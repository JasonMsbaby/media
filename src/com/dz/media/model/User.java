package com.dz.media.model;

import com.jfinal.plugin.activerecord.Model;
/**
 * 用户信息Model
 * @author Jason
 *
 */
public class User extends Model<User> {
	
	public static final User me = new User();

	/**
	 * 判断用户是否拥有登陆的权限
	 * @param actionKey
	 * @return
	 */
	public boolean canVisit(String actionKey) {
		return false;
	}
}
