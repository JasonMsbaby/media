<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="../common/plugin.jsp" />
<!DOCTYPE >
<html>
<head>
</head>
<body>
 <form method="post" method="post" action="sys/userManger_edit_submit">
  <div class="panel">
   <div class="panel-head icon-bookmark">编辑用户</div>
   <div class="panel-body">
    <div class="form-group">
     <div class="label"><span class="float-right">用户唯一的识别号码，用于登陆的帐号</span> <label>工号</label></div>
     <div class="field"><input type="text" class="input" name="user.uNo" size="30"
      data-validate="required:不为空" placeholder="工号" value="${user.uNo}"
     /> <input type="hidden" name="user.uId" value="${user.uId}" /></div>
   </div>
    <div class="form-group">
     <div class="label"><span class="float-right">用户名/真实姓名</span> <label>用户名</label></div>
     <div class="field"><input type="text" class="input" name="user.uName" size="30"
      data-validate="required:不为空" placeholder="真实姓名" value="${user.uName}"
     /></div>
   </div>
    <div class="form-group">
     <div class="label"><span class="float-right">登陆密码</span> <label>登陆密码</label></div>
     <div class="field"><input type="text" class="input" name="user.uPwd" size="30"
      data-validate="required:不为空" placeholder="请输入密码" value="${user.uPwd}"
     /></div>
   </div>
    <div class="form-group">
     <div class="label"><span class="float-right">针对某些关键操作所设立的独立密码</span> <label>操作密码</label>
    </div>
     <div class="field"><input type="text" class="input" name="user.uDoPwd" size="30"
      placeholder="请输入操作密码" value="${user.uDoPwd}"
     /></div>
   </div>
    <div class="form-group">
     <div class="label"><span class="float-right">性别</span> <label>性别</label></div>
     <div class="field"><select class="input" name="user.uSex">
       <c:choose>
        <c:when test="${user.uSex=='男'}">
         <option selected="selected" value="男">男</option>
        </c:when>
        <c:otherwise>
         <option value="男">男</option>
        </c:otherwise>
       </c:choose>
       <c:choose>
        <c:when test="${user.uSex=='女'}">
         <option selected="selected" value="女">女</option>
        </c:when>
        <c:otherwise>
         <option value="女">女</option>
        </c:otherwise>
       </c:choose>
     </select></div>
   </div>
    <div class="form-group">
     <div class="label"><span class="float-right">该用户所属于的部门或者单位</span> <label>所属单位</label></div>
     <div class="field"><input type="text" class="input" name="user.uCompany" size="30"
      value="${user.uCompany}" placeholder="填写单位/部门名称"
     /></div>
   </div>
    <div class="form-group">
     <div class="label"><span class="float-right">用户所属角色</span> <label>角色选择</label></div>
     <div class="field"><select class="input" name="user.u_rId">
       <c:forEach items="${roles}" var="li">
       <c:choose>
       <c:when test="${user.u_rId==li.rId}"><option selected="selected" value="${li.rId}">${li.rName}</option></c:when>
       <c:otherwise><option value="${li.rId}">${li.rName}</option></c:otherwise>
       </c:choose>
        
       </c:forEach>
     </select></div>
   </div>
    <div class="form-group">
     <div class="label"><span class="float-right">与该用户取得联系的方式,座机/手机/QQ</span> <label>联系方式</label>
    </div>
     <div class="field"><input type="text" class="input" name="user.uPhone" size="30"
      placeholder="联系方式" data-validate="required:不为空" value="${user.uPhone}"
     /></div>
   </div>
    <div class="form-group">
     <div class="label"><span class="float-right">备注</span> <label>备注</label></div>
     <div class="field"><input type="text" class="input" name="user.uRemark" size="30"
      placeholder="备注" value="${user.uRemark}"
     /></div>
   </div>
  </div>
   <div class="panel-foot text-center"><input type="submit" class="button bg-main radius-none"
    value="提交保存"
   /></div>
 </div>
</form>
</body>
</html>