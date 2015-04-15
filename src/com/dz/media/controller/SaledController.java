package com.dz.media.controller;

import com.dz.media.common.Help;
import com.dz.media.model.Goods;
import com.dz.media.model.Guest;
import com.dz.media.model.Sale;
import com.dz.media.model.Saled;
import com.dz.media.model.User;
import com.dz.media.model.Val;
import com.jfinal.core.Controller;

/**
 * 售后管理控制层
 * 
 * @author Jason
 * 
 */
public class SaledController extends Controller {

	public void saledManger() {
		String keyword = getPara("keyword") == null ? "" : getPara("keyword");
		setAttr("keyword", keyword);
		int pageNumber = getPara("page") == null ? 1 : getParaToInt("page");
		setAttr("saled", Saled.me.getByPage(pageNumber, keyword));
	}

	public void saledManger_add() {
		setAttr("saledNo", Help.getCurrentTime2());
		setAttr("saledType", Val.me.getByType(3));
		setAttr("repireStatus", Val.me.getByType(7));
	}

	public void saledManger_add_submit() {
		Saled saled = getModel(Saled.class, "saled");
		Sale s = Sale.me.findById(saled.get("sd_sId"));
		if (s != null) {
			saled.set("sdInputPerson",
					Help.getCurrentUser(getSession()).get("uId"));
			saled.set("sdInputDate", Help.getCurrentTime());
			//saled.set("sdCheckStatus", "已提交");
			if (saled.save()) {
				redirect("/saled/saledManger_add");
			} else {
				renderText("保存失败");
			}
		} else {
			renderText("请正确选择销售记录信息");
		}

	}
	public void saledManger_delete(){
		int id=getParaToInt("id");
		Saled saled=Saled.me.findById(id);
		if(saled.delete()){
			redirect("/saled/saledManger");
		}else{
			renderText("删除失败");
		}
	}
	public void saledManger_detail() {
		int id=getParaToInt("id");
		Saled saled=Saled.me.findById(id);
		Sale sale=Sale.me.findById(saled.get("sd_sId"));
		Goods goods=Goods.me.findById(sale.get("s_goId"));
		Guest guest=Guest.me.findById(sale.get("s_gId"));
		User user=User.me.findByName(saled.get("sd_uName").toString());
		setAttr("saled", saled);
		setAttr("goods", goods);
		setAttr("guest", guest);
		setAttr("user", user);
	}


	// ***********************************************************************
	public void getSalesJson() {
		String keyword = getPara("keyword") == null ? "" : getPara("keyword");
		renderJson(Sale.me.likeSearch(keyword));
	}
	/**
	 * 派工
	 */
	public void repaire(){
		String name=getPara("name");
		int id=getParaToInt("id");
		if(User.me.exist(name)){
			Saled saled=Saled.me.findById(id);
			saled.set("sd_uName", name);
			if(saled.update()){
				renderText("派工成功");
			}else{
				renderText("派工失败");
			}
		}else{
			renderText("该维修工不存在");
		}
	}

}
