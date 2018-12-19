<%@ page language="java" isErrorPage="true" info="Error Handler" %>
<%@ page import="java.io.*" %>
<%@ page contentType="text/html; charset=utf-8" %>
<%
  String message = "";
  message = exception.getMessage();

  StringWriter sw = new StringWriter();
  PrintWriter pw = new PrintWriter(sw);
  exception.printStackTrace(pw);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>LEE</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<style type="text/css">
body {
	font:75%/1.5em arial,helvetica,clean,sans-serif;
	height:100%;
}
table {
	border-collapse: collapse;
	border-spacing: 0;
}
input {
	border:1px solid #CCCCCC;
	padding:2px 1px 1px 2px;
	font-size:0.9em;
	color:#666666;
	line-height:100%;
	vertical-align:middle;
}
</style>

<script type="text/javascript" language="JavaScript">
<!--
function showError() {
  var obj = document.all.detail;
  obj.style.display = "block";
}

function hideError() {
  var obj = document.all.detail;
  obj.style.display = "none";
}
-->
</script>
</head>

<body onload="javascript:hideError();">
<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td width="99%" valign="top">
    <div align="center">
      <table width="90%" border="0" cellpadding="0" cellspacing="1">
       <tr>
        <td height="30"></td>
       </tr>
      </table>

      <table width="90%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td><div align="center"><strong>시스템에 장애가 발생하였습니다. 불편을 드려 죄송합니다.<br/>자세한 문의는 관리자에게 해주시기 바랍니다.</strong></div></td>
        </tr>
      </table>

      <br/>

      <table width="90%" border="0" cellpadding="0" cellspacing="0" bgcolor="#5B98FF">
        <tr>
          <td>
            <div align="center">
              <table width="97%" border="0" cellspacing="0" cellpadding="10">
                <tr>
                  <td>Error Message : <%= message %></td>
                </tr>
              </table>
            </div>
          </td>
        </tr>
      </table>

      <br/>

      <table width="90%" border="0" cellpadding="0" cellspacing="1">
       <tr>
        <td height="10"></td>
       </tr>
      </table>

      <table width="90%" border="0" cellpadding="0" cellspacing="1" bgcolor="#5B98FF" id="detail">
        <tr>
          <td bgcolor="#FFFFFF">
            <div align="left">
              <table width="98%" border="0" cellspacing="1" cellpadding="15">
                <tr>
                  <td><pre><%= sw %></pre></td>
                 </tr>
              </table>
            </div>
          </td>
        </tr>
      </table>

      <br/>

      <table width="90%" border="0" cellspacing="1" cellpadding="0">
        <tr>
          <td>
            <input type="button" value="Back" onclick="javascript:history.back();">
            <input type="button" value="Show Detail Error" onclick="javascript:showError();">
            <input type="button" value="Hide Detail Error" onclick="javascript:hideError();">
          </td>
        </tr>
      </table>
    </div>
    </td>
  </tr>
</table>
</body>
</html>
