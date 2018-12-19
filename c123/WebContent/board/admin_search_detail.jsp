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
<link rel="stylesheet" type="text/css" href="<%=ConstantUtil.SERVER_HOST%>/share/css/kais_kaml.css" />
<script type="text/javascript"  src="<%=ConstantUtil.SERVER_HOST%>/share/js/common.js"></script>
<script language="javascript" type="text/javascript"  src="<%=ConstantUtil.SERVER_HOST%>/js/jquery-1.5.2.min.js"></script>
<script language="javascript" type="text/javascript"  src="<%=ConstantUtil.SERVER_HOST%>/js/jquery.blockUI.js"></script>
<script language="javascript" type="text/javascript"  src="<%=ConstantUtil.SERVER_HOST%>/js/common.js"></script>

<%@include file="../common/inc_dhxgrid_00.jsp" %>

</head>

<body>
<div id="wrap">
	<div id="container3">
		<div class="contents_wrap">
		<!-- 컨텐츠 시작-->
				<table width="100%" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td class="conTitleBg">
							<!-- 제목&페이지 위치-->
							<table width="100%" border="0" cellspacing="0" cellpadding="0">
								<tr>
									<td class="conTitle"><a href="javascript:print2();">양도</a>/<a href="javascript:print3();">양수</a> 리스트</td>
									<td valign="bottom" class="btnLine">
										<!-- 버튼 시작 -->
										<table border="0" align="right" cellpadding="0" cellspacing="0">
											<tr>
												<!-- 등록 버튼 시작 -->
												<td class="btn_box">
													<table border="0" id="BTN_PRINT" cellpadding="0" cellspacing="0" style="cursor:pointer;">
														<tr>
															<td class="btn-left">
																<a href="javascript:print();" class="admin_text_btn02">상세화면</a>
															</td>
														</tr>
													</table>
												</td>
												<!-- 등록 버튼 끝 -->
												<!-- 등록 버튼 시작 -->
												<td class="btn_box">
													<table border="0" id="BTN_CLOSE" cellpadding="0" cellspacing="0" style="cursor:pointer;">
														<tr>
															<td class="btn-left">
														<!--	<img src="<%=ConstantUtil.SERVER_HOST%>/images/button/kaml_btn_popClose.gif"> -->
																<a href="javascript:l_close();" class="admin_text_btn03">닫기</a>
															</td>
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
							<!-- 결과테이블 시작-->
							<table width="100%" border="0" cellspacing="0" cellpadding="9">
								<tr>
									<td class="search">
										<table width="1000" border="0" align="center" cellpadding="0" cellspacing="0">
											<tr>
												<td class="search_con">
													<!-- 그리드 시작 -->
													<table width="100%" border="0" align="left" cellpadding="0" cellspacing="0">
														<tr>
															<td class="taList">
																<!-- <div id="gridT" height="300"> -->
																<div id="gridT" style="width:1060px; height:110px; background-color:white;">
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
			<div class="contents_bottom">
		<!-- 컨텐츠 시작-->
				<table width="100%" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td class="conTitleBg">
							<!-- 제목&페이지 위치-->
							<table width="100%" border="0" cellspacing="0" cellpadding="0">
								<tr>
				                    <td width="60" class="taTitleCen">기타</td>
				                 	<!--<td class="taCon1" ><textarea name="A" id="A" cols="45" rows="4" readonly></textarea></td>--><!-- VARCHAR(1000) -->
				                 	<td class="taCon1" width="120"><div id="A"></td>
<%
								//관리자와 유료회원이 아니면 맨 끝2개 필드는 보여주지 않음
								//관리자구분(1:관리자(슈퍼), 2:관리자(일반), 3:정액회원, 4:일반회원)'
								if (StringUtil.stoi(userType) <= 3 ) {
%>
				                    <td width="60" class="taTitleCen">업체</td>
				                    <!--<td class="taCon1" ><textarea name="B" id="B" cols="45" rows="4" readonly></textarea></td>--><!-- VARCHAR(1000) -->
				                    <td class="taCon1" width="120"><div id="B"></td>
				                    <td width="60" class="taTitleCen">연락처</td>
				                    <!--<td class="taCon1" ><textarea name="C" id="C" cols="45" rows="4" readonly></textarea></td>--><!-- VARCHAR(1000) -->
				                    <td class="taCon1" width="120"><div id="C"></td>
<%
								}
