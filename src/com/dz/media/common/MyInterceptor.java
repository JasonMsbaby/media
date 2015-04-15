package com.dz.media.common;


import com.dz.media.model.Action;
import com.dz.media.model.Roles;
import com.dz.media.model.User;
import com.jfinal.aop.Interceptor;
import com.jfinal.core.ActionInvocation;
import com.jfinal.core.Controller;

/**
 * 拦截器
 * 
 * @author Jason
 * 
 */
public class MyInterceptor implements Interceptor {

	@Override
	public void intercept(ActionInvocation ai) {
		System.out.println(ai.getActionKey());
		String actionKey = ai.getActionKey();
		if (Action.me.getCount() == 0) {// 判断模块设置是否需要初始化
			new SaxModule().start();
		}
		if (compare(actionKey)) {// 判断是否是默认允许的登陆页面
			ai.invoke();
		} else {
			Controller controller = ai.getController();
			User currentUser = controller.getSessionAttr("currentUser");
			if(currentUser!=null){//判断用户是否登陆
					if(actionKey=="/"){//判断是否登陆的是主页
						ai.invoke();
					}else{
						//判断是否是超级管理员
						if(!(Roles.me.findById(currentUser.get("u_rId")).getInt("rLevel")==0)){
							if(currentUser.canVisit(actionKey,controller.getSession())){//判断是否有权限访问
								ai.invoke();
							}else{
								controller.renderHtml(Help.getAlert("没有权限"));
							}
						}else{
							ai.invoke();
						}
						
					}
			}else{
				controller.redirect("/login");
			}

		}
	}

	/**
	 * 默认允许登陆页
	 * 
	 * @param actionKey
	 * @return
	 */
	private boolean compare(String actionKey) {
		String[] str = new String[] { "/login", "/login_submit","/getCode","/welcome","exit"};
		boolean flag = false;
		for (String s : str) {
			if (s.equals(actionKey)) {
				flag = true;
				break;
			}
		}
		return flag;
	}
}
