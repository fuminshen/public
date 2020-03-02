package com.fumin.role.demo;

import java.util.LinkedHashMap;
import java.util.Map;

import org.apache.shiro.authc.credential.HashedCredentialsMatcher;
import org.apache.shiro.cache.ehcache.EhCacheManager;
import org.apache.shiro.mgt.SecurityManager;
import org.apache.shiro.spring.security.interceptor.AuthorizationAttributeSourceAdvisor;
import org.apache.shiro.spring.web.ShiroFilterFactoryBean;
import org.apache.shiro.web.mgt.DefaultWebSecurityManager;
import org.springframework.aop.framework.autoproxy.DefaultAdvisorAutoProxyCreator;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import com.fumin.role.demo.util.ShiroRealm;

import at.pollux.thymeleaf.shiro.dialect.ShiroDialect;
import net.sf.ehcache.CacheManager;

@Configuration
public class ShiroConfig {
	private static String passType="MD5";
	private static int passCount=797;
	
	public static String getPassType() {
		return passType;
	}
	
	public static int getPassCount() {
		return passCount;
	}
	
	@Bean
	public ShiroFilterFactoryBean shirFilter(SecurityManager securityManager) {
		ShiroFilterFactoryBean shiroFilterFactoryBean = new ShiroFilterFactoryBean();
		shiroFilterFactoryBean.setSecurityManager(securityManager);
		//拦截器.
		Map<String,String> filterChainDefinitionMap = new LinkedHashMap<String,String>();
		// 配置不会被拦截的链接 顺序判断
		filterChainDefinitionMap.put("/bower_components/**", "anon");
		filterChainDefinitionMap.put("/dist/**", "anon");
		filterChainDefinitionMap.put("/plugins/**", "anon");
		filterChainDefinitionMap.put("/loginAction", "anon");
		
		//配置退出 过滤器,其中的具体的退出代码Shiro已经替我们实现了
		//filterChainDefinitionMap.put("/logout", "logout");
		//<!-- 过滤链定义，从上向下顺序执行，一般将/**放在最为下边 -->:这是一个坑呢，一不小心代码就不好使了;
		//<!-- authc:所有url都必须认证通过才可以访问; anon:所有url都都可以匿名访问-->
		filterChainDefinitionMap.put("/**", "authc");
		// 如果不设置默认会自动寻找Web工程根目录下的"/login.jsp"页面
		shiroFilterFactoryBean.setLoginUrl("/login");
		// 登录成功后要跳转的链接
		shiroFilterFactoryBean.setSuccessUrl("/");

		//未授权界面;
		shiroFilterFactoryBean.setUnauthorizedUrl("/");
		shiroFilterFactoryBean.setFilterChainDefinitionMap(filterChainDefinitionMap);
		return shiroFilterFactoryBean;
	}
	
	@Bean
    public ShiroDialect shiroDialect() {
        ShiroDialect shiroDialect = new ShiroDialect();
        return shiroDialect;
    }
	
	@Bean
    public HashedCredentialsMatcher hashedCredentialsMatcher() {
        HashedCredentialsMatcher credentialsMatcher = new HashedCredentialsMatcher();
        //指定加密方式为MD5
        credentialsMatcher.setHashAlgorithmName(passType);
        //加密次数
        credentialsMatcher.setHashIterations(passCount);
        credentialsMatcher.setStoredCredentialsHexEncoded(true);
        return credentialsMatcher;
    }

	@Bean
	public ShiroRealm shiroRealm(){
		ShiroRealm shiroRealm = new ShiroRealm();
		shiroRealm.setCredentialsMatcher(hashedCredentialsMatcher());
		return shiroRealm;
	}
	
	@Bean
    public EhCacheManager ehCacheManager() {
		CacheManager cacheManager = CacheManager.getCacheManager("myEhcache");
        if(cacheManager == null){
            cacheManager = CacheManager.create();
        }

        EhCacheManager em = new EhCacheManager();
        em.setCacheManager(cacheManager);
        return em;
    }

	@Bean
	public SecurityManager securityManager(){
		DefaultWebSecurityManager securityManager =  new DefaultWebSecurityManager();
		securityManager.setRealm(shiroRealm());
		securityManager.setCacheManager(ehCacheManager());
		return securityManager;
	}
	
	//开启@RequiresPermissions注解
	@Bean
	public DefaultAdvisorAutoProxyCreator advisorAutoProxyCreator(){
		DefaultAdvisorAutoProxyCreator advisorAutoProxyCreator = new DefaultAdvisorAutoProxyCreator();
		advisorAutoProxyCreator.setProxyTargetClass(true);
		return advisorAutoProxyCreator;
	}
	
	//开启@RequiresPermissions注解
	@Bean
	public AuthorizationAttributeSourceAdvisor authorizationAttributeSourceAdvisor(SecurityManager securityManager) {
		AuthorizationAttributeSourceAdvisor authorizationAttributeSourceAdvisor = new AuthorizationAttributeSourceAdvisor();
		authorizationAttributeSourceAdvisor.setSecurityManager(securityManager);
		return authorizationAttributeSourceAdvisor;
	}
}
