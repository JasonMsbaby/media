package com.dz.media.controller;

import com.dz.media.common.Help;
import com.dz.media.model.Action;
import com.dz.media.model.Roles;
import com.dz.media.model.User;
import com.dz.media.model.Val;
import com.jfinal.core.Controller;

public class SystemController extends Controller {

	// &*****************************用户管理****************************************************
	public void userManger() {
		int pageNum = getPara("page") == null ? 1 : Integer
				.parseInt(getPara("page"));
		int roleLevel = Integer.parseInt(Help.getCurrentRole(getSession())
				.get("rLevel").toString());
		setAttr("users", User.me.findByPage(pageNum, roleLevel));
		render("userManger.jsp");
	}

	public void userManger_add() {
		setAttr("roles", Roles.me.getRolesList(getSession()));
		render("userManger_add.jsp");
	}

	public void userManger_add_submit() {
		User user = getModel(User.class, "user");
		if (user.save()) {
			redirect("/sys/userManger");
		} else {
			renderText("error");
		}

	}

	public void userManger_edit() {
		setAttr("user", User.me.findById(getPara("id")));
		setAttr("roles", Roles.me.getRolesList(getSession()));
		render("userManger_edit.jsp");
	}

	public void userManger_edit_submit() {
		User user = getModel(User.class, "user");
		if (user.update()) {
			redirect("/sys/userManger");
		} else {
			renderText("error");
		}

	}

	public void userManger_delete() {
		User user = User.me.findById(getPara("id"));
		if (user.delete()) {
			redirect("/sys/userManger");
		} else {
			renderText("error");
		}

	}

	// &*****************************角色管理****************************************************
	public void roleManger() {
		int pageNumber = getPara("page") == null ? 1 : Integer
				.parseInt(getPara("page"));
		setAttr("roles", Roles.me.getRolesListByPage(pageNumber, getSession()));
		render("roleManger.jsp");
	}

	public void roleManger_add() {
		setAttr("permissions", Action.me.findAll());
		setAttr("roleLevel", Help.getCurrentRole(getSession()).getInt("rLevel"));
		render("roleManger_add.jsp");
	}

	public void roleManger_add_submit() {
		Roles ro = getModel(Roles.class, "role");
		int currentRoleLevel = Help.getCurrentRole(getSession()).getInt(
				"rLevel");
		if (currentRoleLevel < ro.getInt("rLevel")) {
			if (ro.save()) {
				redirect("/sys/roleManger");
			} else {
				renderText("error");
			}
		} else {
			renderText("error");
		}

	}

	public void roleManger_edit() {
		setAttr("role", Roles.me.findById(getParaToInt("id")));
		setAttr("permissions", Action.me.findAll());
		render("roleManger_edit.jsp");
	}

	public void roleManger_edit_submit() {
		Roles ro = getModel(Roles.class, "role");
		int currentRoleLevel = Help.getCurrentRole(getSession()).getInt(
				"rLevel");
		if (currentRoleLevel < ro.getInt("rLevel")) {
			if (ro.update()) {
				redirect("/sys/roleManger");
			} else {
				renderText("error");
			}
		} else {
			renderText("error");
		}
	}

	public void roleManger_delete() {
		int id = getParaToInt("id");
		Roles role = Roles.me.findById(id);
		if (role.delete()) {
			redirect("/sys/roleManger");
		} else {
			renderText("error");
		}
	}

	// &*****************************综合变量管理****************************************************
	public void valManger() {
		setAttr("rootVal", Val.me.getRoot());
		setAttr("vals", Val.me.getAll());
		render("valManger.jsp");
	}

	public void valManger_edit() {
		int type = getParaToInt("id");
		setAttr("val", Val.me.findById(type));
		setAttr("vals", Val.me.getByType(type));
		render("valManger_edit.jsp");
	}

	public void valManger_edit_submit() {
		Val v = getModel(Val.class, "val");
		if (v.save()) {
			redirect("/sys/valManger_edit?id=" + v.getInt("vType"));
		} else {
			renderText("error");
		}
	}

	public void valManger_delete() {
		int id = getParaToInt("id");
		Val val = Val.me.findById(id);
		if (val.delete()) {
			redirect("/sys/valManger_edit?id=" + val.getInt("vType"));
		} else {
			renderText("error");
		}
	}
}
