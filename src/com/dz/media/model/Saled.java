package com.dz.media.model;

import com.dz.media.common.Help;
import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;

/**
 * 售后记录信息Model
 * 
 * @author Jason
 * 
 */
public class Saled extends Model<Saled> {

	public static final Saled me = new Saled();

	/**
	 * 分页模糊查询所有
	 * @param pageNumber
	 * @param keyword
	 * @return
	 */
	public Page<Saled> getByPage(int pageNumber, String keyword) {
		return paginate(
				pageNumber,
				Help.getPageSize(),
				"select * ",
				"FROM saled,guest,goods,sale WHERE saled.sd_sId=sale.sId AND goods.goId=sale.s_goId AND guest.gId=sale.s_gId  AND (saled.sdId LIKE '%"
						+ keyword
						+ "%' or saled.sdId LIKE '%"
						+ keyword
						+ "%' or saled.sdNo LIKE '%"
						+ keyword
						+ "%'or saled.sdType LIKE '%"
						+ keyword
						+ "%'or saled.sdRepairStatus LIKE '%"
						+ keyword
						+ "%'or saled.sdReportDate LIKE '%"
						+ keyword
						+ "%'or saled.sdRepairDate LIKE '%"
						+ keyword
						+ "%'or saled.sdChargeType LIKE '%"
						+ keyword
						+ "%'or saled.sdCheckPerson LIKE '%"
						+ keyword
						+ "%'or saled.sdCheckStatus LIKE '%"
						+ keyword
						+ "%'or saled.sdInputPerson LIKE '%"
						+ keyword
						+ "%'or saled.sdId LIKE '%"
						+ keyword
						+ "%'or goods.goId LIKE '%"
						+ keyword
						+ "%'or goods.goNo LIKE '%"
						+ keyword
						+ "%'or goods.goType LIKE '%"
						+ keyword
						+ "%'or goods.goName LIKE '%"
						+ keyword
						+ "%'or goods.goVersion LIKE '%"
						+ keyword
						+ "%'or guest.gId LIKE '%"
						+ keyword
						+ "%'or guest.gNo LIKE '%"
						+ keyword
						+ "%'or guest.gName LIKE '%"
						+ keyword
						+ "%'or guest.gPhone LIKE '%"
						+ keyword
						+ "%'or guest.gAdress LIKE '%"
						+ keyword
						+ "%'or guest.gVIP LIKE '%"
						+ keyword
						+ "%'or saled.sd_uName LIKE '%" + keyword + "%' )");
	}

}
