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
		userType =  "1" ;
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

<html xmlns:o="urn:schemas-microsoft-com:office:office"
xmlns:x="urn:schemas-microsoft-com:office:excel"
xmlns="http://www.w3.org/TR/REC-html40">

<head>
<meta http-equiv=Content-Type content="text/html; charset=ks_c_5601-1987">
<meta name=ProgId content=Excel.Sheet>
<meta name=Generator content="Microsoft Excel 11">
<link rel=File-List href="프라임코리아1.files/filelist.xml">
<link rel=Edit-Time-Data href="프라임코리아1.files/editdata.mso">
<link rel=OLE-Object-Data href="프라임코리아1.files/oledata.mso">
<script language="javascript" type="text/javascript"  src="<%=ConstantUtil.SERVER_HOST%>/js/jquery-1.5.2.min.js"></script>
<!--[if gte mso 9]><xml>
 <o:DocumentProperties>
  <o:LastAuthor>912069</o:LastAuthor>
  <o:LastPrinted>2013-03-10T03:21:30Z</o:LastPrinted>
  <o:Created>2013-03-10T00:20:15Z</o:Created>
  <o:LastSaved>2013-03-10T03:21:52Z</o:LastSaved>
  <o:Version>11.9999</o:Version>
 </o:DocumentProperties>
</xml><![endif]-->
<style>
<!--table
	{mso-displayed-decimal-separator:"\.";
	mso-displayed-thousand-separator:"\,";}
@page
	{margin:.75in .7in .75in .7in;
	mso-header-margin:.3in;
	mso-footer-margin:.3in;}
tr
	{mso-height-source:auto;
	mso-ruby-visibility:none;}
col
	{mso-width-source:auto;
	mso-ruby-visibility:none;}
br
	{mso-data-placement:same-cell;}
.style0
	{mso-number-format:General;
	text-align:general;
	vertical-align:middle;
	white-space:nowrap;
	mso-rotate:0;
	mso-background-source:auto;
	mso-pattern:auto;
	color:black;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:"맑은 고딕", monospace;
	mso-font-charset:129;
	border:none;
	mso-protection:locked visible;
	mso-style-name:표준;
	mso-style-id:0;}
td
	{mso-style-parent:style0;
	padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:black;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:"맑은 고딕", monospace;
	mso-font-charset:129;
	mso-number-format:General;
	text-align:general;
	vertical-align:middle;
	border:none;
	mso-background-source:auto;
	mso-pattern:auto;
	mso-protection:locked visible;
	white-space:nowrap;
	mso-rotate:0;}
.xl65
	{mso-style-parent:style0;
	mso-number-format:"\@";}
.xl66
	{mso-style-parent:style0;
	font-size:24.0pt;
	font-weight:700;
	mso-number-format:"\@";
	text-align:center;}
.xl67
	{mso-style-parent:style0;
	font-size:14.0pt;
	mso-number-format:"\@";
	text-align:center;}
.xl68
	{mso-style-parent:style0;
	font-size:14.0pt;
	mso-number-format:"\@";}
.xl69
	{mso-style-parent:style0;
	font-size:14.0pt;
	mso-number-format:"\@";
	text-align:left;}
.xl70
	{mso-style-parent:style0;
	font-size:14.0pt;
	font-weight:700;
	mso-number-format:"\@";
	text-align:left;}
.xl71
	{mso-style-parent:style0;
	font-size:14.0pt;
	mso-number-format:"\@";
	text-align:center;
	border:.5pt solid windowtext;}
