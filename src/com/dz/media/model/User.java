package com.dz.media.model;

import com.jfinal.plugin.activerecord.Model;
/**
 * 用户信息Model
 * @author Jason
 *
 */
public class User extends Model<User> {
	
	public static final User me = new User();
}
