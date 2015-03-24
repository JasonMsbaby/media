package com.dz.media.model;

import com.jfinal.plugin.activerecord.Model;
/**
 * 角色信息Model
 * @author Jason
 *
 */
public class Roles extends Model<Roles> {
	
	public static final Roles me = new Roles();

	/**
	 * 通过用户获取其角色
	 * @param sessionAttr
	 * @return
	 */
	public Roles getRoleByUser(User sessionAttr) {
		Roles roles=me.findById(sessionAttr.get("u_rId"));
		return roles;
	}
}
