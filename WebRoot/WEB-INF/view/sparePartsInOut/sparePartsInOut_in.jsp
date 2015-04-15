<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="../common/plugin.jsp" />
<!DOCTYPE >
<html>
<head>
<!-- 自动补全 -->
<link rel="stylesheet" type="text/css" href="Plugin/autocomplete/jquery.autocomplete.css">
<script type="text/javascript" src="Plugin/autocomplete/jquery.autocomplete.js"></script>
<script type="text/javascript" src="Style/js/autoCompelete.js"></script>
</head>
<body>
 <form method="post" method="post" action="sparePartsInOut/sparePartsInOut_in_submit">
  <div class="panel">
   <div class="panel-head icon-bookmark">&nbsp;&nbsp;备件入库</div>
   <div class="panel-body">
    <div class="form-group">
     <div class="label"><span class="float-right">入库编号</span> <label>入库编号</label></div>
     <div class="field"><input type="text" class="input" name="in.siNo" size="30"
      data-validate="required:不为空" readonly="readonly" placeholder="入库编号" value="${No}"
     /></div>
   </div>
    <div class="form-group">
     <div class="label"><span class="float-right">请选择备件</span> <label>备件</label></div>
     <div class="field"><input type="text" id="spareParts" class="input" name="in.si_sbId" size="30"
      data-validate="required:不为空" placeholder="请选择备件名称（模糊查找）"
     /></div>
   </div>
    <div class="form-group">
     <div class="label"><span class="float-right">请填写入库人员姓名</span> <label>入库人员姓名</label></div>
     <div class="field"><input type="text" class="input" name="in.siPerson" size="30"
      data-validate="required:不为空" placeholder="入库人员姓名"
     /></div>
   </div>
    <div class="form-group">
     <div class="label"><span class="float-right">数量</span> <label>数量</label></div>
     <div class="field"><input type="text" class="input" name="in.siNumber" size="30"
      placeholder="数量"
     /></div>
   </div>
   <div class="form-group">
     <div class="label"><span class="float-right">备注</span> <label>备注</label></div>
     <div class="field"><input type="text" class="input" name="in.siRemark" size="30"
      placeholder="备注"
     /></div>
   </div>
  </div>
   <div class="panel-foot text-center"><input type="submit" class="button bg-main radius-none"
    value="提交保存"
   /></div>
 </div>
</form>
</body>
</html>