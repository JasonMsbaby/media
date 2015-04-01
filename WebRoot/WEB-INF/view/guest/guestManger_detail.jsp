<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
  <div class="panel-head icon-bookmark">客户信息详情</div>
  <div class="panel-body">
   <div class="table-responsive">
    <table class="table table-bordered">
     <tr><td class="td1">客户编号</td>
      <td>${guest.gNo}</td></tr>
     <tr><td class="td1">姓名</td>
      <td>${guest.gName}</td></tr>
     <tr><td class="td1">性别</td>
      <td>${guest.gSex}</td></tr>
     <tr><td class="td1">手机号</td>
      <td>${guest.gPhone}</td></tr>
     <tr><td class="td1">固话/座机</td>
      <td>${guest.gTel}</td></tr>
     <tr><td class="td1">单位名称</td>
      <td>${guest.gCompany}</td></tr>
     <tr><td class="td1">家庭地址</td>
      <td>${guest.gAdress}</td></tr>
     <tr><td class="td1">VIP会员号</td>
      <td>${guest.gVIP}</td></tr>
     <tr><td class="td1">QQ号码</td>
      <td>${guest.gQQ}</td></tr>
     <tr><td class="td1">电子邮箱</td>
      <td>${guest.gEmail}</td></tr>
     <tr><td class="td1">身份证号码</td>
      <td>${guest.gIDcard}</td></tr>
     <tr><td class="td1">录入时间</td>
      <td>${guest.gInputDate}</td></tr>
     <tr><td class="td1">备注</td>
      <td>${guest.gRemark}</td></tr>
   </table>
  </div>
 </div>
  <div class="panel-foot text-center"></div>
</div>
</body>
</html>