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
  <div class="panel-head icon-bookmark">&nbsp;&nbsp;备件基本信息管理 <a id="refresh"onclick="openAdmin('sparePartsBase/sparePartsBaseManger')"
  >刷新</a> <a style="float: right;" class="button border-blue button-little" onclick="openAdmin('sparePartsBase/sparePartsBaseManger_add')" >添加备件</a></div>
  <div class="panel-body">
   <table class="table table-hover">
    <tr>
     <th>编号</th>
     <th>备件大类</th>
     <th>备件名称</th>
     <th>库存量</th>
     <th>规格单位</th>
     <th>备注</th>
     <th>操作</th>
   </tr>
    <c:forEach items="${spb.list}" var="li">
     <tr>
      <td>${li.sbNo}</td>
      <td>${li.sbType}</td>
      <td>${li.sbName}</td>
      <td>${li.sbNumber}</td>
      <td>${li.sbFormat}</td>
      <td>${li.sbRemark}</td>
      <td><a class="button border-blue button-little" onclick="openAdmin('sparePartsBase/sparePartsBaseManger_edit?id=${li.sbId}')">编辑</a>
       <a class="button border-red button-little" 
       onclick="if(confirm('确认删除？')){openAdmin('sparePartsBase/sparePartsBaseManger_delete?id=${li.sbId}');}"
      >删除</a></td>
     </tr>
    </c:forEach>
  </table>
 </div> <!-- 分页 -->
  <div class="panel-foot text-center"><c:choose>
    <c:when test="${spb.pageNumber==1}">
     <a class="button border-blue button-little ">上一页</a>
    </c:when>
    <c:otherwise>
     <a class="button border-blue button-little" onclick="$('#admin').load('sparePartsBase/sparePartsBaseManger?page=${spb.pageNumber-1}')" >上一页</a>
    </c:otherwise>
   </c:choose> 总共${spb.totalRow}条，每页10条，总共${spb.totalPage}页 ，当前第${spb.pageNumber}页 <c:choose>
    <c:when test="${spb.pageNumber==spb.totalPage}">
     <a class="button border-blue button-little disabled">下一页</a>
    </c:when>
    <c:otherwise>
     <a class="button border-blue button-little" onclick="$('#admin').load('sparePartsBase/sparePartsBaseManger?page=${spb.pageNumber+1}')" >下一页</a>
    </c:otherwise>
   </c:choose> 跳转到 <select id="jump" onchange="$('#admin').load('sparePartsBase/sparePartsBaseManger?page='+this.options[this.options.selectedIndex].text)">
    <c:forEach begin="1" end="${spb.totalPage}" var="li">
    <c:choose>
    <c:when test="${spb.pageNumber==li}"><option selected="selected">${li}</option></c:when>
    <c:otherwise><option>${li}</option></c:otherwise>
    </c:choose>
    </c:forEach>
  </select> 页</div>
</div>
</body>
</html>