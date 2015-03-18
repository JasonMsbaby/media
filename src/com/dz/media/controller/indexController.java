package com.dz.media.controller;

import java.util.List;

import com.dz.media.model.Action;
import com.jfinal.core.Controller;

public class indexController extends Controller {

	public void index() {
		List<Action> action=Action.me.getAll();
		System.out.println(action);
		setAttr("list", action);
	}
}
