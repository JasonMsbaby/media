package com.dz.media.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import com.dz.media.common.ValidateCode;
import com.dz.media.model.Action;
import com.dz.media.model.Roles;
import com.dz.media.model.User;
import com.jfinal.core.Controller;

/**
 * 首页控制器
 * 
 * @author Jason
 * 
 */
public class IndexController extends Controller {

	/**
	 * 欢迎页
	 */
	public void welcome() {
		render("common/welcome.jsp");
	}
	

	/**
	 * 获取验证码
	 */
	public void getCode() {
		HttpServletResponse response = getResponse();
		// 设置响应的类型格式为图片格式
		response.setContentType("image/jpeg");
		// 禁止图像缓存。
		response.setHeader("Pragma", "no-cache");
		response.setHeader("Cache-Control", "no-cache");
		response.setDateHeader("Expires", 0);
		ValidateCode vCode = new ValidateCode();
		setSessionAttr("code", vCode.getCode());
		try {
			vCode.write(response.getOutputStream());
			renderNull();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	/**
	 * 登陆初始化
	 */
	public void login() {
		render("login.jsp");
	}

	/**
	 * 登陆提交
	 */
	public void login_submit(){
		String passCode=getPara("code1").toString().toLowerCase().trim();
		String seessionCode=getSessionAttr("code").toString().toLowerCase().trim();
		if(passCode.equals(seessionCode)){
			User user=getModel(User.class, "user");
			//判断用户名和密码是否正确
			User u=user.login_check(user);
			if(u!=null){
				setSessionAttr("currentUser", u);
				redirect("/index");
			}else{
				setAttr("info", "用户名或密码错误");
				render("login.jsp");
			}
		}else{
			setAttr("info", "验证码不正确");
			render("login.jsp");
		}
		
	}

	/**
	 * 首页初始化
	 */
	public void index() {
		List<Action> action = Action.me.getAll();
		setAttr("list", action);
		setAttr("role", Roles.me.getRoleByUser((User)getSessionAttr("currentUser")));
		render("index.jsp");

	}
	
	/**
	 * 注销登陆
	 */
	public void exit(){
		getSession().invalidate();
		redirect("/login");
	}
}
