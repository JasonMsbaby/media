package com.dz.media.controller;

import com.dz.media.model.Goods;
import com.dz.media.model.Val;
import com.jfinal.core.Controller;

public class GoodsController extends Controller {

	// *************************商品基本信息管理***************************************
	public void goodsManger() {
		int pageNumber = getPara("page") == null ? 1 : getParaToInt("page");
		String keyword=getPara("keyword")==null?"":getPara("keyword");
		setAttr("keyword", keyword);
		setAttr("goods", Goods.me.getByPage(pageNumber,keyword));
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
			renderText("保存失败");
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
			renderText("更新失败");
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
			renderText("删除失败");
		}

	}
	// *************************其他帮助函数***************************************
	public void getGoodsJson(){
		String where=getPara("keyword");
		renderJson(Goods.me.likeSearch(where));
	}
}
