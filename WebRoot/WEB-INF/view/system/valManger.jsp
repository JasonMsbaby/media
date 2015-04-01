<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="../common/plugin.jsp" />
<!DOCTYPE >
<html>
<head>
</head>
<body>
 <div class="panel">
  <div class="panel-head icon-bookmark">综合变量设置 <a id="refresh"
   onclick="openAdmin('sys/valManger')"
  >刷新</a> <!-- <a style="float: right;" class="button border-blue button-little"
   onclick="openAdmin('sys/valManger_add_big')"
  >添加新变量</a> --></div>
  <div class="panel-body">
   <table class="table table-hover">
    <tr>
     <th>编号</th>
     <th>变量名称</th>
     <th>变量类型</th>
     <th>变量值</th>
     <th>备注</th>
     <th>操作</th>
   </tr>
    <c:forEach items="${rootVal}" var="li">
     <tr>
      <td>${li.vId}</td>
      <td>${li.vName}</td>
      <td>${li.vType}</td>
      <td><c:forEach items="${vals}" var="li2" varStatus="status">
        <c:if test="${li2.vType==li.vId}">
                    【${li2.vName}】
        </c:if>
       </c:forEach></td>
      <td>${li.vRemark}</td>
      <td><a class="button border-blue button-little"
       onclick="openAdmin('sys/valManger_edit?id=${li.vId}')"
      >编辑</a>
     </tr>
    </c:forEach>
  </table>
 </div>
</div>
</body>
</html>