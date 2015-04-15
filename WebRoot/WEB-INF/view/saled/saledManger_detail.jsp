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
  <div class="panel-head icon-bookmark">&nbsp;&nbsp;售后信息详情</div>
  <div class="panel-body">
   <div class="table-responsive">
    <table class="table table-bordered">
     <tr><td class="td1">编号</td>
      <td>${saled.sdNo}</td></tr>
     <tr>
      <td class="td1">商品信息</td>
      <td>
       <table class="table">
        <tr>
         <th>商品编号</th>
         <th>大类</th>
         <th>名称</th>
         <th>型号</th>
         <th>规格单位</th>
       </tr>
        <tr>
         <td>${goods.goNo}</td>
         <td>${goods.goType}</td>
         <td>${goods.goName}</td>
         <td>${goods.goVersion}</td>
         <td>${goods.goFormat}</td>
       </tr>
      </table>
     </td>
    </tr>
     <tr><td class="td1">售后类型</td>
      <td>${saled.sdType}</td></tr>
     <tr><td class="td1">单据状态</td>
      <td>${saled.sdRepairStatus}</td></tr>
     <tr><td class="td1">报修日期</td>
      <td>${saled.sdReportDate}</td></tr>
     <tr><td class="td1">维修时间</td>
      <td>${saled.sdRepairDate}</td></tr>
     <tr><td class="td1">故障原因</td>
      <td>${saled.sdEquipmentTrouble}</td></tr>
     <tr><td class="td1">客户资料</td>
      <td>
       <table class="table">
        <tr>
         <th>编号</th>
         <th>姓名</th>
         <th>性别</th>
         <th>手机号</th>
         <th>固话</th>
         <th>单位名称</th>
         <th>家庭住址</th>
         <th>VIP号码</th>
         <th>QQ号码</th>
       </tr>
        <tr>
         <td>${guest.gNo}</td>
         <td>${guest.gName}</td>
         <td>${guest.gSex}</td>
         <td>${guest.gPhone}</td>
         <td>${guest.gTel}</td>
         <td>${guest.gCompany}</td>
         <td>${guest.gAdress}</td>
         <td>${guest.gVIP}</td>
         <td>${guest.gQQ}</td>
       </tr>
      </table>
     </td>
    </tr>
     <tr><td class="td1">维修工资料</td>
      <td>
       <table class="table">
        <tr>
         <th>工号</th>
         <th>姓名</th>
         <th>性别</th>
         <th>所属单位</th>
         <th>联系方式</th>
       </tr>
        <tr>
         <td>${user.uNo}</td>
         <td>${user.uName}</td>
         <td>${user.uSex}</td>
         <td>${user.uCompany}</td>
         <td>${user.uPhone}</td>
       </tr>
      </table>
     </td>
    </tr>
     <tr><td class="td1">收费项目</td>
      <td>
       <table class="table">
        <tr>
         <th>收费类型</th>
         <th>收费金额</th>
         <th>交通费用</th>
         <th>其他费用</th>
       </tr>
        <tr>
         <td>${guest.sdChargeType}</td>
         <td>${guest.sdChargeMoney}</td>
         <td>${guest.sdTrafficMoney}</td>
         <td>${guest.sdOtherMoney}</td>
       </tr>
      </table>
     </td></tr>
     <tr><td class="td1">审核</td>
      <td>
       <table class="table">
        <tr>
         <th>审核状态</th>
         <th>审核意见</th>
         <th>审核人</th>
         <th>审核时间</th>
       </tr>
        <tr>
         <td>${guest.sdCheckStatus}</td>
         <td>${guest.sdCheckSuggestion}</td>
         <td>${guest.sdCheckPerson}</td>
         <td>${guest.sdCheckDate}</td>
       </tr>
      </table>
     </td></tr>
     <tr><td class="td1">录入员</td>
      <td>${saled.sdInputPerson}</td></tr>
     <tr><td class="td1">录入时间</td>
      <td>${saled.sdInputDate}</td></tr>
     <tr><td class="td1">备注</td>
      <td>${saled.gInputDate}</td></tr>
     <tr><td class="td1">备注</td>
      <td>${saled.sdRemark}</td></tr>
   </table>
  </div>
 </div>
  <div class="panel-foot text-center"></div>
</div>
</body>
</html>