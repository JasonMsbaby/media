package com.dz.media.model;

import java.util.List;

import com.jfinal.plugin.activerecord.Model;
/**
----------------------
连接模块表
FIELD    TYPE          COLLATION        NULL    KEY     DEFAULT  Extra           PRIVILEGES                       COMMENT     
-------  ------------  ---------------  ------  ------  -------  --------------  -------------------------------  ------------
aId      VARCHAR(20)   utf8_general_ci  NO              (NULL)           SELECT,INSERT,UPDATE,REFERENCES  ID  
aType    VARCHAR(50)   utf8_general_ci  YES             (NULL)                   SELECT,INSERT,UPDATE,REFERENCES  请求类型
aName    VARCHAR(50)   utf8_general_ci  YES             (NULL)                   SELECT,INSERT,UPDATE,REFERENCES  ACTION名称
aLink    VARCHAR(100)  utf8_general_ci  YES             (NULL)                   SELECT,INSERT,UPDATE,REFERENCES  ACTION连接
aShow    INT(1)        (NULL)           YES             (NULL)                   SELECT,INSERT,UPDATE,REFERENCES  是否显示
aOrder   INT(10)       (NULL)           YES             (NULL)                   SELECT,INSERT,UPDATE,REFERENCES  排序方式
aRemark  TEXT          utf8_general_ci  YES             (NULL)                   SELECT,INSERT,UPDATE,REFERENCES  备注      
 */
public class Action extends Model<Action> {
	public static final Action me = new Action();
	/**
	 * 获取所有的集合
	 * @return
	 */
	public List<Action> getAll() {
		return find("select * from action");
	}
	/**
	 * 获取所有集合的个数
	 * @return
	 */
	public int getCount(){
		find("select count(*) from action").get(0).get("count(*)").toString();
		return Integer.parseInt(find("select count(*) from action").get(0).get("count(*)").toString());
	}
}
