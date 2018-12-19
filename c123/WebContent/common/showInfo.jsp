<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<%@ page import="lee.common.config.ConstantUtil" %>
<%@ page import="lee.common.config.PropertyManager" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko" xml:lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr" />
<meta name="subject" content=" 관리자모드" />
<meta name="title" content=" 관리자모드페이지" />
<meta name="keywords" content=", 관리자모드" />
<meta name="date" content="2011-08-11" />
<title> <%=ConstantUtil.HTML_TITLE%></title>
</head>
<!--
<frameset rows="0%,*" frameborder="no" border="0" framespacing="0">
<frame src="" name="topFrame" scrolling="no" noresize="noresize" id="topFrame" />
<frame src="login_index.jsp?MAC=<%=request.getParameter("MAC") == null ? "" : request.getParameter("MAC")%>" name="mainFrame" id="mainFrame" />
</frameset>
<noframes>
-->
<script language="javascript">
<!--
function fnInit(){
	var frm = document.forms[0];
 	frm.target = "_top"
 	frm.action = "login_index.jsp";
 	frm.submit();
 	frm.target = "";
}

//-->
</script>

<body>
	<p align="center">
	<!--	<a href="http://www.prmna.com" target="_blank" title="프라임코리아"> -->
			<img src="<%=ConstantUtil.SERVER_HOST%>/images/admin/prime_logo.gif" width="922" height="95" border="0" usemap="#Map">
	<!--	</a>-->
	</p>
	<!--
	<map name="Map">
	  <area shape="rect" coords="807,44,859,88" href="http://www.prmna.com/mps/AdminArea/Admin_Login.php" target="_blank">
	  <area shape="rect" coords="20,44,180,88" href="http://www.prmna.com" target="_blank">
	</map>
	-->
</body>
</noframes>
</html>
