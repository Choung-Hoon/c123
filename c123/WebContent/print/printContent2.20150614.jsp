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
	
  java.text.DateFormat formatter = new java.text.SimpleDateFormat("yy/MM/dd");
  Date date1 = formatter.parse(excelData.getF1());
  formatter = new java.text.SimpleDateFormat("yyyyMMdd");
  String registerDate = DateUtils.getStringToHanDate(formatter.format(date1));
	
	//그리드 타이틀 DB에서 읽어 오는 방식으로 변경 함
	ExcelTitle excelTitle = excelDataMgr.getExcelTitle(paramD);
	
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
<!--
<meta http-equiv=Content-Type content="text/html; charset=ks_c_5601-1987">
-->
<meta http-equiv="content-type" content="text/html; charset=euc-kr" />
<script language="javascript" type="text/javascript"  src="<%=ConstantUtil.SERVER_HOST%>/js/jquery-1.5.2.min.js"></script>
<!--[if gte mso 9]><xml>
 <o:DocumentProperties>
  <o:LastAuthor>912069</o:LastAuthor>
  <o:LastPrinted>2013-03-26T07:33:07Z</o:LastPrinted>
  <o:Created>2013-03-10T00:20:15Z</o:Created>
  <o:LastSaved>2013-03-26T07:33:08Z</o:LastSaved>
  <o:Version>11.9999</o:Version>
 </o:DocumentProperties>
</xml><![endif]-->
<style>
<!--table
	{mso-displayed-decimal-separator:"\.";
	mso-displayed-thousand-separator:"\,";}
@page
	{margin:.75in .68in .75in .42in;
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
	font-size:14.0pt;
	mso-number-format:"\@";
	text-align:center;}
.xl67
	{mso-style-parent:style0;
	font-size:14.0pt;
	mso-number-format:"\@";}
.xl68
	{mso-style-parent:style0;
	font-size:14.0pt;
	font-family:굴림, monospace;
	mso-font-charset:129;
	mso-number-format:"\@";}
.xl69
	{mso-style-parent:style0;
	font-size:15.0pt;
	font-family:굴림, monospace;
	mso-font-charset:129;
	mso-number-format:"\@";}
.xl70
	{mso-style-parent:style0;
	font-size:20.0pt;
	font-weight:700;
	mso-number-format:"\@";}
.xl71
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-family:굴림, monospace;
	mso-font-charset:129;
	mso-number-format:"\@";
	text-align:center;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl72
	{mso-style-parent:style0;
	font-family:굴림, monospace;
	mso-font-charset:129;
	mso-number-format:"\@";}
.xl73
	{mso-style-parent:style0;
	font-size:32.0pt;
	font-weight:700;
	mso-number-format:"\@";
	text-align:center;}
.xl74
	{mso-style-parent:style0;
	font-size:15.0pt;
	font-family:굴림, monospace;
	mso-font-charset:129;
	mso-number-format:"\@";
	text-align:center;}
.xl75
	{mso-style-parent:style0;
	font-size:14.0pt;
	font-family:굴림, monospace;
	mso-font-charset:129;
	mso-number-format:"\@";
	text-align:left;}
.xl76
	{mso-style-parent:style0;
	font-size:14.0pt;
	font-weight:700;
	font-family:굴림, monospace;
	mso-font-charset:129;
	mso-number-format:"\@";
	text-align:left;}
.xl77
	{mso-style-parent:style0;
	font-size:15.0pt;
	font-weight:700;
	font-family:굴림, monospace;
	mso-font-charset:129;
	mso-number-format:"\@";
	text-align:center;
	white-space:normal;}
.xl78
	{mso-style-parent:style0;
	font-size:15.0pt;
	font-family:굴림, monospace;
	mso-font-charset:129;
	mso-number-format:"\@";
	text-align:center;
	white-space:normal;}
.xl79
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-family:굴림, monospace;
	mso-font-charset:129;
	mso-number-format:"\@";
	text-align:center;
	border-top:1.0pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:1.0pt solid windowtext;}
.xl80
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-family:굴림, monospace;
	mso-font-charset:129;
	mso-number-format:"\@";
	text-align:center;
	border-top:1.0pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl81
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-family:굴림, monospace;
	mso-font-charset:129;
	mso-number-format:"\@";
	text-align:center;
	border-top:1.0pt solid windowtext;
	border-right:1.0pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl82
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-family:굴림, monospace;
	mso-font-charset:129;
	mso-number-format:"\@";
	text-align:center;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:1.0pt solid windowtext;}
