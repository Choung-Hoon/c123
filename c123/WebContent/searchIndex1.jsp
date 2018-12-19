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
<!--
<link rel="stylesheet" type="text/css" href="<%=ConstantUtil.SERVER_HOST%>/share/css/admin.css" />
-->
<link rel="stylesheet" type="text/css" href="<%=ConstantUtil.SERVER_HOST%>/share/css/kais_kaml.css" />
<script type="text/javascript"  src="<%=ConstantUtil.SERVER_HOST%>/share/js/common.js"></script>
<script language="javascript" type="text/javascript"  src="<%=ConstantUtil.SERVER_HOST%>/js/jquery-1.5.2.min.js"></script>
<script language="javascript" type="text/javascript"  src="<%=ConstantUtil.SERVER_HOST%>/js/jquery.blockUI.js"></script>
<script language="javascript" type="text/javascript"  src="<%=ConstantUtil.SERVER_HOST%>/js/common.js"></script>

<%@include file="../common/inc_dhxgrid_00.jsp" %>

</head>

<body>
<div id="wrap">
 	<div id="header">
		<p align="center">
			<img src="<%=ConstantUtil.SERVER_HOST%>/images/admin/prime_logo.gif" width="922" height="95" border="0" usemap="#Map">
		</p>
	</div>

	<div id="container2">
		<div id="left">
			<table width="215" cellpadding="0" cellspacing="0">
			    <tr>
			        <td width="205" background="<%=ConstantUtil.SERVER_HOST%>/images/admin/rsp.gif" valign="top">
			            <div align="right">
			                <table cellpadding="0" cellspacing="0">
			                    <tr>
			                        <td width="180">
			                           <img src="<%=ConstantUtil.SERVER_HOST%>/images/admin/tel.gif" border="0">
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
		<div class="contents_wrap">
		<!-- 컨텐츠 시작-->
				<table width="100%" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td class="conTitleBg">
							<!-- 제목&페이지 위치-->
							<table width="100%" border="0" cellspacing="0" cellpadding="0">
								<tr>
									<td class="conTitle">테스트</td>
									<td valign="bottom" class="btnLine">
										<!-- 버튼 시작 -->
										<table border="0" align="right" cellpadding="0" cellspacing="0">
											<tr>
												<!-- 엑셀 업로드 버튼 시작 -->
												<td class="btn_box">
													<table border="0" id="BTN_UPLOAD" cellpadding="0" cellspacing="0" style="cursor:pointer;">
														<tr>
															<td class="btn-left"><img src="<%=ConstantUtil.SERVER_HOST%>/images/button/kaml_btn_dat_search.gif"></td>
															<td class="btn-right"><a href="#" onclick="uploadExcel();return false;">엑셀업로드</button></td>
														</tr>
													</table>
												</td>
												<!-- 등록 버튼 시작 -->
												<td class="btn_box">
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
										<table width="760" border="0" align="center" cellpadding="0" cellspacing="0">
											<tr>
												<td width='60' class="search_li">선택1 </td>
												<td class="search_con" valign="top">
													<!-- 그리드 시작 -->
													<table width="200" border="0" align="left" cellpadding="0" cellspacing="0">
														<tr>
															<td class="taList">
																<!--<div id="gridL" width="200" height="200"> -->
																<div id="gridL" style="width:200px; height:150px; background-color:white;">
																</div>
															</td>
														</tr>
													</table>
													<!-- 그리드 끝 -->
												</td>

												<td width='60' class="search_li">선택2 </td>
												<td class="search_con" valign="top">
													</select-->
													<!-- 그리드 시작 -->
													<table width="200" border="0" align="left" cellpadding="0" cellspacing="0">
														<tr>
															<td class="taList">
																<!-- <div id="gridM" width="200" height="150"> -->
																<div id="gridM" style="width:200px; height:150px; background-color:white;">
																</div>
															</td>
														</tr>
													</table>
													<!-- 그리드 끝 -->
												</td>

												<td width='60' class="search_li">선택3 </td>
												<td class="search_con" valign="top">
													</select-->
													<!-- 그리드 시작 -->
													<table width="200" border="0" align="left" cellpadding="0" cellspacing="0">
														<tr>
															<td class="taList">
																<!-- <div id="gridS" width="200" height="150"> -->
																<div id="gridS" style="width:200px; height:150px; background-color:white;">
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
							<td class="Dot1" align="center">총 <span id="totalCount">0</span>건</td>
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
																<div id="gridT" style="width:760px; height:350px; background-color:white;">
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
	</div>
	<hr />
</div>
<form name="myform" id="myform" method="post">
</form>
<!-- Start of DHTMLX Component Initializations -->
<script type="text/javascript">

