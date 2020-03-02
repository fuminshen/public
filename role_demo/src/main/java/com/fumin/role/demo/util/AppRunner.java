package com.fumin.role.demo.util;

import java.util.Calendar;
import java.util.Date;
import java.util.Timer;
import java.util.TimerTask;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.ApplicationArguments;
import org.springframework.boot.ApplicationRunner;
import org.springframework.stereotype.Component;

import com.fumin.role.demo.service.ClientService;

@Component
public class AppRunner implements ApplicationRunner {
	private Logger logger = LoggerFactory.getLogger(AppRunner.class);
	
	@Autowired
	private ClientService clientService;

	@Override
	public void run(ApplicationArguments args) throws Exception {
		logger.info("每月的定时任务已开启");
		excuteTimer();
	}

	public void excuteTimer() {
		logger.debug("定时任务开始调用");
		Calendar calendar = Calendar.getInstance();
        calendar.set(Calendar.HOUR_OF_DAY, 3);
        calendar.set(Calendar.MINUTE, 0);
        calendar.set(Calendar.SECOND, 0);
        Date date = calendar.getTime();
        
		Timer timer = new Timer();
		
		timer.schedule(new TimerTask() {
			
			@Override
			public void run() {
				Calendar calendar = Calendar.getInstance();
				int date = calendar.get(Calendar.DAY_OF_MONTH);
				if(date==1) {
					logger.info(calendar.get(Calendar.MONTH)+"月清空客户的巡检状态已经执行成功");
					clientService.clearCheckedState();
				}
				
			}
		}, date, 24 * 60 * 60 * 1000);
	}
}
