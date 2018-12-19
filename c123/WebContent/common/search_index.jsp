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
<link rel="stylesheet" type="text/css" href="<%=ConstantUtil.SERVER_HOST%>/share/css/base.css" />
<link rel="stylesheet" type="text/css" href="<%=ConstantUtil.SERVER_HOST%>/share/css/admin.css" />
<script type="text/javascript"  src="<%=ConstantUtil.SERVER_HOST%>/share/js/common.js"></script>
<script language="javascript" type="text/javascript"  src="<%=ConstantUtil.SERVER_HOST%>/js/jquery-1.5.2.min.js"></script>
<script language="javascript" type="text/javascript"  src="<%=ConstantUtil.SERVER_HOST%>/js/common.js"></script>

<script language="javascript">
<!--

$(document).ready(function() {
	focus();
	//if (getCookie('popup_stop_donate') != 'no')	document.onload = open_win();
	//if (getCookie('popup_donate') != 'no')	document.onload = open_win();
	//if (getCookie('popup_notice_20120329') != 'no')	document.onload = open_win1();
	//2012.07.16
	//if (getCookie('popup_stop_donate') != 'no')	document.onload = open_win();
});

function focus()
{
	$("#userid").focus();
	if(Common.isValue($("#userid").val())){
		$("#userpw").focus();
	}
}

function keyEvent(){
	if(event.keyCode == '13'){
		form_check();
	}
}

function enter()
{
	if(event.keyCode==13) form_check();
}

function form_check()
{
	if(navigator.userAgent.indexOf("Chrome") == -1) {
		alert("Google 크롬브라우저 설치를 먼저 하세요");
		return;
	}

	if(!Common.isValue($("#userid").val()))
	{
		alert("아이디를 입력하세요.");
		$("#userid").focus();
		return;
	}

	if( !Common.isValue($("#userpw").val()) )
	{
		alert("비밀번호를 입력하세요.");
		$("#userpw").focus();
		return;
	}

	//
	$("#myform").attr("action", "do_login.jsp");
	$("#myform").attr("target", "_top");
	$("#myform").submit();
	$("#myform").attr("target", "");
}

	function showGrid(){

		if(navigator.userAgent.indexOf("Chrome") == -1) {
			alert("Google 크롬브라우저 설치를 먼저 하세요");
			return;
		}

		//location.href = "<%=ConstantUtil.SERVER_HOST%>/dhx/dhxSearch.jsp";
	    window.open('<%=ConstantUtil.SERVER_HOST%>/dhx/dhxSearch.jsp' ,'popup_0', 'width=1000, height=700,left=10,top=10,toolbar=no, location=no, directories=no, status=no, menubar=no, resizable=no, scrollbars=no, copyhistory=no');
	 }

//-->
</script>
</head>

<body>
	<p class="skin_btn center">
		<button type="button" class="admin_text_btn05" onclick="showGrid()">양도물건리스트</button>
	</p>
	<p class="skin_btn center">
		성능개선을 위해서는 크롬을 설치하세요.
	</p>
	<p class="skin_btn center">
		<a href="https://www.google.com/intl/ko/chrome/browser/?hl=kr&brand=CHMD&utm_campaign=kr_kr&utm_source=kr-ha-kr-sk-img&utm_medium=houseads" target="_blank" title="구글 크롬다운로드">
			<img  src="<%=ConstantUtil.SERVER_HOST%>/images/admin/googleCromDownload.jpg" alt="구글 크롬다운로드" style="cursor:pointer" width="300"/>
		</a>
	</p>

	<form name="myform" id="myform" method="post" class="form_login_s">
		<input type="hidden" name="targetPage" id="targetPage" value="GRID"/>
		<fieldset>
			<legend>사용자 로그인</legend>
			<p class="form_legend_s">사용자 로그인</p>
			<div>
				<p><strong> 사용자 모드</strong><br />시스템 관련 문의 :  <strong class="blue_color"></strong><br />(Tel : )</p>
				<ul>
					<li><label for="Login_ID">아이디 :</label><input type="text" name="userid" id="userid" value="" autocomplete=off tabindex="1" class="text_input" /></li>
					<li><label for="Login_PW">패스워드 :</label><input type="password" name="userpw" id="userpw" value="" onKeydown="enter();" autocomplete=off tabindex="2" class="text_input" /></li>
					<li class="login_btn">
						<a href="javascript:form_check();">
							<img  src="<%=ConstantUtil.SERVER_HOST%>/images/admin/btn_adminLogin.gif" alt="로그인" />
						</a>
					</li>
				</ul>
			</div>
		</fieldset>
	</form>
</body>
</html>