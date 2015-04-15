package com.dz.media.model;

import java.util.List;

import com.dz.media.common.Help;
import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;

/**
 * 客户信息Model
 * 
 * @author Jason
 * 
 */
public class Guest extends Model<Guest> {

	public static final Guest me = new Guest();

	/**
	 * 模糊查找
	 * 
	 * @param where
	 * @return
	 */
	public List<Guest> likeSearch(String where) {
		List<Guest> guests = find("select * FROM guest WHERE gId like '%"
				+ where + "%' or  gNo  LIKE '%" + where + "%' OR gName LIKE '%"
				+ where + "%' OR gPhone LIKE '%" + where
				+ "%' OR gAdress LIKE '%" + where + "%' order by gNo asc");
		return guests;
	}

	public Page<Guest> getByPage(int page, String keyword) {
		return paginate(page, Help.getPageSize(), "select *",
				"from guest where gId like '%" + keyword + "%' or gNo like '%"
						+ keyword + "%' or gName like '%" + keyword
						+ "%' or gSex like '%" + keyword
						+ "%' or gPhone like '%" + keyword
						+ "%' or gCompany like '%" + keyword
						+ "%' or gAdress like '%" + keyword
						+ "%' or gVIP like '%" + keyword
						+ "%' or gInputDate like '%" + keyword + "%' order by gNo asc");
	}
}
