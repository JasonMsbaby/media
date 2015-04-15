package com.dz.media.controller;

import com.dz.media.common.Help;
import com.dz.media.model.Sparepartsbase;
import com.dz.media.model.Sparepartsinout;
import com.jfinal.core.Controller;

/**
 * 备件入库出库
 * 
 * @author Jason
 * 
 */
public class sparePartsInOutController extends Controller {

	public void sparePartsInOut_in() {
		setAttr("No", Help.getCurrentTime2());
	}
	public void sparePartsInOut_in_submit() {
		Sparepartsinout sparepartsinout=getModel(Sparepartsinout.class, "in");
		Sparepartsbase sparepartsbase=Sparepartsbase.me.findById(sparepartsinout.get("si_sbId"));
		if(sparepartsbase!=null){
			sparepartsinout.set("siType", "入库");
			sparepartsinout.set("siDate", Help.getCurrentTime());
			sparepartsinout.set("siCheckPerson", Help.getCurrentUser(getSession()).get("uId"));
			if(sparepartsinout.save()){
				sparepartsbase.set("sbNumber", sparepartsbase.getInt("sbNumber")+sparepartsinout.getInt("siNumber"));
				if(sparepartsbase.update()){
					redirect("/sparePartsInOut/sparePartsInOut_in");
				}else{
					renderText("更新库存量失败");
				}
			}else{
				renderText("保存失败");
			}
		}else{
			renderText("请正确选择备件基本信息");
		}
	}

	public void sparePartsInOut_out() {
		int num=getPara("num")==null?0:getParaToInt("num");
		if(num!=0){
			Sparepartsbase sparepartsbase=Sparepartsbase.me.findById(getPara("id"));
			sparepartsbase.set("sbNumber", sparepartsbase.getInt("sbNumber")-num);
			if(sparepartsbase.update()){
				Sparepartsinout sparepartsinout=new Sparepartsinout();
				sparepartsinout.set("siNo", Help.getCurrentTime2());
				sparepartsinout.set("siType", "出库");
				sparepartsinout.set("siDate", Help.getCurrentTime());
				sparepartsinout.set("si_sbId", getPara("id"));
				sparepartsinout.set("siNumber", num);
				sparepartsinout.set("siCheckPerson", Help.getCurrentUser(getSession()).get("uId"));
				if(!sparepartsinout.save()){
					renderText("保存出库失败");
				}
			}else{
				renderText("出库失败");
			}
		}
		int page=getPara("page")==null?1:getParaToInt("page");
		String keyword=getPara("keyword")==null?"":getPara("keyword");
		setAttr("keyword", keyword);
		setAttr("sparepartsbase", Sparepartsbase.me.getByPage(page, keyword));
		
	}

	public void sparePartsInOut_find() {
		int page=getPara("page")==null?1:getParaToInt("page");
		String keyword=getPara("keyword")==null?"":getPara("keyword");
		setAttr("keyword", keyword);
		setAttr("inOut", Sparepartsinout.me.getByPage(page, keyword));
	}
	//************************************************************
	
}
