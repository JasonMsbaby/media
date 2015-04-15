<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="../common/plugin.jsp" />
<!DOCTYPE >
<html>
<head>
<!-- 时间选择控件 -->
<link rel="stylesheet" type="text/css" href="Plugin/datepicker/css/jquery-ui.css">
<script type="text/javascript" src="Plugin/datepicker/js/jquery-ui-datepicker.js"></script>
<!-- 自动补全 -->
<link rel="stylesheet" type="text/css" href="Plugin/autocomplete/jquery.autocomplete.css">
<script type="text/javascript" src="Plugin/autocomplete/jquery.autocomplete.js"></script>
<script type="text/javascript" src="Style/js/autoCompelete.js"></script>
<script type="text/javascript">
    $(function() {
	$(".date").datepicker(); 
    });	
</script>
</head>
<body>
 <form method="post" method="post" action="saled/saledManger_add_submit">
  <div class="panel">
   <div class="panel-head icon-bookmark">&nbsp;&nbsp;添加售后记录</div>
   <div class="panel-body">
    <div class="form-group">
     <div class="label"><span class="float-right">销售编号</span> <label>销售编号</label></div>
     <div class="field"><input type="text" class="input" name="saled.sdNo" size="30"
      data-validate="required:不为空" readonly="readonly" placeholder="销售编号" value="${saledNo}"
     /></div>
   </div>
    <div class="form-group">
     <div class="label"><span class="float-right">请销售记录序号,双击文本框出现所有销售记录,如果未找到销售信息，请先进行销售记录的录入</span>
      <label>销售记录</label> <a class="button border-main button-little"
      onclick="openAdmin('sales/salesManger_add')"
     >添加销售记录</a></div>
     <div class="field"><input id="saled" type="text" class="input" size="30"
      name="saled.sd_sId" data-validate="required:不为空"
      placeholder="可以根据 商品信息/客户信息检索(建议使用用户手机号码进行查询) 支持模糊查找"
     /></div>
   </div>
    <div class="form-group">
     <div class="label"><span class="float-right">单据状态</span> <label>单据状态</label></div>
     <div class="field"><select name="saled.sdRepairStatus" class="input">
       <c:forEach items="${repireStatus}" var="li">
        <option value="${li.vName}">${li.vName}</option>
       </c:forEach>
     </select></div>
   </div>
    <div class="form-group">
     <div class="label"><span class="float-right">报修故障</span> <label>报修故障</label></div>
     <div class="field"><textarea name="saled.sdEquipmentTrouble" class="input" rows="5"
      cols="50" placeholder="描述客户报修的故障"
     ></textarea></div>
   </div>
    <div class="form-group">
     <div class="label"><span class="float-right">报修时间</span> <label>报修时间</label></div>
     <div class="field"><input type="text" class="input date" name="saled.sdReportDate"
      size="30" placeholder="点击选择报修时间"
     /></div>
   </div>
    <div class="form-group">
     <div class="label"><span class="float-right">备注</span> <label>备注</label></div>
     <div class="field"><input type="text" class="input" name="saled.sdRemark" size="30"
      placeholder="备注"
     /></div>
   </div>
  </div>
   <div class="panel-foot text-center"><input type="submit" class="button bg-main radius-none"
    value="提交保存"
   /></div>
 </div>
  </div>
</form>
</body>
</html>