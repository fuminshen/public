package com.fumin.role.demo.util;

import java.util.List;

import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.util.ByteSource;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;

import com.fumin.role.demo.ShiroConfig;
import com.fumin.role.demo.bean.Admin;
import com.fumin.role.demo.bean.Nav;
import com.fumin.role.demo.service.AdminService;
import com.fumin.role.demo.service.NavService;

public class ShiroRealm extends AuthorizingRealm {
	Logger logger = LoggerFactory.getLogger(getClass());
	
	public static final String ADMIN_SESSION_KEY="admin";
	
	@Autowired
	@Lazy
	private AdminService service;
	
	@Autowired
	@Lazy
	private NavService navService;
	

	/**
	 * 登录验证
	 */
	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
		UsernamePasswordToken user = (UsernamePasswordToken)token;
		String username = user.getUsername();
		Object userObj;
		Object credentials;
			
		Admin admin = new Admin();
		admin.setUsername(username);
		admin = service.getOneByEntity(admin);
		
		if(admin==null) {
			throw new UnknownAccountException("不存在的用户");
		}
		
		userObj = admin;
		credentials = admin.getPassword();
			
		String realmName=getName(); //当前Realm的name，直接调用父类的getName()即可获取
		ByteSource bs = ByteSource.Util.bytes(username);
		SimpleAuthenticationInfo sai = new SimpleAuthenticationInfo(userObj, credentials, bs, realmName);
		return sai;
	}
	
	/**
	 * 权限验证
	 */
	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
		SimpleAuthorizationInfo authorizationInfo = new SimpleAuthorizationInfo();
		Object user = principals.getPrimaryPrincipal();
		logger.debug("权限验证："+principals.getPrimaryPrincipal());
		Admin admin = (Admin) user;
		if(admin.getRole()==null) {
			return authorizationInfo;
		}
		List<Nav> roles;
		if(admin.getRole().intValue()==1) {
			roles = navService.getAll();
		}else {
			roles = navService.getByRole(admin.getRole());
		}
		for(Nav roleNav:roles) {
			authorizationInfo.addStringPermission(roleNav.getId().toString());
		}
		return authorizationInfo;
	}
	
	/**
	 * 计算加密结果
	 * 传入要加密的明文
	 * 返回密文
	 */
	public static String getPassword(String salt,String password) {
		ByteSource bs = ByteSource.Util.bytes(salt);
		SimpleHash pass = new SimpleHash(ShiroConfig.getPassType(), password, bs, ShiroConfig.getPassCount());//test加密5次，并用用户名加盐的结果
		return pass.toString();
	}

}
