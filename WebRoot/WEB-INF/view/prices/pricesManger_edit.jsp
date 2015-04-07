<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="../common/plugin.jsp" />
<!DOCTYPE >
<html>
<head>
<style type="text/css">
.td1 {
	width: 20%;
	text-align: center;
}

td {
	text-align: center;
}

.title {
	font-weight: 700;
	text-align: center;
}
</style>
</head>
<body>
 <div class="panel">
  <div class="panel-head icon-bookmark">&nbsp;&nbsp;商品价格编辑</div>
  <div class="panel-body">
   <table class="table table-bordered">
    <tr><td class="td1">商品编号</td>
     <td>${goods.goNo}</td></tr>
    <tr><td class="td1">商品大类</td>
     <td>${goods.goType}</td></tr>
    <tr><td class="td1">商品名称</td>
     <td>${goods.goName}</td></tr>
    <tr><td class="td1">商品型号</td>
     <td>${goods.goVersion}</td></tr>
    <tr><td class="td1">规格单位</td>
     <td>${goods.goFormat}</td></tr>
    <tr><td class="td1">采购价格</td>
     <td>
      <table class="table table-bordered">
       <tr>
        <td class="title">时间段</td>
        <td class="title">价格</td>
        <td class="title">备注</td>
        <td class="title">定价员</td>
        <td class="title">操作</td>
      </tr>
       <c:forEach items="${prices_in}" var="li">
        <tr>
         <td>${li.pDate}</td>
         <td>${li.pPrice}元</td>
         <td>${li.pRemark}</td>
         <td>${li.uName}</td>
         <td><a
          onclick="openAdmin('prices/pricesManger_edit_delete?pId=${li.pId}&&goodsId=${goods.goId}')"
          class="button bg-red radius-none button-little"
         >删除</a></td>
        </tr>
       </c:forEach>
       <tr>
        <form action="prices/pricesManger_edit_submit" method="post">
         <td><select name="prices.pDate" class="input">
           <c:forEach items="${times}" var="li">
            <option value="${li.vName}">${li.vName}</option>
           </c:forEach>
         </select></td>
         <td><input name="prices.pPrice" type="text" class="input" placeholder="请输入价格" /></td>
         <td><input name="prices.pRemark" type="text" class="input" placeholder="备注" /></td>
         <td>${currentUser.uName}<input name="prices.pPerson" type="hidden"
          value="${currentUser.uId}"
         /> <input name="goodsId" type="hidden" value="${goods.goId}" /> <input
          name="prices.pType" type="hidden" value="采购"
         /> <input name="prices.p_gId" type="hidden" value="${goods.goId}" />
        </td>
         <td><button class="button bg-main radius-none button-little">添加</button></td>
       </form>
      </tr>
     </table>
    </td></tr>
    <tr><td class="td1">出售价格</td>
     <td>
      <table class="table table-bordered">
       <tr>
        <td class="title">时间段</td>
        <td class="title">价格</td>
         <td class="title">备注</td>
        <td class="title">定价员</td>
        <td class="title">操作</td>
      </tr>
       <c:forEach items="${prices_out}" var="li">
        <tr>
         <td>${li.pDate}</td>
         <td>${li.pPrice}元</td>
         <td>${li.pRemark}</td>
         <td>${li.uName}</td>
         <td><a
          onclick="openAdmin('prices/pricesManger_edit_delete?pId=${li.pId}&&goodsId=${goods.goId}')"
          class="button bg-red radius-none button-little"
         >删除</a></td>
        </tr>
       </c:forEach>
       <tr>
        <form action="prices/pricesManger_edit_submit" method="post">
         <td><select name="prices.pDate" class="input">
           <c:forEach items="${times}" var="li">
            <option value="${li.vName}">${li.vName}</option>
           </c:forEach>
         </select></td>
         <td><input name="prices.pPrice" type="text" class="input" placeholder="请输入价格" /></td>
         <td><input name="prices.pRemark" type="text" class="input" placeholder="备注" /></td>
         <td>${currentUser.uName}<input name="prices.pPerson" type="hidden"
          value="${currentUser.uId}"
         /> <input name="goodsId" type="hidden" value="${goods.goId}" /> <input
          name="prices.pType" type="hidden" value="出售"
         /> <input name="prices.p_gId" type="hidden" value="${goods.goId}" />
        </td>
         <td><button class="button bg-main radius-none button-little">添加</button></td>
       </form>
      </tr>
     </table>
    </td></tr>
  </table>
 </div>
  <div class="panel-foot text-center"></div>
</div>
</body>
</html>