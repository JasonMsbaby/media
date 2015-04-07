package com.dz.media.controller;

import com.dz.media.common.Help;
import com.dz.media.model.Guest;
import com.jfinal.core.Controller;

public class GuestController extends Controller {

	//************************客户信息录入**********************************************
	public void guestManger_add(){
		render("guestManger_add.jsp");
	}
	public void guestManger_add_submit(){
		Guest guest=getModel(Guest.class, "guest");
		guest.set("gInputDate", Help.getCurrentTime());
		if(guest.save()){
			render("guestManger_add.jsp");
		}else{
			renderText("error");
		}
		
	}
	//************************客户信息管理**********************************************
	public void guestManger(){
		int page=getPara("page")==null?1:Integer.parseInt(getPara("page"));
		setAttr("guest", Guest.me.paginate(page, Help.getPageSize(), "select *", "from guest"));
		render("guestManger.jsp");
	}
	//************************查看客户详情**********************************************
	public void guestManger_detail(){
		setAttr("guest", Guest.me.findById(getPara("id")));
		render("guestManger_detail.jsp");
	}
	//************************编辑客户信息**********************************************
	public void guestManger_edit(){
		setAttr("guest", Guest.me.findById(getPara("id")));
		render("guestManger_edit.jsp");
	}
	public void guestManger_edit_submit(){
		Guest guest=getModel(Guest.class, "guest");
		if(guest.update()){
			redirect("/guest/guestManger");
		}else{
			render("error");
		}
	}
	//************************删除客户信息**********************************************
	public void guestManger_delete(){
		Guest guest=Guest.me.findById(getPara("id"));
		if(guest.delete()){
			redirect("/guest/guestManger");
		}else{
			render("error");
		}
		
	}
	
}