.xl72
	{mso-style-parent:style0;
	font-size:14.0pt;
	mso-number-format:"\@";
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl73
	{mso-style-parent:style0;
	font-size:14.0pt;
	mso-number-format:"\@";
	text-align:center;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;}
.xl74
	{mso-style-parent:style0;
	font-size:14.0pt;
	mso-number-format:"\@";
	text-align:center;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl75
	{mso-style-parent:style0;
	font-size:14.0pt;
	font-weight:700;
	mso-number-format:"\@";
	text-align:center;
	white-space:normal;}
.xl76
	{mso-style-parent:style0;
	font-size:14.0pt;
	mso-number-format:"\@";
	text-align:center;
	white-space:normal;}
.xl77
	{mso-style-parent:style0;
	font-size:18.0pt;
	font-weight:700;
	mso-number-format:"\@";
	text-align:left;}
ruby
	{ruby-align:left;}
rt
	{color:windowtext;
	font-size:8.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:"맑은 고딕", monospace;
	mso-font-charset:129;
	mso-char-type:none;
	display:none;}
-->
</style>
<!--[if gte mso 9]><xml>
 <x:ExcelWorkbook>
  <x:ExcelWorksheets>
   <x:ExcelWorksheet>
    <x:Name>Sheet1</x:Name>
    <x:WorksheetOptions>
     <x:DefaultRowHeight>330</x:DefaultRowHeight>
     <x:Print>
      <x:ValidPrinterInfo/>
      <x:PaperSizeIndex>9</x:PaperSizeIndex>
      <x:HorizontalResolution>600</x:HorizontalResolution>
      <x:VerticalResolution>600</x:VerticalResolution>
     </x:Print>
     <x:Selected/>
     <x:DoNotDisplayGridlines/>
     <x:Panes>
      <x:Pane>
       <x:Number>3</x:Number>
       <x:ActiveRow>12</x:ActiveRow>
       <x:ActiveCol>9</x:ActiveCol>
      </x:Pane>
     </x:Panes>
     <x:ProtectContents>False</x:ProtectContents>
     <x:ProtectObjects>False</x:ProtectObjects>
     <x:ProtectScenarios>False</x:ProtectScenarios>
    </x:WorksheetOptions>
   </x:ExcelWorksheet>
  </x:ExcelWorksheets>
  <x:WindowHeight>12270</x:WindowHeight>
  <x:WindowWidth>19320</x:WindowWidth>
  <x:WindowTopX>240</x:WindowTopX>
  <x:WindowTopY>30</x:WindowTopY>
  <x:ProtectStructure>False</x:ProtectStructure>
  <x:ProtectWindows>False</x:ProtectWindows>
 </x:ExcelWorkbook>
</xml><![endif]-->

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

function goClose()
{
	self.close();
}

</script>
</head>

<body link=blue vlink=purple class=xl65>

<table x:str border=0 cellpadding=0 cellspacing=0 width=715 style='border-collapse:
 collapse;table-layout:fixed;width:537pt'>
 <col class=xl65 width=29 style='mso-width-source:userset;mso-width-alt:928;
 width:22pt'>
 <col class=xl65 width=165 style='mso-width-source:userset;mso-width-alt:5280;
 width:124pt'>
 <col class=xl65 width=72 span=5 style='width:54pt'>
 <col class=xl65 width=89 style='mso-width-source:userset;mso-width-alt:2848;
 width:67pt'>
 <col class=xl65 width=72 style='width:54pt'>
 <tr height=51 style='height:38.25pt'>
  <td height=51 class=xl65 width=29 style='height:38.25pt;width:22pt'></td>
  <td colspan=7 class=xl66 width=614 style='width:461pt'>프라임 코리아
  </td>
  <td class=xl65 width=72 style='width:54pt' id="button">
  	<a href="#dummy" onclick="goPrint();return false;"><img src="<%=ConstantUtil.SERVER_HOST%>/images/button/btn_popup_form_1.gif" alt="인쇄하기" border=0 /></a>
  </td>
 </tr>
 <tr height=27 style='height:20.25pt'>
  <td height=27 class=xl65 style='height:20.25pt'></td>
  <td colspan=7 class=xl67>(www.prmna.pe.kr)</td>
  <td class=xl68></td>
 </tr>
 <tr height=27 style='height:20.25pt'>
  <td height=27 class=xl65 style='height:20.25pt'></td>
  <td colspan=7 class=xl67 style='mso-ignore:colspan'></td>
  <td class=xl68></td>
 </tr>
 <tr height=27 style='height:20.25pt'>
  <td height=27 class=xl65 style='height:20.25pt'></td>
  <td colspan=8 class=xl69>주소 : 서울시 송파구 가락로 206, 4층(송파동, 장수빌딩)</td>
 </tr>
 <tr height=27 style='height:20.25pt'>
  <td height=27 class=xl65 style='height:20.25pt'></td>
  <td colspan=7 class=xl70>우편번호 : 1688-3880, 팩스 : 0505-323-2000, 전화 :
  02-516-6852</td>
  <td class=xl68></td>
 </tr>
 <tr height=27 style='height:20.25pt'>
  <td height=27 class=xl65 style='height:20.25pt'></td>
  <td colspan=8 class=xl68 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=27 style='height:20.25pt'>
  <td height=27 class=xl65 style='height:20.25pt'></td>
  <td class=xl68 colspan=2 style='mso-ignore:colspan'>날 짜 : <%=DateUtils.getStringToHanDate(DateUtils.getToday())%></td>
  <td colspan=6 class=xl68 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=27 style='height:20.25pt'>
  <td height=27 class=xl65 style='height:20.25pt'></td>
  <td colspan=8 class=xl68 style='mso-ignore:colspan'></td>
 </tr>

<%
	//법인/면허 작업 시작
	String [] f4Str = StringUtil.stringTokenizer(excelData.getF4(),"<br>");
	System.out.println("=================> " + excelData.getF4());

	if (f4Str.length > 0) {
%>

 <tr height=27 style='height:20.25pt'>
  <td height=27 class=xl65 style='height:20.25pt'></td>
  <td class=xl68 x:str="* 법             인 : ">* 법<span
  style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  </span>인 :<span style='mso-spacerun:yes'>&nbsp;</span></td>
  <td class=xl68 colspan=7 style='mso-ignore:colspan'><span
  style='mso-spacerun:yes'>&nbsp;&nbsp; </span><%=f4Str[0]%>년</td>
 </tr>
<%
	}

	if (f4Str.length > 1) {
%>
 <tr height=27 style='height:20.25pt'>
  <td height=27 class=xl65 style='height:20.25pt'></td>
  <td class=xl68>* 면<span
  style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  </span>허 :</td>
  <td class=xl68 colspan=7 style='mso-ignore:colspan'><span
  style='mso-spacerun:yes'>&nbsp;&nbsp; </span><%=f4Str[1]%>년</td>
 </tr>
<%
	}
%>
 <tr height=27 style='height:20.25pt'>
  <td height=27 class=xl65 style='height:20.25pt'></td>
  <td class=xl68 x:str="* 자     본     금 : ">* 자<span
  style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp; </span>본<span
  style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp; </span>금 :<span
  style='mso-spacerun:yes'>&nbsp;</span></td>
  <td class=xl68 colspan=7><span style='mso-spacerun:yes'>&nbsp;&nbsp; </span><%= "".equals(excelData.getF5()) ? "" :  excelData.getF5() + "억"%></td>
 </tr>
 <tr height=27 style='height:20.25pt'>
  <td height=27 class=xl65 style='height:20.25pt'></td>
  <td class=xl68 x:str="* 지             역 : ">* 지<span
  style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  </span>역 :<span style='mso-spacerun:yes'>&nbsp;</span></td>
  <td class=xl68 colspan=7><span style='mso-spacerun:yes'>&nbsp;&nbsp; </span><%=excelData.getF3()%></td>
 </tr>
 <tr height=27 style='height:20.25pt'>
  <td height=27 class=xl65 style='height:20.25pt'></td>
  <td class=xl68>* 공제 출자 좌수 :</td>
  <td class=xl68 colspan=7><span style='mso-spacerun:yes'>&nbsp;&nbsp; </span><%=excelData.getF7().replaceAll("<br>","/")%></td>
 </tr>
 <tr height=27 style='height:20.25pt'>
  <td height=27 class=xl65 style='height:20.25pt'></td>
  <td class=xl68 x:str="* 공제 조합 잔액 : ">* 공제 조합 잔액 :<span
  style='mso-spacerun:yes'>&nbsp;</span></td>
  <td class=xl68 colspan=7 style='mso-ignore:colspan'><span
  style='mso-spacerun:yes'>&nbsp;&nbsp; </span><%= "".equals(excelData.getF8()) ? "" :  excelData.getF8() + "억"%></td>
 </tr>
 <tr height=27 style='height:20.25pt'>
  <td height=27 class=xl65 style='height:20.25pt'></td>
  <td class=xl68 x:str="* 협             회 : ">* 협<span
  style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  </span>회 :<span style='mso-spacerun:yes'>&nbsp;</span></td>
  <td class=xl68 colspan=7> <span style='mso-spacerun:yes'>&nbsp;&nbsp; </span><%=excelData.getF16()%></td>
 </tr>

<%
	//시공 능력 자업
	String [] f6Str = StringUtil.stringTokenizer(excelData.getF6(),"<br>");
	StringBuffer f6SB = new StringBuffer() ;

	for(int count=0 ; f6Str.length > count ;count++)
	{
		f6SB.append(f6Str[count] + "억").append("&nbsp;&nbsp;");
	}
%>

 <tr height=27 style='height:20.25pt'>
  <td height=27 class=xl65 style='height:20.25pt'></td>
  <td class=xl68 x:str="* 시  공   능  력 : ">* 시<span
  style='mso-spacerun:yes'>&nbsp; </span>공<span
  style='mso-spacerun:yes'>&nbsp;&nbsp; </span>능<span
  style='mso-spacerun:yes'>&nbsp; </span>력 :<span
  style='mso-spacerun:yes'>&nbsp;</span></td>
  <td colspan=7 class=xl68><span style='mso-spacerun:yes'>&nbsp;&nbsp; </span><%=f6SB.toString()%></td>
 </tr>
 <tr height=27 style='height:20.25pt'>
  <td height=27 class=xl65 style='height:20.25pt'></td>
  <td colspan=8 class=xl68 style='mso-ignore:colspan'></td>
 </tr>

 <tr height=27 style='height:20.25pt'>
  <td height=27 class=xl65 style='height:20.25pt'></td>
  <td class=xl71>물건</td>
  <td class=xl72>시평</td>
  <td class=xl72>2009</td>
  <td class=xl72>2010</td>
  <td class=xl72>2011</td>
  <td class=xl72>합계</td>
  <td class=xl72>2012</td>
  <td class=xl68></td>
 </tr>
<%
	// 테이블 만들기
	//물건(업종)
	String [] f2Str = StringUtil.stringTokenizer(excelData.getF2(),"<br>");
	// 시평(위에서 정의 함)
	f6Str = StringUtil.stringTokenizer(excelData.getF6(),"<br>");
	// 2009
	String [] f10Str = StringUtil.stringTokenizer(excelData.getF10(),"<br>");
	// 2010
	String [] f11Str = StringUtil.stringTokenizer(excelData.getF11(),"<br>");
	// 2011
	String [] f12Str = StringUtil.stringTokenizer(excelData.getF12(),"<br>");
	// 합계
	String [] f13Str = StringUtil.stringTokenizer(excelData.getF13(),"<br>");
	// 2012
	String [] f14Str = StringUtil.stringTokenizer(excelData.getF14(),"<br>");

	ArrayList resultList = new ArrayList();

	for(int count=0 ; f2Str.length > count ;count++)
	{
		String [] showTable = new String[7] ;
		int showTableColumnIndex = 0 ;

		if (f2Str.length > count) showTable[showTableColumnIndex++] = f2Str[count];
		else showTable[showTableColumnIndex++] = "";
		if (f6Str.length > count) showTable[showTableColumnIndex++] = f6Str[count];
		else showTable[showTableColumnIndex++] = "";
		if (f10Str.length > count) showTable[showTableColumnIndex++] = f10Str[count];
		else showTable[showTableColumnIndex++] = "";
		if (f11Str.length > count) showTable[showTableColumnIndex++] = f11Str[count];
		else showTable[showTableColumnIndex++] = "";
		if (f12Str.length > count) showTable[showTableColumnIndex++] = f12Str[count];
		else showTable[showTableColumnIndex++] = "";
		if (f13Str.length > count) showTable[showTableColumnIndex++] = f13Str[count];
		else showTable[showTableColumnIndex++] = "";
		if (f14Str.length > count) showTable[showTableColumnIndex++] = f14Str[count];
		else showTable[showTableColumnIndex++] = "";

		resultList.add(showTable);
	}

	for(int count=0 ; resultList.size() > count ;count++)
	{
		String showT [] = (String[])resultList.get(count) ;
		int showTableColumnIndex = 0 ;

%>
 <tr height=27 style='height:20.25pt'>
  <td height=27 class=xl65 style='height:20.25pt'></td>
  <td class=xl73><%=showT[showTableColumnIndex++]%></td>
  <td class=xl74><%=showT[showTableColumnIndex++]%></td>
  <td class=xl74><%=showT[showTableColumnIndex++]%></td>
  <td class=xl74><%=showT[showTableColumnIndex++]%></td>
  <td class=xl74><%=showT[showTableColumnIndex++]%></td>
  <td class=xl74><%=showT[showTableColumnIndex++]%></td>
  <td class=xl74><%=showT[showTableColumnIndex++]%></td>
  <td class=xl68></td>
 </tr>
<%
	}
%>

 <tr height=22 style='height:16.5pt'>
  <td height=22 colspan=9 class=xl65 style='height:16.5pt;mso-ignore:colspan'></td>
 </tr>
 <tr height=27 style='height:20.25pt'>
  <td height=27 class=xl65 style='height:20.25pt'></td>
  <td colspan=7 class=xl75 width=614 style='width:461pt'>* 기타사항</td>
  <td class=xl68></td>
 </tr>
 <tr >
  <td class=xl65 ></td>
  <td colspan=7 class=xl76 width=614 style='width:461pt'><%=excelData.getF17()%></td>
  <td class=xl68></td>
 </tr>
 <tr height=27 style='height:20.25pt'>
  <td height=27 class=xl65 style='height:20.25pt'></td>
  <td colspan=8 class=xl68 style='mso-ignore:colspan'></td>
 </tr>
 <tr class=xl68 height=35 style='height:26.25pt'>
  <td height=35 class=xl68 style='height:26.25pt'></td>
  <td colspan=8 class=xl77>양 도 가<span
  style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  </span><%=excelData.getF15()%> (억)</td>
 </tr>
 <tr class=xl68 height=35 style='height:26.25pt'>
  <td height=27 class=xl65 style='height:20.25pt'></td>
  <td colspan=10 class=xl68>* 양도가는 수수료 별도입니다.</td>
 </tr>
</table>

</body>

</html>