%>
								</tr>
							</table>
						</td>
					</tr>
				</table>

			</div>
	</div>
	<hr />
</div>
<form name="myform" id="myform" method="post">
</form>
<!-- Start of DHTMLX Component Initializations -->
<script type="text/javascript">

	var grid_font_size = "font-size:12px";
	// 결과 그리드 시작
	var gridT = new dhtmlXGridObject("gridT");
	gridT.setImagePath("<%=ConstantUtil.SERVER_HOST%>/dhx_new/imgs/");

	var idArrT = new Array();
	var idxT   = 0;
	var conArrT = new Array(); // head, width, align, sorting, type

	idArrT[idxT++] = "날짜";
	idArrT[idxT++] = "업종";
	idArrT[idxT++] = "지역";
	idArrT[idxT++] = "법인/면허";
	idArrT[idxT++] = "자본금";
	idArrT[idxT++] = "시평";
	idArrT[idxT++] = "좌수";
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
	idArrT[idxT++] = "협회";
	idArrT[idxT++] = "A"; //기타
<%
	//관리자와 유료회원이 아니면 맨 끝2개 필드는 보여주지 않음
	//관리자구분(1:관리자(슈퍼), 2:관리자(일반), 3:정액회원, 4:일반회원)'
	if (StringUtil.stoi(userType) <= 3 ) {
%>
	idArrT[idxT++] = "B"; //업체
	idArrT[idxT++] = "C"; //연락처
<%
	}
