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
  <div class="panel-head icon-bookmark">&nbsp;&nbsp;销售信息管理 <a id="refresh"
   onclick="openAdmin('sales/salesManger')"
  >刷新</a> <a style="float: right;" class="button border-blue button-little"
   onclick="openAdmin('sales/salesManger_add')"
  >添加销售信息</a></div>
  <div class="panel-body">
   <div class="panel">
    <div class="panel-body">
     <form method="post" class="form-inline" action="sales/salesManger">
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
     <th>编号</th>
     <th>商品名称</th>
     <th>客户姓名</th>
     <th>数量</th>
     <th>应收金额</th>
     <th>实收金额</th>
     <th>销售日期</th>
     <th>购买方式</th>
     <th>发票号码</th>
     <th>录入时间</th>
     <th>录入员</th>
     <th>操作</th>
   </tr>
    <c:forEach items="${sales.list}" var="li">
     <tr>
      <td>${li.sNo}</td>
      <td>${li.goName}</td>
      <td>${li.gName}</td>
      <td>${li.sNum}</td>
      <td>${li.sReceivable}</td>
      <td>${li.sReceived}</td>
      <td>${li.sSaledDate}</td>
      <td>${li.sPayType}</td>
      <td>${li.sInvoice}</td>
      <td>${li.sInputDate}</td>
      <td>${li.uName}</td>
      <td>
      <a class="button border-green button-little"
       onclick="openAdmin('sales/salesManger_detail?id=${li.sId}')"
      >查看详情</a>
      <a class="button border-blue button-little"
       onclick="openAdmin('sales/salesManger_edit?id=${li.sId}')"
      >编辑</a> <a class="button border-red button-little"
       onclick="if(confirm('确认删除？')){openAdmin('sales/salesManger_delete?id=${li.sId}');}"
      >删除</a></td>
     </tr>
    </c:forEach>
  </table>
 </div> <!-- 分页 -->
  <div class="panel-foot text-center"><c:choose>
    <c:when test="${sales.pageNumber==1}">
     <a class="button border-blue button-little ">上一页</a>
    </c:when>
    <c:otherwise>
     <a class="button border-blue button-little"
      onclick="$('#admin').load('sales/salesManger?page=${sales.pageNumber-1}&&keyword=${keyword}')"
     >上一页</a>
    </c:otherwise>
   </c:choose> 总共${sales.totalRow}条，每页${sales.pageSize}条，总共${sales.totalPage}页 ，当前第${sales.pageNumber}页 <c:choose>
    <c:when test="${sales.pageNumber==sales.totalPage}">
     <a class="button border-blue button-little disabled">下一页</a>
    </c:when>
    <c:otherwise>
     <a class="button border-blue button-little"
      onclick="$('#admin').load('sales/salesManger?page=${sales.pageNumber+1}&&keyword=${keyword}')"
     >下一页</a>
    </c:otherwise>
   </c:choose> 跳转到 <select id="jump"
   onchange="$('#admin').load('sales/salesManger?page='+this.options[this.options.selectedIndex].text+'&&keyword=${keyword}')"
  >
    <c:forEach begin="1" end="${sales.totalPage}" var="li">
     <c:choose>
      <c:when test="${sales.pageNumber==li}">
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