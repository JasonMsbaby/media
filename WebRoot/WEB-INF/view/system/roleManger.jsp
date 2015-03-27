<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="../common/plugin.jsp"></jsp:include>
<!DOCTYPE >
<html>
<head>
</head>
<body>
 <div class="panel">
  <div class="panel-head icon-bookmark">角色管理 <a id="refresh"onclick="openAdmin('sys/roleManger')"
  >刷新</a> <a style="float: right;" class="button border-blue button-little" onclick="openAdmin('sys/roleManger_add')" >添加角色</a></div>
  <div class="panel-body">
   <table class="table table-hover">
    <tr>
     <th>编号</th>
     <th>角色名称</th>
     <th>角色等级</th>
     <th>备注</th>
     <th>操作</th>
   </tr>
    <c:forEach items="${roles.list}" var="li">
     <tr>
      <td>${li.rId}</td>
      <td>${li.rName}</td>
      <td>${li.rLevel}</td>
      <td>${li.rRemark}</td>
      <td><a class="button border-blue button-little" onclick="openAdmin('sys/roleManger_edit?id=${li.rId}')">编辑</a>
       <a class="button border-red button-little" 
       onclick="if(confirm('确认删除？')){openAdmin('sys/roleManger_delete?id=${li.rId}');}"
      >删除</a></td>
     </tr>
    </c:forEach>
  </table>
 </div> <!-- 分页 -->
  <div class="panel-foot text-center"><c:choose>
    <c:when test="${roles.pageNumber==1}">
     <a class="button border-blue button-little ">上一页</a>
    </c:when>
    <c:otherwise>
     <a class="button border-blue button-little" onclick="$('#admin').load('sys/userManger?page=${roles.pageNumber-1}')" >上一页</a>
    </c:otherwise>
   </c:choose> 总共${roles.totalRow}条，每页10条，总共${roles.totalPage}页 ，当前第${roles.pageNumber}页 <c:choose>
    <c:when test="${roles.pageNumber==roles.totalPage}">
     <a class="button border-blue button-little disabled">下一页</a>
    </c:when>
    <c:otherwise>
     <a class="button border-blue button-little" onclick="$('#admin').load('sys/userManger?page=${roles.pageNumber+1}')" >下一页</a>
    </c:otherwise>
   </c:choose> 跳转到 <select id="jump" onchange="$('#admin').load('sys/userManger?page='+this.options[this.options.selectedIndex].text)">
    <c:forEach begin="1" end="${roles.totalPage}" var="li">
    <c:choose>
    <c:when test="${roles.pageNumber==li}"><option selected="selected">${li}</option></c:when>
    <c:otherwise><option>${li}</option></c:otherwise>
    </c:choose>
    </c:forEach>
  </select> 页</div>
</div>
</body>
</html>