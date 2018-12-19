<%@ page contentType="text/html;charset=utf-8" %>

<%@ page import="lee.common.config.ConstantUtil" %>
<%@ page import="lee.common.config.PropertyManager" %>

<%
	// 검색 조건 추가
	String searchValue = request.getParameter( "searchValue" );
	if( searchValue == null || searchValue.equals("null") ) searchValue = "";

%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko" xml:lang="ko">
<script>
  // 구글 웹 로그 사용을 위한 코드
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-41945809-1', 'prmna.pe.kr');
  ga('send', 'pageview');

</script>
<script>
  // 구글 웹 로그 사용을 위한 코드
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-41945809-1', 'prmna.pe.kr');
  ga('send', 'pageview');

</script>
<script type="text/javascript">
  // ActiveX 사용가능 여부 체크
  var agt=navigator.userAgent.toLowerCase();
  if (agt.indexOf("msie") != -1) {
    try { 
      request = new ActiveXObject("Microsoft.XMLHTTP"); 
      } catch (failed) {
      alert("인터넷 브라우저가 ActiveX 컨트롤을 차단하여 페이지가 올바르게 표시되지 않을 수 있습니다. 도움말 페이지로 이동합니다.");
      location.replace("security_help/security.html");
    }
  }
</script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr" />
<meta name="subject" content=" 관리자모드" />
<meta name="title" content=" 관리자모드페이지" />
<meta name="keywords" content=", 관리자모드" />
<meta name="date" content="2011-08-11" />
<title> <%=ConstantUtil.HTML_TITLE%></title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="images/icons/favicon.ico"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/select2/select2.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/perfect-scrollbar/perfect-scrollbar.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="css/util.css">
	<link rel="stylesheet" type="text/css" href="css/main.css">
<!--===============================================================================================-->
<!--===============================================================================================-->	
	<script src="vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/bootstrap/js/popper.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
	<script src="js/main.js"></script>

<link rel="stylesheet" type="text/css" href="<%=ConstantUtil.SERVER_HOST%>/share/css/base.css" />
<link rel="stylesheet" type="text/css" href="<%=ConstantUtil.SERVER_HOST%>/dhx/dhtmlxGrid/codebase/skins/dhtmlxgrid_dhx_skyblue.css">
<link rel="stylesheet" type="text/css" href="<%=ConstantUtil.SERVER_HOST%>/share/css/kais_kaml.css" />
<link rel="stylesheet" type="text/css" href="<%=ConstantUtil.SERVER_HOST%>/share/css/text.css" />
<script type="text/javascript"  src="<%=ConstantUtil.SERVER_HOST%>/share/js/common.js"></script>
<script language="javascript" type="text/javascript"  src="<%=ConstantUtil.SERVER_HOST%>/js/jquery-1.5.2.min.js"></script>
<script language="javascript" type="text/javascript"  src="<%=ConstantUtil.SERVER_HOST%>/js/jquery.blockUI.js"></script>
<script language="javascript" type="text/javascript"  src="<%=ConstantUtil.SERVER_HOST%>/js/common.js"></script>

<%@include file="../common/inc_dhxgrid_00.jsp" %>

