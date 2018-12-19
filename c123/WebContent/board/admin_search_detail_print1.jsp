<%@ page contentType="text/html;charset=utf-8" %>

<%@ page errorPage="../common/error.jsp" %>

<%@ page import="lee.common.config.*" %>
<%@ page import="lee.bean.*" %>
<%@ page import="lee.manager.*" %>
<%@ page import="lee.common.util.*" %>
<%@ page import="lee.common.servlet.*" %>
<%@ page import="lee.session.*" %>
<%@ page import="java.util.*" %>

<%@ page import="lee.common.config.ConstantUtil" %>
<%@ page import="lee.common.config.PropertyManager" %>

<%@ include file="../common/_includeInit.inc" %>
<%@ include file="../common/_includeCommon.inc" %>

<%
	String excelID = StringUtil.NVL(request.getParameter("excelID"),"0");
	String userType = "" ;

	// 등록된 고객 여부 판단하여 고객 유형 분류함
	if(curAdminInfo != null) {
		userType =  curAdminInfo.getUserType() ;
	} else {
		userType =  "9" ;
	}

	ExcelDataMgr excelDataMgr = mgr.getExcelDataMgr();

	HashMap paramD = new HashMap();
	paramD.put( "excelId", excelID);
	ExcelData excelData = excelDataMgr.getExcelDataByExcelId( paramD );

	if( excelData == null )
	{
%>
	<script>
		alert( "유효하지 않은 값입니다." );
		self.close();
	</script>
<%
	}
%>

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
<link rel="stylesheet" type="text/css" href="<%=ConstantUtil.SERVER_HOST%>/share/css/kais_kaml.css" />
<script type="text/javascript"  src="<%=ConstantUtil.SERVER_HOST%>/share/js/common.js"></script>
<script language="javascript" type="text/javascript"  src="<%=ConstantUtil.SERVER_HOST%>/js/jquery-1.5.2.min.js"></script>
<script language="javascript" type="text/javascript"  src="<%=ConstantUtil.SERVER_HOST%>/js/jquery.blockUI.js"></script>
<script language="javascript" type="text/javascript"  src="<%=ConstantUtil.SERVER_HOST%>/js/common.js"></script>

<%@include file="../common/inc_dhxgrid_00.jsp" %>

</head>

<body class="mypage_popup" id="printareabox">

<script type="text/javascript" language="javascript">
var initBody;
function beforePrint() {
	initBody = document.body.innerHTML;
	document.body.innerHTML = printareabox.innerHTML;
}

function afterPrint() {
	document.body.innerHTML = initBody;
}

function goPrint() {

	$("#button").hide();
	if( !confirm("화면을 인쇄하시겠습니까?" ) )
	{
		$("#button").show();
		return;
	}
	window.onbeforeprint = beforePrint;
	window.onafterprint = afterPrint;
	window.print();
	$("#button").show();
}

function fileDownload(cfileName, rfileName){
	$("#rfileName").attr("value", cfileName);
	$("#cfileName").attr("value", rfileName);

	$("#myfileDown").attr("action", "/servlet/scholar.dn");
	$("#myfileDown").attr("encoding", "application/x-www-form-urlencoded");
	$("#myfileDown").submit();
}

function goClose()
{
	self.close();
}

</script>
	<div class="mypage_popup_form_box">
		<h2 class="h2_mypage_popup_form">양도/양수 리스트</h2>
		<ul id="button">
			<li><a href="#dummy" onclick="goPrint();return false;"><img src="<%=ConstantUtil.SERVER_HOST%>/images/button/btn_popup_form_1.gif" alt="인쇄하기" /></a></li>
			<li><a href="#dummy" onclick="goClose();return false;"><img src="<%=ConstantUtil.SERVER_HOST%>/images/button/btn_popup_form_2.gif" alt="창닫기" /></a></li>
		</ul>
		<div class="mypage_popup_form_list">
			<table class="form_board" >
				<colgroup>
					<col width="15%" />
					<col width="35%" />
					<col width="15%" />
					<col width="35%" />
				</colgroup>
				<tbody>
					<tr>
						<th scope="row">날짜</th>
						<td><%=excelData.getF1()%></td>
						<th scope="row">업종</th>
						<td><%=excelData.getF2()%></td>
					</tr>
					<tr>
						<th scope="row">지역</th>
						<td><%=excelData.getF3()%></td>
						<th scope="row">법인/면허</th>
						<td><%=excelData.getF4()%></td>
					</tr>
					<tr>
						<th scope="row">자본금</th>
						<td><%=excelData.getF5()%></td>
						<th scope="row">시평</th>
						<td><%=excelData.getF6()%></td>
					</tr>
					<tr>
						<th scope="row">좌수</th>
						<td><%=excelData.getF7()%></td>
						<th scope="row">잔액</th>
						<td><%=excelData.getF8()%></td>
					</tr>
					<tr>
						<th scope="row">2008</th>
						<td><%=excelData.getF9()%></td>
						<th scope="row">2009</th>
						<td><%=excelData.getF10()%></td>
					</tr>
					<tr>
						<th scope="row">2010</th>
						<td><%=excelData.getF11()%></td>
						<th scope="row">2011</th>
						<td><%=excelData.getF12()%></td>
					</tr>
					<tr>
						<th scope="row">3년합계</th>
						<td><%=excelData.getF13()%></td>
						<th scope="row">2012</th>
						<td><%=excelData.getF14()%></td>
					</tr>
					<tr>
						<th scope="row">양도가</th>
						<td ><%=excelData.getF15()%></td>
						<td colspan="2"><b>* 양도가는 수수료 별도입니다.</b></td>
					</tr>
					<tr>
						<th scope="row">협회</th>
						<td colspan="5"><%=excelData.getF16()%></td>
					</tr>
					<tr>
						<th scope="row">기타</th>
						<td colspan="5"><%=excelData.getF17()%></td>
					</tr>
				<%
					//관리자와 유료회원이 아니면 맨 끝2개 필드는 보여주지 않음
					//관리자구분(1:관리자(슈퍼), 2:관리자(일반), 3:정액회원, 4:일반회원)'
					if (StringUtil.stoi(userType) <= 3 ) {
				%>
					<tr>
						<th scope="row">업체</th>
						<td colspan="5"><%=excelData.getF18()%></td>
					</tr>
					<tr>
						<th scope="row">연락처</th>
						<td colspan="5"><%=excelData.getF19()%></td>
					</tr>
				<%
					}
				%>
				</tbody>
			</table>
		</div>
	</div>
</body>
<!-- 파일 다운로드 -->
<form name="myfileDown" id="myfileDown" method="post" action="">
	<input type="hidden" id="fileType" name="fileType" value="scholar" />
	<input type="hidden" id="rfileName" name="rfileName" />
	<input type="hidden" id="cfileName" name="cfileName" />
</form>
</html>