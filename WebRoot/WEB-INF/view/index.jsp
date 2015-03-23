<jsp:include page="common/plugin.jsp" />
<!DOCTYPE html>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<html lang="zh-cn">
<head>
</head>
<body>
 <div class="lefter"><br> <label
  style="font-size: large; font-weight: 800; font-family: '微软雅黑'"
 >美的售后维护管理系统</label></div>
 <div class="righter nav-navicon" id="admin-nav">
  <div class="mainer">
   <div class="admin-navbar"><span class="float-right"> <a
     class="button button-little bg-main" href="index.html" target="_self"
    >前台首页</a> <a class="button button-little bg-yellow" href="exit.html">注销登录</a>
   </span>
    <ul class="nav nav-inline admin-nav">
     <li class="nav1 active"><a class="icon-home">首页</a>
      <ul><li class="active" onclick="$('#admin').load('welcome')"><a class="icon-paper-plane-o" 
       > 欢迎页面</a></li></ul></li>
     <c:forEach items="${list}" var="li">
      <c:if test="${li.aType==0}">
       <li class="nav1"><a href="#" class="${li.aIcon}"> ${li.aName}</a>
        <ul>
         <c:forEach items="${list}" var="li2">
          <c:if test="${li2.aType==li.aId}">
           <li class="nav2" onclick="$('#admin').load('${li2.aLink}')"><a class="${li2.aIcon}">
             ${li2.aName}</a></li>
          </c:if>
         </c:forEach>
       </ul></li>
      </c:if>
     </c:forEach>
   </ul></div>
   <div class="admin-bread"><span>您好，欢迎您的光临。</span>
    <ul class="bread">
     <li><a id="adressOne" href="#" class="icon-external-link-square">首页</a></li>
     <li id="adressTwo" href="#" class="icon-external-link">后台首页</li>
   </ul></div> 
 </div>
</div>
<div id="admin" class="admin">
</div>
</body>
</html>