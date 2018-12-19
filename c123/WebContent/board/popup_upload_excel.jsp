<%@ page contentType="text/html;charset=utf-8" %>

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

	<link rel="stylesheet" type="text/css" href="<%=ConstantUtil.SERVER_HOST%>/share/css/base.css" />
	<link rel="stylesheet" type="text/css" href="<%=ConstantUtil.SERVER_HOST%>/share/css/admin.css" />
	<script type="text/javascript" src="<%=ConstantUtil.SERVER_HOST%>/share/js/common.js"></script>
	<script language="javascript" type="text/javascript" src="<%=ConstantUtil.SERVER_HOST%>/js/jquery-1.5.2.min.js"></script>
	<script language="javascript" type="text/javascript" src="<%=ConstantUtil.SERVER_HOST%>/js/common.js"></script>

</head>
<body>
<script language="javascript">
<!--
	$(document).ready(function() {
	});

	function uploadOk()
	{
		if( !Common.isValue($("#fileipt").val()))
		{
			alert( "업로드할 파일이 없습니다.");
			$("#fileipt").focus();
			return false;
		}

		$("#myform").attr("action", "popup_upload_excel_ok.jsp");
		$("#myform").submit();
	}

	function goClose()
	{
		self.close();
	}

	function chFileUp()
	{
		var lieTxt = document.getElementById("viewtxt");
		var trueTxt = document.getElementById("fileipt");
		lieTxt.value = trueTxt.value;
	}

//-->
</script>

<form name="myform" id="myform" method="post" enctype="multipart/form-data">

	<div class="popup">
		<h1>파일 업로드</h1>
		<p class="center sub_table">
			<input type="text" id="viewtxt" name="viewtxt" class="inputbox1" readonly="readonly" />
			<span style="position:absolute; overflow:hidden; width:100px; height:23px; background:url(<%=ConstantUtil.SERVER_HOST%>/images/button/btn_search.gif) no-repeat;">
				<input type="file" id="fileipt" name="fileipt" style="position:absolute; left:-20px; top:0px; height:40px; width:100px; filter:alpha(opacity=0); opacity:0; -moz-opacity:0; " onChange="chFileUp();" />
			</span>
		</p>
	<!--
		<p class="center sub_table">
			<font color="white"></font> <b> * excel만 업로드 가능</b>
		</p>
	-->
		<p class="center sub_table">
			<button type="button" class="admin_text_btn03" onclick="uploadOk();">업로드</button>
			<font color="white">_</font>
			<button type="button" class="admin_text_btn03" onclick="goClose();">닫기</button>
		</p>
	</div>
</form>

</body>
</html>