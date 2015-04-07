<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="../common/plugin.jsp" />
<!DOCTYPE>
<html>
<head>
<style type="text/css">
.td1 {
	width: 20%;
	text-align: center;
}
</style>
</head>
<body>
 <div class="panel">
  <div class="panel-head icon-bookmark">商品基本信息详情</div>
  <div class="panel-body">
   <div class="table-responsive">
    <table class="table table-bordered">
     <tr><td class="td1">商品编号</td>
      <td>${goods.goNo}</td></tr>
     <tr><td class="td1">商品大类</td>
      <td>${goods.goType}</td></tr>
     <tr><td class="td1">商品名称</td>
      <td>${goods.goName}</td></tr>
      <tr><td class="td1">商品型号</td>
      <td>${goods.goVersion}</td></tr>
     <tr><td class="td1">详细配置</td>
      <td>${goods.goProperty}</td></tr>
     <tr><td class="td1">规格单位</td>
      <td>${goods.goFormat}</td></tr>
     <tr><td class="td1">图片详情</td>
      <td>${goods.goImg}</td></tr>
     <tr><td class="td1"> </td>
      <td>${goods.goRemark}</td>
   </table>
  </div>
 </div>
  <div class="panel-foot text-center"></div>
</div>
</body>
</html>