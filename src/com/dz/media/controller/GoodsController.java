package com.dz.media.controller;

import com.dz.media.model.Goods;
import com.dz.media.model.Val;
import com.jfinal.core.Controller;

public class GoodsController extends Controller {

	//*************************商品基本信息管理***************************************
	public void goodsManger(){
		int pageNumber=getPara("page")==null?1:getParaToInt("page");
		setAttr("goods", Goods.me.paginate(pageNumber, 10, "select * ", "from goods order by goType"));
		render("goodsManger.jsp");
	}
	public void goodsManger_add(){
		setAttr("types", Val.me.getByType(1));
		setAttr("formats", Val.me.getByType(2));
	}
	public void goodsManger_add_submit(){
		render("goodsManger_add.jsp");
	}
	public void goodsManger_edit(){
	}
	public void goodsManger_edit_submit(){
		render("/goods/goodsManger");
	}
	public void goodsManger_detail(){
		render("goodsManger_detail.jsp");
	}
	public void goodsManger_delete(){
		render("/goods/goodsManger");
	}
	
}
