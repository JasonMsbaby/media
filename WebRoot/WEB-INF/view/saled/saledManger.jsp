<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="../common/plugin.jsp" />
<!DOCTYPE >
<html>
<head>
<!-- 自动补全 -->
<link rel="stylesheet" type="text/css" href="Plugin/autocomplete/jquery.autocomplete.css">
<script type="text/javascript" src="Plugin/autocomplete/jquery.autocomplete.js"></script>
<script type="text/javascript" src="Style/js/autoCompelete.js"></script>
<script type="text/javascript">
    function repair(id) {
		var name=$("#"+id).val();
		if(name!=""){
		    $.post("saled/repaire",{"id":id,"name":name},function(data){
				alert(data);
		    });
		}else{
		    alert("请输入维修工的姓名");
		}
    }
</script>
</head>
<body>
 <div class="panel">
  <div class="panel-head icon-bookmark">&nbsp;&nbsp;售后信息管理 <a id="refresh"
   onclick="openAdmin('saled/saledManger')"
  >刷新</a>
 </div>
  <div class="panel-body">
   <div class="panel">
    <div class="panel-body">
     <form method="post" class="form-inline" action="saled/saledManger">
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
     <th>售后编号</th>
     <th>销售记录编号</th>
     <th>售后类型</th>
     <th>单据状态</th>
     <th>客户姓名</th>
     <th>报修商品</th>
     <th>报修日期</th>
     <th>维修工</th>
     <th>操作</th>
   </tr>
    <c:forEach items="${saled.list}" var="li">
     <tr>
      <td>${li.sdNo}</td>
      <td>${li.sNo}</td>
      <td>${li.sdType}</td>
      <td>${li.sdRepairStatus}</td>
      <td>${li.gName}</td>
      <td>${li.goName}</td>
      <td>${li.sdReportDate}</td>
      <td><input id="${li.sdId}" class="input uName" size="30" type="text"
       value="${li.sd_uName}"
      /></td>
      <td><a class="button border-green button-little"
       onclick="openAdmin('saled/saledManger_detail?id=${li.gId}')"
      >查看详情</a> <a class="button border-red button-little"
       onclick="if(confirm('确认删除？')){openAdmin('saled/saledManger_delete?id=${li.sdId}');}"
      >删除</a> <a class="button border-yellow button-little" onclick="repair(${li.sdId})">派工</a></td>
     </tr>
    </c:forEach>
  </table>
 </div> <!-- 分页 -->
  <div class="panel-foot text-center"><c:choose>
    <c:when test="${saled.pageNumber==1}">
     <a class="button border-blue button-little ">上一页</a>
    </c:when>
    <c:otherwise>
     <a class="button border-blue button-little"
      onclick="$('#admin').load('saled/saledManger?page=${saled.pageNumber-1}&&keyword=${keyword}')"
     >上一页</a>
    </c:otherwise>
   </c:choose> 总共${saled.totalRow}条，每页${saled.pageSize}条，总共${saled.totalPage}页 ，当前第${saled.pageNumber}页 <c:choose>
    <c:when test="${saled.pageNumber==saled.totalPage}">
     <a class="button border-blue button-little disabled">下一页</a>
    </c:when>
    <c:otherwise>
     <a class="button border-blue button-little"
      onclick="$('#admin').load('saled/saledManger?page=${saled.pageNumber+1}&&keyword=${keyword}')"
     >下一页</a>
    </c:otherwise>
   </c:choose> 跳转到 <select id="jump"
   onchange="$('#admin').load('saled/saledManger?page='+this.options[this.options.selectedIndex].text)+'&&keyword=${keyword}'"
  >
    <c:forEach begin="1" end="${saled.totalPage}" var="li">
     <c:choose>
      <c:when test="${saled.pageNumber==li}">
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