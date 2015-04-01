<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE >
<html>
<head>
</head>
<body>
 <form method="post" method="post" action="guest/guestManger_edit_submit">
  <div class="panel">
   <div class="panel-head icon-bookmark">编辑客户信息</div>
   <div class="panel-body">
    <div class="form-group">
     <div class="label"><span class="float-right">客户唯一的识别号码，用于登陆的帐号</span> <label>客户编号</label></div>
     <div class="field"><input type="hidden" name="guest.gId" value="${guest.gId}" /> <input
      type="text" class="input" name="guest.gNo" size="30" data-validate="required:不为空"
      placeholder="客户编号" value="${guest.gNo}"
     /></div>
   </div>
    <div class="form-group">
     <div class="label"><span class="float-right">姓名</span> <label>姓名</label></div>
     <div class="field"><input type="text" class="input" name="guest.gName" size="30"
      data-validate="required:不为空" placeholder="真实姓名" value="${guest.gName}"
     /></div>
   </div>
    <div class="form-group">
     <div class="label"><span class="float-right">性別</span> <label>性別</label></div>
     <div class="field"><select class="input" name="guest.gSex">
       <c:choose>
        <c:when test="${guest.gSex=='男'}">
         <option selected="selected" value="男">男</option>
         <option value="女">女</option>
        </c:when>
        <c:otherwise>
        <option value="男">男</option>
         <option selected="selected" value="女">女</option>
        </c:otherwise>
       </c:choose>
     </select></div>
   </div>
    <div class="form-group">
     <div class="label"><span class="float-right">手机号</span> <label>手机号</label></div>
     <div class="field"><input type="text" class="input" name="guest.gPhone" size="30"
      data-validate="required:不为空" placeholder="手机号" value="${guest.gPhone}"
     /></div>
   </div>
    <div class="form-group">
     <div class="label"><span class="float-right">固话/座机</span> <label>固话/座机</label></div>
     <div class="field"><input type="text" class="input" name="guest.gTel" size="30"
      value="${guest.gTel}" placeholder="固话/座机"
     /></div>
   </div>
    <div class="form-group">
     <div class="label"><span class="float-right">单位名称</span> <label>单位名称</label></div>
     <div class="field"><input type="text" class="input" name="guest.gCompany" size="30"
      placeholder="单位名称" value="${guest.gCompany}"
     /></div>
   </div>
    <div class="form-group">
     <div class="label"><span class="float-right">家庭住址</span> <label>家庭住址</label></div>
     <div class="field"><input type="text" class="input" name="guest.gAdress" size="30"
      data-validate="required:不为空" placeholder="家庭住址" value="${guest.gAdress}"
     /></div>
   </div>
    <div class="form-group">
     <div class="label"><span class="float-right">VIP会员号</span> <label>VIP会员号</label></div>
     <div class="field"><input type="text" class="input" name="guest.gVIP" size="30"
      placeholder="VIP会员号" value="${guest.gVIP}"
     /></div>
   </div>
    <div class="form-group">
     <div class="label"><span class="float-right">QQ号码</span> <label>QQ号码</label></div>
     <div class="field"><input type="text" class="input" name="guest.gQQ" size="30"
      data-validate="qq:请输入正确的QQ号码" placeholder="QQ号码" value="${guest.gQQ}"
     /></div>
   </div>
    <div class="form-group">
     <div class="label"><span class="float-right">电子邮件（Email）</span> <label>电子邮件（Email）</label></div>
     <div class="field"><input type="text" class="input" name="guest.gEmail" size="30"
      data-validate="email:请输入正确的电子邮件格式" placeholder="电子邮件（Email）" value="${guest.gEmail}"
     /></div>
   </div>
    <div class="form-group">
     <div class="label"><span class="float-right">身份证号码</span> <label>身份证号码</label></div>
     <div class="field"><input type="text" class="input" name="guest.gIDcard" size="30"
      placeholder="身份证号码" value="${guest.gIDcard}"
     /></div>
   </div>
    <div class="form-group">
     <div class="label"><span class="float-right">备注</span> <label>备注</label></div>
     <div class="field"><input type="text" class="input" name="guest.gRemark" size="30"
      placeholder="备注" value="${guest.gRemark}"
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