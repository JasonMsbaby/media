<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <jsp:include page="common/plugin.jsp" />
<!DOCTYPE html>
<html lang="zh-cn">
<head>

</head>

<body>
<div class="container">
    <div class="line">
        <div class="xs6 xm4 xs3-move xm4-move">
            <br /><br />
            <div class="media media-y">
                <a href="index" target="_blank">
                <img style="height: 90px;" src="Images/Resources/midea.png" class="img-border border-green radius-circle" alt="后台管理系统" /></a>
            </div>
            <br /><br />
            <form action="login_submit" method="post">
            <div class="panel">
                <div class="panel-head"><strong>美的售后维护管理系统</strong><strong style="color:red;margin-left: 30px;">${info}</strong></div>
                <div class="panel-body" style="padding:30px;">
                    <div class="form-group">
                        <div class="field field-icon-right">
                            <input type="text" class="input" name="user.uNo" placeholder="用户名/工号" data-validate="required:请填写账号" />
                            <span class="icon icon-user"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="field field-icon-right">
                            <input type="password" class="input" name="user.uPwd" placeholder="登录密码" data-validate="required:请填写密码" />
                            <span class="icon icon-key"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="field">
                            <input type="text" class="input" name="code1" placeholder="填写右侧的验证码" data-validate="required:请填写右侧的验证码" />
                            <img onclick="this.src='getCode'" src="getCode" width="80" height="32" class="passcode" />
                        </div>
                    </div>
                </div>
                <div class="panel-foot text-center"><button class="button button-block bg-main text-big">立即登录后台</button></div>
            </div>
            </form>
        </div>
    </div>
</div>

<div class="hidden"><script src="http://s4.cnzz.com/stat.php?id=5952475&web_id=5952475" language="JavaScript"></script></div>
</body>
</html>