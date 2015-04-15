package com.dz.media.controller;

import com.dz.media.common.Help;
import com.dz.media.model.Sparepartsbase;
import com.dz.media.model.Val;
import com.jfinal.core.Controller;

/**
 * 备件基本信息控制层
 * 
 * @author Jason
 * 
 */
public class SparePartsBase extends Controller {

	public void sparePartsBaseManger() {
		int page = getAttr("page") == null ? 1 : getParaToInt("page");
		String keyword = getPara("keyword") == null ? "" : getPara("keyword");
		setAttr("keyword", keyword);
		setAttr("spb", Sparepartsbase.me.getByPage(page, keyword));
	}
	public void sparePartsBaseManger_add() {
		setAttr("spbType", Val.me.getByType(4));
		setAttr("spbFormat", Val.me.getByType(2));
	}
	public void sparePartsBaseManger_add_submit() {
		Sparepartsbase spb = getModel(Sparepartsbase.class, "spb");
		if (spb.save()) {
			redirect("/sparePartsBase/sparePartsBaseManger");
		} else {
			renderText("保存失败");
		}
	}
	public void sparePartsBaseManger_edit() {
		setAttr("spbType", Val.me.getByType(4));
		setAttr("spbFormat", Val.me.getByType(2));
		setAttr("spb", Sparepartsbase.me.findById(getPara("id")));
	}
	public void sparePartsBaseManger_edit_submit() {
		Sparepartsbase spb = getModel(Sparepartsbase.class, "spb");
		if (spb.update()) {
			redirect("/sparePartsBase/sparePartsBaseManger");
		} else {
			renderText("更新失败");
		}
	}
	public void sparePartsBaseManger_delete() {
		Sparepartsbase spb = Sparepartsbase.me.findById(getPara("id"));
		if (spb.delete()) {
			redirect("/sparePartsBase/sparePartsBaseManger");
		} else {
			renderText("删除失败");
		}
	}
	// *****************************************************************
	public void getSparePartsJason() {
		renderJson(Sparepartsbase.me.likeSearch(getPara("keyword")));
	}

}
