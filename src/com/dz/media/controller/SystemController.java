package com.dz.media.controller;

import com.dz.media.common.Help;
import com.dz.media.model.Roles;
import com.dz.media.model.User;
import com.jfinal.core.Controller;

public class SystemController extends Controller {
	
	
	//&*****************************用户管理****************************************************
	public void userManger(){
		int pageNum=getPara("page")==null?1:Integer.parseInt(getPara("page"));
		int roleLevel=Integer.parseInt(Help.getCurrentRole(getSession()).get("rLevel").toString());
		setAttr("users", User.me.findByPage(pageNum,roleLevel));
		render("userManger.jsp");
	}
	public void userManger_add(){
		setAttr("roles", Roles.me.getRolesList(getSession()));
		render("userManger_add.jsp");
	}
	public void userManger_add_submit(){
		//renderHtml(Help.getAlert("添加成功"));
		//render("userManger.jsp");
		redirect("/sys/userManger");
	}
}
