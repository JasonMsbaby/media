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
  <div class="panel-head icon-bookmark">&nbsp;&nbsp;记录查询 <a id="refresh"
   onclick="openAdmin('sparePartsInOut/sparePartsInOut_find')"
  >刷新</a>
 </div>
  <div class="panel-body">
   <div class="panel">
    <div class="panel-body">
     <form method="post" class="form-inline"
     action="sparePartsInOut/sparePartsInOut_find"
    >
      <div class="form-group">
       <div class="label"><label>检索条件&nbsp;&nbsp;</label></div>
       <div class="field"><input id="keyword" type="text" class="input" name="keyword"
        size="125" placeholder="支持模糊查找 " value="${keyword}"
       /> <input id="page" type="hidden" value="${inOut.pageNumber}" /></div>
     </div>
      <div class="form-button"><button class="button bg-main" type="submit">搜索</button></div>
    </form>
   </div>
  </div>
   <table class="table table-hover">
    <tr>
     <th>记录编号</th>
     <th>备件编号</th>
     <th>备件大类</th>
     <th>备件名称</th>
     <th>库存量</th>
     <th>库存类型</th>
     <th>出入库时间</th>
     <th>经办人</th>
     <th>领取/入库人员</th>
     <th>数量</th>
     <th>备注</th>
   </tr>
    <c:forEach items="${inOut.list}" var="li">
     <tr>
      <td>${li.siNo}</td>
      <td>${li.sbNo}</td>
      <td>${li.sbType}</td>
      <td>${li.sbName}</td>
      <td>${li.sbNumber}</td>
      <td>${li.siType}</td>
      <td>${li.siDate}</td>
      <td>${li.uName}</td>
      <td>${li.siPerson}</td>
      <td>${li.siNumber}</td>
      <td>${li.siRemark}</td>
     </tr>
    </c:forEach>
  </table>
 </div> <!-- 分页 -->
  <div class="panel-foot text-center"><c:choose>
    <c:when test="${sparePartsInOut.pageNumber==1}">
     <a class="button border-blue button-little ">上一页</a>
    </c:when>
    <c:otherwise>
     <a class="button border-blue button-little"
      onclick="$('#admin').load('sparePartsInOut/sparePartsInOut_find?page=${inOut.pageNumber-1}&&keyword=${keyword}')"
     >上一页</a>
    </c:otherwise>
   </c:choose> 总共${inOut.totalRow}条，每页${inOut.pageSize}条，总共${inOut.totalPage}页 ，当前第${inOut.pageNumber}页 <c:choose>
    <c:when test="${inOut.pageNumber==inOut.totalPage}">
     <a class="button border-blue button-little disabled">下一页</a>
    </c:when>
    <c:otherwise>
     <a class="button border-blue button-little"
      onclick="$('#admin').load('sparePartsInOut/sparePartsInOut_find?page=${inOut.pageNumber+1}&&keyword=${keyword}')"
     >下一页</a>
    </c:otherwise>
   </c:choose> 跳转到 <select id="jump"
   onchange="$('#admin').load('sparePartsInOut/sparePartsInOut_find?page='+this.options[this.options.selectedIndex].text)+'&&keyword=${keyword}'"
  >
    <c:forEach begin="1" end="${inOut.totalPage}" var="li">
     <c:choose>
      <c:when test="${inOut.pageNumber==li}">
       <option selected="selected">${li}</option>
      </c:when>
      <c:otherwise>
       <option>${li}</option>
      </c:otherwise>
     </c:choose>
    </c:forEach>
  </select> 页</div>
</div>
</body>
</html>