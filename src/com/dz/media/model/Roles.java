package com.dz.media.model;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.dz.media.common.Help;
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

	/**
	 * 根据当前登陆的用户获取其可以对那些角色进行添加
	 * @param session
	 * @return
	 */
	public List<Roles> getRolesList(HttpSession session) {
		return find("select * from roles where rLevel>?", Help.getCurrentRole(session).get("rLevel"));
	}
}