%>
/*
	conArrT["날짜"   	]	= Array("날짜"		, "60",  "center",  "str", "ro");
	conArrT["업종"   	]	= Array("업종"		, "80", "center",  "str", "ro");
	conArrT["지역"   	]	= Array("지역"		, "60", "center",  "str", "ro");
	conArrT["법인/면허"	]	= Array("법인/면허"	, "80", "center",  "str", "ro");
	conArrT["자본금"  	]	= Array("자본금"	, "60", "center",  "str", "ro");
	conArrT["시평"   	]	= Array("시평"		, "60", "center",  "str", "ro");
	conArrT["좌수"  	]	= Array("좌수"		, "60", "center",  "str", "ro");
	conArrT["잔액"   	]	= Array("잔액"		, "60", "center",  "str", "ro");
	conArrT["2009" 		]	= Array("2010"		, "60", "center",  "str", "ro");
	conArrT["2010" 		]	= Array("2011"		, "60", "center",  "str", "ro");
	conArrT["2011" 		]	= Array("2012"		, "60", "center",  "str", "ro");
	conArrT["3년합계" 	]	= Array("3년합계"	, "60", "center",  "str", "ro");
	conArrT["2012" 		]	= Array("2013"		, "60", "center",  "str", "ro");
	conArrT["2013" 		]	= Array("2014"		, "60", "center",  "str", "ro");
	conArrT["양도가"  	]	= Array("양도가"	, "60", "center",  "str", "ro");
	conArrT["협회"   	]	= Array("협회"		, "60", "center",  "str", "ro");
	conArrT["A"   		]	= Array("A"			, "1", "left",  "str", "ro");
*/	
	
	conArrT["날짜"   	]	= Array("<%=excelTitle.getF1()%>"	, "60",  "center",  "str", "ro");
	conArrT["업종"   	]	= Array("<%=excelTitle.getF2()%>"	, "80", "center",  "str", "ro");
	conArrT["지역"   	]	= Array("<%=excelTitle.getF3()%>"	, "60", "center",  "str", "ro");
	conArrT["법인/면허"]	= Array("<%=excelTitle.getF4().replaceAll("<br>","")%>"	, "80", "center",  "str", "ro");
	conArrT["자본금"  	]	= Array("<%=excelTitle.getF5()%>"	, "60", "center",  "str", "ro");
	conArrT["시평"   	]	= Array("<%=excelTitle.getF6()%>"	, "60", "center",  "str", "ro");
	conArrT["좌수"  	]	= Array("<%=excelTitle.getF7()%>"	, "45", "center",  "str", "ro");
	conArrT["잔액"   	]	= Array("<%=excelTitle.getF8()%>"	, "45", "center",  "str", "ro");
	conArrT["FIRST_YEAR" ]	= Array("<%=excelTitle.getFstYr()%>" , "45", "center",  "str", "ro");
	conArrT["SECOND_YEAR"]	= Array("<%=excelTitle.getScndYr()%>", "45", "center",  "str", "ro");
	conArrT["2009" 		]	= Array("<%=excelTitle.getF9()%>"	, "45", "center",  "str", "ro");
	conArrT["2010" 		]	= Array("<%=excelTitle.getF10()%>"	, "45", "center",  "str", "ro");
	conArrT["2011" 		]	= Array("<%=excelTitle.getF11()%>"	, "45", "center",  "str", "ro");
	conArrT["3년합계" 	]	= Array("<%=excelTitle.getF12()%>"	, "60", "center",  "str", "ro");
	conArrT["5년합계" 	]	= Array("<%=excelTitle.getSumOf5yr()%>"	, "60", "center",  "str", "ro");
	conArrT["2012" 		]	= Array("<%=excelTitle.getF13()%>"	, "45", "center",  "str", "ro");
	conArrT["2013" 		]	= Array("<%=excelTitle.getF14()%>"	, "45", "center",  "str", "ro");
	conArrT["양도가"  	]	= Array("<%=excelTitle.getF15()%>"	, "60", "center",  "str", "ro");
	conArrT["협회"   	]	= Array("<%=excelTitle.getF16()%>"	, "60", "center",  "str", "ro");
	conArrT["A"   		]	= Array("A"							, "1", "left",  "str", "ro");

<%
	//관리자와 유료회원이 아니면 맨 끝2개 필드는 보여주지 않음
	//관리자구분(1:관리자(슈퍼), 2:관리자(일반), 3:정액회원, 4:일반회원)'
	if (StringUtil.stoi(userType) <= 3 ) {
%>
	conArrT["B"   		]	= Array("B"			, "1", "center",  "str", "ro");
	conArrT["C"  		]	= Array("C"			, "1", "center",  "str", "ro");
<%
	}
