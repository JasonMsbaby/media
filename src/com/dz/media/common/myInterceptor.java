package com.dz.media.common;


import com.dz.media.model.Action;
import com.dz.media.model.User;
import com.jfinal.aop.Interceptor;
import com.jfinal.core.ActionInvocation;
import com.jfinal.core.Controller;
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
		Controller controller=ai.getController();
		User currentUser=controller.getSessionAttr("currentUser");
		if(currentUser!=null&&currentUser.canVisit(ai.getActionKey())){
			ai.invoke();
		}else{
			controller.render("login.jsp");
		}
	}

}
