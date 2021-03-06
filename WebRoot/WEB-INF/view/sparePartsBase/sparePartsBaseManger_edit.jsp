<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="../common/plugin.jsp" />
<!DOCTYPE >
<html>
<head>
</head>
<body>
 <form method="post" method="post" action="sparePartsBase/sparePartsBaseManger_edit_submit">
  <div class="panel">
   <div class="panel-head icon-bookmark">&nbsp;&nbsp;编辑备件</div>
   <div class="panel-body"><input type="hidden" name="spb.sbId" value="${spb.sbId}" />
    <div class="form-group">
     <div class="label"><span class="float-right">备件编号</span> <label>备件编号</label></div>
     <div class="field"><input type="text" class="input" name="spb.sbNo" size="30"
      data-validate="required:不为空" placeholder="备件编号" value="${spb.sbNo}"
     /></div>
   </div>
    <div class="form-group">
     <div class="label"><span class="float-right">请选择备件大类</span> <label>备件大类</label></div>
     <div class="field"><select class="input" name="spb.sbType">
       <c:forEach items="${spbType}" var="li">
        <c:choose>
         <c:when test="${li.vName==spb.sbType}">
          <option selected="selected" value="${li.vName}">${li.vName}</option>
         </c:when>
         <c:otherwise>
          <option value="${li.vName}">${li.vName}</option>
         </c:otherwise>
        </c:choose>
       </c:forEach>
     </select></div>
   </div>
    <div class="form-group">
     <div class="label"><span class="float-right">备件名称</span> <label>备件名称</label></div>
     <div class="field"><input type="text" class="input" name="spb.sbName" size="30"
      placeholder="备件名称" value="${spb.sbName}"
     /></div>
   </div>
    <div class="form-group">
     <div class="label"><span class="float-right">规格单位</span> <label>规格单位</label></div>
     <div class="field"><select class="input" name="spb.sbFormat">
       <c:forEach items="${spbFormat}" var="li">
        <c:choose>
         <c:when test="${li.vName==spb.sbFormat}">
          <option selected="selected" value="${li.vName}">${li.vName}</option>
         </c:when>
         <c:otherwise>
          <option value="${li.vName}">${li.vName}</option>
         </c:otherwise>
        </c:choose>
       </c:forEach>
     </select></div>
   </div>
    <div class="form-group">
     <div class="label"><span class="float-right">库存量</span> <label>库存量</label></div>
     <div class="field"><input type="text" class="input" name="spb.sbNumber" size="30"
      placeholder="库存量" data-validate="required:不为空" value="${spb.sbNumber}"
     /></div>
   </div>
    <div class="form-group">
     <div class="label"><span class="float-right">备注</span> <label>备注</label></div>
     <div class="field"><input type="text" class="input" name="spb.sbRemark" size="30"
      placeholder="备注" value="${spb.sbRemark}"
     /></div>
   </div></div>
   <div class="panel-foot text-center"><input type="submit" class="button bg-main radius-none"
    value="提交保存"
   /></div>
 </div>
</form>
</body>
</html>