<%@ page import="lee.common.config.ConstantUtil" %>
<%@ page import="lee.common.config.PropertyManager" %>
<%@ page import="lee.common.config.ConfigManager" %>

<%@ page import="lee.common.util.StringUtil" %>
<%@ page import="lee.manager.MgrFactory" %>
<%@ page import="lee.manager.ExcelDataMgr" %>
<%@ page import="lee.bean.ExcelTitle" %>
<%@ page import="java.util.HashMap" %>

<%
	// 검색 조건 추가
	String searchValue = request.getParameter( "searchValue" );
	if( searchValue == null || searchValue.equals("null") ) searchValue = "";
	
	//그리드 타이틀 DB에서 읽어 오는 방식으로 변경 함
	MgrFactory mgr = MgrFactory.getMgrFactory();
	ExcelDataMgr excelDataMgr = mgr.getExcelDataMgr();
	HashMap params = new HashMap();
	ExcelTitle excelTitle = excelDataMgr.getExcelTitle(params);
%>

<link rel="stylesheet" type="text/css" href="<%=ConstantUtil.SERVER_HOST%>/dhx/dhtmlxGrid/codebase/skins/dhtmlxgrid_dhx_skyblue.css">
<script type="text/javascript"  src="<%=ConstantUtil.SERVER_HOST%>/share/js/common.js"></script>
<script language="javascript" type="text/javascript"  src="<%=ConstantUtil.SERVER_HOST%>/js/jquery.blockUI.js"></script>
<script language="javascript" type="text/javascript"  src="<%=ConstantUtil.SERVER_HOST%>/js/common.js"></script>
<%@include file="../common/inc_dhxgrid_00.jsp" %>

