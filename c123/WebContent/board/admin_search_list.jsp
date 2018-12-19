<%@ page contentType="text/html;charset=utf-8" %>

<%@ page errorPage="../common/error.jsp" %>

<%@ page import="lee.common.config.ConstantUtil" %>
<%@ page import="lee.common.config.PropertyManager" %>
<%@ page import="java.io.BufferedReader" %>
<%@ page import="java.io.InputStreamReader" %>
<%@ page import="java.io.FileInputStream" %>
<%@ page import="java.io.IOException" %>
<%@ page import="java.io.FileReader" %>
<%@ page import="java.io.FileWriter" %>
<%@ page import="java.io.BufferedWriter" %>
<%@ page import="java.io.OutputStreamWriter" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.*" %>
<%@ page import=" java.io.File"%>
<%@ page import=" java.text.SimpleDateFormat"%>
<%@ page import=" java.util.Date"%>
<%@ page import=" java.util.Calendar"%>

<%@ include file="../common/_includeInit.inc" %>
<%@ include file="../common/_includeCommon.inc" %>
<%@ include file="../common/_checkLogin.inc" %>

<%
	// 회원 권한 세팅
	int userType = Integer.parseInt(curAdminInfo.getUserType());
	
	ExcelDataMgr excelDataMgr = mgr.getExcelDataMgr();
	HashMap paramD = new HashMap();
	//그리드 타이틀 DB에서 읽어 오는 방식으로 변경 함
	ExcelTitle excelTitle = excelDataMgr.getExcelTitle(paramD);
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
<link rel="stylesheet" type="text/css" href="<%=ConstantUtil.SERVER_HOST%>/dhx/dhtmlxGrid/codebase/skins/dhtmlxgrid_dhx_skyblue.css">
<!--
<link rel="stylesheet" type="text/css" href="<%=ConstantUtil.SERVER_HOST%>/share/css/admin.css" />
-->
<link rel="stylesheet" type="text/css" href="<%=ConstantUtil.SERVER_HOST%>/share/css/kais_kaml.css" />
<script type="text/javascript"  src="<%=ConstantUtil.SERVER_HOST%>/share/js/common.js"></script>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>
<!--<script language="javascript" type="text/javascript"  src="<%=ConstantUtil.SERVER_HOST%>/js/jquery-1.5.2.min.js"></script>-->
<!--<script language="javascript" type="text/javascript"  src="<%=ConstantUtil.SERVER_HOST%>/js/jquery.blockUI.js"></script>-->
<script language="javascript" type="text/javascript"  src="<%=ConstantUtil.SERVER_HOST%>/js/common.js"></script>

<%@include file="../common/inc_dhxgrid_00.jsp" %>

</head>
<%!
  String beforeCount = "";
  int todayCount = 0;
%>
<body>
<%                
            
    String today_file = application.getRealPath("count.txt");
		String history_file = application.getRealPath("history.txt");

		File file1 = new File(today_file);
		File file2 = new File(history_file);
		//
		// get today
		//
		SimpleDateFormat frm = new SimpleDateFormat("yyyyMMdd");
		Calendar cal = Calendar.getInstance();

		String today = frm.format(cal.getTime());

		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		String strFileDate = sdf.format(file1.lastModified());
		SimpleDateFormat form = new SimpleDateFormat("yyyyMMdd");
    // get yesterday
    cal.add(cal.DATE, -1);
    String yesterday = sdf.format(cal.getTime());
    
		try {        		
			/**
			 * 오늘의 현재 방문자수 구하기
			 */        			 
			BufferedReader br = new BufferedReader(new FileReader(today_file));
			String temp = br.readLine();
			
			if (null == temp)
				temp = "0";
			else
				temp.trim();
			
			todayCount = Integer.parseInt(temp);
			br.close();
			br = null;
			//
			Date beginDate = (Date) form.parse(today);
			Date fileDate = (Date) form.parse(strFileDate);        
      
			long diff = beginDate.getTime() - fileDate.getTime();
			/**
			 * 어제 방문자수 구하기
			 */
      FileInputStream in = new FileInputStream(history_file);
      br = new BufferedReader(new InputStreamReader(in));
      String strLine = null, tmp; 
      while ((tmp = br.readLine()) != null)
      {
         strLine = tmp;
      } 
      String lastLine = strLine; 
      in.close();
      
      if (null != lastLine) {
        String arr[] = lastLine.split(":");
        if (arr[0].equals(yesterday))                    
          beforeCount = arr[1];
        else                    
          beforeCount = "0";                
      } else {
        beforeCount = "0";
      }
		} catch (Exception e) {
		  out.print(e);
		}
