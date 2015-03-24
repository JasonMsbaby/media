package com.dz.media.model;

import java.util.List;

import com.jfinal.plugin.activerecord.Model;
/**
 * 用户信息Model
 * @author Jason
 *
 *
FIELD     TYPE         COLLATION        NULL    KEY     DEFAULT  Extra           PRIVILEGES                       COMMENT                       
--------  -----------  ---------------  ------  ------  -------  --------------  -------------------------------  ------------------------------
uId       INT(11)      (NULL)           NO      PRI     (NULL)   AUTO_INCREMENT  SELECT,INSERT,UPDATE,REFERENCES  ID                            
uNo       VARCHAR(20)  utf8_general_ci  YES             (NULL)                   SELECT,INSERT,UPDATE,REFERENCES  用户工号                  
uName     VARCHAR(20)  utf8_general_ci  YES             (NULL)                   SELECT,INSERT,UPDATE,REFERENCES  用户名                     
uPwd      VARCHAR(50)  utf8_general_ci  YES             (NULL)                   SELECT,INSERT,UPDATE,REFERENCES  登陆密码                  
uDoPwd    VARCHAR(50)  utf8_general_ci  YES             (NULL)                   SELECT,INSERT,UPDATE,REFERENCES  操作密码                  
uCompany  VARCHAR(50)  utf8_general_ci  YES             (NULL)                   SELECT,INSERT,UPDATE,REFERENCES  所属单位                  
uSex      CHAR(1)      utf8_general_ci  YES             (NULL)                   SELECT,INSERT,UPDATE,REFERENCES  性别                        
uPhone    VARCHAR(20)  utf8_general_ci  YES             (NULL)                   SELECT,INSERT,UPDATE,REFERENCES  联系方式                  
u_rId     INT(20)      (NULL)           YES             (NULL)                   SELECT,INSERT,UPDATE,REFERENCES  用户所属角色（外键）
uRemark   TEXT         utf8_general_ci  YES             (NULL)                   SELECT,INSERT,UPDATE,REFERENCES  备注                        

 */
public class User extends Model<User> {
	
	public static final User me = new User();

	/**
	 * 判断用户是否拥有登陆的权限
	 * @param actionKey
	 * @return
	 */
	public boolean canVisit(String actionKey) {
		//首先判断是否是默认允许的登陆页面
		/*if(compare(actionKey)){
			return true;
		}else{//判断用户是否拥有该项的权限
			
		}*/
		return false;
	}

	/**
	 * 判断是否有该用户
	 * @param user
	 * @return 
	 */
	public User login_check(User user) {
		User u=findFirst("select * from user where uName=? and uPwd=?",user.get("uName"),user.get("uPwd"));
		return u;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	//**********************************内部帮助函数******************************************************************

	
	
}