<table border="0" cellpadding="0" cellspacing="0">
		<tr>
			<td width="27" align="left" valign="top">&nbsp;</td>
			<td>
		<!-- 컨텐츠 시작-->
				<table width="100%" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td>
							<!-- 제목&페이지 위치-->
							<table width="100%" border="0" cellspacing="0" cellpadding="0">
								<td>
									  <table  border="0" cellspacing="0" cellpadding="0">
  										<tr>
  										  <td>
      									<b>※ 체크박스에서 업종명을 선택 후, 아래의 [검색하기]버튼을 클릭하시면, 검색결과를 확인 할 수 있습니다.</b>
      									</td>
      								</tr>
										</table>
										</td>
									<td valign="bottom" class="btnLine">
										<!-- 버튼 시작 -->
										<table border="0" align="right" cellpadding="0" cellspacing="0">
											<tr>
												<!-- 등록 버튼 시작 -->
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
						<td>
							<!-- 조회테이블 시작-->
							<table width="100%" border="0" cellspacing="0" cellpadding="9">
			                    <tr>
			                        <td class="search">
			                            <table width="760" border="0" align="center" cellpadding="0" cellspacing="0">
			                                <tr>
			                                    <td width="100" class="search_li" bgcolor="#EBF3F5">일반건설</td>
			                                    <td class="search_con"><input ID="CONDITON" NAME="CONDITON" type="checkbox" value="전체" ><font color=blue><b>전체</b></font></td>
			                                    <td class="search_con"><input ID="CONDITON_1" NAME="CONDITON_1" type="checkbox" value="토건" >토건</td>
			                                    <td class="search_con"><input ID="CONDITON_2" NAME="CONDITON_2" type="checkbox" value="토목" >토목</td>
			                                    <td class="search_con"><input ID="CONDITON_3" NAME="CONDITON_3" type="checkbox" value="건축" >건축</td>
			                                    <td class="search_con"><input ID="CONDITON_4" NAME="CONDITON_4" type="checkbox" value="조경" >조경</td>
			                                    <td class="search_con"><input ID="CONDITON_5" NAME="CONDITON_5" type="checkbox" value="산업설비" >산업설비</td>
			                                    <td>&nbsp;</td>
											</tr>
											<tr>
			                                    <td colspan="8" bgcolor="cccccc" height="1"></td>
											</tr>
											<tr>
			                                    <td width="100" class="search_li" rowspan="5" bgcolor="#EBF3F5">전문건설</td>
			                                    <td class="search_con"><input ID="CONDITON_6"	NAME="CONDITON_6"	type="checkbox" value="가스" >가스</td>
			                                    <td class="search_con"><input ID="CONDITON_7"	NAME="CONDITON_7"	type="checkbox" value="도장" >도장</td>
			                                    <td class="search_con"><input ID="CONDITON_8"	NAME="CONDITON_8"	type="checkbox" value="상하" >상하</td>
			                                    <td class="search_con"><input ID="CONDITON_9"	NAME="CONDITON_9"	type="checkbox" value="실내건축" >실내건축</td>
			                                    <td class="search_con"><input ID="CONDITON_10"	NAME="CONDITON_10"	type="checkbox" value="철강" >철강</td>
			                                    <td class="search_con"><input ID="CONDITON_11"	NAME="CONDITON_11"	type="checkbox" value="단종신규" >단종신규</td>
											</tr>
											<tr>
												<td class="search_con"><input ID="CONDITON_12"	NAME="CONDITON_12"	type="checkbox" value="강구조" >강구조</td>			                                    
			                                    <td class="search_con"><input ID="CONDITON_13" NAME="CONDITON_13" type="checkbox" value="미방" >미방</td>
			                                    <td class="search_con"><input ID="CONDITON_14" NAME="CONDITON_14" type="checkbox" value="석공" >석공</td>
			                                    <td class="search_con"><input ID="CONDITON_15" NAME="CONDITON_15" type="checkbox" value="조경시설" >조경시설</td>
			                                    <td class="search_con"><input ID="CONDITON_16" NAME="CONDITON_16" type="checkbox" value="철도" >철도</td>
			                                    <td class="search_con">&nbsp;</td>
											</tr>
											<tr>
			                                    <td class="search_con"><input ID="CONDITON_17" NAME="CONDITON_17" type="checkbox" value="금속" >금속</td>
			                                    <td class="search_con"><input ID="CONDITON_18" NAME="CONDITON_18" type="checkbox" value="보링" >보링</td>
			                                    <td class="search_con"><input ID="CONDITON_19" NAME="CONDITON_19" type="checkbox" value="수중" >수중</td>
			                                    <td class="search_con"><input ID="CONDITON_20" NAME="CONDITON_20" type="checkbox" value="조경식재" >조경식재</td>
			                                    <td class="search_con"><input ID="CONDITON_21" NAME="CONDITON_21" type="checkbox" value="철콘" >철콘</td>
			                                    <td class="search_con">&nbsp;</td>
											</tr>
											<tr>
			                                    <td class="search_con"><input ID="CONDITON_22" NAME="CONDITON_22" type="checkbox" value="기계" >기계</td>
			                                    <td class="search_con"><input ID="CONDITON_23" NAME="CONDITON_23" type="checkbox" value="비계" >비계</td>
			                                    <td class="search_con"><input ID="CONDITON_24" NAME="CONDITON_24" type="checkbox" value="승강기" >승강기</td>
			                                    <td class="search_con"><input ID="CONDITON_25" NAME="CONDITON_25" type="checkbox" value="준설" >준설</td>
			                                    <td class="search_con"><input ID="CONDITON_26" NAME="CONDITON_26" type="checkbox" value="토공" >토공</td>
			                                    <td class="search_con">&nbsp;</td>
			                                 </tr>
											 <tr>   
			                                    <td class="search_con"><input ID="CONDITON_27" NAME="CONDITON_27" type="checkbox" value="난방" >난방</td>
			                                    <td class="search_con"><input ID="CONDITON_28" NAME="CONDITON_28" type="checkbox" value="삭도" >삭도</td>
			                                    <td class="search_con"><input ID="CONDITON_29" NAME="CONDITON_29" type="checkbox" value="시설물" >시설물</td>
			                                    <td class="search_con"><input ID="CONDITON_30" NAME="CONDITON_30" type="checkbox" value="지붕판금" >지붕판금</td>
			                                    <td class="search_con"><input ID="CONDITON_31" NAME="CONDITON_31" type="checkbox" value="포장" >포장</td>
			                                    <td class="search_con">&nbsp;</td>
											</tr>
											<tr>
			                                    <td colspan="8" bgcolor="cccccc" height="1"></td>
											</tr>
											<tr>
			                                    <td width="100" class="search_li" rowspan="3" bgcolor="#EBF3F5" >건설관련</td>
			                                    <td class="search_con"><input ID="CONDITON_32" NAME="CONDITON_32" type="checkbox" value="전기" >전기</td>
			                                    <td class="search_con"><input ID="CONDITON_33" NAME="CONDITON_33" type="checkbox" value="통신" >통신</td>
			                                    <td class="search_con"><input ID="CONDITON_34" NAME="CONDITON_34" type="checkbox" value="소방" >소방</td>
			                                    <td class="search_con"><input ID="CONDITON_35" NAME="CONDITON_35" type="checkbox" value="지하수" >지하수</td>
			                                    <td class="search_con"><input ID="CONDITON_36" NAME="CONDITON_36" type="checkbox" value="주택건설" >주택건설</td>
			                                    <td class="search_con"><input ID="CONDITON_37" NAME="CONDITON_37" type="checkbox" value="대지조성" >대지조성</td>
			                                    <td class="search_con">&nbsp;</td>					              
											</tr>													              
											<tr>													              
			                                    <td class="search_con"><input ID="CONDITON_38" NAME="CONDITON_38" type="checkbox" value="5년법인" >5년법인</td>
			                                    <td class="search_con"><input ID="CONDITON_39" NAME="CONDITON_39" type="checkbox" value="일반법인" >일반법인</td>
			                                    <td class="search_con"><input ID="CONDITON_40" NAME="CONDITON_40" type="checkbox" value="공법인" >공법인</td>
			                                    <td class="search_con"><input ID="CONDITON_41" NAME="CONDITON_41" type="checkbox" value="부동산개발" >부동산개발</td>
			                                    <td class="search_con"><input ID="CONDITON_42" NAME="CONDITON_42" type="checkbox" value="전문1종목" >전문1종목</td>
			                                    <td class="search_con"><input ID="CONDITON_43" NAME="CONDITON_43" type="checkbox" value="숲가꾸기" >숲가꾸기</td>
			                                    <td class="search_con">&nbsp;</td>					              
											</tr>													              
											<tr>													              
			                                    <td class="search_con"><input ID="CONDITON_44" NAME="CONDITON_44" type="checkbox" value="산림토목" >산림토목</td>
			                                    <td class="search_con"><input ID="CONDITON_45" NAME="CONDITON_45" type="checkbox" value="산림사업" >산림사업</td>
			                                    <td class="search_con"><input ID="CONDITON_46" NAME="CONDITON_46" type="checkbox" value="도시림" >도시림</td>
			                                    <td class="search_con" colspan="4">&nbsp;</td>

											</tr>
											<tr>
			                                    <td colspan="8" bgcolor="cccccc" height="1"></td>
											</tr>
											<tr>
			                                    <td class="search_con" colspan="7" align="center">
			                                    	<input ID="INQUERY_R" NAME="INQUERY_R" type="radio" value="1" checked>선택한 업종만 검색
													<font color=white>_____</font>
													<input ID="INQUERY_R" NAME="INQUERY_R" type="radio" value="2">선택한 업종 포함한 검색	
			                                    </td>
											</tr>
											<tr>
			                                    <td colspan="8" bgcolor="cccccc" height="1"></td>
											</tr>
										
											<tr>
			                                    <td width="100" class="search_li"  bgcolor="#EBF3F5" >양도가</td>
			                                    <td  colspan=7>&nbsp;&nbsp;
			                                    	<input type="text" id="sAmount" name="sAmount" title="백만이상" class="inputbox6" style="text-align:right;" onblur="this.value=this.value.only_number();" value="" maxlength="11" />&nbsp;백만이상
													~
													<input type="text" id="eAmount" name="eAmount" title="백만이하" class="inputbox6" style="text-align:right;" onblur="this.value=this.value.only_number();" value="" maxlength="11" />&nbsp;백만이하
			                                    </td>
											</tr>
										
											<tr>
			                                    <td colspan="8" bgcolor="cccccc" height="1"></td>
											</tr>
											<tr>
												<td colspan="8" >
													<!-- 버튼 시작 -->
													<table border="0" align="center" cellpadding="0" cellspacing="0">
														<tr>
															<!-- 등록 버튼 시작 -->
															<td class="btn_box" >
																<table border="0" id="BTN_SEARCH" cellpadding="0" cellspacing="0" style="cursor:pointer;">
																	<tr>
																	<!--
																		<td class="btn-left"><img src="<%=ConstantUtil.SERVER_HOST%>/images/button/kaml_btn_dat_search.gif"></td>
																		<td class="btn-right"><a href="#" onfocus="this.blur()">검색하기</a></td>
																	-->	
																		<td><p class="left_input"> 
																			</p><button type="button" class="admin_text_btn06" >검색하기</button> &nbsp;
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
						<td>
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
																<!-- <div id="gridT" style="width:760px; height:350px; background-color:white;"> -->
																<!--<div id="gridT" style="width:910px; height:350px; background-color:white;"> -->
																<div id="gridT" style="width:890px; height:1000px; background-color:white;"> 
																</div>
															</td>
														</tr>
														<tr><td class="taCon1Cen" id="pagingArea" colspan="3"></td></tr><!--align="center" -->
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
			<!--

				<img src="<%=ConstantUtil.SERVER_HOST%>/images/admin/prime_logo.gif" width="760px" height="95" border="0" usemap="#Map">
				<map name="Map">
				  <area shape="rect" coords="807,44,859,88" href="/common/login.jsp">
				</map>
			-->			