var arrMS;	// 중분류 기 선택 값
var arrSS;	// 소분류 기 선택 값
var onChromeBrowser = false ;

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
	conArrM["3년합계"]		= Array("3년합계", "160", "left",  "str", "ro");

	l_initGrid(gridM,idArrM,conArrM);


	gridM.setSkin("light");
	gridM.setDelimiter("/");

	gridM.init();

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
	conArrS["양도가"]		= Array("양도가", "160", "left",  "str", "ro");

	l_initGrid(gridS,idArrS,conArrS);


	gridS.setSkin("light");
	gridS.setDelimiter("/");

	gridS.init();

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

	idArrT[idxT++] = "날짜";
	idArrT[idxT++] = "업종";
	idArrT[idxT++] = "지역";
	idArrT[idxT++] = "법인/면허";
	idArrT[idxT++] = "자본금";
	idArrT[idxT++] = "시평";
	idArrT[idxT++] = "좌수";
	idArrT[idxT++] = "잔액";
	idArrT[idxT++] = "2008";
	idArrT[idxT++] = "2009";
	idArrT[idxT++] = "2010";
	idArrT[idxT++] = "2011";
	idArrT[idxT++] = "3년합계";
	idArrT[idxT++] = "2012";
	idArrT[idxT++] = "양도가";
	idArrT[idxT++] = "협회";
	idArrT[idxT++] = "기타";
	idArrT[idxT++] = "업체";
	idArrT[idxT++] = "연락처";

	conArrT["날짜"   	]	= Array("날짜"		, "60",  "center",  "str", "ro");
	conArrT["업종"   	]	= Array("업종"		, "80", "center",  "str", "ro");
	conArrT["지역"   	]	= Array("지역"		, "60", "center",  "str", "ro");
	conArrT["법인/면허"	]	= Array("법인/면허"	, "80", "center",  "str", "ro");
	conArrT["자본금"  	]	= Array("자본금"	, "60", "center",  "str", "ro");
	conArrT["시평"   	]	= Array("시평"		, "60", "center",  "str", "ro");
	conArrT["좌수"  	]	= Array("좌수"		, "60", "center",  "str", "ro");
	conArrT["잔액"   	]	= Array("잔액"		, "60", "center",  "str", "ro");
	conArrT["2008" 		]	= Array("2008"		, "60", "center",  "str", "ro");
	conArrT["2009" 		]	= Array("2009"		, "60", "center",  "str", "ro");
	conArrT["2010" 		]	= Array("2010"		, "60", "center",  "str", "ro");
	conArrT["2011" 		]	= Array("2011"		, "60", "center",  "str", "ro");
	conArrT["3년합계" 	]	= Array("3년합계"	, "60", "center",  "str", "ro");
	conArrT["2012" 		]	= Array("2012"		, "60", "center",  "str", "ro");
	conArrT["양도가"  	]	= Array("양도가"	, "60", "center",  "str", "ro");
	conArrT["협회"   	]	= Array("협회"		, "60", "center",  "str", "ro");
	conArrT["기타"   	]	= Array("기타"		, "150", "center",  "str", "ro");
	conArrT["업체"   	]	= Array("업체"		, "150", "center",  "str", "ro");
	conArrT["연락처"  	]	= Array("연락처"	, "150", "center",  "str", "ro");

	l_initGrid(gridT,idArrT,conArrT);

	gridT.setSkin("light");
	gridT.setDelimiter("/");

	gridT.init();

	//gridT.enableDistributedParsing(true,12,100);
	// 결과 그리드 끝

    //로드후 실행
    $(document).ready( function(){

		checkChromeBrowser();
		doInitSearch();

		// 조회
		$('#BTN_SEARCH').click(function() {
			doSearch();
		});

		// 엑셀 업로드
		$('#BTN_UPLOAD').click(function() {
			uploadExcel();
		});
    });

	function doInitSearch() {
		//
		var params = "";
		params += "?fieldName=f2&COMMAND=COMBO";
	    var callUrl = "combo_list_show.jsp" + params;

	    gridL.clearAndLoad(callUrl,function(){
			var rowCnt = gridL.getRowsNum();

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

	function initCheckBoxOnChrome(grid,rowCnt)
	{
		for (var i=1 ; i <= rowCnt; i++) {
			grid.cells(i, grid.getColIndexById("선택")).setValue("0");
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

	// 대분류gridL 체크시 이벤트 발생 시 수행 함수 --> gridL.attachEvent("onCheckbox", ... )
	function actionGridLCheckbox(rId,cInd,state) {

		//var strMsg = "";
		//strMsg = "rId : [" + rId + "]\n\n";
		//strMsg += "cInd : [" + cInd + "]\n\n";
		//strMsg += "state : [" + state + "]";
		//alert(strMsg);

		//doSelect2Search(); // selectbox Result
		doGridMSearch(); // grid Result
	}

	// 중분류gridM 조회
	function doGridMSearch() {
		//
		var f2List = getGridCheckedItem(gridL, "선택", "업종명", true);

		var params = "";
		params += "fieldName=f13&COMMAND=COMBO&returnGubn=G";

		if (onChromeBrowser)
			params += "&isChromeBrowser=Y";

		if ( f2List.length > 0 ) {
			params += "&f2List=" + f2List.join(","); // 업종
		}

		var callUrl = "combo_list_show.jsp?" + params;

	    //$.blockUI();
	    //dhtmlxAjax.post("combo_list_show.jsp", params, outputResponse);

		gridS.clearAll(); // 소분류 Row 삭제
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
            $.unblockUI(); //처리후 unblock
        });
	}

	// 중분류gridM 체크시 이벤트 발생 시 수행 함수 --> gridM.attachEvent("onCheckbox", ... )
	function actionGridMCheckbox(rId,cInd,state) {

		//var strMsg = "";
		//strMsg = "rId : [" + rId + "]\n\n";
		//strMsg += "cInd : [" + cInd + "]\n\n";
		//strMsg += "state : [" + state + "]";
		//alert(strMsg);

		arrMS = getGridCheckedItem(gridM, "선택", "3년합계", false); // 중분류 key값 저장
		doGridSSearch(); // grid Result
	}

	// 소분류gridS 조회
	function doGridSSearch() {
		//
		var f13List = getGridCheckedItem(gridM, "선택", "3년합계", true);

		var params = "";
		params += "fieldName=f15&COMMAND=COMBO&returnGubn=G";

		if (onChromeBrowser)
			params += "&isChromeBrowser=Y";

		if ( f13List.length > 0 ) {
			params += "&f13List=" + f13List.join(","); // 3년합계코드
		}

	    var callUrl = "combo_list_show.jsp?" + params;

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
					for (var i=0, arrSSSLen = arrSS.length; i < arrSSSLen; i++) {
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

	// 소분류gridS 체크시 이벤트 발생 시 수행 함수 --> gridS.attachEvent("onCheckbox", ... )
	function actionGridSCheckbox(rId,cInd,state) {

		//var strMsg = "";
		//strMsg = "rId : [" + rId + "]\n\n";
		//strMsg += "cInd : [" + cInd + "]\n\n";
		//strMsg += "state : [" + state + "]";
		//alert(strMsg);

		arrSS = getGridCheckedItem(gridS, "선택", "양도가", false); // 소분류 key값 저장
		//alert(arrSS);
	}

	// 상단 조회버튼 클릭 시 처리 함수
	function doSearch() {

		//
		var f2List = getGridCheckedItem(gridL, "선택", "업종명", true);
		var f13List = getGridCheckedItem(gridM, "선택", "3년합계", true);
		var f15List = getGridCheckedItem(gridS, "선택", "양도가", true);

		//alert("지점코드\n" + brnchNoInfo + "\n\n" + "행원코드\n" + clerkNoInfo + "발령년월일\n" + annuncmntDtInfo);

		var params = "";
		params += "COMMAND=SEARCH";

		if (onChromeBrowser)
			params += "&isChromeBrowser=Y";

		if ( f2List.length > 0 ) {
			params += "&f2List=" + f2List.join(","); // 지점코드
		}
		if ( f13List.length > 0 ) {
			params += "&f13List=" + f13List.join(","); // 행원코드
		}
		if ( f15List.length > 0 ) {
			params += "&f15List=" + f15List.join(","); // 발령년월일
		}

	    var callUrl = "combo_list_show.jsp?" + params;

	    $.blockUI();

        gridT.clearAndLoad(callUrl,function(){
			var rowCnt = gridT.getRowsNum();

        	if ( rowCnt == 0 ) {
        		alert('조회결과가 없습니다. ');
        	}

            $("#totalCount").text(rowCnt);
            $.unblockUI(); //처리후 unblock
        });
	}

	// 체크된 대분류의 값으로 중분류selectbox 내용 조회
	function doSelect2Search() {

		var brnchNoInfo = getGridCheckedItem(gridL, "선택", "지점코드", true);

		var params = "";
		params += "COMMAND=MSC";
		if ( brnchNoInfo.length > 0 ) {
			params += "&BRNCH_NO=" + brnchNoInfo.join(","); // 지점코드
		}

	    $.blockUI();

        dhtmlxAjax.post('combo_list_show.jsp', params, doSelect2SearchResponse);      //ajax 호출
	}

	// 중분류selectbox 조회 콜백함수
	function doSelect2SearchResponse(loader){
		$.unblockUI();

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