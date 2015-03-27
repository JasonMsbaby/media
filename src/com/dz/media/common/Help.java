package com.dz.media.common;

import javax.servlet.http.HttpSession;


import com.dz.media.model.Roles;
import com.dz.media.model.User;

/**
 * 通用帮助类
 * @author Jason
 *
 */
public class Help {
	public static String getAlert(String msg) {
		return "<script>alert('"+msg+"');</script>";
	}
	/**
	 * 根据session获取当前登陆用户
	 * @param session
	 * @return
	 */
	public static User getCurrentUser(HttpSession session){
		return (User) session.getAttribute("currentUser");
	}
	/**
	 * 根据当前登陆用户获取用户的角色
	 * @param user
	 * @return
	 */
	public static Roles getCurrentRole(HttpSession session){
		
		return Roles.me.findById(getCurrentUser(session).get("u_rId"));
	}
	
}
