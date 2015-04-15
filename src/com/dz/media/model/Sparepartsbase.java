package com.dz.media.model;

import java.util.List;

import com.dz.media.common.Help;
import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;

/**
 * 备件基本信息Model
 * 
 * @author Jason
 * 
 */
public class Sparepartsbase extends Model<Sparepartsbase> {

	public static final Sparepartsbase me = new Sparepartsbase();

	public Page<Sparepartsbase> getByPage(int page, String keyword) {
		return paginate(page, Help.getPageSize(), "select *",
				"from sparepartsbase where sbId like '%" + keyword
						+ "%' or sbNo like '%" + keyword
						+ "%' or sbType like '%" + keyword
						+ "%' or sbName like '%" + keyword
						+ "%' or sbNumber like '%" + keyword
						+ "%' or sbFormat like '%" + keyword + "%'");
	}

	public List<Sparepartsbase> likeSearch(String keyword) {
		return find("select * from sparepartsbase where sbNo like '%" + keyword
				+ "%' or sbType like '%" + keyword + "%' or sbName like '%"
				+ keyword + "%'");
	}

}
