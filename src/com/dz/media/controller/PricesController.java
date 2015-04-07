package com.dz.media.controller;

import java.net.URLDecoder;
import java.net.URLEncoder;

import com.dz.media.common.Help;
import com.dz.media.model.Goods;
import com.dz.media.model.Prices;
import com.dz.media.model.Val;
import com.jfinal.core.Controller;

/**
 * 价目管理Controller
 * 
 * @author Jason
 * 
 */
public class PricesController extends Controller {

	public void pricesManger() {
		int pageNume = getParaToInt("page") == null ? 1 : getParaToInt("page");
		setAttr("goods", Goods.me.getAllDistinct(pageNume));
		setAttr("prices", Prices.me.getAll());
	}

	public void pricesManger_add() {
	}

	public void pricesManger_add_submit() {
		Prices prices = getModel(Prices.class, "prices");
		String key = getPara("key");
		int page = getParaToInt("page");
		int id = getParaToInt("id");
		prices.set("pPerson", Help.getCurrentUser(getSession()).get("uId"));
		if (prices.save()) {
			key = URLEncoder.encode(key);
			redirect("/prices/goodsSearch?key=" + key + "&&page=" + page
					+ "&&id=" + id);
		} else {
			renderText("error");
		}
	}

	public void pricesManger_edit() {
		setAttr("goods", Goods.me.findById(getPara("id")));
		setAttr("prices_in",
				Prices.me.getByGoodsAndType(getParaToInt("id"), "采购"));
		setAttr("prices_out",
				Prices.me.getByGoodsAndType(getParaToInt("id"), "出售"));
		setAttr("times", Val.me.getByType(5));
		setAttr("currentUser", Help.getCurrentUser(getSession()));
	}

	public void pricesManger_edit_submit() {
		Prices prices = getModel(Prices.class, "prices");
		int goodsId = getParaToInt("goodsId");
		if (prices.save()) {
			redirect("/prices/pricesManger_edit?id=" + goodsId);
		} else {
			renderText("error");
		}
	}

	public void pricesManger_edit_delete() {
		String pid = getPara("pId");
		int goodsId = getParaToInt("goodsId");
		Prices p = Prices.me.findById(pid);
		if (pid != null) {
			if (p.delete()) {
				redirect("/prices/pricesManger_edit?id=" + goodsId);
			} else {
				renderText("error");
			}
		}
	}

	public void pricesManger_detail() {
		setAttr("goods", Goods.me.findById(getParaToInt("id")));
		setAttr("prices_in",
				Prices.me.getByGoodsAndType(getParaToInt("id"), "采购"));
		setAttr("prices_out",
				Prices.me.getByGoodsAndType(getParaToInt("id"), "出售"));
	}

	public void pricesManger_delete() {
		if (Prices.me.deleteByType(getParaToInt("id"))) {
			redirect("/prices/pricesManger");
		} else {
			renderText("error");
		}
	}

	public void goodsSearch() {
		int page = getPara("page") == null ? 1 : getParaToInt("page");
		// 获取搜索的关键字
		setAttr("key", URLDecoder.decode(getPara("key")));
		// 通过关键字获取相匹配的记录
		setAttr("goods", Goods.me.likeSearch(page, getPara("key")));

		// 判断用户是否点击编辑
		if (getPara("id") != null) {
			setAttr("prices_in",
					Prices.me.getByGoodsAndType(getParaToInt("id"), "采购"));
			setAttr("prices_out",
					Prices.me.getByGoodsAndType(getParaToInt("id"), "出售"));
			// 状态保持
			setAttr("goodsId", getPara("id"));
			setAttr("selectedGoods", Goods.me.findById(getPara("id")));
			// 获取所有时间段
			setAttr("times", Val.me.getByType(5));
		}
		String pid = getPara("pid");
		// 删除这个商品的价目信息
		if (pid != null) {
			Prices p = Prices.me.findById(pid);
			if (p.delete()) {
				setAttr("prices_in",
						Prices.me.getByGoodsAndType(getParaToInt("id"), "采购"));
				setAttr("prices_out",
						Prices.me.getByGoodsAndType(getParaToInt("id"), "出售"));
				render("pricesManger_add.jsp");
			} else {
				renderText("error");
			}
		}
		render("pricesManger_add.jsp");
	}

}
