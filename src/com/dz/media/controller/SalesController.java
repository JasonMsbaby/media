package com.dz.media.controller;

import com.dz.media.common.Help;
import com.dz.media.model.Goods;
import com.dz.media.model.Guest;
import com.dz.media.model.Sale;
import com.dz.media.model.Val;
import com.jfinal.core.Controller;
import com.jfinal.plugin.activerecord.Page;

/**
 * 销售管理控制层
 * 
 * @author Jason
 * 
 */
public class SalesController extends Controller {
	
	public void salesManger() {
		int pageNumber=getPara("page")==null?1:getParaToInt("page");
		String keyword=getPara("keyword")==null?"":getPara("keyword");
		setAttr("keyword", keyword);
		Page<Sale> listPage=Sale.me.getByPage(pageNumber,keyword);
		setAttr("sales",listPage );
	}

	public void salesManger_add() {
		setAttr("salesNo", Help.getCurrentTime2());
		setAttr("buyType", Val.me.getByType(6));
	}

	public void salesManger_add_submit() {
		Sale s = getModel(Sale.class, "sales");
		Goods good = Goods.me.findById(s.get("s_goId"));
		Guest guest = Guest.me.findById(s.get("s_gId"));
		if (good == null || guest == null) {
			renderText("请正确选择商品和客户的信息");
		} else {
			s.set("sInputDate", Help.getCurrentTime());
			s.set("sInputPerson", Help.getCurrentUser(getSession()).get("uId"));
			if (s.save()) {
				redirect("/sales/salesManger_add");
			} else {
				renderText("保存失败");
			}
		}

	}

	public void salesManger_edit() {
		Sale s=Sale.me.findWithId(getPara("id"));
		setAttr("sales", s);
		setAttr("buyType", Val.me.getByType(6));
	}

	public void salesManger_edit_submit() {
		Sale s=getModel(Sale.class, "sales");
		if(s.update()){
			redirect("/sales/salesManger");
		}else{
			renderText("更新失败");
		}
	}

	public void salesManger_delete() {
		Sale s=Sale.me.findById(getPara("id"));
		if(s.delete()){
			redirect("/sales/salesManger");
		}else{
			renderText("删除失败");
		}
	}
	public void salesManger_detail(){
		setAttr("sales",Sale.me.findWithId(getPara("id")));
	}
}
