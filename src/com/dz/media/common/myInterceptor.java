package com.dz.media.common;

import com.dz.media.model.Action;
import com.jfinal.aop.Interceptor;
import com.jfinal.core.ActionInvocation;
/**
 * 拦截器
 * @author Jason
 *
 */
public class myInterceptor implements Interceptor {

	@Override
	public void intercept(ActionInvocation ai) {
		//判断模块设置是否需要初始化
		if(Action.me.getCount()==0){
			new SaxModule().start();
		}
		ai.invoke();
	}

}
