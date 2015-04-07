<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="../common/plugin.jsp" />
<html>
<head>
</head>
<body>
 <div class="panel">
  <div class="panel-head icon-bookmark">&nbsp;&nbsp;添加商品价格</div>
  <div class="panel-body">
   <div class="line">
    <div class="x6">
     <form method="post" action="prices/goodsSearch">
      <div class="form-group">
       <div class="label"><label>检索条件</label></div>
       <div class="field"><input type="text" class="input" name="key" size="30"
        placeholder="关键字：编号/大类/名称/型号 支持模糊查找" value="${key}"
       /></div>
     </div>
      <div class="form-button"><button class="button" type="submit">检索</button></div>
    </form> <br>
     <div class="label"><label>检索结果</label></div>
     <table class="table table-condensed">
      <tr>
       <th>编号</th>
       <th>大类</th>
       <th>名称</th>
       <th>型号</th>
       <th>规格</th>
       <th>操作</th>
     </tr>
      <c:forEach items="${goods.list}" var="li">
       <tr>
        <td>${li.goNo}</td>
        <td>${li.goType}</td>
        <td>${li.goName}</td>
        <td>${li.goVersion}</td>
        <td>${li.goFormat}</td>
        <td><a
         onclick="openAdmin('prices/goodsSearch?key=${key}&&page=${goods.pageNumber}&&id=${li.goId}')"
         class="button bg-main radius-none button-little"
        >编辑</a></td>
       </tr>
      </c:forEach>
    </table>
     <div class="panel-foot text-center"><c:choose>
       <c:when test="${goods.pageNumber==1}">
        <a class="button border-blue button-little ">上一页</a>
       </c:when>
       <c:otherwise>
        <a class="button border-blue button-little"
         onclick="$('#admin').load('prices/goodsSearch?key=${key}&&page=${goods.pageNumber-1}')"
        >上一页</a>
       </c:otherwise>
      </c:choose> 总共${goods.totalRow}条，每页${goods.pageSize}条，总共${goods.totalPage}页 ，当前第${goods.pageNumber}页 <c:choose>
       <c:when test="${goods.pageNumber==goods.totalPage}">
        <a class="button border-blue button-little disabled">下一页</a>
       </c:when>
       <c:otherwise>
        <a class="button border-blue button-little"
         onclick="$('#admin').load('prices/goodsSearch?key=${key}&&page=${goods.pageNumber+1}')"
        >下一页</a>
       </c:otherwise>
      </c:choose> 跳转到 <select id="jump"
      onchange="$('#admin').load('prices/goodsSearch?key=${key}&&page='+this.options[this.options.selectedIndex].text)"
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
    <div class="x6">
     <div class="label"><label>采购价格</label></div>
     <table class="table table-condensed table-bordered">
      <tr>
       <th>时间段</th>
       <th>价格</th>
       <th>录入员</th>
       <th>备注</th>
       <th>操作</th>
     </tr>
      <c:forEach items="${prices_in}" var="li">
       <tr>
        <td>${li.pDate}</td>
        <td>${li.pPrice}</td>
        <td>${li.uName}</td>
        <td>${li.pRemark}</td>
        <td><a
         onclick="openAdmin('prices/goodsSearch?key=${key}&&page=${goods.pageNumber}&&id=${goodsId}&&pid=${li.pId}')"
         class="button bg-red radius-none button-little"
        >删除</a></td>
       </tr>
      </c:forEach>
    </table> <br>
     <div class="label"><label>出售价格</label></div>
     <table class="table table-condensed table-bordered">
      <tr>
       <th>时间段</th>
       <th>价格</th>
       <th>录入员</th>
       <th>备注</th>
       <th>操作</th>
     </tr>
      <c:forEach items="${prices_out}" var="li">
       <tr>
        <td>${li.pDate}</td>
        <td>${li.pPrice}</td>
        <td>${li.uName}</td>
        <td>${li.pRemark}</td>
        <td><a
         onclick="openAdmin('prices/goodsSearch?key=${key}&&page=${goods.pageNumber}&&id=${goodsId}&&pid=${li.pId}')"
         class="button bg-red radius-none button-little"
        >删除</a></td>
       </tr>
      </c:forEach>
    </table> <br>
     <div class="label"><label>为编号为【${selectedGoods.goNo}】，名称为【${selectedGoods.goName}】的商品进行价格编辑</label></div>
     <!-- 添加销售价格 --> <br>
     <div class="label"><label>添加销售价格</label></div>
     <form method="post" action="prices/pricesManger_add_submit">
      <div class="input-inline clearfix">
      
      <input name="key" type="hidden"  value="${key}" /> 
      <input name="page" type="hidden"  value="${goods.pageNumber}" /> 
      <input name="id" type="hidden"  value="${goodsId}" /> 
      
      <input name="prices.p_gId" type="hidden"  value="${selectedGoods.goId}" /> 
      <input name="prices.pType" type="hidden" value="出售" />
       <select name="prices.pDate" class="input">
        <c:forEach items="${times}" var="li">
         <option value="${li.vName}">${li.vName}</option>
        </c:forEach>
      </select> 
       <input type="text" class="input" name="prices.pPrice" size="20" placeholder="请输入价格" />
       <input type="text" class="input" name="prices.pRemark" size="20" placeholder="备注" />
       <input class="button" type="submit" value="添加" /></div>
    </form>
    
    <!-- 添加采购价格 --> <br>
     <div class="label"><label>添加采购价格</label></div>
     <form method="post" action="prices/pricesManger_add_submit">
      <div class="input-inline clearfix">
      
      <input name="key" type="hidden"  value="${key}" /> 
      <input name="page" type="hidden"  value="${goods.pageNumber}" /> 
      <input name="id" type="hidden"  value="${goodsId}" /> 
      
      <input name="prices.p_gId" type="hidden"  value="${selectedGoods.goId}" /> 
      <input name="prices.pType" type="hidden" value="采购" />
       <select name="prices.pDate" class="input">
        <c:forEach items="${times}" var="li">
         <option value="${li.vName}">${li.vName}</option>
        </c:forEach>
      </select> 
       <input type="text" class="input" name="prices.pPrice" size="20" placeholder="请输入价格" />
       <input type="text" class="input" name="prices.pRemark" size="20" placeholder="备注" />
       <input class="button" type="submit" value="添加" /></div>
    </form>
   </div>
  </div>
 </div>
  <div class="panel-foot text-center"></div>
</div>
</body>
</html>