</td>
</tr>
</table>


<!-- Start of DHTMLX Component Initializations -->
<script type="text/javascript">

	var grid_font_size = "font-size:13px";
	var inintArrLS; //처음 로딩된
	var arrLS;	// 대분류 기 선택 값
	var arrMS;	// 중분류 기 선택 값
	var arrSS;	// 소분류 기 선택 값
	var onChromeBrowser = false ;
	var searchValueTemp ; // 업종검색값 임시 저장소

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
	//idArrT[idxT++] = "FIRST_YEAR";
	//idArrT[idxT++] = "SECOND_YEAR";
	idArrT[idxT++] = "2009";
	idArrT[idxT++] = "2010";
	idArrT[idxT++] = "2011";
	idArrT[idxT++] = "3년합계";
	idArrT[idxT++] = "5년합계";
	idArrT[idxT++] = "2012";
	//idArrT[idxT++] = "2013"; // 2008 ==> 2013
	idArrT[idxT++] = "양도가";
	//idArrT[idxT++] = "협회";
	idArrT[idxT++] = "기타";
	//idArrT[idxT++] = "업체";
	//idArrT[idxT++] = "연락처";

/*
	conArrT["S" 		]	= Array("S"	, "0",  "center",  "str", "ro");
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
	conArrT["날짜"   	]	= Array("<%=excelTitle.getF1()%>" + "<br>" + "-----" + "<br>" + "정 렬"	, "60",  "center",  "str", "ro");
	conArrT["업종"   	]	= Array("<%=excelTitle.getF2()%>"	, "80", "center",  "str", "ro");
	conArrT["지역"   	]	= Array("<%=excelTitle.getF3()%>"	, "60", "center",  "str", "ro");
	//conArrT["법인/면허"]	= Array("<%=excelTitle.getF4().replaceAll("<br>","")%>"	, "80", "center",  "str", "ro");
	//onArrT["자본금"  	]	= Array("<%=excelTitle.getF5()%>" 	, "60", "center",  "str", "ro");
	conArrT["시평"   	]	= Array("<%=excelTitle.getF6()%>" + "<br>" + "-----" + "<br>" + "정 렬"	, "60", "center",  "str", "ro");
	conArrT["좌수"  	]	= Array("<%=excelTitle.getF7()%>"	, "60", "center",  "str", "ro");
	conArrT["잔액"   	]	= Array("<%=excelTitle.getF8()%>"	, "60", "center",  "str", "ro");
	//conArrT["FIRST_YEAR" ]	= Array("<%=excelTitle.getFstYr()%>"	, "45", "center",  "str", "ro");
	//conArrT["SECOND_YEAR"]	= Array("<%=excelTitle.getScndYr()%>"	, "45", "center",  "str", "ro");
	conArrT["2009" 		]	= Array("<%=excelTitle.getF9()%>"	, "45", "center",  "str", "ro");
	conArrT["2010" 		]	= Array("<%=excelTitle.getF10()%>"	, "45", "center",  "str", "ro");
	conArrT["2011" 		]	= Array("<%=excelTitle.getF11()%>"	, "45", "center",  "str", "ro");
	conArrT["3년합계" 	]	= Array("<%=excelTitle.getF12()%>" + "<br>" + "-----" + "<br>" + "정 렬"	, "60", "center",  "str", "ro");
	//conArrT["5년합계" 	]	= Array("<%=excelTitle.getSumOf5yr()%>"	, "60", "center",  "str", "ro");
	conArrT["5년합계" 	]	= Array("<%=excelTitle.getSumOf5yr()%>" + "<br>" + "-----" + "<br>" + "정 렬"	, "60", "center",  "str", "ro");
	conArrT["2012" 		]	= Array("<%=excelTitle.getF13()%>"	, "45", "center",  "str", "ro");
	//conArrT["2013" 		]	= Array("<%=excelTitle.getF14()%>"	, "45", "center",  "str", "ro");
	conArrT["양도가"  	]	= Array("<%=excelTitle.getF15()%>" + "<br>" + "-----" + "<br>" + "정 렬"	, "60", "center",  "str", "ro");
	//conArrT["협회"   	]	= Array("<%=excelTitle.getF16()%>"	, "60", "center",  "str", "ro");
	conArrT["기타"   	]	= Array("<%=excelTitle.getF17()%>"	, "150", "left",  "str", "ro");
	//conArrT["업체"   	]	= Array("<%=excelTitle.getF18()%>"	, "150", "center",  "str", "ro");
	//conArrT["연락처" 	]	= Array("<%=excelTitle.getF19()%>"	, "150", "center",  "str", "ro");
	
	l_initGrid(gridT,idArrT,conArrT);

	gridT.setSkin("dhx_skyblue");
	gridT.enableMultiline(true);
	gridT.setDelimiter("/");
	gridT.enablePaging(true,30,10,"pagingArea",true,"recinfoArea");

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
		
		//gridT.setCellTextStyle(rId,4,"font-family: 돋움;font-weight: bold;"+grid_font_size);
		//gridT.setCellTextStyle(rId,5,"font-family: 돋움;font-weight: bold;"+grid_font_size);
		//gridT.setCellTextStyle(rId,6,"font-family: 돋움;font-weight: bold;"+grid_font_size);
		//gridT.setCellTextStyle(rId,12,"font-family: 돋움;font-weight: bold;"+grid_font_size);
		//gridT.setCellTextStyle(rId,15,"font-family: 돋움;font-weight: bold;"+grid_font_size);
		
	});
	// 결과 그리드 끝
	
	$(document).ready( function(){
		
		checkChromeBrowser();
		doInitSearch();
		
		// 조회
		$('#BTN_SEARCH').click(function() {
			doSearch();
		});
		
		// 전체 체크 시 모든 체크 박스 CHECK함
	  	$("#CONDITON").click(function(){
			if($("#CONDITON").is(":checked")){
				$("input:checkbox").attr("checked","checked");
			}else{
				$("input:checkbox").attr("checked","");
			}
		
		});
	});
	
	function onRowDblClicked(rowId,cellId){

		var excelID = gridT.cells(rowId, gridT.getColIndexById("S")).getValue();
		$("#excelID").attr("value", excelID);

		var param = "?excelID="   + excelID;
		//var openUrl = "/board/admin_search_detail.jsp" + param;
		//l_viewPopup2(openUrl,'excelInfo', '1080','360' );
		
		//var openUrl = "/print/printContent5_1.jsp" + param;
		var openUrl = "/print/printContent5.jsp" + param;
		l_viewPopup2(openUrl,'print', '850','850' );
		
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

	function doInitSearch() {

		var params = "?COMMAND=FIRST";
	    var callUrl = "/board/combo_list_show_main_2.jsp" + params;

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
	
	// 상단 조회버튼 클릭 시 처리 함수
	function doSearch() {

		var f2List ;
		var chkval = [];
		var searchCond ;
		// 2014.02.15 추가됨
		var sAmount;
		var eAmount;

        $.each($(":checked"), function(i, val){
            
            //전체와 RADIO 버튼 값 제외 함
			if ( $(this).val() == "전체" || $(this).val() == "1" || $(this).val() == "2" ) 
			{
				//continue;
			} else 
			{
				chkval.push($(this).val());
			}
			
		});
		
		searchCond = $("input:radio[name=INQUERY_R]:checked").val();
		sAmount    = $("#sAmount").val()
		eAmount    = $("#eAmount").val()
		
        var params = "COMMAND=SEARCH";
            params += "&f2List="+chkval;
            params += "&searchCond="+searchCond;
            params += "&sAmount="+sAmount + "&eAmount="+eAmount;
		
		if (onChromeBrowser)
			params += "&isChromeBrowser=Y";
		
	    var callUrl = "/board/combo_list_show_main_2.jsp?" + params;
		
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
	
	// 숫자 확인
  	String.prototype.only_number = function(){
   		return this.replace(/[^0-9,.]/gi, '');
  	}
  	
  	function sortMark(str) {
	  	str = str + "<br>" + "-----" + "<br>" + "정 렬";
	  	return str;
	}
</script>
<!-- End of DHTMLX Component Initializations -->