package com.dz.media.controller;

import com.dz.media.common.Help;
import com.dz.media.model.Goods;
import com.dz.media.model.Val;
import com.jfinal.core.Controller;

public class GoodsController extends Controller {

	// *************************商品基本信息管理***************************************
	public void goodsManger() {
		int pageNumber = getPara("page") == null ? 1 : getParaToInt("page");
		setAttr("goods", Goods.me.paginate(pageNumber, Help.getPageSize(), "select * ",
				"from goods order by goType"));
		render("goodsManger.jsp");
	}

	public void goodsManger_add() {
		setAttr("types", Val.me.getByType(1));
		setAttr("formats", Val.me.getByType(2));
		render("goodsManger_add.jsp");
	}

	public void goodsManger_add_submit() {
		Goods goods = getModel(Goods.class, "goods");
		if (goods.save()) {
			redirect("/goods/goodsManger_add");
		} else {
			renderText("error");
		}

	}

	public void goodsManger_edit() {
		setAttr("goods", Goods.me.findById(getPara("id")));
		setAttr("types", Val.me.getByType(1));
		setAttr("formats", Val.me.getByType(2));
	}

	public void goodsManger_edit_submit() {
		Goods goods=getModel(Goods.class, "goods");
		if(goods.update()){
			redirect("/goods/goodsManger");
		}else{
			renderText("error");
		}
		
	}

	public void goodsManger_detail() {
		setAttr("goods", Goods.me.findById(getPara("id")));
		render("goodsManger_detail.jsp");
	}

	public void goodsManger_delete() {
		int id = getParaToInt("id");
		Goods g = Goods.me.findById(id);
		if (g.delete()) {
			redirect("/goods/goodsManger");
		} else {
			render("error");
		}

	}
}
