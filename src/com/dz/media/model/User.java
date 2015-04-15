package com.dz.media.model;

import java.util.List;

import javax.management.relation.Role;
import javax.servlet.http.HttpSession;

import com.dz.media.common.DESUtil;
import com.dz.media.common.Help;
import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;

/**
 * 用户信息Model
 * 
 * @author Jason
 * 
 * 
 *         FIELD TYPE COLLATION NULL KEY DEFAULT Extra PRIVILEGES COMMENT
 *         -------- ----------- --------------- ------ ------ -------
 *         -------------- -------------------------------
 *         ------------------------------ uId INT(11) (NULL) NO PRI (NULL)
 *         AUTO_INCREMENT SELECT,INSERT,UPDATE,REFERENCES ID uNo VARCHAR(20)
 *         utf8_general_ci YES (NULL) SELECT,INSERT,UPDATE,REFERENCES 用户工号 uName
 *         VARCHAR(20) utf8_general_ci YES (NULL)
 *         SELECT,INSERT,UPDATE,REFERENCES 用户名 uPwd VARCHAR(50) utf8_general_ci
 *         YES (NULL) SELECT,INSERT,UPDATE,REFERENCES 登陆密码 uDoPwd VARCHAR(50)
 *         utf8_general_ci YES (NULL) SELECT,INSERT,UPDATE,REFERENCES 操作密码
 *         uCompany VARCHAR(50) utf8_general_ci YES (NULL)
 *         SELECT,INSERT,UPDATE,REFERENCES 所属单位 uSex CHAR(1) utf8_general_ci YES
 *         (NULL) SELECT,INSERT,UPDATE,REFERENCES 性别 uPhone VARCHAR(20)
 *         utf8_general_ci YES (NULL) SELECT,INSERT,UPDATE,REFERENCES 联系方式 u_rId
 *         INT(20) (NULL) YES (NULL) SELECT,INSERT,UPDATE,REFERENCES 用户所属角色（外键）
 *         uRemark TEXT utf8_general_ci YES (NULL)
 *         SELECT,INSERT,UPDATE,REFERENCES 备注
 */
public class User extends Model<User> {

	public static final User me = new User();

	/*
	 * 关联表操作
	 */
	public Roles getRoles() {
		return Roles.me.findById(get("u_rId"));
	}

	/**
	 * 判断用户是否拥有登陆的权限
	 * 
	 * @param actionKey
	 * @return
	 */
	public boolean canVisit(String actionKey,HttpSession session) {
		String str2=Help.getCurrentRole(session).getStr("r_psId");
		boolean flag=false;
		if(str2!=null&&str2!=""){
			String roles[]=str2.split(",");
			for(String str:roles){
				String allow=Action.me.findById(str).getStr("aAllow");
				if(allow.contains(actionKey)){
					flag=true;
					break;
				}
			}
		}
		
		return flag;
	}

	/**
	 * 判断是否有该用户
	 * 
	 * @param user
	 * @return
	 */
	public User login_check(User user) {
		user.set("uPwd", new DESUtil().encryptStr(user.getStr("uPwd")));
		User u = findFirst("select * from user where uNo=? and uPwd=?",
				user.get("uNo"), user.get("uPwd"));
		u.set("uPwd", new DESUtil().decryptStr(u.getStr("uPwd")));
		return u;
	}

	/**
	 * 通过当前用户的角色 分页获取比当前用户角色级别低的用户信息
	 * 
	 * @param pageIndex
	 * @param roleLevel
	 * @return
	 */
	public Page<User> findByPage(int pageIndex, int roleLevel) {
		List<Roles> roles = Roles.me.find("select * from roles where rLevel>?",
				roleLevel);
		if (roles.size() > 0) {
			String str = "(";
			for (Roles r : roles) {
				str += r.get("rId") + ",";
			}
			str = str.substring(0, str.length() - 1);
			str += ")";
			Page<User> usersList = paginate(pageIndex, Help.getPageSize(),
					"select * ", "from user where u_rId in " + str);
			for (User u : usersList.getList()) {
				u.set("uRemark", u.getRoles().get("rName"));
				u.set("uPwd", new DESUtil().decryptStr(u.getStr("uPwd")));
			}
			return usersList;
		} else {
			return null;
		}

	}

	public List<User> likeSearch(String keyword) {
		List<User> users=find("select * from user,roles where user.u_rId=roles.rId and (uNo like '%" + keyword
				+ "%' or uName like '%" + keyword + "%' or uCompany like '%"
				+ keyword + "%' or uPhone like '%" + keyword
				+ "%' or uPhone like '%" + keyword + "%' or rName like '%" + keyword + "%' )");
		 
		for(User u:users){
			u.set("uPwd", new DESUtil().decryptStr(u.getStr("uPwd")));
		}
		return users;
	}

	public boolean exist(String name) {
		List<User> users=find("select * from user where uName=?",name);
		if(users.size()>0){
			return true;
		}else{
			return false;
		}
	}

	public User findByName(String name) {
		User user=findFirst("select * from user where uName=?",name);
		user.set("uPwd", new DESUtil().decryptStr(user.getStr("uPwd")));
		return user;
	}

	// **********************************内部帮助函数******************************************************************

}