%>
<div id="wrap">

 	<%@ include file="../include/top_navi.jsp" %>

	<div id="container2">
		<div class="contents_wrap">
		<!-- 컨텐츠 시작-->
				<table width="100%" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td class="conTitleBg">
							<!-- 제목&페이지 위치-->
							<table width="100%" border="0" cellspacing="0" cellpadding="0">
								<tr>
									<td class="conTitle">양도/양수 리스트</td>
								<!--
									<td valign="bottom" class="btnLine">
										<table border="0" align=" center" cellpadding="0" cellspacing="0">
											<tr>
												<td class="btn_box">
													<table border="0" id="BTN_TEXT_SEARCH"  cellpadding="0" cellspacing="0" style="cursor:pointer;">
														<tr>
															<td >
																<strong>업종검색</strong> <font color=white>__</font>
																<input type="text" id="searchValue" name="searchValue" value="" class="search_input" onkeypress="if(event.keyCode == 13) doTextSearch();"/>
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
											<%
												//관리자와 유료회원이 아니면 맨 끝2개 필드는 보여주지 않음
												//관리자구분(1:관리자(슈퍼), 2:관리자(일반), 3:정액회원, 4:일반회원)'
												if (userType < 3 ) {
											%>
												<!-- 엑셀 다운로드 버튼 시작
												<td class="btn_box">
													<table border="0" id="BTN_DOWNLOAD" cellpadding="0" cellspacing="0" style="cursor:pointer;">
														<tr>
															<td class="btn-left"><img src="<%=ConstantUtil.SERVER_HOST%>/images/button/kaml_btn_dat_excel2.gif"></td>
															<td class="btn-right"><a href="#" onclick="this.blur()">엑셀다운로드</button></td>
														</tr>
													</table>
												</td>
												-->
												<!-- 엑셀 업로드 버튼 시작 -->
												<td class="btn_box">
													<table border="0" id="BTN_UPLOAD" cellpadding="0" cellspacing="0" style="cursor:pointer;">
														<tr>
															<td class="btn-left"><img src="<%=ConstantUtil.SERVER_HOST%>/images/button/kaml_btn_dat_search.gif"></td>
															<td class="btn-right"><a href="#" onclick="this.blur()">데이터 입력</button></td>
														</tr>
													</table>
												</td>
											<%
												}
											%>
												<!-- 조회 버튼 시작 -->
												<td class="btn_box">
													<table border="0" id="BTN_SEARCH" cellpadding="0" cellspacing="0" style="cursor:pointer;">
														<tr>
															<td class="btn-left"><img src="<%=ConstantUtil.SERVER_HOST%>/images/button/kaml_btn_dat_search.gif"></td>
															<td class="btn-right"><a href="#" onfocus="this.blur()">조회</a></td>
														</tr>
													</table>
												</td>
												<!-- 조회 버튼 끝 -->
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
																<strong>업종명</strong> <!--<font color=white>__</font> -->
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
													&nbsp;
													<!-- 그리드 시작 -->
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
													&nbsp;
													<!-- 그리드 시작 -->
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
					<tr>
						<!--	<td class="Dot1" align="center"><b><font color="blue" size="4">검색 결과를 더블 클릭 하면, 상세화면으로 이동합니다.</font></b></td> -->
							<td class="conTitle" align="center">검색 결과를 더블 클릭 하면, 상세화면으로 이동합니다.</td>
					<!--		<td class="Dot1" align="center">총 <span id="totalCount">0</span>건</td> -->
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
																<div id="gridT" style="width:910px; height:700px; background-color:white;">
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
					<td align="center">
    				<%
            // 선언부에서 선언한 변수와 메서드를 스크립트릿 에서 사용할 수 있다.
    				out.print("<strong>오늘 방문자 수 : " + todayCount + "</strong><br>");
    				out.print("<strong>어제 방문자 수 : " + beforeCount+ "</strong>");
            %>
          </td>
				</table>
			</div>
	<!--
			<div class="contents_bottom">
				<img src="<%=ConstantUtil.SERVER_HOST%>/images/admin/prime_logo.gif" width="910px" height="95" border="0" usemap="#Map">
				<map name="Map">
				  <area shape="rect" coords="807,44,859,88" href="/common/login.jsp">
				</map>
			</div>
	-->
	</div>
