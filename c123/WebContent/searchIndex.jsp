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
	
	// http://msdn.microsoft.com/ko-kr/library/7sw4ddf8(v=VS.94).aspx
	//구글 Chrome 설치 여부 조사
	function DetectActiveXControl() 
	{ 
		try 
		{ 
			var xObj = new ActiveXObject("GoogleUpdate.ProcessLauncher"); 
			
			//WScript 프로그램 사용시 아래의 로직 이용함
			//var xObj = new ActiveXObject("WScript.shell");
			//var oExec = xObj.Exec('cmd "start iexplore"');  
			//alert("Final: " + oExec.Status); 
			//oExec = null; 
			//xObj = null; 
			
			if(xObj) 
				Installed = true; 
			else 
				Installed = false; 
		} 
		catch(ex) 
		{ 
			Installed = false; 
		} 
		
		/*	
		if(Installed == true) 
		{ 
			alert("ActiveX Control이 설치되었음"); 
		} 
		else 
		{ 
			alert("ActiveX Control이 설치되지 않았음"); 
		} 
		*/
		return Installed ;
	} 
		
	function form_check()
	{
		if(navigator.userAgent.indexOf("Chrome") == -1) {
			//Chrome 브라우저 설치 여부 판단 함
			//if (!DetectActiveXControl()){
				alert("Google 크롬브라우저 설치를 먼저 하세요");	
				return;	
			//} 
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
		$("#myform").attr("action", "./common/do_login.jsp");
		$("#myform").attr("target", "_top");
		$("#myform").submit();
		$("#myform").attr("target", "");
	}

	function showGrid(){
		
		if(navigator.userAgent.indexOf("Chrome") == -1) {
			//Chrome 브라우저 설치 여부 판단 함
			/*
			if (!DetectActiveXControl()){
				alert("Google 크롬브라우저 설치를 먼저 하세요");	
				return;	
			} else {
			   shellExecuteExe();
			   return;
			}*/
			shellExecuteExe();
			return;	
				
		} else {

	    	window.open('<%=ConstantUtil.SERVER_HOST%>/dhx/dhxSearch.jsp' ,'popup_0', 'width=1000, height=700,left=10,top=10,toolbar=no, location=no, directories=no, status=no, menubar=no, resizable=no, scrollbars=no, copyhistory=no');
	    
	    }
	}
	
	// 참조 사이트
	//	http://wendy81.tistory.com/53 
	//	http://cafe.naver.com/sharedtalk/222
	//도구 > 인터넷옵션 > 보안 > 사용자지정수준 > ActiveX 컨트롤 및 플러그 인 
	// > 스크립팅하기 안전하지 않는것으로 표시된 ActiveX컨트롤 초기화 및 스크립팅을  
	//"사용안함" 에서 "사용" 이나 "확인" 으로 수정
	function shellExecuteExe(){
		
		try 
		{
			var shell = new ActiveXObject("WScript.shell");
			shell.run('chrome.EXE <%=ConstantUtil.SERVER_HOST%>/dhx/dhxSearch.jsp',1,true);
			//shell.Quit();
			shell = null;
		} 
		catch(ex) 
		{ 
		alert(ex);
			alert("Google 크롬브라우저 설치를 먼저 하세요");	
			return;
		} 
		//var objShell = new ActiveXObject("Shell.Application");
		//objShell.ShellExecute("notepad.exe", "", "", "open", 1);
		//shell.ShellExecute("cmd.exe","","", "open", 1);
	}	

//-->
</script>

</head>

<body>
<div id="wrap">
 	<div id="header">
		<p align="center">
			<img src="<%=ConstantUtil.SERVER_HOST%>/images/admin/prime_logo.gif" width="922" height="95" border="0" usemap="#Map">
		</p>
	</div>

	<div id="container1">
		<div id="left">
			<table width="215" cellpadding="0" cellspacing="0">
			    <tr>
			        <td width="205"><img src="<%=ConstantUtil.SERVER_HOST%>/images/admin/rs1.gif" width="215" height="45" border="0"></td>
			    </tr>
			    <tr>
			        <td width="205" background="img/rsp.gif" valign="top">
			            <div align="right">
			                <table cellpadding="0" cellspacing="0">
			                    <tr>
			                        <td width="180">
			                           <a href="http://www.moct.go.kr/" target="_blank"><img src="<%=ConstantUtil.SERVER_HOST%>/images/admin/ban1.gif" width="190" height="41" border="0"></a>
			                        </td>
			                    </tr>
			                    <tr>
			                        <td width="180"><a href="http://www.sarok.go.kr/" target="_blank"><img src="<%=ConstantUtil.SERVER_HOST%>/images/admin/ban2.gif" width="190" height="40" border="0"></a></td>
			                    </tr>
			                    <tr>
			                        <td width="180"><a href="http://www.kocea.or.kr/" target="_blank"><img src="<%=ConstantUtil.SERVER_HOST%>/images/admin/ban3.gif" width="190" height="41" border="0"></a></td>
			                    </tr>
			                    <tr>
			                        <td width="180"><a href="http://cak.or.kr/" target="_blank"><img src="<%=ConstantUtil.SERVER_HOST%>/images/admin/ban4.gif" width="190" height="41" border="0"></a></td>
			                    </tr>
			                    <tr>
			                        <td width="180"><a href="http://www.kosca.or.kr/" target="_blank"><img src="<%=ConstantUtil.SERVER_HOST%>/images/admin/ban5.gif" width="190" height="40" border="0"></a></td>
			                    </tr>
			                    <tr>
			                        <td width="180"><a href="http://www.cgbest.co.kr/" target="_blank"><img src="<%=ConstantUtil.SERVER_HOST%>/images/admin/ban6.gif" width="190" height="42" border="0"></a></td>
			                    </tr>
			                </table>
			            </div>
			        </td>
			    </tr>
			</table>
		</div>

		<div class="contents_wrap">
			<div class="contents">
				<p class="skin_btn center">
					<button type="button" class="admin_text_btn05" onclick="showGrid()">양도물건 리스트</button>
				</p>
				<p class="skin_btn center">
					성능개선을 위해서는 크롬을 설치하세요.
				</p>
				<p class="skin_btn center">
					<a href="https://www.google.com/intl/ko/chrome/browser/?hl=kr&brand=CHMD&utm_campaign=kr_kr&utm_source=kr-ha-kr-sk-img&utm_medium=houseads" target="_blank" title="구글 크롬다운로드">
						<img  src="<%=ConstantUtil.SERVER_HOST%>/images/admin/googleCromDownload.jpg" alt="구글 크롬다운로드" style="cursor:pointer" width="300"/>
					</a>
				</p>

				<p class="skin_btn center"> &nbsp; </p>
				<p class="skin_btn center"> &nbsp; </p>

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
			</div>
		</div>

	</div>
	<hr />
</div>
</body>
</html>