<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="../common/plugin.jsp" />
<!DOCTYPE >
<html>
<head>
<script type="text/javascript">
	function defeat(id){
	    if(confirm('确认不通过？')){
			var content=$("#suggestion").val();
			if(content!=""){
			    openAdmin("check/waitCheck_defeat?id="+id+"&&content="+content);
			}else{
			    alert("请输入审核意见");
			}
			
		}
	}
</script>
</head>
<body>
 <div class="panel">
  <div class="panel-head icon-bookmark">待审核信息 <a id="refresh"
   onclick="openAdmin('check/waitCheck')"
  >刷新</a> <input id="suggestion" type="text" class="input" placeholder="请在此填写审核意见" />
 </div>
  <div class="panel-body">
   <table class="table table-hover">
    <tr>
     <th>编号</th>
     <th>商品名称</th>
     <th>售后类型</th>
     <th>单据状态</th>
     <th>报修日期</th>
     <th>维修日期</th>
     <th>故障原因</th>
     <th>维修工姓名</th>
     <th>收费类型</th>
     <th>收费金额</th>
     <th>交通费用</th>
     <th>其他费用</th>
     <th>备注</th>
     <th>操作</th>
   </tr>
    <c:forEach items="${saled.list}" var="li">
     <tr>
      <td>${li.sdNo}</td>
      <td>${li.goName}</td>
      <td>${li.sdType}</td>
      <td>${li.sdRepairStatus}</td>
      <td>${li.sdReportDate}</td>
      <td>${li.sdRepairDate}</td>
      <td>${li.sdEquipmentTrouble}</td>
      <td>${li.sd_uName}</td>
      <td>${li.sdChargeType}</td>
      <td>${li.sdChargeMoney}</td>
      <td>${li.sdTrafficMoney}</td>
      <td>${li.sdOtherMoney}</td>
      <td>${li.sdRemark}</td>
      <td><a class="button border-green button-little"
       onclick="if(confirm('确认通过审核？')){openAdmin('check/waitCheck_pass?id=${li.sdId}')}"
      >通过</a> <a class="button border-red button-little" onclick="defeat(${li.sdId})">不通过</a></td>
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
      onclick="$('#admin').load('check/waitCheck?page=${saled.pageNumber-1}')"
     >上一页</a>
    </c:otherwise>
   </c:choose> 总共${saled.totalRow}条，每页${saled.pageSize}条，总共${saled.totalPage}页 ，当前第${saled.pageNumber}页 <c:choose>
    <c:when test="${saled.pageNumber==saled.totalPage}">
     <a class="button border-blue button-little disabled">下一页</a>
    </c:when>
    <c:otherwise>
     <a class="button border-blue button-little"
      onclick="$('#admin').load('check/waitCheck?page=${saled.pageNumber+1}')"
     >下一页</a>
    </c:otherwise>
   </c:choose> 跳转到 <select id="jump"
   onchange="$('#admin').load('check/waitCheck?page='+this.options[this.options.selectedIndex].text)"
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