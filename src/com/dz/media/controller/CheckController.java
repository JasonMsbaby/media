package com.dz.media.controller;

import com.dz.media.common.Help;
import com.dz.media.model.Saled;
import com.jfinal.core.Controller;

public class CheckController extends Controller {
	
	public void waitCheck(){
		int pageNumber=getPara("page")==null?1:getParaToInt("page");
		setAttr("saled", Saled.me.paginate(pageNumber, Help.getPageSize(), "select * ", " from saled where sdCheckStatus='待审核'"));
	}
	public void waitCheck_pass(){
		int id=getParaToInt("id");
		Saled saled=Saled.me.findById(id);
		saled.set("sdCheckStatus", "审核通过");
		saled.set("sdCheckPerson", Help.getCurrentUser(getSession()).get("uId"));
		saled.set("sdCheckDate", Help.getCurrentTime());
		if(saled.update()){
			redirect("/check/waitCheck");
		}else{
			renderText("审核失败");
		}
	}
	public void waitCheck_defeat(){
		int id=getParaToInt("id");
		String content=getPara("content");
		Saled saled=Saled.me.findById(id);
		saled.set("sdCheckStatus", "审核未通过");
		saled.set("sdCheckPerson", Help.getCurrentUser(getSession()).get("uId"));
		saled.set("sdCheckDate", Help.getCurrentTime());
		saled.set("sdCheckSuggestion", content);
		if(saled.update()){
			redirect("/check/waitCheck");
		}else{
			renderText("审核失败");
		}
	}

}
