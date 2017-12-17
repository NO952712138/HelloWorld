<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
String path = request.getContextPath();
String basePath = request.getScheme() + "://"
		+ request.getServerName() + ":" + request.getServerPort()
		+ path + "/";
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Signature</title>
<meta charset="utf-8">
  <title>Signature Pad demo</title>
  <meta name="description" content="Signature Pad - HTML5 canvas based smooth signature drawing using variable width spline interpolation.">

  <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no">

  <meta name="apple-mobile-web-app-capable" content="yes">
  <meta name="apple-mobile-web-app-status-bar-style" content="black">

  <link rel="stylesheet" href=""<%=basePath %>css/signature-pad.css"">

  
  <script type="text/javascript">
    var _gaq = _gaq || [];
    _gaq.push(['_setAccount', 'UA-39365077-1']);
    _gaq.push(['_trackPageview']);

    (function() {
      var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
      ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
      var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
    })();
  </script>
</head>
<body>

<body onselectstart="return false">
   <!-- <a id="github" style="position: absolute; top: 0; right: 0; border: 0" href="https://github.com/szimek/signature_pad">
    <img src="https://s3.amazonaws.com/github/ribbons/forkme_right_gray_6d6d6d.png" alt="Fork me on GitHub">
  </a>  -->

  <div id="signature-pad" class="signature-pad">
    <div class="signature-pad--body">
      <canvas></canvas>
    </div>
    <div class="signature-pad--footer">
      <div class="description">Sign above</div>

      <div class="signature-pad--actions">
        <div>
          <button type="button" class="button clear" data-action="clear">清除</button>
          <!-- <button type="button" class="button" data-action="change-color">Change color</button> -->
          <button type="button" class="button" data-action="undo">回退</button>

        </div>
        <div>
          <button type="button" class="button save" data-action="save-png">上传签名</button>
          <!-- <button type="button" class="button save" data-action="save-jpg">Save as JPG</button>
          <button type="button" class="button save" data-action="save-svg">Save as SVG</button> -->
        </div>
      </div>
    </div>
  </div>
	<script src="https://code.jquery.com/jquery-git.js"></script>
  <script src="<%=basePath%>js/signature_pad.js"></script>
  <script src="<%=basePath%>js/app.js"></script>
</body>
</body>
</html>