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
  <div class="panel-head icon-bookmark">商品基本信息管理 <a id="refresh"onclick="openAdmin('goods/goodsManger')"
  >刷新</a> <a style="float: right;" class="button border-blue button-little" onclick="$('#admin').load('goods/goodsManger_add')" >添加商品</a></div>
  <div class="panel-body">
   <table class="table table-hover">
    <tr>
     <th>商品编号</th>
     <th>商品大类</th>
     <th>商品名称</th>
     <th>商品型号</th>
     <th>规格单位</th>
     <th>备注</th>
     <th>操作</th>
   </tr>
    <c:forEach items="${goods.list}" var="li">
     <tr>
      <td>${li.goNo}</td>
      <td>${li.goType}</td>
      <td>${li.goName}</td>
      <td>${li.goVersion}</td>
      <td>${li.goFormat}</td>
      <td>${li.goRemark}</td>
      <td><a class="button border-blue button-little" onclick="openAdmin('goods/goodsManger_edit?id=${li.uId}')">编辑</a>
       <a class="button border-red button-little" 
       onclick="if(confirm('确认删除？')){openAdmin('goods/goodsManger_delete?id=${li.uId}');}"
      >删除</a></td>
     </tr>
    </c:forEach>
  </table>
 </div> <!-- 分页 -->
  <div class="panel-foot text-center"><c:choose>
    <c:when test="${goods.pageNumber==1}">
     <a class="button border-blue button-little ">上一页</a>
    </c:when>
    <c:otherwise>
     <a class="button border-blue button-little" onclick="$('#admin').load('sys/userManger?page=${goods.pageNumber-1}')" >上一页</a>
    </c:otherwise>
   </c:choose> 总共${goods.totalRow}条，每页10条，总共${goods.totalPage}页 ，当前第${goods.pageNumber}页 <c:choose>
    <c:when test="${goods.pageNumber==goods.totalPage}">
     <a class="button border-blue button-little disabled">下一页</a>
    </c:when>
    <c:otherwise>
     <a class="button border-blue button-little" onclick="$('#admin').load('sys/userManger?page=${goods.pageNumber+1}')" >下一页</a>
    </c:otherwise>
   </c:choose> 跳转到 <select id="jump" onchange="$('#admin').load('sys/userManger?page='+this.options[this.options.selectedIndex].text)">
    <c:forEach begin="1" end="${goods.totalPage}" var="li">
    <c:choose>
    <c:when test="${goods.pageNumber==li}"><option selected="selected">${li}</option></c:when>
    <c:otherwise><option>${li}</option></c:otherwise>
    </c:choose>
    </c:forEach>
  </select> 页</div>
</div>
</body>
</html>