%>

	l_initGrid(gridT,idArrT,conArrT);

	gridT.setSkin("light");
	gridT.setDelimiter("/");

	gridT.init();
	//gridT.setColumnHidden(gridT.getColIndexById("업체"),true);
	//gridT.setColumnHidden(gridT.getColIndexById("연락처"),true);
	//gridT.enableDistributedParsing(true,12,100);

	//
	// add by nobel
	// set bold text on specific columns
	//
	gridT.attachEvent("onRowCreated", function(rId,rObj,rXml){
	  // 데이터 폰트 크기 설정
	  var colNum = gridT.getColumnsNum();
	  for (var i=0 ; i <= colNum; i++) {
	    gridT.setCellTextStyle(rId,i,grid_font_size)
	  }
		//gridT.setCellTextStyle(rId,5,"font-family: 돋움;font-weight: bold;"+grid_font_size);
		//gridT.setCellTextStyle(rId,6,"font-family: 돋움;font-weight: bold;"+grid_font_size);
		//gridT.setCellTextStyle(rId,7,"font-family: 돋움;font-weight: bold;"+grid_font_size);
		//gridT.setCellTextStyle(rId,12,"font-family: 돋움;font-weight: bold;"+grid_font_size);
		//gridT.setCellTextStyle(rId,14,"font-family: 돋움;font-weight: bold;"+grid_font_size);
		gridT.setCellTextStyle(rId,5,"font-family: 돋움;font-weight: bold;"+grid_font_size);
		gridT.setCellTextStyle(rId,6,"font-family: 돋움;font-weight: bold;"+grid_font_size);
		gridT.setCellTextStyle(rId,7,"font-family: 돋움;font-weight: bold;"+grid_font_size);
		gridT.setCellTextStyle(rId,15,"font-family: 돋움;font-weight: bold;"+grid_font_size);
		gridT.setCellTextStyle(rId,17,"font-family: 돋움;font-weight: bold;"+grid_font_size);
		
	});


	// 결과 그리드 끝

    //로드후 실행
    $(document).ready( function(){

		doInitSearch();

		// 엑셀 업로드
		$('#BTN_CLOSE').click(function() {
			l_close();
		});

		// 엑셀 업로드
		/*
		$('#BTN_PRINT').click(function() {
			print();
		});
    */
    });

	function print() {
	<%
		//String popupHeight = "650";
		String popupHeight = "850";
	%>

		var param = "?excelID=<%=excelID%>";
		//var openUrl = "/board/admin_search_detail_print1.jsp" + param;
		//var openUrl = "/print/printContent2.jsp" + param;
		var openUrl = "/print/printContent_admin.jsp" + param;
		//var openUrl = "/print/printContent5.jsp" + param;
		//l_viewPopup2(openUrl,'print', '760','<%=popupHeight%>' );
		//l_viewPopup2(openUrl,'print', '835','<%=popupHeight%>' );
		l_viewPopup2(openUrl,'print', '850','<%=popupHeight%>' );
	}

	function print2() {

		var param = "?excelID=<%=excelID%>";
		//var openUrl = "/board/admin_search_detail_print1.jsp" + param;
		//var openUrl = "/print/printContent3.jsp" + param;
		var openUrl = "/print/printContent_admin1.jsp" + param;
		//var openUrl = "/print/printContent_admin.jsp" + param;
		//l_viewPopup2(openUrl,'print', '760','<%=popupHeight%>' );
		l_viewPopup2(openUrl,'print', '835','<%=popupHeight%>' );
	}

	function print3() {

		var param = "?excelID=<%=excelID%>";
		//var openUrl = "/board/admin_search_detail_print1.jsp" + param;
		var openUrl = "/print/printContent4.jsp" + param;
		//l_viewPopup2(openUrl,'print', '760','<%=popupHeight%>' );
		l_viewPopup2(openUrl,'print', '835','<%=popupHeight%>' );
	}


	function doInitSearch() {
		//
		var params = "";
		params += "?COMMAND=DETAIL&excelID=" + <%=excelID%>;
	    var callUrl = "/board/combo_list_show.jsp" + params;

	    gridT.clearAndLoad(callUrl,function(){
			var rowCnt = gridT.getRowsNum();

        	if ( rowCnt == 0 ) {
        		alert('조회결과가 없습니다. ');
        	} else {
        		var 기타 = gridT.cells(1, gridT.getColIndexById("A")).getValue();
				$("#A").html(기타);
				gridT.cells(1, gridT.getColIndexById("A")).setValue("&nbsp;<br>&bnsp;");

<%
	//관리자와 유료회원이 아니면 맨 끝2개 필드는 보여주지 않음
	//관리자구분(1:관리자(슈퍼), 2:관리자(일반), 3:정액회원, 4:일반회원)'
	if (StringUtil.stoi(userType) <= 3 ) {
%>
				var 업체 = gridT.cells(1, gridT.getColIndexById("B")).getValue();
				var 연락처 = gridT.cells(1, gridT.getColIndexById("C")).getValue();

				$("#B").html(업체);
				$("#C").html(연락처);

				gridT.cells(1, gridT.getColIndexById("B")).setValue("");
				gridT.cells(1, gridT.getColIndexById("C")).setValue("");
<%
	}
%>

        	}
        });

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