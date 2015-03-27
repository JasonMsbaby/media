<jsp:include page="common/plugin.jsp" />
<!DOCTYPE html>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<html lang="zh-cn">
<head>
</head>
<body>
 <div class="lefter"><img class="img-border radius-circle"
  style="width: 180px; height: 75px; margin-top: 5px;" alt="" src="Images/Resources/midea.png"
 ></div>
 <div class="righter nav-navicon" id="admin-nav">
  <div class="mainer">
   <div class="admin-navbar"><span class="float-right"> <a
     class="button button-little bg-main" href="index" target="_self"
    >前台首页</a> <a class="button button-little bg-yellow" href="exit">注销登录</a>
   </span>
    <ul class="nav nav-inline admin-nav">
     <li class="nav1 active"><a class="icon-home">首页</a>
      <ul><li class="active" onclick="openAdmin('welcome')"><a class="icon-paper-plane-o">
         欢迎页面</a></li></ul></li>
     <c:forEach items="${list}" var="li">
      <c:if test="${li.aType==0}">
       <li class="nav1"><a href="#" class="${li.aIcon}"> ${li.aName}</a>
        <ul>
         <c:forEach items="${list}" var="li2">
          <c:if test="${li2.aType==li.aId}">
           <li class="nav2" onclick="openAdmin('${li2.aLink}')"><a class="${li2.aIcon}">
             ${li2.aName}</a></li>
          </c:if>
         </c:forEach>
       </ul></li>
      </c:if>
     </c:forEach>
   </ul></div>
   <div class="admin-bread"><span>您好【${role.rName}】${sessionScope.currentUser.uName}，欢迎您的光临。</span>
    <ul class="bread">
     <li><a id="adressOne" href="index" class="icon-external-link-square">首页</a></li>
     <li id="adressTwo" href="#" class="icon-external-link">后台首页</li>
   </ul> <!-- <button class="button win-back icon-arrow-left">后退</button>
    <button class="button win-forward">前进 <span class="icon-arrow-right"></span></button></div> -->
  </div>
 </div>
</div>
 <script type="text/javascript">
	$(function() {
	    openAdmin('welcome');
	});
    </script>
 <div id="admin" class="admin"></div>
</body>
</html>