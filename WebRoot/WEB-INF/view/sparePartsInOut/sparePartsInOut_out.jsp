<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="../common/plugin.jsp" />
<!DOCTYPE >
<html>
<head>
<script type="text/javascript">
function sparePartsOut(id){
    var num=$("#"+id).val();
    var page=$("#page").val();
    var keyword=$("#keyword").val();
    if(num!=""){
		openAdmin("sparePartsInOut/sparePartsInOut_out?num="+num+"&&page="+page+"&&keyword="+keyword+"&&id="+id);
    }else{
		alert("请填写出库量");
    }
}
</script>
</head>
<body>
 <div class="panel">
  <div class="panel-head icon-bookmark">&nbsp;&nbsp;备件出库 <a id="refresh"
   onclick="openAdmin('sparePartsInOut/sparePartsInOut_out')"
  >刷新</a> </div>
  <div class="panel-body">
   <div class="panel">
    <div class="panel-body">
     <form method="post" class="form-inline" action="sparePartsInOut/sparePartsInOut_out">
      <div class="form-group">
       <div class="label"><label>检索条件&nbsp;&nbsp;</label></div>
       <div class="field"><input id="keyword" type="text" class="input" name="keyword"
        size="125" placeholder="支持模糊查找 " value="${keyword}"
       /> <input id="page" type="hidden" value="${sparepartsbase.pageNumber}" /></div>
     </div>
      <div class="form-button"><button class="button bg-main" type="submit">搜索</button></div>
    </form>
   </div>
  </div>
   <table class="table table-hover">
    <tr>
     <th>备件编号</th>
     <th>备件大类</th>
     <th>名称</th>
     <th>库存量</th>
     <th>规格单位</th>
     <th>备注</th>
     <th>出库数量</th>
     <th>操作</th>
   </tr>
    <c:forEach items="${sparepartsbase.list}" var="li">
     <tr>
      <td>${li.sbNo}</td>
      <td>${li.sbType}</td>
      <td>${li.sbName}</td>
      <td>${li.sbNumber}</td>
      <td>${li.sbFormat}</td>
      <td>${li.sbRemark}</td>
      <td><input id="${li.sbId}" type="text" class="input" size="5" /></td>
      <td><a class="button border-green button-little" onclick="sparePartsOut(${li.sbId})">出库</a>
     </td>
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
      onclick="$('#admin').load('sparePartsInOut/sparePartsInOut_out?page=${sparepartsbase.pageNumber-1}&&keyword=${keyword}')"
     >上一页</a>
    </c:otherwise>
   </c:choose> 总共${sparepartsbase.totalRow}条，每页${sparepartsbase.pageSize}条，总共${sparepartsbase.totalPage}页
   ，当前第${sparepartsbase.pageNumber}页 <c:choose>
    <c:when test="${sparepartsbase.pageNumber==sparepartsbase.totalPage}">
     <a class="button border-blue button-little disabled">下一页</a>
    </c:when>
    <c:otherwise>
     <a class="button border-blue button-little"
      onclick="$('#admin').load('sparePartsInOut/sparePartsInOut_out?page=${sparepartsbase.pageNumber+1}&&keyword=${keyword}')"
     >下一页</a>
    </c:otherwise>
   </c:choose> 跳转到 <select id="jump"
   onchange="$('#admin').load('sparePartsInOut/sparePartsInOut_out?page='+this.options[this.options.selectedIndex].text)+'&&keyword=${keyword}'"
  >
    <c:forEach begin="1" end="${sparepartsbase.totalPage}" var="li">
     <c:choose>
      <c:when test="${sparepartsbase.pageNumber==li}">
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