<style>
	.tt7{font-size:11px;FONT-WEIGHT: bold;color:#7E7E7E;font-family: "굴림,verdana";}
	.tt8{font-size:11px;FONT-WEIGHT: bold;color:#408FC9;font-family: "굴림,verdana";}
	.tt9{font-size:11px;FONT-WEIGHT: bold;color:#AEAAAA;font-family: "굴림,verdana";}
	.tt10{font-size:12px;FONT-WEIGHT: bold;color:#000000;font-family: "굴림,verdana";}
	.tt11{font-size:12px;FONT-WEIGHT: bold;color:#A24444;font-family: "굴림,verdana";}
</style>

</head>

<body>
<div class="table100 ver2 m-b-110">
					<table data-vertable="ver2">
						<thead>
							<tr class="row100 head">
								<th class="column100 column1" data-column="column1"></th>
								<th class="column100 column2" data-column="column2">Sunday</th>
								<th class="column100 column3" data-column="column3">Monday</th>
								<th class="column100 column4" data-column="column4">Tuesday</th>
								<th class="column100 column5" data-column="column5">Wednesday</th>
								<th class="column100 column6" data-column="column6">Thursday</th>
								<th class="column100 column7" data-column="column7">Friday</th>
								<th class="column100 column8" data-column="column8">Saturday</th>
							</tr>
						</thead>
						<tbody>
							<tr class="row100">
								<td class="column100 column1" data-column="column1">Lawrence Scott</td>
								<td class="column100 column2" data-column="column2">8:00 AM</td>
								<td class="column100 column3" data-column="column3">--</td>
								<td class="column100 column4" data-column="column4">--</td>
								<td class="column100 column5" data-column="column5">8:00 AM</td>
								<td class="column100 column6" data-column="column6">--</td>
								<td class="column100 column7" data-column="column7">5:00 PM</td>
								<td class="column100 column8" data-column="column8">8:00 AM</td>
							</tr>

							<tr class="row100">
								<td class="column100 column1" data-column="column1">Jane Medina</td>
								<td class="column100 column2" data-column="column2">--</td>
								<td class="column100 column3" data-column="column3">5:00 PM</td>
								<td class="column100 column4" data-column="column4">5:00 PM</td>
								<td class="column100 column5" data-column="column5">--</td>
								<td class="column100 column6" data-column="column6">9:00 AM</td>
								<td class="column100 column7" data-column="column7">--</td>
								<td class="column100 column8" data-column="column8">--</td>
							</tr>

							<tr class="row100">
								<td class="column100 column1" data-column="column1">Billy Mitchell</td>
								<td class="column100 column2" data-column="column2">9:00 AM</td>
								<td class="column100 column3" data-column="column3">--</td>
								<td class="column100 column4" data-column="column4">--</td>
								<td class="column100 column5" data-column="column5">--</td>
								<td class="column100 column6" data-column="column6">--</td>
								<td class="column100 column7" data-column="column7">2:00 PM</td>
								<td class="column100 column8" data-column="column8">8:00 AM</td>
							</tr>

							<tr class="row100">
								<td class="column100 column1" data-column="column1">Beverly Reid</td>
								<td class="column100 column2" data-column="column2">--</td>
								<td class="column100 column3" data-column="column3">5:00 PM</td>
								<td class="column100 column4" data-column="column4">5:00 PM</td>
								<td class="column100 column5" data-column="column5">--</td>
								<td class="column100 column6" data-column="column6">9:00 AM</td>
								<td class="column100 column7" data-column="column7">--</td>
								<td class="column100 column8" data-column="column8">--</td>
							</tr>

							<tr class="row100">
								<td class="column100 column1" data-column="column1">Tiffany Wade</td>
								<td class="column100 column2" data-column="column2">8:00 AM</td>
								<td class="column100 column3" data-column="column3">--</td>
								<td class="column100 column4" data-column="column4">--</td>
								<td class="column100 column5" data-column="column5">8:00 AM</td>
								<td class="column100 column6" data-column="column6">--</td>
								<td class="column100 column7" data-column="column7">5:00 PM</td>
								<td class="column100 column8" data-column="column8">8:00 AM</td>
							</tr>

							<tr class="row100">
								<td class="column100 column1" data-column="column1">Sean Adams</td>
								<td class="column100 column2" data-column="column2">--</td>
								<td class="column100 column3" data-column="column3">5:00 PM</td>
								<td class="column100 column4" data-column="column4">5:00 PM</td>
								<td class="column100 column5" data-column="column5">--</td>
								<td class="column100 column6" data-column="column6">9:00 AM</td>
								<td class="column100 column7" data-column="column7">--</td>
								<td class="column100 column8" data-column="column8">--</td>
							</tr>

							<tr class="row100">
								<td class="column100 column1" data-column="column1">Rachel Simpson</td>
								<td class="column100 column2" data-column="column2">9:00 AM</td>
								<td class="column100 column3" data-column="column3">--</td>
								<td class="column100 column4" data-column="column4">--</td>
								<td class="column100 column5" data-column="column5">--</td>
								<td class="column100 column6" data-column="column6">--</td>
								<td class="column100 column7" data-column="column7">2:00 PM</td>
								<td class="column100 column8" data-column="column8">8:00 AM</td>
							</tr>

							<tr class="row100">
								<td class="column100 column1" data-column="column1">Mark Salazar</td>
								<td class="column100 column2" data-column="column2">8:00 AM</td>
								<td class="column100 column3" data-column="column3">--</td>
								<td class="column100 column4" data-column="column4">--</td>
								<td class="column100 column5" data-column="column5">8:00 AM</td>
								<td class="column100 column6" data-column="column6">--</td>
								<td class="column100 column7" data-column="column7">5:00 PM</td>
								<td class="column100 column8" data-column="column8">8:00 AM</td>
							</tr>
						</tbody>
					</table>
				</div>
<div id="wrap">
	<div id="container2">
<!--
		<div id="left">
			<table width="215" cellpadding="0" cellspacing="0">
			    <tr>
			        <td width="205" background="img/rsp.gif" valign="top">
			            <div align="right">
			                <table cellpadding="0" cellspacing="0">
			                    <tr>
			                        <td width="180">
			                           &nbsp;
			                        </td>
			                    </tr>
			                </table>
			            </div>
			        </td>
			    </tr>
			</table>

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
-->
		<div class="contents_wrap">
		<!-- 컨텐츠 시작-->
				<table width="100%" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td class="conTitleBg">
							<!-- 제목&페이지 위치-->
							<table width="100%" border="0" cellspacing="0" cellpadding="0">
								<td class="conTitle_re">
									  <table>
  									  <tr>
  										양도/양수 리스트
  										</tr>
  										<tr>
  										  <td class="topSpace10">
      									<b>업종명 체크박스에서 업종명을 선택 후, 화면 우측의 [조회]버튼을 클릭하시면, 검색결과를 확인 할 수 있습니다.</b>
      									</td>
      								</tr>
										</table>
										</td>
								<!--
									<td valign="bottom" class="btnLine">
										<table border="0" align=" center" cellpadding="0" cellspacing="0">
											<tr>
												<td class="btn_box">
													<table border="0" id="BTN_TEXT_SEARCH"  cellpadding="0" cellspacing="0" style="cursor:pointer;">
														<tr>
															<td >
																<strong>업종검색</strong> <font color=white>__</font>
																<input type="text" id="searchValue" name="searchValue" value="" class="search_input2" onkeypress="if(event.keyCode == 13) doTextSearch();"/>
																<font color=white>__</font>
																<img src="../images/admin/btn_search.gif" alt="검색" onclick="doTextSearch()" style="cursor:pointer"/>
															</td>
														</tr>
													</table>
												</td>
											</tr>
										</table>
									</td>
								-->
									<td valign="bottom" class="btnLine">
										<!-- 버튼 시작 -->
										<table border="0" align="right" cellpadding="0" cellspacing="0">
											<tr>
												<!-- 등록 버튼 시작 -->
												<td class="btn_box">
													<table border="0" id="BTN_HOME"  cellpadding="0" cellspacing="0" style="cursor:pointer;">
														<tr>
															<td >
																<a href="javascript:goHome();" class="admin_text_btn03">첫 페이지로 이동</a>
															</td>
														</tr>
													</table> <br>
													<table border="0" id="BTN_SEARCH" cellpadding="0" cellspacing="0" style="cursor:pointer;">
														<tr>
															<td class="btn-left"><img src="<%=ConstantUtil.SERVER_HOST%>/images/button/kaml_btn_dat_search.gif"></td>
															<td class="btn-right"><a href="#" onfocus="this.blur()">조회</a></td>
														</tr>
													</table>
												</td>
												<!-- 등록 버튼 끝 -->
											</tr>
										</table>
										<!-- 버튼 끝 -->
									</td>
								</tr>
							</table>
						</td>
					</tr>
					<tr>
						<td class="topSpace10">
							<!-- 조회테이블 시작-->
							<table width="100%" border="0" cellspacing="0" cellpadding="9">
								<tr>
									<td class="search">
										<table width="850" border="0" align="center" cellpadding="0" cellspacing="0">
											<tr>
												<td width='200' class="search_li" align="center">
													<font color=white>________</font>
													<a href="javascript:initAllGrid();" class="admin_text_btn02">조건초기화</a>
												</td>
												<td class="search_con" valign="top">
													<table border="0" id="BTN_TEXT_SEARCH"  cellpadding="0" cellspacing="0" style="cursor:pointer;">
														<tr>
															<td >
																<strong>업종검색</strong> <!--<font color=white>__</font> -->
																<input type="text" id="searchValue" name="searchValue" value="" class="text_input width_style01" onkeypress="if(event.keyCode == 13) doTextSearch();"/>
																<img src="../images/admin/btn_search.gif" alt="검색" onclick="doTextSearch()" style="cursor:pointer"/>
															</td>
														</tr>
													</table>
													<!-- 그리드 시작 -->
													<table width="200" border="0" align="left" cellpadding="0" cellspacing="0">
														<tr>
															<td class="taList">
																<!--<div id="gridL" width="200" height="200"> -->
																<div id="gridL" style="width:230px; height:150px; background-color:white;">
																</div>
															</td>
														</tr>
													</table>
													<!-- 그리드 끝 -->
												</td>
												<td width='30' class="search_li">&nbsp;
												</td>
												<td class="search_con" valign="top">
													</select-->
													<!-- 그리드 시작 -->
													&nbsp;
													<table width="200" border="0" align="left" cellpadding="0" cellspacing="0">
														<tr>
															<td class="taList">
																<!-- <div id="gridM" width="200" height="150"> -->
																<div id="gridM" style="width:230px; height:150px; background-color:white;">
																</div>
															</td>
														</tr>
													</table>
													<!-- 그리드 끝 -->
												</td>
												<td width='30' class="search_li">&nbsp;
												</td>
												<td class="search_con" valign="top">
													</select-->
													<!-- 그리드 시작 -->
													&nbsp;
													<table width="200" border="0" align="left" cellpadding="0" cellspacing="0">
														<tr>
															<td class="taList">
																<!-- <div id="gridS" width="200" height="150"> -->
																<div id="gridS" style="width:230px; height:150px; background-color:white;">
																</div>
															</td>
														</tr>
													</table>
													<!-- 그리드 끝 -->
												</td>

											</tr>
										</table>
									</td>
								</tr>
							</table>
							<!-- 조회테이블 끝-->
						</td>
					</tr>
					<!--
					<tr>
						 <td class="conTitle" align="center">검색 결과를 더블 클릭 하면, 상세화면으로 이동합니다.</td>
					</tr>
					-->
					<tr>
						<td class="topSpace10">
							<!-- 결과테이블 시작-->
							<table width="100%" border="0" cellspacing="0" cellpadding="9">
								<tr>
									<td  align="center"> <b>* 타이틀 클릭시 정렬됩니다.</b>
									</td>
									<td  align="center"> <b>* 검색 결과를 더블 클릭 하면, 상세화면으로 이동합니다.</b>
									</td>
								</tr>
							</table>
							<!-- 결과테이블 끝-->
						</td>
					</tr>
					<tr>
						<td class="topSpace10">
							<!-- 결과테이블 시작-->
							<table width="100%" border="0" cellspacing="0" cellpadding="9">
								<tr>
									<td class="search">
										<table width="760" border="0" align="center" cellpadding="0" cellspacing="0">
											<tr>
												<td class="search_con">
													<!-- 그리드 시작 -->
													<table width="100%" border="0" align="left" cellpadding="0" cellspacing="0">
														<tr>
															<td class="taList">
																<!-- <div id="gridT" height="300"> -->
																<div id="gridT" style="width:910px; height:350px; background-color:white;">
																</div>
															</td>
														</tr>
													</table>
													<!-- 그리드 끝 -->
												</td>
											</tr>
										</table>
									</td>
								</tr>
							</table>
							<!-- 결과테이블 끝-->
						</td>
					</tr>
				</table>
			</div>

			<!--

				<img src="<%=ConstantUtil.SERVER_HOST%>/images/admin/prime_logo.gif" width="910px" height="95" border="0" usemap="#Map">
				<map name="Map">
				  <area shape="rect" coords="807,44,859,88" href="/common/login.jsp">
				</map>
			-->
			<div class="contents_bottom">
				<table width="940" height="95" border="0" cellspacing="0" cellpadding="0" background="<%=ConstantUtil.SERVER_HOST%>/images/main/bottom_bg.gif">
					<tr>
						<td ><img src="<%=ConstantUtil.SERVER_HOST%>/images/main/bottom.gif" ></td>
						<td>
							<table width="0%" border="0" cellspacing="0" cellpadding="0" >
								<tr height="40"><td colspan="4"></td></tr>
							<!--
								<tr>
									<td class="tt7">COPYRIGHT(C)</td>
									<td class="tt8"> PRIMEMNA.PE.KR </td>
									<td class="tt7"> ALL RIGHTS RESERVED. </td>
									<td>&nbsp;</td>
								</tr>
							-->
								<tr>
									<td class="tt9" colspan="3">
										상호: 프라임코리아&nbsp;&nbsp;&nbsp;
										대표: 한광수&nbsp;&nbsp;&nbsp;
										이메일: h82214400@nate.com
									</td>
									<td class="tt4" id="goToAdmin"><a href="#" onfocus="this.blur()">[ 관리자 ]</a></td>
								</tr>
								<tr>
									<td class="tt9" colspan="3">
										[주소] 서울시 송파구 삼전동 57-15 2층&nbsp;&nbsp;&nbsp;
										사업자번호: 206-12-30051&nbsp;&nbsp;&nbsp;
									</td>
									<td>
										<table width="0%" border="0" cellspacing="0" cellpadding="0" >
											<tr>
												<td class="tt10">TEL:</td>
												<td class="tt11"> 1688-3880 &nbsp;</td>
												<td class="tt10">FAX:</td>
												<td class="tt11"> 0505-323-2000</td>
											</tr>
										</table>
									</td>
								</tr>
							</table>
						</td>
					</tr>
				</table>
			</div>
	</div>
</div>
<form name="myform" id="myform" method="post">
	<input type="hidden" id="excelID" name="excelID"  />
</form>
<!-- Start of DHTMLX Component Initializations -->
<script type="text/javascript">

	var grid_font_size = "font-size:13px";
	var inintArrLS; //처음 로딩된
	var arrLS;	// 대분류 기 선택 값
	var arrMS;	// 중분류 기 선택 값
	var arrSS;	// 소분류 기 선택 값
	var onChromeBrowser = false ;
	var searchValueTemp ; // 업종검색값 임시 저장소

	//grid 시작
	// 대분류 그리드 시작
	var gridL = new dhtmlXGridObject("gridL");
	gridL.setImagePath("<%=ConstantUtil.SERVER_HOST%>/dhx_new/imgs/");

	var idArrL = new Array();
	var idxL   = 0;
	var conArrL = new Array(); // head, width, align, sorting, type

	idArrL[idxL++] = "선택";
	idArrL[idxL++] = "업종명";

	//conArrL["선택"]		= Array("{#master_checkbox}", "30", "center",  "str", "ch");
	conArrL["선택"]			= Array("선택", "50", "center",  "#master_checkbox", "ch");
	conArrL["업종명"]		= Array("업종명", "160", "left",  "str", "ro");

	l_initGrid(gridL,idArrL,conArrL);

	gridL.setSkin("light");
	gridL.setDelimiter("/");

	gridL.init();
	// 데이터 폰트 크기 설정
  gridL.attachEvent("onRowCreated", function(rId,rObj,rXml){
	  var colNum = gridL.getColumnsNum();
	  for (var i=1 ; i <= colNum; i++) {
	    gridL.setCellTextStyle(rId,i,grid_font_size)
	  }
	});

	//gridL.setColumnHidden(gridL.getColIndexById("업종코드"), true);

	//gridL.enableDistributedParsing(true,12,100);
	gridL.attachEvent("onCheckbox", function(rId,cInd,state) {
		actionGridLCheckbox(rId,cInd,state);
	});
	// 대분류 그리드 끝

	// 중분류 그리드 시작
	var gridM = new dhtmlXGridObject("gridM");
	gridM.setImagePath("<%=ConstantUtil.SERVER_HOST%>/dhx_new/imgs/");

	var idArrM = new Array();
	var idxM   = 0;
	var conArrM = new Array(); // head, width, align, sorting, type

	idArrM[idxM++] = "선택";
	idArrM[idxM++] = "3년합계";

	//conArrM["선택"]		= Array("{#master_checkbox}", "30", "center",  "#master_checkbox", "ch");
	conArrM["선택"]			= Array("선택", "50", "center",  "#master_checkbox", "ch");
	conArrM["3년합계"]		= Array("3년합계", "150", "left",  "str", "ro");

	l_initGrid(gridM,idArrM,conArrM);


	gridM.setSkin("light");
	gridM.setDelimiter("/");

	gridM.init();
	// 데이터 폰트 크기 설정
  gridM.attachEvent("onRowCreated", function(rId,rObj,rXml){
	  var colNum = gridM.getColumnsNum();
	  for (var i=1 ; i <= colNum; i++) {
	    gridM.setCellTextStyle(rId,i,grid_font_size)
	  }
	});

	//gridM.setColumnHidden(gridM.getColIndexById("3년합계코드"), true);
	//gridM.enableDistributedParsing(true,12,100);
	gridM.enablePreRendering(200);
	gridM.attachEvent("onCheckbox", function(rId,cInd,state) {
		actionGridMCheckbox(rId,cInd,state);
	});
	// 중분류 그리드 끝

	// 소분류 그리드 시작
	var gridS = new dhtmlXGridObject("gridS");
	gridS.setImagePath("<%=ConstantUtil.SERVER_HOST%>/dhx_new/imgs/");

	var idArrS = new Array();
	var idxS   = 0;
	var conArrS = new Array(); // head, width, align, sorting, type

	idArrS[idxS++] = "선택";
	idArrS[idxS++] = "양도가";

	//conArrS["선택"]			= Array("{#master_checkbox}", "30", "center",  "#master_checkbox", "ch");
	conArrS["선택"]				= Array("선택", "50", "center",  "#master_checkbox", "ch");
	conArrS["양도가"]		= Array("양도가", "150", "left",  "str", "ro");

	l_initGrid(gridS,idArrS,conArrS);


	gridS.setSkin("light");
	gridS.setDelimiter("/");

	gridS.init();
	// 데이터 폰트 크기 설정
  gridS.attachEvent("onRowCreated", function(rId,rObj,rXml){
	  var colNum = gridS.getColumnsNum();
	  for (var i=1 ; i <= colNum; i++) {
	    gridS.setCellTextStyle(rId,i,grid_font_size)
	  }
	});

	//gridS.setColumnHidden(gridS.getColIndexById("양도가코드"), true);
	//gridS.enableDistributedParsing(true,12,100);
	gridS.enablePreRendering(50);
	gridS.attachEvent("onCheckbox", function(rId,cInd,state) {
		actionGridSCheckbox(rId,cInd,state);
	});
	// 소분류 그리드 끝

	// 결과 그리드 시작
	var gridT = new dhtmlXGridObject("gridT");
	gridT.setImagePath("<%=ConstantUtil.SERVER_HOST%>/dhx_new/imgs/");

	var idArrT = new Array();
	var idxT   = 0;
	var conArrT = new Array(); // head, width, align, sorting, type

	idArrT[idxT++] = "S";
	idArrT[idxT++] = "날짜";
	idArrT[idxT++] = "업종";
	idArrT[idxT++] = "지역";
	//idArrT[idxT++] = "법인/면허";
	//idArrT[idxT++] = "자본금";
	idArrT[idxT++] = "시평";
	idArrT[idxT++] = "좌수";
	idArrT[idxT++] = "잔액";
	idArrT[idxT++] = "2009";
	idArrT[idxT++] = "2010";
	idArrT[idxT++] = "2011";
	idArrT[idxT++] = "3년합계";
	idArrT[idxT++] = "2012";
	idArrT[idxT++] = "2013"; // 2008 ==> 2013
	idArrT[idxT++] = "양도가";
	//idArrT[idxT++] = "협회";
	idArrT[idxT++] = "기타";
	//idArrT[idxT++] = "업체";
	//idArrT[idxT++] = "연락처";

	conArrT["S" 		]	= Array("S"	, "1",  "center",  "str", "ro");
	conArrT["날짜"   	]	= Array("날짜"		, "60",  "center",  "str", "ro");
	conArrT["업종"   	]	= Array("업종"		, "80", "center",  "str", "ro");
	conArrT["지역"   	]	= Array("지역"		, "60", "center",  "str", "ro");
	//conArrT["법인/면허"	]	= Array("법인/면허"	, "80", "center",  "str", "ro");
	//onArrT["자본금"  	]	= Array("자본금"	, "60", "center",  "str", "ro");
	conArrT["시평"   	]	= Array("시평"		, "60", "center",  "str", "ro");
	conArrT["좌수"  	]	= Array("좌수"		, "60", "center",  "str", "ro");
	conArrT["잔액"   	]	= Array("잔액"		, "60", "center",  "str", "ro");
	conArrT["2009" 		]	= Array("2010"		, "45", "center",  "str", "ro");
	conArrT["2010" 		]	= Array("2011"		, "45", "center",  "str", "ro");
	conArrT["2011" 		]	= Array("2012"		, "45", "center",  "str", "ro");
	conArrT["3년합계" 	]	= Array("3년합계"	, "60", "center",  "str", "ro");
	conArrT["2012" 		]	= Array("2013"		, "45", "center",  "str", "ro");
	conArrT["2013" 		]	= Array("2014"		, "45", "center",  "str", "ro");
	conArrT["양도가"  	]	= Array("양도가"	, "60", "center",  "str", "ro");
	//conArrT["협회"   	]	= Array("협회"		, "60", "center",  "str", "ro");
	conArrT["기타"   	]	= Array("기타"		, "150", "left",  "str", "ro");
	//conArrT["업체"   	]	= Array("업체"		, "150", "center",  "str", "ro");
	//conArrT["연락처"  	]	= Array("연락처"	, "150", "center",  "str", "ro");

	l_initGrid(gridT,idArrT,conArrT);

	gridT.setSkin("dhx_skyblue");
	gridT.enableMultiline(true)
	gridT.setDelimiter("/");

	gridT.init();
	gridT.attachEvent("onRowDblClicked",onRowDblClicked);        //row DoubleClick
	//gridT.attachEvent("onRowSelect", onRowDblClicked);

	//gridT.setColumnHidden(gridT.getColIndexById("업체"),true);
	//gridT.setColumnHidden(gridT.getColIndexById("연락처"),true);
	//gridT.enableDistributedParsing(true,12,100);

	//
	// add by nobel
	// set bold text on specific columns
	//
	gridT.attachEvent("onRowCreated", function(rId,rObj,rXml){
	  var colNum = gridT.getColumnsNum();
	  for (var i=1 ; i <= colNum; i++) {
	    gridT.setCellTextStyle(rId,i,grid_font_size)
	  }
		gridT.setCellTextStyle(rId,4,"font-family: 돋움;font-weight: bold;"+grid_font_size);
		gridT.setCellTextStyle(rId,5,"font-family: 돋움;font-weight: bold;"+grid_font_size);
		gridT.setCellTextStyle(rId,6,"font-family: 돋움;font-weight: bold;"+grid_font_size);
		gridT.setCellTextStyle(rId,10,"font-family: 돋움;font-weight: bold;"+grid_font_size);
		gridT.setCellTextStyle(rId,12,"font-family: 돋움;font-weight: bold;"+grid_font_size);
	});


	// 결과 그리드 끝

    //로드후 실행
    $(document).ready( function(){

		//
		checkChromeBrowser();
		doInitSearch();
    	  
		// 조회
		$('#BTN_SEARCH').click(function() {
			if (isCheckedInConditon())
			{
				doSearch();
			} else {
				alert("업종명/3년합계/양도가 조건 선택을 먼저 하세요");
			}

		});

		// 엑셀 업로드
		$('#BTN_UPLOAD').click(function() {
			uploadExcel();
		});

		$("#goToAdmin").click(function()
        {
            goToAdmin();
        });

        $("#goHome").click(function()
        {
            goHome();
        });
    });
	
	function onRowDblClicked(rowId,cellId){

		var excelID = gridT.cells(rowId, gridT.getColIndexById("S")).getValue();
		$("#excelID").attr("value", excelID);

		var param = "?excelID="   + excelID;
		//var openUrl = "/board/admin_search_detail.jsp" + param;
		//l_viewPopup2(openUrl,'excelInfo', '1080','360' );
		
		var openUrl = "/print/printContent2.jsp" + param;
		l_viewPopup2(openUrl,'print', '760','850' );
		
	}
  
	function isCheckedInConditon()
	{
		var searchOK =false ;
		var chkrowL = gridL.getCheckedRows(gridL.getColIndexById("선택")) ;
		var chkrowM = gridM.getCheckedRows(gridM.getColIndexById("선택")) ;
		var chkrowS = gridS.getCheckedRows(gridS.getColIndexById("선택")) ;
		var totalRowCnt = 0 ;

		if (chkrowL.length > 0) totalRowCnt += chkrowL.split(",").length ;
		if (chkrowM.length > 0) totalRowCnt += chkrowM.split(",").length ;
		if (chkrowS.length > 0) totalRowCnt += chkrowS.split(",").length ;

		if (totalRowCnt > 0)
		{
			searchOK = true ;
		}

		return searchOK ;
	}

	function isNothingChecked()
	{
		//체크된 rows가 없으면 조건 초기화로 감
		if (!isCheckedInConditon())
		{
			initAllGrid();
			return true ;
		}

		return false ;
	}

	function initCheckBoxOnChrome(grid,rowCnt)
	{
		for (var i=1 ; i <= rowCnt; i++) {
			grid.cells(i, grid.getColIndexById("선택")).setValue("0");
		}

	}

	function initAllGrid()
	{

		// 업종검색 초기화
		$("#searchValue").attr("value", "");
		searchValueTemp = "" ;

		arrLS = "" ;
		arrMS = "" ;
		arrSS = "" ;
		gridL.clearAll(); // 대분류 Row 삭제
		gridM.clearAll(); // 중분류 Row 삭제
		gridS.clearAll(); // 소분류 Row 삭제
		doInitSearch();

	}

	function checkAll(gridName,chckObj)
	{

		var grid ;
		var onAndOff = chckObj.checked;
		var checkValue = '1';

		if (onAndOff) checkValue = '1'
		else checkValue = '0'

		if (gridName == "gridL")  grid = gridL ;
		else if (gridName == "gridM")  grid = gridM ;
		else if (gridName == "gridS")  grid = gridS ;

		var rowCnt = grid.getRowsNum();

		for (var i=1 ; i <= rowCnt; i++) {
			grid.cells(i, grid.getColIndexById("선택")).setValue(checkValue);
		}

	}

	function checkChromeBrowser()
	{
		if(navigator.userAgent.indexOf("Chrome") > -1 ||
		   navigator.userAgent.indexOf("Android") > -1
		) {
			onChromeBrowser = true ;
		}
	}

	function doInitSearch() {
		//업종검색 단어가 있으면 해당 텍스트로 조회 함
		var searchValue = $("#searchValue").val();
    <% 
    System.out.println("doInSearch() -- 1 ");
    %>
		var params = "";
		params += "?fieldName=f2&COMMAND=COMBO&searchValue=" + searchValue;
	    var callUrl = "/board/combo_list_show.jsp" + params;

    <% 
    System.out.println("doInSearch() -- 2 ");
    //System.out.println(callUrl);
    %>
	    gridL.clearAndLoad(callUrl,function(){
			var rowCnt = gridL.getRowsNum();

    <% 
    System.out.println("doInSearch() -- 3 ");
    %>
        	if ( rowCnt == 0 ) {
        		alert('조회결과가 없습니다. ');
        	}

            //$("#totalCount").text(rowCnt);
            //$.unblockUI(); //처리후 unblock

            // CHROME에서는체크박스가 모두 체크 되어 나옴
			if (onChromeBrowser)
				initCheckBoxOnChrome(gridL,rowCnt);

        });

	}

	// 체크한값 반환
	// grid : 기준그리드객체
	// chkColNm : 해당 그리드객체의 체크박스 컬럼ID
	// baseColNm : 해당 그리드객체의 체크된Row의 추출하고자 하는 컬럼ID
	// charYn = ' 사용여부(boolean)
	function getGridCheckedItem(grid, chkColNm, baseColNm, charYn) {

		var gridItemIds = grid.getAllItemIds().split('/');
		var arrResult = new Array();
		var chkrow = grid.getCheckedRows(grid.getColIndexById(chkColNm));
		var charMark = charYn == true ? "'" : "";
		if ( chkrow.length > 0 ) {
			var arrChkrow = chkrow.split(",");

			for (var i=0, arrChkrowLen = arrChkrow.length; i < arrChkrowLen; i++) {
				arrResult[i] = charMark + grid.cells(arrChkrow[i], grid.getColIndexById(baseColNm)).getValue() + charMark;
			}
		}

		return arrResult;
	}

	// 업종코드 gridL 체크시 이벤트 발생 시 수행 함수 --> gridL.attachEvent("onCheckbox", ... )
	function actionGridLCheckbox(rId,cInd,state) {

		//체크가 하나도 안되어 있으면 초기화 함
		if (isNothingChecked()) return ;

		arrLS = "";
		arrLS = getGridCheckedItem(gridL, "선택", "업종명", false); // 대분류 key값 저장

		var f2List = getGridCheckedItem(gridL, "선택", "업종명", true);
		var f13List = getGridCheckedItem(gridM, "선택", "3년합계", true);
		var f15List = getGridCheckedItem(gridS, "선택", "양도가", true);

		doGridMSearch(f2List,f13List,f15List); // grid Result
		doGridSSearch(f2List,f13List,f15List); // grid Result
	}

	// 3년합계 gridM 체크시 이벤트 발생 시 수행 함수 --> gridM.attachEvent("onCheckbox", ... )
	function actionGridMCheckbox(rId,cInd,state) {

		//체크가 하나도 안되어 있으면 초기화 함
		if (isNothingChecked()) return ;

		arrMS = "";
		arrMS = getGridCheckedItem(gridM, "선택", "3년합계", false); // 중분류 key값 저장

		var f2List = getGridCheckedItem(gridL, "선택", "업종명", true);
		var f13List = getGridCheckedItem(gridM, "선택", "3년합계", true);
		var f15List = getGridCheckedItem(gridS, "선택", "양도가", true);

		doGridSSearch(f2List,f13List,f15List); // grid Result
		doGridLSearch(f2List,f13List,f15List); // grid Result
	}

	// 양도가코드 gridS 체크시 이벤트 발생 시 수행 함수 --> gridS.attachEvent("onCheckbox", ... )
	function actionGridSCheckbox(rId,cInd,state) {

		//체크가 하나도 안되어 있으면 초기화 함
		if (isNothingChecked()) return ;

		arrSS = "" ;
		arrSS = getGridCheckedItem(gridS, "선택", "양도가", false); // 소분류 key값 저장

		var f2List = getGridCheckedItem(gridL, "선택", "업종명", true);
		var f13List = getGridCheckedItem(gridM, "선택", "3년합계", true);
		var f15List = getGridCheckedItem(gridS, "선택", "양도가", true);

		doGridLSearch(f2List,f13List,f15List); // grid Result
		doGridMSearch(f2List,f13List,f15List); // grid Result

	}

	// 업종코드 조회
	function doGridLSearch(f2List,f13List,f15List) {
		//
		//var f13List = getGridCheckedItem(gridM, "선택", "3년합계코드", true);
		//var f15List = getGridCheckedItem(gridS, "선택", "양도가코드", true);

		var params = "";
		params += "fieldName=f2&COMMAND=COMBO&returnGubn=G";

		if (onChromeBrowser)
			params += "&isChromeBrowser=Y";

		if ( f13List.length > 0 ) {
			params += "&f13List=" + f13List.join(","); // 3년합계
		}

		if ( f15List.length > 0 ) {
			params += "&f15List=" + f15List.join(","); // 양도가코드
		}

		/* 업종코드 상세 검색이 있으면 포함 시킴*/
		if (searchValueTemp != null && searchValueTemp.length > 0) {
			params += "&searchValue=" + searchValueTemp; // 검색된 값
		}

		var callUrl = "/board/combo_list_show.jsp?" + params;

	    //$.blockUI();
	    //dhtmlxAjax.post("combo_list_show.jsp", params, outputResponse);

		//gridS.clearAll(); // 소분류 Row 삭제
        gridL.clearAndLoad(callUrl,function(){
			var rowCnt = gridL.getRowsNum();

			if (onChromeBrowser)
				initCheckBoxOnChrome(gridL,rowCnt);

        	if ( rowCnt == 0 ) {
        		//alert('조회결과가 없습니다. ');
        	}
			else {
				// 조회된 데이타가 존재할 경우
				//  alert("rowCnt : [" + rowCnt + "]");
				if ( nullChk(arrLS) ) {
					// alert(arrMS);
					for (var i=0, arrLSLen = arrLS.length; i < arrLSLen; i++) {
						// alert("arrMS["+i+"] : [" + arrMS[i] + "]");
						for (var j=1; j <= rowCnt; j++) {
							// alert("arrMS["+i+"] : [" + arrMS[i] + "]\n\n" + "행원코드 : [" + gridM.cells(j, gridM.getColIndexById("행원코드")).getValue() + "]");
							if (gridL.cells(j, gridL.getColIndexById("업종명")).getValue() == arrLS[i]) {
								//
								gridL.cells(j, gridL.getColIndexById("선택")).setValue("1");
								break;
							}
						}
					}

					// 기 선택된 중분류에 맞는 기 소분류를 조회한다.
					//doGridSSearch();
				}
			}

            //$("#totalCount").text(rowCnt);
            //$.unblockUI(); //처리후 unblock
        });
	}
	// 중분류gridM 조회
	function doGridMSearch(f2List,f13List,f15List) {
		//
		//var f2List = getGridCheckedItem(gridL, "선택", "업종코드", true);
		//var f15List = getGridCheckedItem(gridS, "선택", "양도가코드", true);

		var params = "";
		params += "fieldName=f13&COMMAND=COMBO&returnGubn=G";

		if (onChromeBrowser)
			params += "&isChromeBrowser=Y";

		if ( f2List.length > 0 ) {
			params += "&f2List=" + f2List.join(","); // 업종코드
		}

		if ( f15List.length > 0 ) {
			params += "&f15List=" + f15List.join(","); // 양도가코드
		}

		var callUrl = "/board/combo_list_show.jsp?" + params;

	    //$.blockUI();
	    //dhtmlxAjax.post("combo_list_show.jsp", params, outputResponse);

		//gridS.clearAll(); // 소분류 Row 삭제
        gridM.clearAndLoad(callUrl,function(){
			var rowCnt = gridM.getRowsNum();

			if (onChromeBrowser)
				initCheckBoxOnChrome(gridM,rowCnt);

        	if ( rowCnt == 0 ) {
        		//alert('조회결과가 없습니다. ');
        	}
			else {
				// 조회된 데이타가 존재할 경우
				//  alert("rowCnt : [" + rowCnt + "]");
				if ( nullChk(arrMS) ) {
					// alert(arrMS);
					for (var i=0, arrMSLen = arrMS.length; i < arrMSLen; i++) {
						// alert("arrMS["+i+"] : [" + arrMS[i] + "]");
						for (var j=1; j <= rowCnt; j++) {
							// alert("arrMS["+i+"] : [" + arrMS[i] + "]\n\n" + "행원코드 : [" + gridM.cells(j, gridM.getColIndexById("행원코드")).getValue() + "]");
							if (gridM.cells(j, gridM.getColIndexById("3년합계")).getValue() == arrMS[i]) {
								//
								gridM.cells(j, gridM.getColIndexById("선택")).setValue("1");
								break;
							}
						}
					}

					// 기 선택된 중분류에 맞는 기 소분류를 조회한다.
					//doGridSSearch();
				}
			}

            //$("#totalCount").text(rowCnt);
            //$.unblockUI(); //처리후 unblock
        });
	}

	// 소분류gridS 조회
	function doGridSSearch(f2List,f13List,f15List) {
		//
		//var f2List = getGridCheckedItem(gridL, "선택", "업종코드", true);
		//var f13List = getGridCheckedItem(gridM, "선택", "3년합계코드", true);

		var params = "";
		params += "fieldName=f15&COMMAND=COMBO&returnGubn=G";

		if (onChromeBrowser)
			params += "&isChromeBrowser=Y";

		if ( f2List.length > 0 ) {
			params += "&f2List=" + f2List.join(","); // 업종코드
		}

		if ( f13List.length > 0 ) {
			params += "&f13List=" + f13List.join(","); // 3년합계코드
		}

	    var callUrl = "/board/combo_list_show.jsp?" + params;

	    //$.blockUI();

        gridS.clearAndLoad(callUrl,function(){
			var rowCnt = gridS.getRowsNum();

			if (onChromeBrowser)
				initCheckBoxOnChrome(gridS,rowCnt);

        	if ( rowCnt == 0 ) {
        		//alert('조회결과가 없습니다. ');
        	}
			else {
				// 조회된 데이타가 존재할 경우
				//alert("rowCnt : [" + rowCnt + "]");
				if ( nullChk(arrSS) ) {
					//alert(arrSS);
					for (var i=0, arrSSLen = arrSS.length; i < arrSSLen; i++) {
						//alert("arrSS["+i+"] : [" + arrSS[i] + "]");
						for (var j=1; j <= rowCnt; j++) {
							//alert("arrSS["+i+"] : [" + arrSS[i] + "]\n\n" + "SKEY : [" + gridS.cells(j, gridS.getColIndexById("SKEY")).getValue() + "]");
							if (gridS.cells(j, gridS.getColIndexById("양도가")).getValue() == arrSS[i]) {
								//
								gridS.cells(j, gridS.getColIndexById("선택")).setValue("1");
								break;
							}
						}
					}
				}
			}

            //$("#totalCount").text(rowCnt);
            //$.unblockUI(); //처리후 unblock
        });
	}


	// 상단 조회버튼 클릭 시 처리 함수
	function doSearch() {

		var f2List = getGridCheckedItem(gridL, "선택", "업종명", true);
		var f13List = getGridCheckedItem(gridM, "선택", "3년합계", true);
		var f15List = getGridCheckedItem(gridS, "선택", "양도가", true);

		//alert("지점코드\n" + brnchNoInfo + "\n\n" + "행원코드\n" + clerkNoInfo + "발령년월일\n" + annuncmntDtInfo);

		var params = "";
		params += "COMMAND=SEARCH";

		if (onChromeBrowser)
			params += "&isChromeBrowser=Y";

		if ( f2List.length > 0 ) {
			params += "&f2List=" + f2List.join(","); // 업종명
		}
		if ( f13List.length > 0 ) {
			params += "&f13List=" + f13List.join(","); // 3년합계
		}
		if ( f15List.length > 0 ) {
			params += "&f15List=" + f15List.join(","); // 양도가
		}

		//if($('#TRIP_YN:checked').val() == 'Y'){tripYn = "Y";}else{tripYn = "N";}
		/*
		if ($("#orderByF13:checked").val() == 'Y' )
		{
			params += "&orderByF13=Y" ; //3년합계 정렬
		}

		if ($("#orderByF15:checked").val() == 'Y' )
		{
			params += "&orderByF15=Y" ; //양도가 정렬
		}
		*/

	    var callUrl = "/board/combo_list_show.jsp?" + params;

	    //$.blockUI();

        gridT.clearAndLoad(callUrl,function(){
			//alert("조회 후 그리드 생성");
			var rowCnt = gridT.getRowsNum();

        	if ( rowCnt == 0 ) {
        		alert('조회결과가 없습니다. ');
        	}
			//alert("조회 후 그리드 완성");
            //$("#totalCount").text(rowCnt);
            //$.unblockUI(); //처리후 unblock
        });
	}

	// 상단 업종조회버튼 클릭 시 처리 함수
	function doTextSearch() {
	  //alert(1);
		// 텍스트 조회값을 임시 저장 함
		searchValueTemp = $("#searchValue").val();
		arrLS = "" ;
		arrMS = "" ;
		arrSS = "" ;
		gridL.clearAll(); // 대분류 Row 삭제
		gridM.clearAll(); // 중분류 Row 삭제
		gridS.clearAll(); // 소분류 Row 삭제
		
		doInitSearch();
	}

	// 체크된 대분류의 값으로 중분류selectbox 내용 조회
	function doSelect2Search() {

		var brnchNoInfo = getGridCheckedItem(gridL, "선택", "지점코드", true);

		var params = "";
		params += "COMMAND=MSC";
		if ( brnchNoInfo.length > 0 ) {
			params += "&BRNCH_NO=" + brnchNoInfo.join(","); // 지점코드
		}

	    //$.blockUI();

        dhtmlxAjax.post('/board/combo_list_show.jsp', params, doSelect2SearchResponse);      //ajax 호출
	}

	// 중분류selectbox 조회 콜백함수
	function doSelect2SearchResponse(loader){
		//$.unblockUI();

	    if(loader.xmlDoc.responseText!=null){

			JSONObject = eval( "(" +loader.xmlDoc.responseText+ ")" );

	        result = JSONObject.data[0].result;

	        if(result == "true"){

				// 고객정보
				var clerkNo = JSONObject.data[0].CLERK_NO; // 행원코드
				var clerkNm = JSONObject.data[0].CLERK_NM; // 행원명

				clerkNo = clerkNo.substring(0, clerkNo.length - 1);
				clerkNm = clerkNm.substring(0, clerkNm.length - 1);

				var arrClerkNo = clerkNo.split("^");
				var arrClerkNm = clerkNm.split("^");

				// 중분류(selectbox 재 설정 - TEST_SELECT2)
				$("#TEST_SELECT2 option").remove();
				for (var i=0, arrLen=arrClerkNo.length; i < arrLen; i++) {
					//
					$("#TEST_SELECT2").append("<option value='" + arrClerkNo[i] + "'>" + arrClerkNm[i] + "</option>");
				}

	        }
	        else{
	        	alert(JSONObject.data[0].message);
	        }

	    }else{
	          	l_msgSet("조회 중 에러발생!");
	    }
	}

	function goToAdmin()
	{
		//location.href="../common/login.jsp";
		location.href="../board/admin_search_list.jsp";
	}

	function goHome()
	{
		location.href="<%=ConstantUtil.SERVER_HOST%>";
	}

	function nullChk(param) {
		//
		if ( param == "" || param == null || param == undefined || param == "undefined" ) {
			return false;
		}
		else {
			return true;
		}
	}

	//replace
	String.prototype.simpleReplace = function(oldStr, newStr) {
		var rStr = oldStr;

		rStr = rStr.replace(/\\/g, "\\\\");
		rStr = rStr.replace(/\^/g, "\\^");
		rStr = rStr.replace(/\$/g, "\\$");
		rStr = rStr.replace(/\*/g, "\\*");
		rStr = rStr.replace(/\+/g, "\\+");
		rStr = rStr.replace(/\?/g, "\\?");
		rStr = rStr.replace(/\./g, "\\.");
		rStr = rStr.replace(/\(/g, "\\(");
		rStr = rStr.replace(/\)/g, "\\)");
		rStr = rStr.replace(/\|/g, "\\|");
		rStr = rStr.replace(/\,/g, "\\,");
		rStr = rStr.replace(/\{/g, "\\{");
		rStr = rStr.replace(/\}/g, "\\}");
		rStr = rStr.replace(/\[/g, "\\[");
		rStr = rStr.replace(/\]/g, "\\]");
		rStr = rStr.replace(/\-/g, "\\-");

	  	var re = new RegExp(rStr, "g");
	    return this.replace(re, newStr);
	}

	//Grid setting
	function l_initGrid(grid, idArr, conArr){
	    var headerArr  =  Array(); //header
	    var widthArr  =  Array(); //width
	    var alignArr   =  Array(); //align
	    var sortingArr =  Array(); //sorting
	    var typeArr   =  Array(); //type
	    for(var i = 0 ; i < idArr.length; i++){
	        headerArr[i]  = conArr[idArr[i]][0];
	        widthArr[i]   = conArr[idArr[i]][1];
	        alignArr[i]   = conArr[idArr[i]][2];
	        sortingArr[i] = conArr[idArr[i]][3];
	        typeArr[i]    = conArr[idArr[i]][4];
	    }
	    grid.setColumnIds(idArr.join(","));
	    grid.setHeader(headerArr.join(","));
	    grid.setInitWidths(widthArr.join(","));
	    grid.setColAlign(alignArr.join(","));
	    grid.setColSorting(sortingArr.join(","));
	    grid.setColTypes(typeArr.join(","));

	}

</script>
<!-- End of DHTMLX Component Initializations -->

</body>
</html>
