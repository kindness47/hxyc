<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="public/head.jsp"%>
<!DOCTYPE html>
<html lang="zh">
<head>
  <meta charset="utf-8" />
  <title>华西云采平台</title>
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta content="width=device-width, initial-scale=1" name="viewport" />
  <meta content="" name="description" />
  <meta content="" name="author" />
  <!-- BEGIN GLOBAL MANDATORY STYLES -->
  <link href="${hxycStatic}/vendors/metronic4.5.2/global/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
  <link href="${hxycStatic}/vendors/metronic4.5.2/global/plugins/simple-line-icons/simple-line-icons.min.css" rel="stylesheet" type="text/css" />
  <link href="${hxycStatic}/vendors/metronic4.5.2/global/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
  <link href="${hxycStatic}/vendors/metronic4.5.2/global/plugins/uniform/css/uniform.default.css" rel="stylesheet" type="text/css" />
  <link href="${hxycStatic}/vendors/metronic4.5.2/global/plugins/bootstrap-switch/css/bootstrap-switch.min.css" rel="stylesheet" type="text/css" />
  <!-- END GLOBAL MANDATORY STYLES -->
  <!-- BEGIN PAGE LEVEL PLUGINS -->
  <link href="${hxycStatic}/vendors/metronic4.5.2/global/plugins/select2/css/select2.min.css" rel="stylesheet" type="text/css" />
  <link href="${hxycStatic}/vendors/metronic4.5.2/global/plugins/select2/css/select2-bootstrap.min.css" rel="stylesheet" type="text/css" />
  <!-- END PAGE LEVEL PLUGINS -->
  <!-- BEGIN THEME GLOBAL STYLES -->
  <link href="${hxycStatic}/vendors/metronic4.5.2/global/css/components.min.css" rel="stylesheet" id="style_components" type="text/css" />
  <link href="${hxycStatic}/vendors/metronic4.5.2/global/css/plugins.min.css" rel="stylesheet" type="text/css" />
  <!-- END THEME GLOBAL STYLES -->
  <!-- BEGIN PAGE LEVEL STYLES -->
  <link href="${hxycStatic}/vendors/metronic4.5.2/pages/css/login-4.min.css" rel="stylesheet" type="text/css" />
  <!-- END PAGE LEVEL STYLES -->
  <!-- BEGIN THEME LAYOUT STYLES -->
  <!-- END THEME LAYOUT STYLES -->
<!-- END HEAD -->

<body class=" login">
<!-- BEGIN LOGO -->
<div class="logo">
 <%-- <a href="index.html">
    <img src="${hxycStatic}/vendors/metronic4.5.2/pages/img/logo-big.png" alt="" /> </a>--%>
</div>
<!-- END LOGO -->
<!-- BEGIN LOGIN -->
<div class="content">
  <!-- BEGIN LOGIN FORM -->
  <form class="login-form" action="login" method="post">
    <h3 class="form-title"></h3>
    <div class="alert alert-danger display-hide">
      <button class="close" data-close="alert"></button>
      <span> Enter any username and password. </span>
    </div>
    <div class="form-group">
      <!--ie8, ie9 does not support html5 placeholder, so we just show field title for that-->
      <label class="control-label visible-ie8 visible-ie9">用户名</label>
      <div class="input-icon">
        <i class="fa fa-user"></i>
        <input class="form-control placeholder-no-fix" type="text" autocomplete="off" placeholder="请输入用户账号" name="account" /> </div>
    </div>
    <div class="form-group">
      <label class="control-label visible-ie8 visible-ie9">密码</label>
      <div class="input-icon">
        <i class="fa fa-lock"></i>
        <input class="form-control placeholder-no-fix" type="password" autocomplete="off" placeholder="请输入密码" name="passwd" /> </div>
    </div>
    <div class="form-actions">
      <label class="checkbox">
        <input type="checkbox" name="remember" value="1" /> 记住我 </label>
      <button type="submit" class="btn green pull-right"> 登 录 </button>
    </div>
  </form>
  <!-- END LOGIN FORM -->
</div>
<!-- END LOGIN -->
<!-- BEGIN COPYRIGHT -->
<div class="copyright"> Copyright 四川华西集采电子商务有限公司. </div>
<!-- END COPYRIGHT -->
<!--[if lt IE 9]>
<script src="${hxycStatic}/vendors/metronic4.5.2/global/plugins/respond.min.js"></script>
<script src="${hxycStatic}/vendors/metronic4.5.2/global/plugins/excanvas.min.js"></script>
<![endif]-->
<!-- BEGIN CORE PLUGINS -->
<script src="${hxycStatic}/vendors/metronic4.5.2/global/plugins/jquery.min.js" type="text/javascript"></script>
<script src="${hxycStatic}/vendors/metronic4.5.2/global/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<script src="${hxycStatic}/vendors/metronic4.5.2/global/plugins/js.cookie.min.js" type="text/javascript"></script>
<script src="${hxycStatic}/vendors/metronic4.5.2/global/plugins/bootstrap-hover-dropdown/bootstrap-hover-dropdown.min.js" type="text/javascript"></script>
<script src="${hxycStatic}/vendors/metronic4.5.2/global/plugins/jquery-slimscroll/jquery.slimscroll.min.js" type="text/javascript"></script>
<script src="${hxycStatic}/vendors/metronic4.5.2/global/plugins/jquery.blockui.min.js" type="text/javascript"></script>
<script src="${hxycStatic}/vendors/metronic4.5.2/global/plugins/uniform/jquery.uniform.min.js" type="text/javascript"></script>
<script src="${hxycStatic}/vendors/metronic4.5.2/global/plugins/bootstrap-switch/js/bootstrap-switch.min.js" type="text/javascript"></script>
<!-- END CORE PLUGINS -->
<!-- BEGIN PAGE LEVEL PLUGINS -->
<script src="${hxycStatic}/vendors/metronic4.5.2/global/plugins/jquery-validation/js/jquery.validate.min.js" type="text/javascript"></script>
<script src="${hxycStatic}/vendors/metronic4.5.2/global/plugins/jquery-validation/js/additional-methods.min.js" type="text/javascript"></script>
<script src="${hxycStatic}/vendors/metronic4.5.2/global/plugins/select2/js/select2.full.min.js" type="text/javascript"></script>
<script src="${hxycStatic}/vendors/metronic4.5.2/global/plugins/backstretch/jquery.backstretch.min.js" type="text/javascript"></script>
<!-- END PAGE LEVEL PLUGINS -->
<!-- BEGIN THEME GLOBAL SCRIPTS -->
<script src="${hxycStatic}/vendors/metronic4.5.2/global/scripts/app.min.js" type="text/javascript"></script>
<!-- END THEME GLOBAL SCRIPTS -->
<!-- BEGIN PAGE LEVEL SCRIPTS -->
<script src="${hxycStatic}/vendors/metronic4.5.2/pages/scripts/login-4.min.js" type="text/javascript"></script>
<!-- END PAGE LEVEL SCRIPTS -->
<!-- BEGIN THEME LAYOUT SCRIPTS -->
<!-- END THEME LAYOUT SCRIPTS -->
</body>

</html>