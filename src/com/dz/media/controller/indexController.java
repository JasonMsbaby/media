package com.dz.media.controller;

import java.util.List;

import com.dz.media.model.Action;
import com.jfinal.core.Controller;

public class indexController extends Controller {

	
	public void welcome(){
		render("common/welcome.jsp");
	}
	
	public void login(){
		render("login.jsp");
	}
	public void index() {
		List<Action> action=Action.me.getAll();
		setAttr("list", action);
		render("index.jsp");
		
	}
}
