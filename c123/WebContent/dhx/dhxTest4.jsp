<%@ page contentType="text/html;charset=utf-8" %>

<%@ page errorPage="../common/error.jsp" %>
<%@ include file="../include/global_head.jsp" %>

<%@ include file="../common/_includeInit.inc" %>
<%@ include file="../common/_includeCommon.inc" %>
<%@ include file="../common/_checkLogin.inc" %>
<%@include file="../common/inc_dhxgrid_00.jsp" %>


<script type="text/javascript">


</script>

<body>



<form>
<input type="hidden" name="titles" id="titles" value="">

<div id="wrap">

 	<%@ include file="../include/top_navi.jsp" %>
	<hr />
	<div id="container">
		<%@ include file="../include/left.jsp" %>
		<div class="contents_wrap">

			<div class="location">
				<h1>DHX테스트4</h1>
				<p><a href="main.jsp">홈</a> &gt; <strong>DHX</strong></p>
			</div>
		</div>
	</div>
</div>

			<!-- 컨텐츠 시작-->
<div id="contents1">
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
            <td class="topSpace5">
                <!-- 하단테이블 시작-->
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <td>
                            <!-- 버튼,건수 시작-->
                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                    <td class="conTitle2">조회결과</td>
                                    <td>
                                        <table border="0" align="right" cellpadding="0" cellspacing="0">
                                            <tr>
                                                <td class="btn-center" id="recinfoArea" align="center">
                                            </tr>
                                        </table>
                                    </td>
                                    <!--
                                    <td width="60" class="btn_box">
                                        <table id="BTN_EXCEL" border="0" cellpadding="0" cellspacing="0" style="cursor:pointer;">
                                            <tr>
                                                <td class="btn-left"><img src="<%=ConstantUtil.SERVER_HOST%>/images/button/kaml_btn_dat_excel2.gif"></td>
                                                <td class="btn-right"><a href="#">엑셀</a></td>
                                            </tr>
                                        </table>
                                    </td>
                                    -->
                                </tr>
                            </table>
                            <!-- 버튼,건수 끝-->
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <!-- 그리드테이블 시작-->
                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                    <td class="ta2List">
                                        <div id="gridbox" width="100%" height="600"></div>
										<div id="excelGrid" width="0" height="0" style="display:none"></div>
                                    </td>
                                </tr>
                                <tr><td class="taCon1Cen" id="pagingArea" colspan="3"></td></tr><!--align="center" -->
                                <!-- 목록넘버 -->
                                <!--
                                <tr>
                                    <td class="taNumber"><a href="#"><img src="http://kais/ais/images/icon/kaml_i_back2.gif" width="12" height="9"></a> <a href="#"><img src="http://kais/ais/images/icon/kaml_i_back1.gif" width="12" height="9"></a> <b>11</b> <a href="#">12</a> <a href="#">13</a> <a href="#">14</a> <a href="#">15</a> <a href="#">16</a> <a href="#">17</a> <a href="#">18</a> <a href="#">19</a> <a href="#">20</a> <a href="#"><img src="http://kais/ais/images/icon/kaml_i_next1.gif" width="12" height="9"></a> <a href="#"><img src="http://kais/ais/images/icon/kaml_i_next2.gif" width="12" height="9"></a> </td>
                                </tr>
                                -->
                            </table>
                            <!-- 그리드테이블 끝-->
                        </td>
                    </tr>
                </table>
                <!-- 하단테이블 끝-->
            </td>
        </tr>
    </table>
</div>

