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
}
