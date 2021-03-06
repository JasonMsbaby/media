<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="../common/plugin.jsp" />
<!DOCTYPE >
<html>
<head>
<link rel="stylesheet" href="Style/css/permission.css">
<script type="text/javascript" src="Style/js/permission.js"></script>
</head>
<body>
 <form method="post" method="post" action="sys/roleManger_add_submit">
  <div class="panel">
   <div class="panel-head icon-bookmark">添加角色</div>
   <div class="panel-body">
    <div class="form-group">
     <div class="label"><span class="float-right">角色名称</span> <label>角色名称</label></div>
     <div class="field"><input type="text" class="input" name="role.rName" size="30"
      data-validate="required:不为空" placeholder="角色名称"
     /></div>
   </div>
    <div class="form-group">
     <div class="label"><span class="float-right">注意：角色等级不得小于本用户角色等级</span> <label>角色等级</label></div>
     <div class="field"><input type="text" class="input" name="role.rLevel" size="30"
      placeholder="角色等级：格式为数字,当前等级为${roleLevel},请填写大于本等级的数字" data-validate="required:不为空,plusinteger:请输入正整数"
     /></div>
   </div>
    <div class="form-group">
     <div class="label"><span class="float-right">备注</span> <label>备注</label></div>
     <div class="field"><input type="text" class="input" name="role.rRemark" size="30"
      placeholder="备注" 
     /></div>
   </div>
    <div class="form-group">
     <div class="label"><span class="float-right"><input id="allCheck" type="checkbox"
       value="全选"
      /><label for="allCheck">全选</label></span> <label>权限配置</label></div>
     <div class="field"><input name="role.r_psId" type="hidden" id="permission" />
      <ul class="list-group">
       <c:forEach items="${permissions}" var="li1">
        <c:if test="${li1.aType==0}">
         <li class="icon-folder-open-o">${li1.aName}<a style="margin-left: 10px;"
          class="icon-minus-square-o nav11"
         ></a>
          <ul>
           <c:forEach items="${permissions}" var="li2">
            <c:if test="${li2.aType==li1.aId}">
             <li class="icon-folder-open-o">${li2.aName}<a style="margin-left: 10px;"
              class="icon-minus-square-o nav22"
             ></a> <input class="check2-${li2.aId}" value="${li2.aId}" style="float: right;"
              type="checkbox"
             />
              <ul>
               <c:forEach items="${permissions}" var="li3">
                <c:if test="${li3.aType==li2.aId}">
                 <li class="icon-folder-o">${li3.aName}<input class="check3-${li3.aType}"
                  value="${li3.aId}" style="float: right;" type="checkbox"
                 /></li>
                </c:if>
               </c:forEach>
             </ul></li>
            </c:if>
           </c:forEach>
         </ul></li>
        </c:if>
       </c:forEach>
     </ul></div>
   </div>
  </div>
   <div class="panel-foot text-center"><input id="btn_submit" type="submit"
    class="button bg-main radius-none" value="提交保存"
   /></div>
 </div>
</form>
</body>
</html>