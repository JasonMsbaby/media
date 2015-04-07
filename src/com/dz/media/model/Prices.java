package com.dz.media.model;

import java.util.List;

import com.jfinal.plugin.activerecord.Model;
/**
 * 价目信息Model
 * @author Jason
 *
 */
public class Prices extends Model<Prices> {
	
	public static final Prices me = new Prices();

	/**
	 * 获取所有的数据
	 * @return
	 */
	public List<Prices> getAll() {
		return find("select * from prices");
	}

	/**
	 * 通过商品的编号获取商品的出售/采购价格表
	 * @param paraToInt
	 * @param string
	 * @return
	 */
	public List<Prices> getByGoodsAndType(Integer p_gId, String pType) {
		return find("select * from prices LEFT JOIN USER ON user.uId=prices.pPerson where p_gId=? and pType=?  order by pDate asc", p_gId,pType);
	}

	/**
	 * 根据价格的商品ID删除该商品的所有价格
	 * @param paraToInt
	 * @return
	 */
	public boolean deleteByType(Integer paraToInt) {
		List<Prices> pList=find("select * from prices where p_gId=?",paraToInt);
		boolean b=true;
		for(Prices p:pList){
			if(p.delete()==false){
				b=false;
				break;
			}
		}
		return b;
	}

}
