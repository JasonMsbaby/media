package com.dz.media.model;

import java.util.List;

import com.dz.media.common.Help;
import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;

/**
 * 备件出库入库信息Model
 * 
 * @author Jason
 * 
 */
public class Sparepartsinout extends Model<Sparepartsinout> {

	public static final Sparepartsinout me = new Sparepartsinout();

	public Page<Sparepartsinout> getByPage(int pageNumber, String keyword) {
		return paginate(
				pageNumber,
				Help.getPageSize(),
				"select * ",
				"FROM sparepartsinout AS a,sparepartsbase AS b,user as c WHERE a.si_sbId=b.sbId AND c.uId=a.siCheckPerson and  (a.siNo LIKE '%"
						+ keyword
						+ "%' OR a.siCheckPerson LIKE '%"
						+ keyword
						+ "%' OR a.siDate LIKE '%"
						+ keyword
						+ "%' OR a.siPerson LIKE '%"
						+ keyword
						+ "%' OR a.siType LIKE '%"
						+ keyword
						+ "%' OR b.sbName LIKE '%"
						+ keyword
						+ "%' OR b.sbNo LIKE '%"
						+ keyword
						+ "%' OR b.sbType LIKE '%" + keyword + "%') ");
	}
}
