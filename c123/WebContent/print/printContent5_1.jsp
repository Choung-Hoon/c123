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
<html xmlns:v="urn:schemas-microsoft-com:vml"
xmlns:o="urn:schemas-microsoft-com:office:office"
xmlns:x="urn:schemas-microsoft-com:office:excel"
xmlns="http://www.w3.org/TR/REC-html40">

<head>
<meta name=ProgId content=Excel.Sheet>
<meta name=Generator content="Microsoft Excel 12">
<meta http-equiv="content-type" content="text/html; charset=euc-kr" />
<script language="javascript" type="text/javascript"  src="<%=ConstantUtil.SERVER_HOST%>/js/jquery-1.5.2.min.js"></script>

<!--[if !mso]>
<style>
v\:* {behavior:url(#default#VML);}
o\:* {behavior:url(#default#VML);}
x\:* {behavior:url(#default#VML);}
.shape {behavior:url(#default#VML);}
</style>
<![endif]-->
<style>
<!--table
	{mso-displayed-decimal-separator:"\.";
	mso-displayed-thousand-separator:"\,";}
@page
	{margin:.75in .68in .75in .42in;
	mso-header-margin:.3in;
	mso-footer-margin:.3in;}
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

<script language="JavaScript"  type="text/javascript">
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

<table border=0 cellpadding=0 cellspacing=0 width=921 style='border-collapse:
 collapse;table-layout:fixed;width:694pt'>
 <col class=xl65 width=29 style='mso-width-source:userset;mso-width-alt:928;
 width:22pt'>
 <col class=xl65 width=110 style='mso-width-source:userset;mso-width-alt:3520;
 width:83pt'>
 <col class=xl65 width=73 style='mso-width-source:userset;mso-width-alt:2336;
 width:55pt'>
 <col class=xl65 width=63 style='mso-width-source:userset;mso-width-alt:2016;
 width:47pt'>
 <col class=xl65 width=62 span=3 style='mso-width-source:userset;mso-width-alt:
 1984;width:47pt'>
 <col class=xl65 width=63 style='mso-width-source:userset;mso-width-alt:2016;
 width:47pt'>
 <col class=xl65 width=66 style='mso-width-source:userset;mso-width-alt:2112;
 width:50pt'>
 <col class=xl65 width=62 style='mso-width-source:userset;mso-width-alt:1984;
 width:47pt'>
 <col class=xl65 width=53 style='mso-width-source:userset;mso-width-alt:1696;
 width:40pt'>
 <col class=xl65 width=72 style='width:54pt'>
 <col class=xl65 width=72 span=2 style='width:54pt'>
 <tr height=66 style='height:49.5pt'>
  <td height=66 class=xl65 width=29 style='height:49.5pt;width:22pt'><a name="Print_Area"></a></td>
  <td colspan=8 height=66 width=561 style='height:49.5pt;width:423pt' align=left valign=top>
  <table cellpadding=0 cellspacing=0>
   <tr>
    <td colspan=8 height=66 class=xl76 width=561 style='height:49.5pt;width:423pt'>프라임 코리아</td>
   </tr>
  </table>
  </span></td>
  <td colspan=3 class=xl65 width=187 style='width:141pt'></td>
  <td class=xl65 width=72 style='width:54pt' id=button>
  	<a href="#dummy" onclick="goPrint();return false;"><img src="<%=ConstantUtil.SERVER_HOST%>/images/button/btn_popup_form_1.gif" alt="인쇄하기" border=0 /></a>
  </td>
  <td class=xl65 width=72 style='width:54pt'></td>
 </tr>
 <tr height=27 style='height:20.25pt'>
  <td height=27 class=xl65 style='height:20.25pt'></td>
  <td colspan=8 class=xl77>(www.prmna.pe.kr)</td>
  <td colspan=3 class=xl66></td>
  <td colspan=2 class=xl65 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=27 style='height:20.25pt'>
  <td height=27 class=xl65 style='height:20.25pt'></td>
  <td colspan=8 class=xl67 style='mso-ignore:colspan'></td>
  <td colspan=3 class=xl66></td>
  <td colspan=2 class=xl65 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=25 style='height:18.75pt'>
  <td height=25 class=xl65 style='height:18.75pt'></td>
  <td colspan=12 class=xl78>주소 : 서울시 송파구 가락로 206, 4층(송파동, 장수빌딩)</td>
  <td class=xl65></td>
 </tr>
 <tr height=25 style='height:18.75pt'>
  <td height=25 class=xl65 style='height:18.75pt'></td>
  <td colspan=8 class=xl79>우편번호 : 1688-3880, 팩스 : 0505-323-2000, 전화 :
  02-516-6852</td>
  <td colspan=3 class=xl68></td>
  <td colspan=2 class=xl65 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=27 style='height:20.25pt'>
  <td height=27 class=xl65 style='height:20.25pt'></td>
  <td colspan=12 class=xl66 style='mso-ignore:colspan'></td>
  <td class=xl65></td>
 </tr>
 <tr height=27 style='height:20.25pt'>
  <td height=27 class=xl65 style='height:20.25pt'></td>
  <td class=xl68 colspan=3 style='mso-ignore:colspan'>날 짜 : 2014년 02월 17일</td>
  <td colspan=9 class=xl66 style='mso-ignore:colspan'></td>
  <td class=xl65></td>
 </tr>
 <tr height=27 style='height:20.25pt'>
  <td height=27 class=xl65 style='height:20.25pt'></td>
  <td colspan=12 class=xl66 style='mso-ignore:colspan'></td>
  <td class=xl65></td>
 </tr>
 <tr height=26 style='height:19.5pt'>
  <td height=26 class=xl65 style='height:19.5pt'></td>
  <td colspan=2 class=xl78>* 법<span style='mso-spacerun:yes'>               
  </span>인<span style='mso-spacerun:yes'>   </span>:</td>
  <td class=xl69 colspan=2 style='mso-ignore:colspan'><span
  style='mso-spacerun:yes'>   </span>02년</td>
  <td colspan=7 class=xl69 style='mso-ignore:colspan'></td>
  <td colspan=2 class=xl65 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=26 style='height:19.5pt'>
  <td height=26 class=xl65 style='height:19.5pt'></td>
  <td colspan=2 class=xl78>* 면<span style='mso-spacerun:yes'>               
  </span>허<span style='mso-spacerun:yes'>   </span>:</td>
  <td class=xl69 colspan=2 style='mso-ignore:colspan'><span
  style='mso-spacerun:yes'>   </span>06년</td>
  <td colspan=7 class=xl69 style='mso-ignore:colspan'></td>
  <td colspan=2 class=xl65 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=26 style='height:19.5pt'>
  <td height=26 class=xl65 style='height:19.5pt'></td>
  <td colspan=2 class=xl78>* 자<span style='mso-spacerun:yes'>     </span>본<span
  style='mso-spacerun:yes'>       </span>금<span style='mso-spacerun:yes'>  
  </span>:<span style='mso-spacerun:yes'> </span></td>
  <td colspan=9 class=xl69><span style='mso-spacerun:yes'>   </span>5억</td>
  <td colspan=2 class=xl65 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=26 style='height:19.5pt'>
  <td height=26 class=xl65 style='height:19.5pt'></td>
  <td colspan=2 class=xl78>* 지<span style='mso-spacerun:yes'>              
  </span>역<span style='mso-spacerun:yes'>   </span>:<span
  style='mso-spacerun:yes'> </span></td>
  <td colspan=9 class=xl69><span style='mso-spacerun:yes'>   </span>지방</td>
  <td colspan=2 class=xl65 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=26 style='height:19.5pt'>
  <td height=26 class=xl65 style='height:19.5pt'></td>
  <td colspan=2 class=xl78>* 공제출자좌수<span style='mso-spacerun:yes'>      
  </span>:</td>
  <td colspan=9 class=xl69><span style='mso-spacerun:yes'>   </span>115</td>
  <td colspan=2 class=xl65 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=26 style='height:19.5pt'>
  <td height=26 class=xl65 style='height:19.5pt'></td>
  <td colspan=2 class=xl78>* 공제조합잔액<span style='mso-spacerun:yes'>      
  </span>:</td>
  <td colspan=9 class=xl69><span style='mso-spacerun:yes'>   </span>0.41억</td>
  <td colspan=2 class=xl65 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=26 style='height:19.5pt'>
  <td height=26 class=xl65 style='height:19.5pt'></td>
  <td colspan=2 class=xl78>* 협<span style='mso-spacerun:yes'>                
  </span>회<span style='mso-spacerun:yes'>  </span>:<span
  style='mso-spacerun:yes'> </span></td>
  <td colspan=9 class=xl69><span style='mso-spacerun:yes'>   </span>가입</td>
  <td colspan=2 class=xl65 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=26 style='height:19.5pt'>
  <td height=26 class=xl65 style='height:19.5pt'></td>
  <td colspan=2 class=xl78>* 시<span style='mso-spacerun:yes'>   </span>공<span
  style='mso-spacerun:yes'>    </span>능<span style='mso-spacerun:yes'>   
  </span>력<span style='mso-spacerun:yes'>  </span>:<span
  style='mso-spacerun:yes'> </span></td>
  <td class=xl69 colspan=2 style='mso-ignore:colspan'><span
  style='mso-spacerun:yes'>   </span>32억<span
  style='mso-spacerun:yes'>  </span></td>
  <td colspan=7 class=xl69 style='mso-ignore:colspan'></td>
  <td colspan=2 class=xl65 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=28 style='height:21.0pt'>
  <td height=28 class=xl65 style='height:21.0pt'></td>
  <td class=xl67>단위(억)</td>
  <td colspan=8 class=xl67 style='mso-ignore:colspan'></td>
  <td colspan=3 class=xl66 style='mso-ignore:colspan'></td>
  <td class=xl65></td>
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
  <td class=xl70>업종</td>
  <td class=xl71>2008</td>
  <td class=xl71>2009</td>
  <td class=xl71>2010</td>
  <td class=xl71>2011</td>
  <td class=xl71>2012</td>
  <td class=xl71>3년합<br>
    -----<br>
    정 렬</td>
  <td class=xl71>5년합</td>
  <td class=xl71>2013</td>
  <td class=xl71>2014</td>
  <td class=xl66></td>
  <td colspan=2 class=xl65 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=27 style='height:20.25pt'>
  <td height=27 class=xl65 style='height:20.25pt'></td>
  <td class=xl72>철콘</td>
  <td class=xl73>　</td>
  <td class=xl73>　</td>
  <td class=xl73>0.6</td>
  <td class=xl73>4.7</td>
  <td class=xl73>0.39</td>
  <td class=xl73>5.69</td>
  <td class=xl73>　</td>
  <td class=xl73>6</td>
  <td class=xl73>　</td>
  <td class=xl66></td>
  <td colspan=2 class=xl65 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=27 style='height:20.25pt'>
  <td height=27 class=xl65 style='height:20.25pt'></td>
  <td class=xl72>시설물</td>
  <td class=xl73>　</td>
  <td class=xl73>　</td>
  <td class=xl73>2.5</td>
  <td class=xl73>1.5</td>
  <td class=xl73>10</td>
  <td class=xl73>14</td>
  <td class=xl73>　</td>
  <td class=xl73>20</td>
  <td class=xl73>　</td>
  <td class=xl66></td>
  <td colspan=2 class=xl65 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=22 style='height:16.5pt'>
  <td height=22 class=xl65 style='height:16.5pt'></td>
  <td class=xl74 colspan=6 style='mso-ignore:colspan'>* 상기 실적은 상황에 따라 다소 차이가
  있을수 있습니다</td>
  <td colspan=5 class=xl74 style='mso-ignore:colspan'></td>
  <td colspan=2 class=xl65 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=22 style='height:16.5pt'>
  <td height=22 colspan=14 class=xl65 style='height:16.5pt;mso-ignore:colspan'></td>
 </tr>
 <tr height=27 style='height:20.25pt'>
  <td height=27 class=xl65 style='height:20.25pt'></td>
  <td colspan=8 class=xl80 width=561 style='width:423pt'>* 기타사항</td>
  <td colspan=3 class=xl66></td>
  <td colspan=2 class=xl65 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=27 style='height:20.25pt'>
  <td height=27 class=xl65 style='height:20.25pt'></td>
  <td colspan=8 class=xl81 width=561 style='width:423pt'>행정처분 없음<br>
    14년 중반 갱신예정<br>
    12년 현금 및 자체 결산<br>
    13년 현금결산 2월말종료<br>
    14년 10억 진행중 3월말 안료 예정<br>
    연차공사 3억 15년 상반기완료예정<br>
    </td>
  <td colspan=3 class=xl66></td>
  <td colspan=2 class=xl65 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=27 style='height:20.25pt'>
  <td height=27 class=xl65 style='height:20.25pt'></td>
  <td colspan=12 class=xl66 style='mso-ignore:colspan'></td>
  <td class=xl65></td>
 </tr>
 <tr class=xl66 height=42 style='height:31.5pt'>
  <td height=42 class=xl66 style='height:31.5pt'></td>
  <td class=xl75 colspan=2 style='mso-ignore:colspan'>양 도 가<span
  style='mso-spacerun:yes'>        </span><span style='display:none'><span
  style='mso-spacerun:yes'>                    </span></span></td>
  <td colspan=11 class=xl75><span style='mso-spacerun:yes'> </span>2.1 (억)</td>
 </tr>
 <tr height=22 style='height:16.5pt'>
  <td height=22 class=xl65 style='height:16.5pt'></td>
  <td colspan=3 class=xl74 style='mso-ignore:colspan'></td>
  <td colspan=10 class=xl65 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=22 style='height:16.5pt'>
  <td height=22 class=xl65 style='height:16.5pt'></td>
  <td class=xl74 colspan=3 style='mso-ignore:colspan'>* 양도가는 수수료 별도입니다.</td>
  <td colspan=10 class=xl65 style='mso-ignore:colspan'></td>
 </tr>
 <![if supportMisalignedColumns]>
 <tr height=0 style='display:none'>
  <td width=29 style='width:22pt'></td>
  <td width=110 style='width:83pt'></td>
  <td width=73 style='width:55pt'></td>
  <td width=63 style='width:47pt'></td>
  <td width=62 style='width:47pt'></td>
  <td width=62 style='width:47pt'></td>
  <td width=62 style='width:47pt'></td>
  <td width=63 style='width:47pt'></td>
  <td width=66 style='width:50pt'></td>
  <td width=62 style='width:47pt'></td>
  <td width=53 style='width:40pt'></td>
  <td width=72 style='width:54pt'></td>
  <td width=72 style='width:54pt'></td>
  <td width=72 style='width:54pt'></td>
 </tr>
 <![endif]>
</table>

</body>

</html>