</div>
<form name="myform" id="myform" method="post">
</form>

<form name="myformExcel" id="myformExcel" method="post" action="">
	<input type="hidden" id="fileType" name="fileType" value="board" />
	<input type="hidden" id="rfileName" name="rfileName" />
	<input type="hidden" id="cfileName" name="cfileName" />
</form>
<!-- Start of DHTMLX Component Initializations -->
<script type="text/javascript">

var grid_font_size = "font-size:12px";
var inintArrLS; //처음 로딩된
var arrLS;	// 대분류 기 선택 값
var arrMS;	// 중분류 기 선택 값
var arrSS;	// 소분류 기 선택 값
var onChromeBrowser = false ;
var onOverIE9Browser = false ;
var searchValueTemp ; // 업종검색값 임시 저장소

	/*
	// {#master_checkbox} - local modify start - dhtmlxgrid_filter.js - dhtmlXGridObject.prototype._in_header_master_checkbox modify
	dhtmlXGridObject.prototype._in_header_master_checkbox=function(t,i,c) {
		t.innerHTML=c[0]+"<input type='checkbox' />"+c[1];
		var self=this;
		t.getElementsByTagName("input")[0].onclick=function(e) {
			//any custom logic here
			self._build_m_order();
			var j=self._m_order?self._m_order[i]:i;
			var val=this.checked?1:0;

			for (var ind=0; ind<self.getRowsNum();ind++) {
				var c=self.cells(self.getRowId(ind),j);
				if (c.isCheckbox()) c.setValue(val);
			}

			(e||event).cancelBubble=true;
			if (self.entBox.id=="gridL") doGridMSearch();

		}
	}
	// {#master_checkbox} - local modify end
	*/

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
	//idArrT[idxT++] = "좌수";
	idArrT[idxT++] = "잔액";
	idArrT[idxT++] = "FIRST_YEAR";
	idArrT[idxT++] = "SECOND_YEAR";
	idArrT[idxT++] = "2009";
	idArrT[idxT++] = "2010";
	idArrT[idxT++] = "2011";
	idArrT[idxT++] = "3년합계";
	idArrT[idxT++] = "5년합계";
	idArrT[idxT++] = "2012";
	idArrT[idxT++] = "2013";
	idArrT[idxT++] = "양도가";
	//idArrT[idxT++] = "협회";
	idArrT[idxT++] = "기타";
	//idArrT[idxT++] = "업체";
	//idArrT[idxT++] = "연락처";

