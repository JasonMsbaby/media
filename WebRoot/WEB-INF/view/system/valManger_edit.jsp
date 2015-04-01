<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="../common/plugin.jsp" />
<!DOCTYPE>
<html>
<head>
</head>
<body>
 <div class="panel">
  <div class="panel-head icon-bookmark">${val.vName}【已拥有变量】</div>
  <div class="panel-body">
   <div class=""><c:forEach items="${vals}" var="li">
     &nbsp; &nbsp;<a style="margin-top: 10px;" class="button bg-gray badge-corner">${li.vName}<span
      class="badge bg-dot"
      onclick="if(confirm('确实要删除该变量吗？')){openAdmin('sys/valManger_delete?id=${li.vId}')}"
     >x</span></a>
    </c:forEach></div>
 </div>
  <div class="panel-foot text-center">
   <form method="post" action="sys/valManger_edit_submit">
    <div class="input-inline clearfix"><input name="val.vType" type="hidden"
     value="${val.vId}"
    /> <input type="text" class="input" name="val.vName" size="60"
     placeholder="在此键入添加新变量值执行添加,点击上面已有变量进行删除"
    /> <input class="button" type="submit" value="提交" /></div>
  </form>
 </div>
</div>
</body>
</html>