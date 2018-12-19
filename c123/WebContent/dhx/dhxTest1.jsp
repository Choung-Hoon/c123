<%@ page contentType="text/html;charset=utf-8" %>

<%@ page errorPage="../common/error.jsp" %>

<%@ include file="../include/global_head.jsp" %>

<%@ include file="../common/_includeInit.inc" %>
<%@ include file="../common/_includeCommon.inc" %>
<%@ include file="../common/_checkLogin.inc" %> 

<%@ include file="../common/inc_import_00.jsp" %>
<%@include file="../common/inc_dhxgrid_00.jsp" %>

<link rel="stylesheet" type="text/css" href="<%=ConstantUtil.SERVER_HOST%>/share/css/kais_kaml.css">

<body>
<div id="wrap">
 
 	<%@ include file="../include/top_navi.jsp" %>
	<hr />
	<div id="container">
		<%@ include file="../include/left.jsp" %>
		<div class="contents_wrap">

			<div class="location">
				<h1>DHX테스트1</h1>
				<p><a href="main.jsp">홈</a> &gt; <strong>DHX</strong></p>
			</div>

			<div class="contents">
				<h2 class="h2_title subname">관리자 정보 관리</h2>
				<table summary="관리자 정보" class="admin_skin_list01">
					<caption class="hidden">관리자 정보</caption>
					<colgroup>
						<col width="20%" />
						<col width="80%" />
					</colgroup>
					<thead>
					<tr class="first_td">
						<th scope="col" colspan="2">관리자 정보</th>
					</tr>
					</thead>
					<tbody>
					<tr>
						<td>관리자 ID</td>
						<td></td>
					</tr>
					<tr>
						<td>관리자 이름</td>
						<td></td>
					</tr>
					</tbody>
				</table>	
				
			</div>
		</div>
	</div>
	<hr />
</div>


					

<!-- Start of DHTMLX Component Initializations -->
<script type="text/javascript">
//
var grid = null;
var row_id = 0;
var rowCnt = 0;
var calFrom		; //from calendar
var calTo		; //to calendar
var calWrk		; //calWrk calendar

//ready (onload)
$(document).ready( function()
{
	//그리드 생성 및 초기화
	doInitGrid();

}).keydown(function(){
	if(window.event.keyCode == 13)	search(); //조회시 call 하는 function 
	else	return;
		
});


//그리드
function doInitGrid() {
	grid = new dhtmlXGridObject("grid");

	var gridArr = Array();
		gridArr[ 0] = "REGIST_DATE";
		gridArr[ 1] = "REGIST_TIME";
		gridArr[ 2] = "SCNR_ID";
		gridArr[ 3] = "SCNR_SUMM";
		gridArr[ 4] = "START_DT";
		gridArr[ 5] = "END_DT";
		gridArr[ 6] = "WRK_CMPLTN_DT";
		gridArr[ 7] = "ETC_CMMNT";
		gridArr[ 8] = "SERNO";		
		gridArr[ 9] = "END_REGIST_TMP";		//end_regist_tmp
		gridArr[10] = "ATTCHD_FILE_NM";
		gridArr[11] = "ATTCHD_REGIST_DT";

	var rowArr = Array();	//"header,width,align,sorting,type"
		rowArr["REGIST_DATE"	 ] = Array("등록일자"		, "93"	, "center"	, "str"	, "ro" );
		rowArr["REGIST_TIME"	 ] = Array("등록시각"		, "93"	, "center"	, "str"	, "ro" );
		rowArr["SCNR_ID"		 ] = Array("시나리오ID"		, "65"	, "left"	, "str"	, "ro" );
		rowArr["SCNR_SUMM"		 ] = Array("시나리오요약"	, "100"	, "left"	, "str"	, "ro" );
		rowArr["START_DT"		 ] = Array("시작일자"		, "79"	, "center"	, "str"	, "ro" );
		rowArr["END_DT"			 ] = Array("종료일자"		, "79"	, "center"	, "str"	, "ro" );
		rowArr["WRK_CMPLTN_DT"	 ] = Array("작업일자"		, "70"	, "center"	, "str"	, "ro" );
		rowArr["SERNO"			 ] = Array("Serial no"		, "120"	, "center"	, "str"	, "ro" );
		rowArr["ETC_CMMNT"		 ] = Array("Comment"		, "163"	, "left"	, "str"	, "ro" );		
		rowArr["END_REGIST_TMP"	 ] = Array("최종등록시간"	, "100"	, "center"	, "str"	, "ro" );
		rowArr["ATTCHD_FILE_NM"	 ] = Array("첨부파일"		, "229"	, "left"	, "str"	, "ro" );
		rowArr["ATTCHD_REGIST_DT"] = Array("첨부등록일자"	, "100"	, "center"	, "str"	, "ro" );

	l_initGrid(grid,gridArr,rowArr);
	grid.setImagePath("<%=ConstantUtil.SERVER_HOST%>/dhx/imgs/");
	//grid.enablePaging(true,15,5,"pagingArea",true,"recinfoArea");
	grid.setSkin("grin");
	grid.setDelimiter("/");
	grid.init();
	
	grid.setColumnHidden(1,true);			//컬럼숨김.//REGIST_TIME
	grid.setColumnHidden(3,true);			//컬럼숨김.//SCNR_SUMM
	grid.setColumnHidden(8,true);			//컬럼숨김.//SERNO
	grid.setColumnHidden(9,true);			//컬럼숨김.//END_REGIST_TMP
	grid.setColumnHidden(11,true);			//컬럼숨김.//ATTCHD_REGIST_DT

	grid.attachEvent("onRowDblClicked" , onRowDblClicked);	//row DoubleClick
	//grid.attachEvent("onRowSelect",doOnRowSelected);
	
}

//
function onRowDblClicked(rowId, cellId) {
	//목록클릭
	$("#SCNR_ID").val(grid.cells(rowId,2).getValue());
	$("#WRK_CMPLTN_DT").val(grid.cells(rowId,6).getValue());
	$("#ETC_CMMNT").val(grid.cells(rowId,7).getValue());
	$("#END_REGIST_TMP").val(grid.cells(rowId,9).getValue());
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

</script><!-- End of DHTMLX Component Initializations -->
<!-- 컨텐츠 끝-->	

</body>
</html>