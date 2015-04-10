package com.dz.media.model;

import java.util.List;

import com.dz.media.common.Help;
import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;

/**
 * 商品信息Model
 * 
 * @author Jason
 * 
 */
public class Goods extends Model<Goods> {

	public static final Goods me = new Goods();

	/**
	 * 通过价目表中所匹配的商品进行商品不重复的全部检索
	 * 
	 * @return
	 */
	public Page<Goods> getAllDistinct(int pageNumber, String keyword) {
		return paginate(
				pageNumber,
				Help.getPageSize(),
				"SELECT *",
				" FROM goods WHERE goId IN(SELECT  DISTINCT(p_gId)  FROM prices) AND ( goId LIKE '%"
						+ keyword
						+ "%' OR  goNo LIKE '%"
						+ keyword
						+ "%' OR goName LIKE '%"
						+ keyword
						+ "%' OR goVersion LIKE '%" + keyword + "%')");
	}

	/**
	 * 通过商品编号获取数据
	 * 
	 * @param para
	 * @return
	 */
	public List<Goods> findByNo(int para) {
		return find("select * from goods where goNo=?", para);
	}

	/**
	 * 根据传过来的关键字去查找相似的记录
	 * 
	 * @param para
	 * @return
	 */
	public Page<Goods> likeSearch(int pageNumber, String para) {
		Page<Goods> goods = paginate(pageNumber, Help.getPageSize(),
				"select *", "FROM goods WHERE goNo LIKE '%" + para
						+ "%' OR goName LIKE '%" + para
						+ "%' OR goVersion LIKE '%" + para
						+ "%' OR goType LIKE '%" + para + "%'");
		return goods;
	}

	public List<Goods> likeSearch(String para) {
		List<Goods> goods = find("select * FROM goods WHERE goId like '%"
				+ para + "%' or  goNo LIKE  '%" + para + "%' OR goName LIKE '%"
				+ para + "%' OR goVersion LIKE '%" + para
				+ "%' OR goType LIKE '%" + para + "%'");
		return goods;
	}

	public Page<Goods> getByPage(int pageNumber, String keyword) {
		return paginate(pageNumber, Help.getPageSize(), "select * ",
				"from goods where goId like '%" + keyword
						+ "%' or goType like '%" + keyword
						+ "%' or goName like '%" + keyword
						+ "%' or goVersion like '%" + keyword
						+ "%' or goFormat like '%" + keyword
						+ "%' order by goType");
	}
}