/*
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
*/	
	
	conArrT["S" 		]	= Array("S"	, "0",  "center",  "str", "ro");
	conArrT["날짜"   	]	= Array("<%=excelTitle.getF1()%>"	, "60",  "center",  "str", "ro");
	conArrT["업종"   	]	= Array("<%=excelTitle.getF2()%>"	, "80", "center",  "str", "ro");
	conArrT["지역"   	]	= Array("<%=excelTitle.getF3()%>"	, "60", "center",  "str", "ro");
	//conArrT["법인/면허"]	= Array("<%=excelTitle.getF4().replaceAll("<br>","")%>"	, "80", "center",  "str", "ro");
	//onArrT["자본금"  	]	= Array("<%=excelTitle.getF5()%>"	, "60", "center",  "str", "ro");
	conArrT["시평"   	]	= Array("<%=excelTitle.getF6()%>"	, "50", "center",  "str", "ro");
	//conArrT["좌수"  	]	= Array("<%=excelTitle.getF7()%>"	, "60", "center",  "str", "ro");
	conArrT["잔액"   	]	= Array("<%=excelTitle.getF8()%>"	, "60", "center",  "str", "ro");
	conArrT["FIRST_YEAR" ]	= Array("<%=excelTitle.getFstYr()%>"	, "40", "center",  "str", "ro");
	conArrT["SECOND_YEAR"]	= Array("<%=excelTitle.getScndYr()%>"	, "40", "center",  "str", "ro");
	conArrT["2009" 		]	= Array("<%=excelTitle.getF9()%>"	, "40", "center",  "str", "ro");
	conArrT["2010" 		]	= Array("<%=excelTitle.getF10()%>"	, "40", "center",  "str", "ro");
	conArrT["2011" 		]	= Array("<%=excelTitle.getF11()%>"	, "40", "center",  "str", "ro");
	conArrT["3년합계" 	]	= Array("<%=excelTitle.getF12()%>"	, "55", "center",  "str", "ro");
	conArrT["5년합계" 	]	= Array("<%=excelTitle.getSumOf5yr()%>"	,"55", "center",  "str", "ro");
	conArrT["2012" 		]	= Array("<%=excelTitle.getF13()%>"	, "40", "center",  "str", "ro");
	conArrT["2013" 		]	= Array("<%=excelTitle.getF14()%>"	, "40", "center",  "str", "ro");
	conArrT["양도가"  	]	= Array("<%=excelTitle.getF15()%>"	, "60", "center",  "str", "ro");
	//conArrT["협회"   	]	= Array("<%=excelTitle.getF16()%>"	, "60", "center",  "str", "ro");
	conArrT["기타"   	]	= Array("<%=excelTitle.getF17()%>"	, "150", "left",  "str", "ro");
	//conArrT["업체"   	]	= Array("<%=excelTitle.getF18()%>"	, "150", "center",  "str", "ro");
	//conArrT["연락처" 	]	= Array("<%=excelTitle.getF19()%>"	, "150", "center",  "str", "ro");
	
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
		//gridT.setCellTextStyle(rId,5,"font-family: 돋움;font-weight: bold;"+grid_font_size);
		gridT.setCellTextStyle(rId,5,"font-family: 돋움;font-weight: bold;"+grid_font_size);
		gridT.setCellTextStyle(rId,11,"font-family: 돋움;font-weight: bold;"+grid_font_size);
		gridT.setCellTextStyle(rId,14,"font-family: 돋움;font-weight: bold;"+grid_font_size);
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

		// 엑셀 다운로드
		/*
		$('#BTN_DOWNLOAD').click(function() {
			downloadExcel();
		});
    */
    });

	function downloadExcel(){
		$("#rfileName").attr("value", "prmna_excel.xls");
		$("#cfileName").attr("value", "prmna_excel.xls");

		$("#myformExcel").attr("action", "/servlet/board.dn");
		$("#myformExcel").attr("encoding", "application/x-www-form-urlencoded");
		$("#myformExcel").submit();
	}


	function onRowDblClicked(rowId,cellId){

		var excelID = gridT.cells(rowId, gridT.getColIndexById("S")).getValue();
		$("#excelID").attr("value", excelID);

		var param = "?excelID="   + excelID;
		var openUrl = "/board/admin_search_detail.jsp" + param;
		//l_viewPopup(openUrl, '813','630' );
		//l_viewPopup(openUrl, '1080','360' );
		l_viewPopup2(openUrl,'excelInfo', '1120','360' );
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
		// IE9 이상인경우 
		if(
		   navigator.userAgent.indexOf("Mozilla/5.0") > -1
		) {
			onOverIE9Browser = true ;
		}
	}

	function doInitSearch() {

		var params = "";
		params += "?fieldName=f2&COMMAND=COMBO" ;

		//업종검색 단어가 있으면 해당 텍스트로 조회 함
		var searchValue = encodeURIComponent($("#searchValue").val());
		//var searchValue = $("#searchValue").val();
		params += "&searchValue=" + searchValue;

	    var callUrl = "/board/combo_list_show.jsp" + params;

	    gridL.clearAndLoad(callUrl,function(){

			var rowCnt = gridL.getRowsNum();

        	if ( rowCnt == 0 ) {
				
				gridT.enableAutoHeight(false);
        		alert('조회결과가 없습니다. ');
        	} else {
				gridT.enableAutoHeight(true);
			}

            //$("#totalCount").text(rowCnt);
            //$.unblockUI(); //처리후 unblock

            // CHROME에서는체크박스가 모두 체크 되어 나옴
			if (onChromeBrowser || onOverIE9Browser)
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

		var params = "";
		params += "fieldName=f2&COMMAND=COMBO&returnGubn=G";

		if (onChromeBrowser)
			params += "&isChromeBrowser=Y";

		if ( f13List.length > 0 ) {
			params += "&f13List=" + encodeURIComponent(f13List.join(",").replace(/\n/gi, '')); // 3년합계
		}

		if ( f15List.length > 0 ) {
			params += "&f15List=" + encodeURIComponent(f15List.join(",").replace(/\n/gi, '')); // 양도가코드
		}

		/* 업종코드 상세 검색이 있으면 포함 시킴*/
		if (searchValueTemp != null && searchValueTemp.length > 0) {
			params += "&searchValue=" + searchValueTemp; // 검색된 값
		}

		var callUrl = "/board/combo_list_show.jsp?" + params;
		  		
      gridL.clearAndLoad(callUrl,function(){
      
  			var rowCnt = gridL.getRowsNum();
  
  			if (onChromeBrowser)
  				initCheckBoxOnChrome(gridL,rowCnt);
                
      	if ( rowCnt == 0 ) {
      		//alert('조회결과가 없습니다. ');
      	}
  			else {
  				// 조회된 데이타가 존재할 경우
  				
  				if ( nullChk(arrLS) ) {
  					for (var i=0, arrLSLen = arrLS.length; i < arrLSLen; i++) {
  						for (var j=1; j <= rowCnt; j++) {

  							if (gridL.cells(j, gridL.getColIndexById("업종명")).getValue() == arrLS[i]) {
  								//
  
  								gridL.cells(j, gridL.getColIndexById("선택")).setValue("1");
  								break;
  							}
  						}
  					}
    			}
  		}
    });
	}
	// 중분류gridM 조회
	function doGridMSearch(f2List,f13List,f15List) {

		var params = "";
		params += "fieldName=f13&COMMAND=COMBO&returnGubn=G";

		if (onChromeBrowser)
			params += "&isChromeBrowser=Y";

		if ( f2List.length > 0 ) {
			params += "&f2List=" + encodeURIComponent(f2List.join(",").replace(/\n/gi, '')); // 업종코드
		}

		if ( f15List.length > 0 ) {
			params += "&f15List=" + encodeURIComponent(f15List.join(",").replace(/\n/gi, '')); // 양도가코드
		}

		var callUrl = "/board/combo_list_show.jsp?" + params;
		
    gridM.clearAndLoad(callUrl,function(){
		
		  var rowCnt = gridM.getRowsNum();

			if (onChromeBrowser)
				initCheckBoxOnChrome(gridM,rowCnt);

    	if ( rowCnt == 0 ) {
    		//alert('조회결과가 없습니다. ');
    	}
			else {
			
				// 조회된 데이타가 존재할 경우
				if ( nullChk(arrMS) ) {

					for (var i=0, arrMSLen = arrMS.length; i < arrMSLen; i++) {
						for (var j=1; j <= rowCnt; j++) {

							if (gridM.cells(j, gridM.getColIndexById("3년합계")).getValue() == arrMS[i]) {
								//
								gridM.cells(j, gridM.getColIndexById("선택")).setValue("1");
								break;
							}
						}
					}
				}
			}
    });
	}

	// 소분류gridS 조회
	function doGridSSearch(f2List,f13List,f15List) {

		var params = "";
		params += "fieldName=f15&COMMAND=COMBO&returnGubn=G";

		if (onChromeBrowser)
			params += "&isChromeBrowser=Y";

		if ( f2List.length > 0 ) {
			params += "&f2List=" + encodeURIComponent(f2List.join(",").replace(/\n/gi, '')); // 업종코드
		}

		if ( f13List.length > 0 ) {
			params += "&f13List=" + encodeURIComponent(f13List.join(",").replace(/\n/gi, '')); // 3년합계코드
		}

    var callUrl = "/board/combo_list_show.jsp?" + params;

    gridS.clearAndLoad(callUrl,function(){
		
			var rowCnt = gridS.getRowsNum();

			if (onChromeBrowser) {
				initCheckBoxOnChrome(gridS,rowCnt);
      }
    	if ( rowCnt == 0 ) {
    		//alert('조회결과가 없습니다. ');
    	}
			else {
				// 조회된 데이타가 존재할 경우
				if ( nullChk(arrSS) ) {
					//alert("2");
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
			params += "&f2List=" + encodeURIComponent(f2List.join(",").replace(/\n/gi, '')); // 업종명
		}
		if ( f13List.length > 0 ) {
			params += "&f13List=" + encodeURIComponent(f13List.join(",").replace(/\n/gi, '')); // 3년합계
		}
		if ( f15List.length > 0 ) {
			params += "&f15List=" + encodeURIComponent(f15List.join(",").replace(/\n/gi, '')); // 양도가
		}
		
		params += "&userID=<%=curAdminInfo.getUserid()%>";


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

			var rowCnt = gridT.getRowsNum();

        	if ( rowCnt == 0 ) {
        		alert('조회결과가 없습니다. ');
        	}
            //$("#totalCount").text(rowCnt);
            //$.unblockUI(); //처리후 unblock
        });
	}

	// 상단 업종조회버튼 클릭 시 처리 함수
	function doTextSearch() {
/*
		var params = "";
		params += "COMMAND=COMBO&fieldName=f2";

		if (onChromeBrowser)
			params += "&isChromeBrowser=Y";


		var searchValue = $("#searchValue").val();

		if ( searchValue.length < 1 ) {
			alert("검색할 업종명을 입력해 주세요.");
			$("#searchValue").focus();
			return ;
		}


		params += "&searchValue=" + searchValue ;
	    var callUrl = "/board/combo_list_show.jsp?" + params;

	    //$.blockUI();
        gridL.clearAndLoad(callUrl,function(){
			//alert("조회 후 그리드 생성");
			var rowCnt = gridL.getRowsNum();

        	if ( rowCnt == 0 ) {
        		alert('조회결과가 없습니다. ');
        	}
			//alert("조회 후 그리드 완성");
            //$("#totalCount").text(rowCnt);
            //$.unblockUI(); //처리후 unblock
        });
*/
		// 텍스트 조회값을 임시 저장 함
		searchValueTemp = encodeURIComponent($("#searchValue").val());
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

	function uploadExcel()
	{
		// 엑셀 파일을 등록 함
		var url = "./popup_upload_excel.jsp";
		var form = document.myform;
		POPUP.openPost(myform, url, 'popupUploadExecl', {width: 400, height: 150, scroll: false, resize: false});
		//form.action = "./sc_university_list.jsp";
		form.target = "_self";
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