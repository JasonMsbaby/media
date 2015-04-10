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
  <div class="panel-head icon-bookmark">&nbsp;&nbsp;客户管理 <a id="refresh"onclick="openAdmin('guest/guestManger')"
  >刷新</a> <a style="float: right;" class="button border-blue button-little" onclick="$('#admin').load('guest/guestManger_add')" >添加客户信息</a></div>
  <div class="panel-body">
  <div class="panel">
    <div class="panel-body">
     <form method="post" class="form-inline" action="guest/guestManger">
      <div class="form-group">
       <div class="label"><label >检索条件&nbsp;&nbsp;</label></div>
       <div class="field"><input type="text" class="input" name="keyword"
        size="125" placeholder="支持模糊查找 " value="${keyword}"
       /></div>
     </div>
      <div class="form-button"><button class="button bg-main" type="submit">搜索</button></div>
    </form>
   </div>
  </div>
   <table class="table table-hover">
    <tr>
     <th>用户编号</th>
     <th>姓名</th>
     <th>性别</th>
     <th>手机号</th>
     <th>固话/座机</th>
     <th>单位名称</th>
     <th>家庭住址</th>
     <th>VIP会员号</th>
     <!-- <th>QQ号码</th> -->
     <!-- <th>邮箱号</th>
     <th>身份证号</th> -->
     <th>录入时间</th>
     <!-- <th>备注</th> -->
     <th>操作</th>
   </tr>
    <c:forEach items="${guest.list}" var="li">
     <tr>
      <td>${li.gNo}</td>
      <td>${li.gName}</td>
      <td>${li.gSex}</td>
      <td>${li.gPhone}</td>
      <td>${li.gTel}</td>
      <td>${li.gCompany}</td>
      <td>${li.gAdress}</td>
      <td>${li.gVIP}</td>
      <%-- <td>${li.gQQ}</td> --%>
      <%-- <td>${li.gEmail}</td> --%>
      <%-- <td>${li.gIDcard}</td> --%>
      <td>${li.gInputDate}</td>
      <%-- <td>${li.gRemark}</td> --%>
      <td>
      <a class="button border-green button-little" onclick="openAdmin('guest/guestManger_detail?id=${li.gId}')">查看详情</a>
      <a class="button border-blue button-little" onclick="openAdmin('guest/guestManger_edit?id=${li.gId}')">编辑</a>
       <a class="button border-red button-little" 
       onclick="if(confirm('确认删除？')){openAdmin('guest/guestManger_delete?id=${li.gId}');}"
      >删除</a></td>
     </tr>
    </c:forEach>
  </table>
 </div> <!-- 分页 -->
  <div class="panel-foot text-center"><c:choose>
    <c:when test="${guest.pageNumber==1}">
     <a class="button border-blue button-little ">上一页</a>
    </c:when>
    <c:otherwise>
     <a class="button border-blue button-little" onclick="$('#admin').load('guest/guestManger?page=${guest.pageNumber-1}&&keyword=${keyword}')" >上一页</a>
    </c:otherwise>
   </c:choose> 总共${guest.totalRow}条，每页${guest.pageSize}条，总共${guest.totalPage}页 ，当前第${guest.pageNumber}页 <c:choose>
    <c:when test="${guest.pageNumber==guest.totalPage}">
     <a class="button border-blue button-little disabled">下一页</a>
    </c:when>
    <c:otherwise>
     <a class="button border-blue button-little" onclick="$('#admin').load('guest/guestManger?page=${guest.pageNumber+1}&&keyword=${keyword}')" >下一页</a>
    </c:otherwise>
   </c:choose> 跳转到 <select id="jump" onchange="$('#admin').load('guest/guestManger?page='+this.options[this.options.selectedIndex].text)+'&&keyword=${keyword}'">
    <c:forEach begin="1" end="${guest.totalPage}" var="li">
    <c:choose>
    <c:when test="${guest.pageNumber==li}"><option selected="selected">${li}</option></c:when>
    <c:otherwise><option>${li}</option></c:otherwise>
    </c:choose>
    </c:forEach>
  </select> 页</div>
</div>
</body>
</html>