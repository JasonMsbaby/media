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
  <div class="panel-head icon-bookmark">用户管理 <a
   style="margin-left: 5px; color: blue; font-size: 10px;" href="sys/userManger"
  >刷新</a> <a style="float: right;" class="button border-blue button-little" onclick="$('#admin').load('sys/userManger_add')" >添加用户</a></div>
  <div class="panel-body">
   <table class="table table-hover">
    <tr>
     <th>工号</th>
     <th>用户名</th>
     <th>性别</th>
     <th>用户密码</th>
     <th>操作密码</th>
     <th>所属单位</th>
     <th>联系电话</th>
     <th>所属角色</th>
     <th>操作</th>
   </tr>
    <c:forEach items="${users.list}" var="li">
     <tr>
      <td>${li.uNo}</td>
      <td>${li.uName}</td>
      <td>${li.uSex}</td>
      <td>${li.uPwd}</td>
      <td>${li.uDoPwd}</td>
      <td>${li.uCompany}</td>
      <td>${li.uPhone}</td>
      <td>${li.uRemark}</td>
      <td><a class="button border-blue button-little" href="userManger_edit.html?uId=${li.uId}">编辑</a>
       <a class="button border-red button-little" href="userManger_delete.html?uId=${li.uId}"
       onclick="return confirm('确认删除？')"
      >删除</a></td>
     </tr>
    </c:forEach>
  </table>
 </div> <!-- 分页 -->
  <div class="panel-foot text-center"><c:choose>
    <c:when test="${users.pageNumber==1}">
     <a class="button border-blue button-little ">上一页</a>
    </c:when>
    <c:otherwise>
     <a class="button border-blue button-little" onclick="$('#admin').load('sys/userManger?page=${users.pageNumber-1}')" >上一页</a>
    </c:otherwise>
   </c:choose> 总共${users.totalRow}条，每页10条，总共${users.totalPage}页 ，当前第${users.pageNumber}页 <c:choose>
    <c:when test="${users.pageNumber==users.totalPage}">
     <a class="button border-blue button-little disabled">下一页</a>
    </c:when>
    <c:otherwise>
     <a class="button border-blue button-little" onclick="$('#admin').load('sys/userManger?page=${users.pageNumber+1}')" >下一页</a>
    </c:otherwise>
   </c:choose> 跳转到 <select id="jump" onchange="$('#admin').load('sys/userManger?page='+this.options[this.options.selectedIndex].text)">
    <c:forEach begin="1" end="${users.totalPage}" var="li">
    <c:choose>
    <c:when test="${users.pageNumber==li}"><option selected="selected">${li}</option></c:when>
    <c:otherwise><option>${li}</option></c:otherwise>
    </c:choose>
    </c:forEach>
  </select> 页</div>
</div>
</body>
</html>