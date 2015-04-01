package com.dz.media.model;

import java.util.List;

import com.jfinal.plugin.activerecord.Model;
/**
 * 综合变量设置Model
 * @author Jason
 *
 */
public class Val extends Model<Val> {
	public static final Val me = new Val();
	
	public List<Val> getAll() {
		return find("select * from val");
	}

	/**
	 * 获取所有根变量集合
	 * @return
	 */
	public List<Val> getRoot() {
		return find("select * from val where vType=0");
	}

	/**
	 * 通过类型获取所有的变量值
	 * @return
	 */
	public List<Val> getByType(int type) {
		return find("select * from val where vType=?",type);
	}
}
