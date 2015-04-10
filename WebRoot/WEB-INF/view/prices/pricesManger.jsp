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
  <div class="panel-head icon-bookmark">价目管理 <a id="refresh"
   onclick="openAdmin('prices/pricesManger')"
  >刷新</a> <a style="float: right;" class="button border-blue button-little"
   onclick="$('#admin').load('prices/pricesManger_add')"
  >添加商品价目信息</a></div>
  <div class="panel-body">
   <div class="panel">
    <div class="panel-body">
     <form method="post" class="form-inline" action="prices/pricesManger">
      <div class="form-group">
       <div class="label"><label>检索条件&nbsp;&nbsp;</label></div>
       <div class="field"><input type="text" class="input" name="keyword" size="125"
        placeholder="支持模糊查找 " value="${keyword}"
       /></div>
     </div>
      <div class="form-button"><button class="button bg-main" type="submit">搜索</button></div>
    </form>
   </div>
  </div>
   <table class="table table-hover">
    <tr>
     <th>商品编号</th>
     <th>商品大类</th>
     <th>商品名称</th>
     <th>商品型号</th>
     <th>操作</th>
   </tr>
    <c:forEach items="${goods.list}" var="li">
     <tr>
      <td>${li.goNo}</td>
      <td>${li.goType}</td>
      <td>${li.goName}</td>
      <td>${li.goVersion}</td>
      <td><a class="button border-green button-little"
       onclick="openAdmin('prices/pricesManger_detail?id=${li.goId}')"
      >查看价目表</a> <a class="button border-blue button-little"
       onclick="openAdmin('prices/pricesManger_edit?id=${li.goId}')"
      >编辑</a> <a class="button border-red button-little"
       onclick="if(confirm('您将要删除该商品的所有价格记录，是否删除？')){openAdmin('prices/pricesManger_delete?id=${li.goId}');}"
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
     <a class="button border-blue button-little"
      onclick="$('#admin').load('prices/pricesManger?page=${goods.pageNumber-1}&&keyword=${keyword}')"
     >上一页</a>
    </c:otherwise>
   </c:choose> 总共${goods.totalRow}条，每页${goods.pageSize}条，总共${goods.totalPage}页 ，当前第${goods.pageNumber}页 <c:choose>
    <c:when test="${goods.pageNumber==goods.totalPage}">
     <a class="button border-blue button-little disabled">下一页</a>
    </c:when>
    <c:otherwise>
     <a class="button border-blue button-little"
      onclick="$('#admin').load('prices/pricesManger?page=${goods.pageNumber+1}&&keyword=${keyword}')"
     >下一页</a>
    </c:otherwise>
   </c:choose> 跳转到 <select id="jump"
   onchange="$('#admin').load('prices/pricesManger?page='+this.options[this.options.selectedIndex].text+'&&keyword=${keyword}')"
  >
    <c:forEach begin="1" end="${goods.totalPage}" var="li">
     <c:choose>
      <c:when test="${goods.pageNumber==li}">
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