.xl83
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-family:굴림, monospace;
	mso-font-charset:129;
	mso-number-format:"\@";
	text-align:center;
	border-top:none;
	border-right:1.0pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl84
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-family:굴림, monospace;
	mso-font-charset:129;
	mso-number-format:"\@";
	text-align:center;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:1.0pt solid windowtext;
	border-left:1.0pt solid windowtext;}
.xl85
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-family:굴림, monospace;
	mso-font-charset:129;
	mso-number-format:"\@";
	text-align:center;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:1.0pt solid windowtext;
	border-left:none;}
.xl86
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-family:굴림, monospace;
	mso-font-charset:129;
	mso-number-format:"\@";
	text-align:center;
	border-top:none;
	border-right:1.0pt solid windowtext;
	border-bottom:1.0pt solid windowtext;
	border-left:none;}
.xl87
	{mso-style-parent:style0;
	font-size:15.0pt;
	font-family:굴림, monospace;
	mso-font-charset:129;
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
       <x:ActiveRow>8</x:ActiveRow>
       <x:ActiveCol>10</x:ActiveCol>
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

<body link=blue vlink=purple class=xl65 id="printareabox">

<table x:str border=0 cellpadding=0 cellspacing=0 width=720 style='border-collapse:
 collapse;table-layout:fixed;width:541pt'>
 <col class=xl65 width=29 style='mso-width-source:userset;mso-width-alt:928;width:22pt'>
 <col class=xl65 width=100 style='mso-width-source:userset;mso-width-alt:3520;width:83pt'>
 <col class=xl65 width=73 style='mso-width-source:userset;mso-width-alt:2336;width:55pt'>
 <col class=xl65 width=72 span=4 style='width:54pt'>
 <col class=xl65 width=71 style='mso-width-source:userset;mso-width-alt:2272;width:53pt'>
 <col class=xl65 width=75 style='mso-width-source:userset;mso-width-alt:2464;width:58pt'>
 <col class=xl65 width=72 style='width:54pt'>  
 <col class=xl65 width=70 style='width:54pt'>
 <col class=xl65 width=5 style='width:10pt'>
 <tr height=66 style='height:49.5pt'>
  <td height=66 class=xl65 width=29 style='height:49.5pt;width:22pt'></td>
  <td colspan=8 class=xl73 width=619 style='width:465pt'>프라임 코리아</td>
  <td colspan=3 class=xl65 width=72 style='width:144pt' id="button">
  	<a href="#dummy" onclick="goPrint();return false;"><img src="<%=ConstantUtil.SERVER_HOST%>/images/button/btn_popup_form_1.gif" alt="인쇄하기" border=0 /></a>
  </td>
 </tr>
 <tr height=27 style='height:20.25pt'>
  <td height=27 class=xl65 style='height:20.25pt'></td>
  <td colspan=8 class=xl74>(www.prmna.pe.kr)</td>
  <td colspan=3 class=xl67></td>
 </tr>
 <tr height=27 style='height:20.25pt'>
  <td height=27 class=xl65 style='height:20.25pt'></td>
  <td colspan=8 class=xl66 style='mso-ignore:colspan'></td>
  <td colspan=3 class=xl67></td>
 </tr>
 <tr height=25 style='height:18.75pt'>
  <td height=25 class=xl65 style='height:18.75pt'></td>
  <td colspan=12 class=xl75>주소 : 서울시 송파구 백제고분로 41길 6-5(송파동, 4층)</td>
 </tr>
 <tr height=25 style='height:18.75pt'>
  <td height=25 class=xl65 style='height:18.75pt'></td>
  <td colspan=9 class=xl76>우편번호 : 1688-3880, 팩스 : 0505-323-2000, 전화 :
  02-516-6852</td>
  <td colspan=3 class=xl68></td>
 </tr>
 <tr height=27 style='height:20.25pt'>
  <td height=27 class=xl65 style='height:20.25pt'></td>
  <td colspan=12 class=xl67 style='mso-ignore:colspan'></td>
 </tr>
 

 <tr height=27 style='height:20.25pt'>
  <td height=27 class=xl65 style='height:20.25pt'></td>
  <td class=xl68 colspan=4 style='mso-ignore:colspan'>등록 날짜 : <%=registerDate%></td>
  <td colspan=9 class=xl67 style='mso-ignore:colspan'></td>
 </tr>

 
 <tr height=27 style='height:20.25pt'>
  <td height=27 class=xl65 style='height:20.25pt'></td>
  <td class=xl68 colspan=4 style='mso-ignore:colspan'>출력 날짜 : <%=DateUtils.getStringToHanDate(DateUtils.getToday())%></td>
  <td colspan=9 class=xl67 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=27 style='height:20.25pt'>
  <td height=27 class=xl65 style='height:20.25pt'></td>
  <td colspan=12 class=xl67 style='mso-ignore:colspan'></td>
 </tr>
<%
	//법인/면허 작업 시작
	String [] f4Str = StringUtil.stringTokenizer(excelData.getF4(),"<br>");

	if (f4Str.length > 0) {
%>
 <tr height=27 style='height:20.25pt'>
  <td height=27 class=xl65 style='height:20.25pt'></td>
  <td colspan=2 class=xl75 >* 법<span
  style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  </span>인<span style='mso-spacerun:yes'>&nbsp;&nbsp; </span>:</td>
  <td class=xl87 colspan=9 style='mso-ignore:colspan'><span
  style='mso-spacerun:yes'>&nbsp;&nbsp; </span><%=f4Str[0]%>년</td>
 </tr>
<%
	}

	if (f4Str.length > 1) {
%>
 <tr height=27 style='height:20.25pt'>
  <td height=27 class=xl65 style='height:20.25pt'></td>
  <td colspan=2 class=xl75>* 면<span
  style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  </span>허<span style='mso-spacerun:yes'>&nbsp;&nbsp; </span>:</td>
  <td class=xl87 colspan=9 style='mso-ignore:colspan'><span
  style='mso-spacerun:yes'>&nbsp;&nbsp; </span><%=f4Str[1]%>년</td>
 </tr>
<%
	}
%>
 <tr height=27 style='height:20.25pt'>
  <td height=27 class=xl65 style='height:20.25pt'></td>
  <td colspan=2 class=xl75 x:str="* 자     본       금   : ">* 자<span
  style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp; </span>본<span
  style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  </span>금<span style='mso-spacerun:yes'>&nbsp;&nbsp; </span>:</td>
  <td colspan=9 class=xl87><span style='mso-spacerun:yes'>&nbsp;&nbsp; </span><%= "".equals(excelData.getF5()) ? "" :  excelData.getF5() + "억"%></td>
 </tr>
 <tr height=27 style='height:20.25pt'>
  <td height=27 class=xl65 style='height:20.25pt'></td>
  <td colspan=2 class=xl75 x:str="* 지               역   : ">* 지<span
  style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  </span>역<span style='mso-spacerun:yes'>&nbsp;&nbsp; </span>:</td>
  <td class=xl87 colspan=9 ><span style='mso-spacerun:yes'>&nbsp;&nbsp; </span><%=excelData.getF3().replaceAll("<br>","/")%></td>
 </tr>
 <tr height=27 style='height:20.25pt'>
  <td height=27 class=xl65 style='height:20.25pt'></td>
  <td colspan=2 class=xl75>* 공제출자좌수<span
  style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>:</td>
  <td class=xl87 colspan=9 ><span style='mso-spacerun:yes'>&nbsp;&nbsp; </span><%=excelData.getF7().replaceAll("<br>","/")%></td>
 </tr>
 <tr height=27 style='height:20.25pt'>
  <td height=27 class=xl65 style='height:20.25pt'></td>
  <td colspan=2 class=xl75>* 공제조합잔액<span
  style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>:</td>
  <td class=xl87 colspan=9 ><span style='mso-spacerun:yes'>&nbsp;&nbsp; </span><%= "".equals(excelData.getF8()) ? "" :  excelData.getF8().replaceAll("<br>","/") + "억"%></td>
 </tr>
 <tr height=27 style='height:20.25pt'>
  <td height=27 class=xl65 style='height:20.25pt'></td>
  <td colspan=2 class=xl75 x:str="* 협                 회  : ">* 협<span
  style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  </span>회<span style='mso-spacerun:yes'>&nbsp; </span>:</td>
  <td class=xl87 colspan=9 ><span style='mso-spacerun:yes'>&nbsp;&nbsp; </span><%=excelData.getF16()%></td>
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
  <td colspan=2 class=xl75 x:str="* 시   공    능    력  : ">* 시<span
  style='mso-spacerun:yes'>&nbsp;&nbsp; </span>공<span
  style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp; </span>능<span
  style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp; </span>력<span
  style='mso-spacerun:yes'>&nbsp; </span>:</td>
  <td class=xl87 colspan=9 style='mso-ignore:colspan' x:str="   32억  "><span
  style='mso-spacerun:yes'>&nbsp;&nbsp; </span><%=f6SB.toString()%><span
  style='mso-spacerun:yes'>&nbsp;&nbsp;</span></td>
 </tr>
 <tr height=28 style='height:21.0pt'>
  <td height=28 class=xl65 style='height:21.0pt'></td>
  <td colspan=9 class=xl66 style='mso-ignore:colspan' align="right" >단위(억)</td>
  <td colspan=3 class=xl67 style='mso-ignore:colspan' ></td>
 </tr>
 <tr height=27 style='height:20.25pt'>
  <td height=27 class=xl65 style='height:20.25pt'></td>
<!--
  <td class=xl79>업종</td>
  <td class=xl80>첫해</td>
  <td class=xl80>둘째해</td>
  <td class=xl80>2010</td>
  <td class=xl80>2011</td>
  <td class=xl80>2012</td>
  <td class=xl80>3년합계</td>
  <td class=xl80>5년합계</td>
  <td class=xl80>2013</td>
  <td class=xl81>2014</td>
  <td class=xl67></td>
-->  
  <td class=xl79>업종</td>
  <td class=xl80><%=excelTitle.getFstYr()%></td>
  <td class=xl80><%=excelTitle.getScndYr()%></td>
  <td class=xl80><%=excelTitle.getF9()%></td>
  <td class=xl80><%=excelTitle.getF10()%></td>
  <td class=xl80><%=excelTitle.getF11()%></td>
  <td class=xl80><%=excelTitle.getF12()%></td>
  <td class=xl80><%=excelTitle.getSumOf5yr()%></td>
  <td class=xl80><%=excelTitle.getF13()%></td>
  <td class=xl80><%=excelTitle.getF14()%></td>
  <td class=xl67></td>
 </tr>
<%
	// 테이블 만들기
	//물건(업종)
	String [] f2Str = StringUtil.stringTokenizer(excelData.getF2(),"<br>");
	
	// 2014.02.20, 업종이 하나이고 나머지가 여러건일 수 있슴
	// 업종이 한건인 경우 나머지 필드는 그냥 보여줌
	// first_year
	String [] fstYrStr ;
	// second_year
	String [] scndYrStr;
	// 2009
	String [] f10Str ;
	// 2010
	String [] f11Str ;
	// 2011
	String [] f12Str ;
	// 3년합계
	String [] f13Str ;
	// 5년합계
	String [] sumOf5yrStr ;
	// 2012
	String [] f14Str ;
	// 2008 ==> 2013변경
	String [] f9Str  ;
	
	// 업종이 한건이지만 나머지 필드에 <br>로 되어 있으면 <tr>사이즈를 조정한다
	String trSize = "height=27 style='height:20.25pt'" ;
	int brSize = 27 ;
	int styieSize = 18 ;
	int brCount = 1 ;
	int tmpBrCount = 0 ;
		
	if ( f2Str.length == 1) {
		// first_year
		fstYrStr = new String[]{excelData.getFstYr()};
		if (excelData.getFstYr().indexOf("<br>") > 0) {
			tmpBrCount = StringUtil.stringTokenizer(excelData.getFstYr(),"<br>").length ;
			if (brCount < tmpBrCount) brCount = tmpBrCount ;
		}
			
		// second_year
		scndYrStr = new String[]{excelData.getScndYr()};
		if (excelData.getScndYr().indexOf("<br>") > 0){
			tmpBrCount = StringUtil.stringTokenizer(excelData.getScndYr(),"<br>").length ;
			if (brCount < tmpBrCount) brCount = tmpBrCount ;
		} 
		
		// 2009
		f10Str = new String[]{excelData.getF10()};
		if (excelData.getF10().indexOf("<br>") > 0){
			tmpBrCount = StringUtil.stringTokenizer(excelData.getF10(),"<br>").length ;
			if (brCount < tmpBrCount) brCount = tmpBrCount ;
		} 
		
		// 2010
		f11Str = new String[]{excelData.getF11()};
		if (excelData.getF11().indexOf("<br>") > 0) {
			tmpBrCount = StringUtil.stringTokenizer(excelData.getF11(),"<br>").length ;
			if (brCount < tmpBrCount) brCount = tmpBrCount ;
		} 
		
		// 2011
		f12Str = new String[]{excelData.getF12()};
		if (excelData.getF12().indexOf("<br>") > 0) {
			tmpBrCount = StringUtil.stringTokenizer(excelData.getF12(),"<br>").length ;
			if (brCount < tmpBrCount) brCount = tmpBrCount ;
		}
		
		// 3년합계
		f13Str = new String[]{excelData.getF13()};
		if (excelData.getF13().indexOf("<br>") > 0) {
			tmpBrCount = StringUtil.stringTokenizer(excelData.getF13(),"<br>").length ;
			if (brCount < tmpBrCount) brCount = tmpBrCount ;
		}
		
		// 5년합계
		sumOf5yrStr = new String[]{excelData.getSumOf5yr()};
		if (excelData.getSumOf5yr().indexOf("<br>") > 0) {
			tmpBrCount = StringUtil.stringTokenizer(excelData.getSumOf5yr(),"<br>").length ;
			if (brCount < tmpBrCount) brCount = tmpBrCount ;
		}
		
		// 2012
		f14Str = new String[]{excelData.getF14()};
		if (excelData.getF14().indexOf("<br>") > 0) {
			tmpBrCount = StringUtil.stringTokenizer(excelData.getF14(),"<br>").length ;
			if (brCount < tmpBrCount) brCount = tmpBrCount ;
		}
		
		// 2008 ==> 2013변경
		f9Str = new String[]{excelData.getF9()};
		if (excelData.getF9().indexOf("<br>") > 0) {
			tmpBrCount = StringUtil.stringTokenizer(excelData.getF9(),"<br>").length ;
			if (brCount < tmpBrCount) brCount = tmpBrCount ;
		}
		
		//trSize = new StringBuffer("height=" + (brSize*brCount) + " style='height:20.25pt'").toString();
		trSize = new StringBuffer("height=" + (brSize*brCount) + " style='height:" + (styieSize*brCount) + "pt'").toString();
	} else { 
	
		// first_year
		fstYrStr = StringUtil.stringTokenizer(excelData.getFstYr(),"<br>");
		// second_year
		scndYrStr = StringUtil.stringTokenizer(excelData.getScndYr(),"<br>");
		// 2009
		f10Str = StringUtil.stringTokenizer(excelData.getF10(),"<br>");
		// 2010
		f11Str = StringUtil.stringTokenizer(excelData.getF11(),"<br>");
		// 2011
		f12Str = StringUtil.stringTokenizer(excelData.getF12(),"<br>");
		// 3년합계
		f13Str = StringUtil.stringTokenizer(excelData.getF13(),"<br>");
		// 5년합계
		sumOf5yrStr = StringUtil.stringTokenizer(excelData.getSumOf5yr(),"<br>");
		// 2012
		f14Str = StringUtil.stringTokenizer(excelData.getF14(),"<br>");
		// 2008 ==> 2013변경
		f9Str = StringUtil.stringTokenizer(excelData.getF9(),"<br>");
	}

	ArrayList resultList = new ArrayList();

	for(int count=0 ; f2Str.length > count ;count++)
	{
		String [] showTable = new String[10] ;
		int showTableColumnIndex = 0 ;

		if (f2Str.length > count) showTable[showTableColumnIndex++] = f2Str[count];
		else showTable[showTableColumnIndex++] = "";
		//if (f6Str.length > count) showTable[showTableColumnIndex++] = f6Str[count];
		//else showTable[showTableColumnIndex++] = "";
		
		// 첫번째해
		if (fstYrStr.length > count) showTable[showTableColumnIndex++] = fstYrStr[count];
		else showTable[showTableColumnIndex++] = "";
		// 두번째해
		if (scndYrStr.length > count) showTable[showTableColumnIndex++] = scndYrStr[count];
		else showTable[showTableColumnIndex++] = "";
		
		if (f10Str.length > count) showTable[showTableColumnIndex++] = f10Str[count];
		else showTable[showTableColumnIndex++] = "";
		if (f11Str.length > count) showTable[showTableColumnIndex++] = f11Str[count];
		else showTable[showTableColumnIndex++] = "";
		if (f12Str.length > count) showTable[showTableColumnIndex++] = f12Str[count];
		else showTable[showTableColumnIndex++] = "";
		if (f13Str.length > count) showTable[showTableColumnIndex++] = f13Str[count];
		else showTable[showTableColumnIndex++] = "";
		//5년합계
		if (sumOf5yrStr.length > count) showTable[showTableColumnIndex++] = sumOf5yrStr[count];
		else showTable[showTableColumnIndex++] = "";
		
		if (f14Str.length > count) showTable[showTableColumnIndex++] = f14Str[count];
		else showTable[showTableColumnIndex++] = "";
		if (f9Str.length > count) showTable[showTableColumnIndex++] = f9Str[count];
		else showTable[showTableColumnIndex++] = "";

		resultList.add(showTable);
	}

	for(int count=0 ; resultList.size() > count ;count++)
	{
		String showT [] = (String[])resultList.get(count) ;
		int showTableColumnIndex = 0 ;

%>
<!--
 <tr height=27 style='height:20.25pt'>
 <td height=27 class=xl65 style='height:20.25pt'></td> 
-->
 <tr <%=trSize%>>
  <td class=xl65 ></td>
  <td class=xl82><%=showT[showTableColumnIndex++]%></td>
  <td class=xl71><%=showT[showTableColumnIndex++]%></td>
  <td class=xl71><%=showT[showTableColumnIndex++]%></td>
  <td class=xl71><%=showT[showTableColumnIndex++]%></td>
  <td class=xl71><%=showT[showTableColumnIndex++]%></td>
  <td class=xl71><%=showT[showTableColumnIndex++]%></td>
  <td class=xl71><%=showT[showTableColumnIndex++]%></td>
  <td class=xl71><%=showT[showTableColumnIndex++]%></td>
  <td class=xl71><%=showT[showTableColumnIndex++]%></td>
  <td class=xl71><%=showT[showTableColumnIndex++]%></td>
   <td class=xl67></td>
 </tr>
 
<%
	}
%>

 <tr height=22 style='height:16.5pt'>
  <td height=22 class=xl65 style='height:16.5pt;mso-ignore:colspan'></td>
  <td height=22 colspan=11 class=xl72 style='height:16.5pt;mso-ignore:colspan'>* 상기 실적은 상황에 따라 다소 차이가 있을수 있습니다</td>
 </tr>
 <tr height=22 style='height:16.5pt'>
  <td height=22 colspan=11 class=xl65 style='height:16.5pt;mso-ignore:colspan'></td>
 </tr>
 <tr height=27 style='height:20.25pt'>
  <td height=27 class=xl65 style='height:20.25pt'></td>
  <td colspan=8 class=xl77 width=619 style='width:465pt'>* 기타사항</td>
  <td colspan=3 class=xl67></td>
 </tr>
 <tr >
  <td class=xl65></td>
  <td colspan=8 class=xl78 width=619 style='width:465pt'><%=excelData.getF17()%></td>
  <td colspan=3 class=xl67></td>
 </tr>

 <tr height=27 style='height:20.25pt'>
  <td height=27 class=xl65 style='height:20.25pt'></td>
  <td colspan=12 class=xl67 style='mso-ignore:colspan'></td>
 </tr>
 <tr class=xl67 height=42 style='height:31.5pt'>
  <td height=42 class=xl67 style='height:31.5pt'></td>
  <td class=xl70 colspan=2 style='mso-ignore:colspan'
  x:str="양 도 가                            ">양 도 가<span
  style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span><span
  style='display:none'><span
  style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></span></td>
  <td colspan=11 class=xl70><span style='mso-spacerun:yes'>&nbsp;</span><%=excelData.getF15()%> (억)</td>
 </tr>
 <tr height=5 >
  <td height=5 class=xl65 ></td>
  <td class=xl72 colspan=3 style='mso-ignore:colspan'>&nbsp;</td>
  <td colspan=10 class=xl65 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=22 style='height:16.5pt'>
  <td height=22 class=xl65 style='height:16.5pt'></td>
  <td class=xl72 colspan=3 style='mso-ignore:colspan'>* 양도가는 수수료 별도입니다.</td>
  <td colspan=10 class=xl65 style='mso-ignore:colspan'></td>
 </tr>
 <![if supportMisalignedColumns]>
 <tr height=0 style='display:none'>
  <td width=29 style='width:22pt'></td>
  <td width=110 style='width:83pt'></td>
  <td width=73 style='width:55pt'></td>
  <td width=72 style='width:54pt'></td>
  <td width=72 style='width:54pt'></td>
  <td width=72 style='width:54pt'></td>
  <td width=72 style='width:54pt'></td>
  <td width=71 style='width:53pt'></td>
  <td width=77 style='width:58pt'></td>
  <td width=72 style='width:54pt'></td>
  <td width=77 style='width:58pt'></td>
  <td width=72 style='width:54pt'></td>
 </tr>
 <![endif]>
</table>

</body>

</html>
