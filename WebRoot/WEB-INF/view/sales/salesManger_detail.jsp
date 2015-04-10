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
  <div class="panel-head icon-bookmark">销售信息详情</div>
  <div class="panel-body">
   <div class="table-responsive">
    <table class="table table-bordered">
     <tr><td class="td1">销售单号</td>
      <td>${sales.sNo}</td></tr>
     <tr><td class="td1">商品信息</td>
      <td>
       <table class="table">
        <tr>
         <th>商品编号</th>
         <th>商品大类</th>
         <th>商品名称</th>
         <th>商品型号</th>
         <th>规格单位</th>
         <th>备注</th>
       </tr>
        <tr>
         <td>${sales.goNo}</td>
         <td>${sales.goType}</td>
         <td>${sales.goName}</td>
         <td>${sales.goVersion}</td>
         <td>${sales.goFormat}</td>
         <td>${sales.goRemark}</td>
       </tr>
      </table>
     </td>
    </tr>
     <tr><td class="td1">客户信息</td>
      <td>
       <table class="table">
        <tr><td class="td1">编号</td>
         <td>${sales.gNo}</td></tr>
        <tr><td class="td1">姓名</td>
         <td>${sales.gName}</td></tr>
        <tr><td class="td1">性别</td>
         <td>${sales.gSex}</td></tr>
        <tr><td class="td1">手机号</td>
         <td>${sales.gPhone}</td></tr>
        <tr><td class="td1">固话</td>
         <td>${sales.gTel}</td></tr>
        <tr><td class="td1">单位名称</td>
         <td>${sales.gCompany}</td></tr>
        <tr><td class="td1">详细地址</td>
         <td>${sales.gAdress}</td></tr>
        <tr><td class="td1">VIP号码</td>
         <td>${sales.gVIP}</td></tr>
        <tr><td class="td1">QQ号码</td>
         <td>${sales.gQQ}</td></tr>
        <tr><td class="td1">邮箱号</td>
         <td>${sales.gEmail}</td></tr>
        <tr><td class="td1">身份证号</td>
         <td>${sales.gIDcard}</td></tr>
         <tr><td class="td1">录入时间</td>
         <td>${sales.gInputDate}</td></tr>
         <tr><td class="td1">备注</td>
         <td>${sales.gRemark}</td></tr>
      </table>
     </td>
    </tr>
     <tr><td class="td1">数量</td>
      <td>${sales.sNum}</td></tr>
     <tr><td class="td1">应收金额</td>
      <td>${sales.sReceivable}</td></tr>
     <tr><td class="td1">实收金额</td>
      <td>${sales.sReceived}</td></tr>
     <tr><td class="td1">销售日期</td>
      <td>${sales.sSaledDate}</td></tr>
     <tr><td class="td1">质保截至</td>
      <td>${sales.sWarrantyDate}</td></tr>
     <tr><td class="td1">技术负责人</td>
      <td>${sales.sTechnologyPerson}</td></tr>
     <tr><td class="td1">销售单位</td>
      <td>${sales.sSalesUnit}</td></tr>
     <tr><td class="td1">销售代表</td>
      <td>${sales.sSalesRepresentative}</td></tr>
     <tr><td class="td1">购买方式</td>
      <td>${sales.sPayType}</td></tr>
     <tr><td class="td1">发票号码</td>
      <td>${sales.sInvoice}</td></tr>
     <tr><td class="td1">录入时间</td>
      <td>${sales.sInputDate}</td></tr>
     <tr><td class="td1">录入员</td>
      <td>${sales.sInputPerson}</td></tr>
     <tr><td class="td1">备注</td>
      <td>${sales.sRemark}</td></tr>
   </table>
  </div>
 </div>
  <div class="panel-foot text-center"></div>
</div>
</body>
</html>