<!-- Start of DHTMLX Component Initializations -->
<script type="text/javascript">
	//
	mygrid = new dhtmlXGridObject('gridbox');

    var idArr = Array();
    var idx = 0;
    //idArr[idx++] = "1"            ;//선택
    idArr[idx++] = "2"
    idArr[idx++] = "3"
    idArr[idx++] = "4"
    idArr[idx++] = "5"
    idArr[idx++] = "6"
    idArr[idx++] = "7"
    idArr[idx++] = "8"
    idArr[idx++] = "9"
    idArr[idx++] = "10"
    idArr[idx++] = "11"
    idArr[idx++] = "12"
    idArr[idx++] = "13"
    idArr[idx++] = "14"
    idArr[idx++] = "15"
    idArr[idx++] = "16"
    idArr[idx++] = "17"
    idArr[idx++] = "18"
	idArr[idx++] = "19"
	idArr[idx++] = "20"

    var conArr = Array();//"header,header attach,width,align,sorting,type"
    //conArr["1"  ] = Array("순서"          	, "&nbsp;" 		  , "40"  , "center"	, "str" , "cntr" );
    conArr["2"  ] = Array("날짜"          	, "#select_filter" , "80"  , "center"	, "str" , "ro" );
    conArr["3"  ] = Array("업종"        	, "#select_filter" , "80"  , "left"		, "str" , "ro" );
    conArr["4"  ] = Array("2.0"      		, "#select_filter"		  , "80"  , "left"		, "str" , "ro" );
    conArr["5"  ] = Array("법인<br>/면허"   , "#select_filter"		  , "80"  , "left"		, "str" , "ro" );
    conArr["6"  ] = Array("자본금"          , "#select_filter"		  , "60"  , "right"  	, "str" , "ro" );
    conArr["7"  ] = Array("시평"      		, "&nbsp;"		  , "60"  , "right"		, "str" , "ro" );
    conArr["8"  ] = Array("좌수"      		, "&nbsp;"		  , "60"  , "right"		, "str" , "ro" );
    conArr["9"  ] = Array("잔액"          	, "&nbsp;"		  , "60"  , "right"  	, "str" , "ro" );
    conArr["10" ] = Array("2008.0"      	, "&nbsp;"		  , "60"  , "right"		, "str" , "ro" );
    conArr["11" ] = Array("2009.0"  		, "&nbsp;"		  , "60"  , "right"		, "str" , "ro" );
    conArr["12" ] = Array("2010.0"      	, "&nbsp;"		  , "60"  , "right"		, "str" , "ro" );
    conArr["13" ] = Array("2011.0"      	, "&nbsp;"		  , "60"  , "right"		, "str" , "ro" );
    conArr["14" ] = Array("계"      		, "&nbsp;"		  , "60"  , "right"		, "str" , "ro" );
    conArr["15" ] = Array("2012.0"      	, "&nbsp;"		  , "60"  , "right"  	, "str" , "ro" );
    conArr["16" ] = Array("양도가"      	, "&nbsp;"		  , "60"  , "right"  	, "str" , "ro" );
	conArr["17" ] = Array(""      			, "&nbsp;"		  , "80"  , "left"  	, "str" , "ro" );
	conArr["18" ] = Array("기타"      		, "&nbsp;"		  , "160"  , "left"  	, "str" , "ro" );
	conArr["19" ] = Array("업체"      		, "&nbsp;"		  , "130"  , "left" 	, "str" , "ro" );
	conArr["20" ] = Array("업체 전화번호"   , "&nbsp;"		  , "160"  , "left"  	, "str" , "ro" );

    l_initGrid(mygrid,idArr,conArr);

    mygrid.setImagePath("<%=ConstantUtil.SERVER_HOST%>/dhx/imgs/");
	mygrid.setSkin("light");
	mygrid.enablePaging(true,50,5,"pagingArea",true,"recinfoArea");
	//mygrid.enableSmartRendering(true,50);
	mygrid.enablePreRendering(50);
	mygrid.loadXML("<%=ConstantUtil.SERVER_HOST%>/dhx/sample/sample_xml3.xml");


	/* helpful info
		http://forum.dhtmlx.com/viewtopic.php?f=2&t=13422&p=39371&hilit=filter+refresh#p39371

		for (var i=0; i<mygrid.getRowsNum(); i++){
			var value=mygrid.cellByIndex(i,COLUMN_INDEX).getValue()
		}
	*/
	mygrid.attachEvent("onFilterEnd", function(elements){
             // http://forum.dhtmlx.com/viewtopic.php?f=2&t=17723&p=55138&hilit=dropdown+filtering#p55138
              /*
              for (i in elements){
		            var filter_value=elements[i][0].value;
		            alert("===>" + filter_value);
		            alert(mygrid.collectValues(i));
		        }
		     */
		     // alert("hi");
		      mygrid.refreshFilters();
		      //alert(mygrid.collectValues(1));

		      //mygrid.filterByAll(); 무한 루프 돌림
		      //mygrid.makeFilter("some_el",2,true);

    });
    /*
    mygrid.attachEvent("onCollectValues", function(index){

                    if (index == 2)

                    //   	for (var i=0; i<mygrid.getRowsNum(); i++){
					//		//var value=mygrid.cellByIndex(i,COLUMN_INDEX).getValue()
					//		alert(mygrid.cellByIndex(i,COLUMN_INDEX).getValue());
					//	}

                        return ["one","two","three"]; //options for select filter
                    else if (index == 3)
                        return ["one1","two1","three1"]; //options for select filter
                    else
                        return true; //default processing
          });
    */

	mygrid.init();

	//mygrid.loadXML("<%=ConstantUtil.SERVER_HOST%>/dhx/sample/500.xml");
	//mygrid.load("./dhx/sample/data.json","json");
	//mygrid.load("./dhx/sample/samle_data.json","json");


