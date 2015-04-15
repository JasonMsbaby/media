package com.dz.media.model;

import java.util.List;

import com.dz.media.common.Help;
import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;

/**
 * 销售记录信息Model
 * 
 * @author Jason
 * 
 */
public class Sale extends Model<Sale> {

	public static final Sale me = new Sale();

	/*
	 * public Goods getGoods(){ return Goods.me.findById(get("s_goId")); }
	 * public Guest getGuest(){ return Guest.me.findById(get("s_gId")); } public
	 * User getUser(){ return User.me.findById(get("sInputPerson")); }
	 */

	public Page<Sale> getByPage(int pageNumber, String keyword) {
		return paginate(
				pageNumber,
				Help.getPageSize(),
				"select *",
				"FROM sale,USER,guest,goods WHERE sale.s_goId=goods.goId AND sale.s_gId=guest.gId AND sale.sInputPerson=user.uId AND (goods.goName LIKE '%"
						+ keyword
						+ "%' OR goods.goType LIKE '%"
						+ keyword
						+ "%' OR goods.goNo LIKE '%"
						+ keyword
						+ "%' OR sale.sId LIKE '%"
						+ keyword
						+ "%' OR sale.sInputDate LIKE '%"
						+ keyword
						+ "%' OR sale.sInputPerson LIKE '%"
						+ keyword
						+ "%' OR sale.sInvoice LIKE '%"
						+ keyword
						+ "%' OR sale.sPayType LIKE '%"
						+ keyword
						+ "%' OR sale.sSaledDate LIKE '%"
						+ keyword
						+ "%' OR sale.sWarrantyDate LIKE '%"
						+ keyword
						+ "%' OR sale.sTechnologyPerson LIKE '%"
						+ keyword
						+ "%' OR sale.sSalesUnit LIKE '%"
						+ keyword
						+ "%' OR sale.sSalesRepresentative LIKE '%"
						+ keyword
						+ "%' OR user.uName LIKE '%"
						+ keyword
						+ "%' OR user.uId LIKE '%"
						+ keyword
						+ "%' OR guest.gNo LIKE '%"
						+ keyword
						+ "%' OR guest.gName LIKE '%"
						+ keyword
						+ "%' OR guest.gPhone LIKE '%" + keyword + "%')");
	}

	public Sale findWithId(String id) {
		return findFirst(
				"SELECT * FROM sale,goods,guest,USER WHERE sId=? AND goods.goId=sale.s_goId AND guest.gId=sale.s_gId AND user.uId=sale.sInputPerson",
				id);
	}
	/**
	 * 供填写售后记录时调出销售记录模糊查询所用
	 * @param para
	 * @return
	 */
	public List<Sale> likeSearch(String para) {
		return find("SELECT * FROM sale,guest,goods WHERE sale.s_goId=goods.goId AND sale.s_gId=guest.gId AND (guest.gPhone LIKE '%"
				+ para
				+ "%' OR guest.gSex LIKE '%"
				+ para
				+ "%' OR guest.gId LIKE '%"
				+ para
				+ "%' OR guest.gName LIKE '%"
				+ para
				+ "%' OR goods.goId LIKE '%" + para + "%' )");
	}
}
