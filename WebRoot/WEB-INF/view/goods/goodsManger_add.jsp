<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE >
<html>
<head>
<!-- UEditor -->
<link rel="stylesheet" href="Plugin/ueditor/themes/default/css/ueditor.css">
<script type="text/javascript" charset="utf-8" src="Plugin/ueditor/ueditor.config.js"></script>
<script type="text/javascript" charset="utf-8" src="Plugin/ueditor/ueditor.all.min.js">
    
</script>
<script type="text/javascript" charset="utf-8" src="Plugin/ueditor/lang/zh-cn/zh-cn.js"></script>
<script type="text/javascript">
    //实例化编辑器
    var ue = UE.getEditor('editor');
</script>
</head>
<body>
 <form method="post" method="post" action="goods/goodsManger_add_submit">
  <div class="panel">
   <div class="panel-head icon-bookmark">添加商品</div>
   <div class="panel-body">
    <div class="form-group">
     <div class="label"><span class="float-right">商品编号</span> <label>商品编号</label></div>
     <div class="field"><input type="text" class="input" name="goods.goNo" size="30"
      data-validate="required:不为空" placeholder="商品编号"
     /></div>
   </div>
    <div class="form-group">
     <div class="label"><span class="float-right">商品大类</span> <label>商品大类</label></div>
     <div class="field"><select class="input" name="goods.goType">
       <c:forEach items="${types}" var="li">
        <option value="${li.vName}">${li.vName}</option>
       </c:forEach>
     </select></div>
     <div class="form-group">
      <div class="label"><span class="float-right">商品名称</span> <label>商品名称</label></div>
      <div class="field"><input type="text" class="input" name="goods.goName" size="30"
       data-validate="required:不为空" placeholder="商品名称"
      /></div>
    </div>
     <div class="form-group">
      <div class="label"><span class="float-right">商品型号</span> <label>商品型号</label></div>
      <div class="field"><input type="text" class="input" name="goods.goVersion" size="30"
       data-validate="required:不为空" placeholder="商品型号"
      /></div>
    </div>
     <div class="form-group">
      <div class="label"><span class="float-right">配置详情</span> <label>配置详情</label></div>
      <div class="field"><textarea id="editor" style="width: 1024px; height: 500px;"></textarea></div>
    </div>
     <div class="form-group">
      <div class="label"><span class="float-right">规格单位</span> <label>规格单位</label></div>
      <div class="field"><select class="input" name="goods.goType">
        <c:forEach items="${formats}" var="li">
         <option value="${li.vName}">${li.vName}</option>
        </c:forEach>
      </select></div>
      <div class="form-group">
       <div class="label"><span class="float-right">图片详情</span> <label>图片详情</label></div>
       <div class="field"><input type="text" class="input" name="goods.goImg" size="30"
        data-validate="required:不为空" placeholder="图片详情"
       /></div>
     </div>
      <div class="form-group">
       <div class="label"><span class="float-right">备注</span> <label>备注</label></div>
       <div class="field"><input type="text" class="input" name="goods.goRemark" size="30"
        data-validate="required:不为空" placeholder="备注"
       /></div>
     </div>
    </div>
     <div class="panel-foot text-center"><input type="submit"
      class="button bg-main radius-none" value="提交保存"
     /></div>
   </div>
  </div>
 </div>
</form>
</body>
</html>