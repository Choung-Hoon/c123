<%@ page contentType="text/html;charset=utf-8" %>

<%@ page errorPage="../common/error.jsp" %>
<%@ include file="../include/global_head.jsp" %>

<%@ include file="../common/_includeInit.inc" %>
<%@ include file="../common/_includeCommon.inc" %>
<%@include file="../common/inc_dhxgrid_00.jsp" %>

<%@ page import="lee.common.util.*" %>

<body oncontextmenu='return false' ondragstart='return false' onselectstart='return false'>


<%
	String strBoardId = ConstantUtil.BOARD_CODE_ADMIN_NOTICE;
	String filename = "" ;
	int userType = 4;

	if(curAdminInfo != null) {
	    userType = StringUtil.stoi(curAdminInfo.getUserType());
	}

	BoardMgr boardMgr = mgr.getBoardMgr();
	int boardMaxId =  boardMgr.getBoardMaxId();

	BoardFile[] boardFileList = boardMgr.getBoardFileList(boardMaxId);
	for(int a=0; a<boardFileList.length; a++)
	{
		filename = boardFileList[a].getRname();
	}

	// 파일 존재 여부 체크 함
	String xmlFile = filename + "_0.xml" ;
	String boardAttachPath = ConfigManager.getInstance().getBoardFileUpload();

	if(!FileUtil.existFile(xmlFile,boardAttachPath))
	{
		goAlert(pageContext, "출력될 자료명이 없습니다.");
		return;
	}

	String titleFile = filename + "_0.title" ;
	String[] title = FileUtil.readFileByLine(boardAttachPath + File.separator + titleFile);

	//String[] gridTitles = StringUtil.stringTokenizer(title[0],",");
	String[] gridTitles = title[0].split(",");

%>

<!-- 컨텐츠 시작-->
<div id="contents2">
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
                                    <td class="conTitle2">&nbsp;</td>
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
                                       <!-- 여기 내가 수정 -->
                                    <div id="gridbox" style="width:1200px; height:800px; background-color:white;"></div>
                                    <!--<div id="gridbox" width="100%" height="800"></div>-->
                                    <!-- 여기 내가 수정 -->
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
	window.moveTo(0, 0);
    window.resizeTo(screen.width-20, screen.height-30);

	//grid 시작
	mygrid = new dhtmlXGridObject('gridbox');
	//
  // add by nobel
  // setStyle(ss_header, ss_grid, ss_selCell, ss_selRow)
  //
  mygrid.setStyle("",
    "font-family:굴림체;font-size:12px;",
    "",
    "");

	var idArr = Array();
    var idx = 0;
<%
	for(int index = 0 ; index < gridTitles.length ; index++)
	{
		//일반회원이면 맨 끝2개 필드는 보여주지 않음
		//관리자구분(1:관리자(슈퍼), 2:관리자(일반), 3:정액회원, 4:일반회원)'
		if (userType > 3 && index > gridTitles.length-3) {
			break;
		}
		out.println("idArr[idx++] = \"" + (index+1) + "\"");
	}
%>
	//filter source : http://docs.dhtmlx.com/doku.php?id=dhtmlxgrid:header_extra#filters
	//				  http://docs.dhtmlx.com/doku.php?id=dhtmlxconnector:filtering&s
    var conArr = Array();//"header,header attach,width,align,sorting,type"
<%
	StringBuffer gridTitleSB = new StringBuffer();
	for(int index = 0 ; index < gridTitles.length ; index++)
	{
		//맨 끝2개 필드는 보여주지 않음
		if (userType > 3 && index > gridTitles.length-3) {
			break;
		}

		gridTitleSB.setLength(0);
		gridTitleSB.append("conArr[\"" + (index+1) + "\"]")  // index
				   .append("= Array(\"" + gridTitles[index] + "\"").append(",") //header
				   // #text_filter, #select_filter, #combo_filter, #text_search
				   .append("\"#select_filter\"").append(",")	// header attach :
				   //.append("\"&nbsp;\"").append(",")		// header attach
				   .append("\"80\"").append(",")				// width
				   .append("\"center\"").append(",")			// align
				   .append("\"str\"").append(",")				// sorting
				   .append("\"ro\"").append(") ;");				// type
		out.println(gridTitleSB.toString());
	}
%>
    l_initGrid(mygrid,idArr,conArr);

    mygrid.setImagePath("<%=ConstantUtil.SERVER_HOST%>/dhx/dhtmlxGrid/codebase/imgs/");
	mygrid.setSkin("light");
	mygrid.enablePaging(true,50,10,"pagingArea",true,"recinfoArea");
	mygrid.enablePreRendering(50);
	mygrid.attachEvent("onFilterEnd", function(elements){
	      mygrid.refreshFilters();
    });
  //
  // add by nobel
  // set bold text on specific columns
  //
  mygrid.attachEvent("onRowCreated", function(rId,rObj,rXml){
    mygrid.setCellTextStyle(rId,5,"font-family: 돋움;font-weight: bold");
    mygrid.setCellTextStyle(rId,6,"font-family: 돋움;font-weight: bold");
    mygrid.setCellTextStyle(rId,7,"font-family: 돋움;font-weight: bold");
    mygrid.setCellTextStyle(rId,12,"font-family: 돋움;font-weight: bold");
    mygrid.setCellTextStyle(rId,13,"font-family: 돋움;font-weight: bold");
  });

	//mygrid.enableAutoWidth(true);
	mygrid.loadXML("<%=ConstantUtil.SERVER_HOST%>/upload/board/<%= xmlFile %>");
	//mygrid.loadXML("<%=ConstantUtil.SERVER_HOST%>/dhx/sample/sample_xml3.xml");
	mygrid.init();

//ready (onload)
$(document).ready( function()
{

});

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
    //grid.setInitWidths(widthArr.join(","));
    //grid.enableAlterCss("even", "uneven");
    grid.setInitWidths("68,77,49,74,58,48,51,55,52,47,44,48,40,41,55,41,200,112,116");
    grid.setColAlign(alignArr.join(","));
    grid.setColSorting(sortingArr.join(","));
    grid.setColTypes(typeArr.join(","));
    //grid.setColumnColor(",,,,,#FFEBCD,#FFEBCD,#FFEBCD,,,,,#FFEBCD,,#FFEBCD,,,,");
    //grid.setColumnColor("white,white,white,white,white,#FFEBCD,#FFEBCD,#FFEBCD,white,white,white,white,#FFEBCD,white,#FFEBCD,white,white,white,white");

}

</script><!-- End of DHTMLX Component Initializations -->
<!-- 컨텐츠 끝-->

</body>
</html>