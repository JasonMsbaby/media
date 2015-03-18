package com.dz.media.common;

import com.dz.media.model.Action;
import com.dz.media.model.Val;
import com.jfinal.config.Constants;
import com.jfinal.config.Handlers;
import com.jfinal.config.Interceptors;
import com.jfinal.config.JFinalConfig;
import com.jfinal.config.Plugins;
import com.jfinal.config.Routes;
import com.jfinal.plugin.activerecord.ActiveRecordPlugin;
import com.jfinal.plugin.c3p0.C3p0Plugin;
import com.jfinal.render.ViewType;

/**
 * 框架主配置文件
 * 
 * @author Jason
 * 
 */
public class Config extends JFinalConfig {

	/**
	 * 设置系统变量
	 */
	@Override
	public void configConstant(Constants me) {
		loadPropertyFile("DBconfig.txt");
		me.setDevMode(false);
		me.setEncoding("UTF-8");
		me.setViewType(ViewType.JSP);
		me.setUrlParaSeparator("&&");
	}

	@Override
	public void configRoute(Routes me) {
		me.add(new com.dz.media.common.Routes());
	}

	@Override
	public void configPlugin(Plugins me) {
		// 配置C3p0数据库连接池插件
		C3p0Plugin c3p0Plugin = new C3p0Plugin(getProperty("jdbcUrl"),
				getProperty("user"), getProperty("password").trim());
		me.add(c3p0Plugin);

		// 配置ActiveRecord插件
		ActiveRecordPlugin arp = new ActiveRecordPlugin(c3p0Plugin);
		me.add(arp);
		//Model映射
		//arp.addMapping(); // 映射blog 表到 Blog模型 参数：表名，主键名，实体.class
		arp.addMapping("val", "vId", Val.class);
		arp.addMapping("action", "aId", Action.class);
	}

	/**
	 * 配置拦截器
	 */
	@Override
	public void configInterceptor(Interceptors me) {
		me.add(new myInterceptor());
	}

	/**
	 * 配置处理器
	 */
	@Override
	public void configHandler(Handlers me) {

	}

}
