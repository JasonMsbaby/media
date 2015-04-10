<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="../common/plugin.jsp" />
<!DOCTYPE >
<html>
<head>
<!-- 时间选择控件 -->
<link rel="stylesheet" type="text/css" href="Plugin/datepicker/css/jquery-ui.css">
<script type="text/javascript" src="Plugin/datepicker/js/jquery-ui-datepicker.js"></script>
<!-- 自动补全 -->
<link rel="stylesheet" type="text/css" href="Plugin/autocomplete/jquery.autocomplete.css">
<script type="text/javascript" src="Plugin/autocomplete/jquery.autocomplete.js"></script>
<script type="text/javascript" src="Style/js/autoCompelete.js"></script>
<script type="text/javascript">
$(function(){
   $(".date").datepicker(); 
});
</script>
</head>
<body>
 <form method="post" method="post" action="sales/salesManger_add_submit">
  <div class="panel">
   <div class="panel-head icon-bookmark">&nbsp;&nbsp;编辑销售记录</div>
   <div class="panel-body">
    <div class="form-group">
     <div class="label"><span class="float-right">销售编号</span> <label>销售编号</label></div>
     <div class="field">
     <input name="sales.sId" type="hidden" value="${sales.sId}" />
     <input type="text" class="input" name="sales.sNo" size="30"
      data-validate="required:不为空" readonly="readonly" placeholder="销售编号" value="${sales.sNo}"
     /></div>
   </div>
    <div class="form-group">
     <div class="label"><span class="float-right">请选择商品,双击文本框出现所有商品</span> <label>商品序号</label></div>
     <div class="field"><input id="goods" type="text" class="input" size="30"
      name="sales.s_goId" data-validate="required:不为空" value="${sales.s_goId}"
      placeholder="请输入 商品编号 / 商品类型 / 商品名称 / 商品型号 进行查找 支持模糊查找"
     /></div>
   </div>
    <div class="form-group">
     <div class="label"><span class="float-right">请选择客户,双击文本框出现所有客户</span> <label>客户序号</label></div>
     <div class="field"><input id="guest" type="text" class="input" size="30"
      name="sales.s_gId" data-validate="required:不为空" value="${sales.s_gId}"
      placeholder="请输入 客户编号 / 客户姓名 / 手机号 / 家庭住址 进行查找 支持模糊查找（不可以手动输入）"
     /></div>
   </div>
    <div class="form-group">
     <div class="label"><span class="float-right">数量</span> <label>数量</label></div>
     <div class="field"><input type="text" class="input" name="sales.sNum" size="30"
      placeholder="数量" data-validate="plusinteger:请输入正整数" value="${sales.sNum}"
     /></div>
   </div>
    <div class="form-group">
     <div class="label"><span class="float-right">应收金额</span> <label>应收金额</label></div>
     <div class="field"><input type="text" class="input" name="sales.sReceivable" size="30"
      placeholder="应收金额" data-validate="currency:请输入正确的货币格式" value="${sales.sReceivable}"
     /></div>
   </div>
    <div class="form-group">
     <div class="label"><span class="float-right">实收金额</span> <label>实收金额</label></div>
     <div class="field"><input type="text" class="input" name="sales.sReceived" size="30"
      placeholder="实收金额" data-validate="currency:请输入正确的货币格式" value="${sales.sReceived}"
     /></div>
   </div>
    <div class="form-group">
     <div class="label"><span class="float-right">销售日期</span> <label>销售日期</label></div>
     <div class="field"><input type="text" class="input date"  name="sales.sSaledDate"
      size="30" placeholder="点击选择销售日期"  value="${sales.sSaledDate}"
     /></div>
   </div>
    <div class="form-group">
     <div class="label"><span class="float-right">质保截至</span> <label>质保截至</label></div>
     <div class="field"><input type="text" class="input date" name="sales.sWarrantyDate"
      size="30" placeholder="质保截至"  value="${sales.sWarrantyDate}"
     /></div>
   </div>
    <div class="form-group">
     <div class="label"><span class="float-right">技术负责人</span> <label>技术负责人</label></div>
     <div class="field"><input type="text" class="input" name="sales.sTechnologyPerson"
      size="30" placeholder="技术负责人" value="${sales.sTechnologyPerson}"
     /></div>
   </div>
    <div class="form-group">
     <div class="label"><span class="float-right">销售单位</span> <label>销售单位</label></div>
     <div class="field"><input type="text" class="input" name="sales.sSalesUnit" size="30"
      placeholder="销售单位" value="${sales.sSalesUnit}"
     /></div>
   </div>
    <div class="form-group">
     <div class="label"><span class="float-right">销售代表</span> <label>销售代表</label></div>
     <div class="field"><input type="text" class="input" name="sales.sSalesRepresentative"
      size="30" placeholder="销售代表" value="${sales.sSalesRepresentative}"
     /></div>
   </div>
    <div class="form-group">
     <div class="label"><span class="float-right">购买方式</span> <label>购买方式</label></div>
     <div class="field"><select name="sales.sPayType" class="input">
       <c:forEach items="${buyType}" var="li">
        <option value="${li.vName}">${li.vName}</option>
       </c:forEach>
     </select></div>
     <div class="form-group">
      <div class="label"><span class="float-right">发票号码</span> <label>发票号码</label></div>
      <div class="field"><input type="text" class="input" name="sales.sInvoice" size="30"
       placeholder="发票号码" data-validate="required:不为空" value="${sales.sInvoice}"
      /></div>
    </div>
     <div class="form-group">
      <div class="label"><span class="float-right">备注</span> <label>备注</label></div>
      <div class="field"><input type="text" class="input" name="sales.sRemark" size="30"
       placeholder="备注" value="${sales.sRemark}"
      /></div>
    </div>
   </div>
    <div class="panel-foot text-center"><input type="submit"
     class="button bg-main radius-none" value="提交保存"
    /></div>
  </div>
 </div>
</form>
</body>
</html>