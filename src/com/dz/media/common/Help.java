package com.dz.media.common;
/**
 * 通用帮助类
 * @author Jason
 *
 */
public class Help {

	public static String getAlert(String msg,String url){
		return "<script>alert('"+msg+"');window.location.href='"+url+"'</script>";
	}

	public static String getAlert(String msg) {
		return "<script>alert('"+msg+"');</script>";
	}
}