//ready (onload)
$(document).ready( function()
{

}).keydown(function(){
	if(window.event.keyCode == 13)	search(); //조회시 call 하는 function
	else	return;

});

function doFilter(mygrid){
	mygrid.filterBy(3,'M',true);
	mygrid.filterBy(2,function(a){ return (a > 55);} );
}


//그리드
function doInitGrid() {
	mygrid = new dhtmlXGridObject('gridbox');
	mygrid.setImagePath("<%=ConstantUtil.SERVER_HOST%>/dhx/imgs/");
	mygrid.setHeader("날짜,업종,2.0,법인<br>/면허,자본금,시평,좌수,잔액,2008.0,2009.0,2010.0,2011.0,계,2012.0,양도가,,기타,업체,업체 전화번호");
	//mygrid.attachHeader("&nbsp;,#combo_filter,#combo_filter,&nbsp;,#cspan,#cspan");
	mygrid.attachHeader("#combo_filter,#combo_filter,#combo_filter,&nbsp;,#cspan,#combo_filter,&nbsp;,&nbsp;,&nbsp;,&nbsp;,&nbsp;,&nbsp;,&nbsp;,&nbsp;,&nbsp;,&nbsp;,&nbsp;,&nbsp;,&nbsp;");
	mygrid.setInitWidths("80,100,100,100,100,100,150,120,150,150,220,150,120,150,150,220,150,150,220");
	//mygrid.enableAutoWidth(true);
	//mygrid.setHeader($('#titles').val());
	mygrid.setColAlign("center,left,left,left,left,left,left,left,left,left,left,left,left,left,left,left,left,left,left");
	//mygrid.setColTypes("ed,ed,ed,ed,ed,ed,ed,ed,ed,ed,ed,ed,ed,ed,ed,ed,ed,ed,ed");
	mygrid.setColTypes("ro,ro,ro,ro,ro,ro,ro,ro,ro,ro,ro,ro,ro,ro,ro,ro,ro,ro,ro");
	mygrid.setColSorting("str,str,str,str,str,str,str,str,str,str,str,str,str,str,str,str,str,str,str");
	//mygrid.setSkin("dhx_skyblue");
	mygrid.setSkin("light");
	//mygrid.enableCellIds(true);
	mygrid.enablePaging(true,100,5,"pagingArea",true,"recinfoArea");
	//mygrid.enableSmartRendering(true,50);
	mygrid.enablePreRendering(100);
	mygrid.loadXML("<%=ConstantUtil.SERVER_HOST%>/dhx/sample/sample_xml3.xml");
	mygrid.init();

	//mygrid.loadXML("<%=ConstantUtil.SERVER_HOST%>/dhx/sample/500.xml");
	//mygrid.load("./dhx/sample/data.json","json");
	//mygrid.load("./dhx/sample/samle_data.json","json");

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
    var attachHearArr = Array(); //attach Header
    var widthArr  =  Array(); //width
    var alignArr   =  Array(); //align
    var sortingArr =  Array(); //sorting
    var typeArr   =  Array(); //type
    for(var i = 0 ; i < idArr.length; i++){
        headerArr[i]  = conArr[idArr[i]][0];
		attachHearArr[i]  = conArr[idArr[i]][1];
        widthArr[i]   = conArr[idArr[i]][2];
        alignArr[i]   = conArr[idArr[i]][3];
        sortingArr[i] = conArr[idArr[i]][4];
        typeArr[i]    = conArr[idArr[i]][5];
    }
    grid.setColumnIds(idArr.join(","));
    grid.setHeader(headerArr.join(","));
    grid.attachHeader(attachHearArr.join(","))
    grid.setInitWidths(widthArr.join(","));
    grid.setColAlign(alignArr.join(","));
    grid.setColSorting(sortingArr.join(","));
    grid.setColTypes(typeArr.join(","));

}

</script><!-- End of DHTMLX Component Initializations -->
<!-- 컨텐츠 끝-->

</body>
</html>