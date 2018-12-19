<%@ page contentType="text/html;charset=utf-8" %>
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
<%@ include file="../common/_checkLoginSession.inc" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>

<script type="text/javascript">
  // ActiveX 사용가능 여부 체크
  var agt=navigator.userAgent.toLowerCase();
  if (agt.indexOf("msie") != -1) {
    try {
      request = new ActiveXObject("Microsoft.XMLHTTP");
      } catch (failed) {
      alert("인터넷 브라우저가 ActiveX 컨트롤을 차단하여 페이지가 올바르게 표시되지 않을 수 있습니다. 도움말 페이지로 이동합니다.");
      location.replace("security_help/security.html");
    }
  }
</script>


<!-- AceCounter Log Gathering Script V.7.5.2013010701 -->
<script language='javascript'>
	var _AceGID=(function(){var Inf=['dgc19.acecounter.com','8080','AR3T40740815618','CW','0','NaPm,Ncisy','ALL','0']; var _CI=(!_AceGID)?[]:_AceGID.val;var _N=0;var _T=new Image(0,0);if(_CI.join('.').indexOf(Inf[3])<0){ _T.src =( location.protocol=="https:"?"https://"+Inf[0]:"http://"+Inf[0]+":"+Inf[1]) +'/?cookie'; _CI.push(Inf);  _N=_CI.length; } return {o: _N,val:_CI}; })();
	var _AceCounter=(function(){var G=_AceGID;if(G.o!=0){var _A=G.val[G.o-1];var _G=( _A[0]).substr(0,_A[0].indexOf('.'));var _C=(_A[7]!='0')?(_A[2]):_A[3];	var _U=( _A[5]).replace(/\,/g,'_');var _S=((['<scr','ipt','type="text/javascr','ipt"></scr','ipt>']).join('')).replace('tt','t src="'+location.protocol+ '//cr.acecounter.com/Web/AceCounter_'+_C+'.js?gc='+_A[2]+'&py='+_A[4]+'&gd='+_G+'&gp='+_A[1]+'&up='+_U+'&rd='+(new Date().getTime())+'" t');document.writeln(_S); return _S;} })();
</script>
<noscript><img src='http://dgc19.acecounter.com:8080/?uid=AR3T40740815618&je=n&' border='0' width='0' height='0' alt=''></noscript>	
<!-- AceCounter Log Gathering Script End --> 

<%
  // 2016.04.28 DB 에서 정보 가져옴
  
  HashMap param = new HashMap();
	param.put( "userid", "root" );

	AdminMgr adminMgr = mgr.getAdminMgr();
	Admin admin = adminMgr.getAdmin( param );
%>

<head>
<title>▧▧ 하원건설정보 - 건설면허 양도양수 전문업체 ▨▧</title>
<meta http-equiv="content-type" content="text/html; charset=euc-kr" />
<link rel="stylesheet" type="text/css" href="<%=ConstantUtil.SERVER_HOST%>/share/css/base.css" />
<link rel="stylesheet" type="text/css" href="<%=ConstantUtil.SERVER_HOST%>/share/css/kais_kaml.css" />
<link rel="stylesheet" type="text/css" href="<%=ConstantUtil.SERVER_HOST%>/share/css/text.css" />
<link rel="stylesheet" type="text/css" href="<%=ConstantUtil.SERVER_HOST%>css/popup.css" />
<script language="javascript" type="text/javascript"  src="./js/jquery.min.js"></script>
<script language="javascript" type="text/javascript"  src="./js/popup.js"></script>
<script language="javascript" type="text/javascript"  src="./js/text.js"></script>
<style>
	.tt7{font-size:11px;FONT-WEIGHT: bold;color:#7E7E7E;font-family: "굴림,verdana";}
	.tt8{font-size:11px;FONT-WEIGHT: bold;color:#408FC9;font-family: "굴림,verdana";}
	.tt9{font-size:11px;FONT-WEIGHT: bold;color:#AEAAAA;font-family: "굴림,verdana";}
	.tt10{font-size:12px;FONT-WEIGHT: bold;color:#000000;font-family: "굴림,verdana";}
	.tt11{font-size:12px;FONT-WEIGHT: bold;color:#A24444;font-family: "굴림,verdana";}

.img-wrap {
  width: 250px;
  height: auto;
  position: relative;
  display: inline-block;
  overflow: hidden;
  border: 0;
  margin: 0;
}
</style>
</head>

<script language="JavaScript">
    <!--
        function setCookie( name, value, expiredays ) {
            var todayDate = new Date();
            todayDate.setDate( todayDate.getDate() + expiredays );
            document.cookie = name + "=" + escape( value ) + "; path=/; expires=" + todayDate.toGMTString() + ";"
        }
        function closePop() {
            if ( document.pop_form.chkbox.checked ){
                setCookie( "maindiv", "done" , 1 );
            }
            document.all['layer_popup'].style.visibility = "hidden";
        }
    //-->
</script>

<script type="text/javascript">

	var onChromeBrowser = false ;
	var onOverIE9Browser = false ;

	$(document).ready(function() {

		checkChromeBrowser();
		menuLink('10_01');

		$("#goToList").click(function()
        {
            //goToList();
            menuLink('10_01')
        });

		$("#goToAdmin").click(function()
        {
            goToAdmin();
        });
		
		$(".btn").click(function(){
		    $("#modal").removeAttr("class").addClass("three");
		});

		$(".close").click(function(){
		    $("#modal").addClass("out");
		});
	});

	function checkChromeBrowser()
	{
		if(navigator.userAgent.indexOf("Chrome") > -1 ||
		   navigator.userAgent.indexOf("Android") > -1
		) {
			onChromeBrowser = true ;
		}

		//alert(navigator.userAgent);

		// IE9 이상인경우
		if(
		   navigator.userAgent.indexOf("Mozilla/5.0") > -1
		) {
			onOverIE9Browser = true ;
		}
	}

	function goToList()
	{
		location.href="./main.jsp";
		//$("#content_view").load("./main.jsp");
	}

	function goHome()
	{
		$("#tit_main").text("건업양도양수 > ");
		$("#tit_sub").text("오시는길");
		$("#sub_title").html('<img src="./images/icon/title1_05.gif">');
		$("#content_view").load("./sub/sub1_05.jsp");
	}

	function goSite()
	{
		$("#tit_main").text("건업양도양수 > ");
		$("#tit_sub").text("관련사이트");
		$("#sub_title").html('<img src="./images/icon/title1_01.gif">');
		$("#content_view").load("./sub/sub1_01.jsp");
	}

	function goNotice()
	{
		$("#tit_main").text("건업양도양수 > ");
		$("#tit_sub").text("공지사항");
		//$("#sub_title").html('<img src="./images/icon/title1_01.gif">');
		$("#sub_title").html('<img src="./images/icon/notice_title_01.gif">');
		$("#content_view").load("./sub/sub11_01.jsp");
	}

	function goToAdmin()
	{
		//location.href="../common/login.jsp";
		location.href="../board/admin_search_list.jsp";
	}

	function goDownload(docName)
	{
		location.href="../form/" + docName;
	}

	function mainMenuOver(m){
		$("#sub1").hide();
		$("#sub2").hide();
		$("#sub3").hide();
		$("#sub4").hide();
		$("#sub5").hide();
		$("#sub6").hide();
		$("#sub7").hide();
		$("#sub8").hide();
		$("#sub"+m).show();
	}

	/*메뉴 link, 타이틀 출력 */
	function menuLink(m){

		var tit_main = "";
		var tit_sub = "";
		var m_url = "";


		switch(m){
			case  '10_01':
									//m_url		="sub10_01.jsp";
								 	tit_main	=" 건설업양도양수";
								 	//tit_sub		=" 양도리스트";
								 	tit_sub		=" 양도기업물건";
			break;
			case  '2_01':
									//m_url		="";
								 	tit_main	=" 양도양수구비서류";
								 	tit_sub		=" 양도시 구비서류";
			break;
			case  '2_02':
									//m_url		="";
								 	tit_main	=" 양도양수구비서류";
								 	tit_sub		=" M&A 구비서류";
			break;
			case  '3_01':
									//m_url		="";
								 	tit_main	=" 신규면허등록/주기적신고";
								 	tit_sub		=" 신규면허등록";
			break;
			case  '3_02':
									//m_url		="";
								 	tit_main	=" 신규면허등록/주기적신고";
								 	tit_sub		=" 건설업 면허분류";
			break;
			case  '3_03':
									//m_url		="";
								 	tit_main	=" 신규면허등록/주기적신고";
								 	tit_sub		=" 주기적신고";
			break;
			case  '4_01':
									//m_url		="";
								 	tit_main	=" 건설업면허분류";
								 	tit_sub		=" 일반건설업";
			break;
			case  '4_02':
									//m_url		="";
								 	tit_main	=" 건설업면허분류";
								 	tit_sub		=" 전문건설업";
			break;
			case  '4_03':
									//m_url		="";
								 	tit_main	=" 건설업면허분류";
								 	tit_sub		=" 전기건설업";
			break;
			case  '4_04':
									//m_url		="";
								 	tit_main	=" 건설업면허분류";
								 	tit_sub		=" 소방건설업";
			break;
			case  '4_05':
									//m_url		="";
								 	tit_main	=" 건설업면허분류";
								 	tit_sub		=" 주택건설업";
			break;
			case  '4_06':
									//m_url		="";
								 	tit_main	=" 건설업면허분류";
								 	tit_sub		=" 설비건설업";
			break;
			case  '5_01':
									//m_url		="";
								 	tit_main	=" 법인설립";
								 	tit_sub		=" 주식회사";
			break;
			case  '5_02':
									//m_url		="";
								 	tit_main	=" 법인설립";
								 	tit_sub		=" 유한회사";
			break;
			case  '5_03':
									//m_url		="";
								 	tit_main	=" 법인설립";
								 	tit_sub		=" 합명회사";
			break;
			case  '5_04':
									//m_url		="";
								 	tit_main	=" 법인설립";
								 	tit_sub		=" 합자회사";
			break;
			case  '6_01':
									//m_url		="";
								 	tit_main	=" 기업진단신청";
								 	tit_sub		=" 재무재표증명";
			break;
			case  '6_02':
									//m_url		="";
								 	tit_main	=" 기업진단신청";
								 	tit_sub		=" 구비서류";
			break;
			case  '6_03':
									//m_url		="";
								 	tit_main	=" 기업진단신청";
								 	tit_sub		=" 의뢰서";
			break;
			case  '7_01':
									//m_url		="";
								 	tit_main	=" 공제조합.출자금";
								 	tit_sub		=" 공제조합/출자금";
			break;
			case  '8_01':
									//m_url		="";
								 	tit_main	=" 기술자격증";
								 	tit_sub		=" 기술자격증";
			break;
			case  '8_02':
									//m_url		="";
								 	tit_main	=" 기술자격증";
								 	tit_sub		=" 인정기술자";
			break;
			}

			$("#location_view").show();

		$("#tit_main").text(tit_main +" > ");
		$("#tit_sub").text(tit_sub);
		$("#sub_title").html('<img src="./images/icon/title'+m+'.gif">');

		// 2014.12.23. chrome과  mobile에서 dhxgrid오류가 발행하여 분기 시킴
		var isChromeBrowser = 'N' ;
		if (m == '10_01' && onChromeBrowser ) isChromeBrowser = 'Y';
		$("#content_view").load("./sub/sub"+m+".jsp?isChromeBrowser=" + isChromeBrowser);


	}

	//menuLink();

	function downloadDoc(docFileName){
		$("#rfileName").attr("value", docFileName);
		$("#cfileName").attr("value", docFileName);

		$("#myformExcel").attr("action", "/servlet/product.dn");
		$("#myformExcel").attr("encoding", "application/x-www-form-urlencoded");
		$("#myformExcel").submit();
	}


</script>

<%!
  int todayCount = 0;
%>
<form name="myform" id="myform" method="post">
</form>

<form name="myformExcel" id="myformExcel" method="post" action="">
	<input type="hidden" id="fileType" name="fileType" value="product" />
	<input type="hidden" id="rfileName" name="rfileName" />
	<input type="hidden" id="cfileName" name="cfileName" />
</form>

<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
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
        			 * 오늘 카운트 증가
        			 */
        			if (0 == diff) {
        			  //out.print("2<br>");

          			//새로고침시 카운트증가를 방지!!
                if(session.getAttribute("member") == null){
                  session.setAttribute("member",";;");
          				todayCount++;
          				BufferedWriter bw = new BufferedWriter(new FileWriter(
          						today_file));
          				bw.write("" + todayCount);
          				bw.flush();
          				bw.close();
          				bw = null;
          			}
                /*
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
                */
        			}
        			/**
        			 * 1. history.txt에 방문자 기록 추가
        			 * 2. count.txt : 1으로 카운트 재설정
        			 */
        			else if (diff > 1) {
        				// 1.
        				BufferedWriter br1 = new BufferedWriter(new FileWriter(
        						history_file, true));
        				br1.newLine();
        				String newHistory = strFileDate + ":" + todayCount;
        				br1.write(newHistory, 0, newHistory.length());
        				br1.close();
        				// 2.
        				br1 = new BufferedWriter(new FileWriter(today_file));
        				br1.write("1");
        				br1.flush();
        				br1.close();
        				br1 = null;
        				/*
                todayCount = 1;

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
                */
        			}
        		} catch (Exception e) {
        		  out.print(e);
        		}
        %>
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
		<!--Top menu start-->
		<tr>
      <td valign="top" height="97" colspan="2" align="center" background="./images/main/top_bg.gif">
				<table width="0%" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td>
							<table width="100%" height="0%" border="0" cellspacing="0" cellpadding="0">
								<tr>
									<td width="250" >
										<a href="http://www.hawonmna.com" onfocus="this.blur()" border="0"><img src="./images/main/log_2_Blue.gif" border=0></a>
									</td>
									<td style="padding-top:15px">
										<table width="808" height="0%" border="0" cellspacing="0" cellpadding="0">
											<tr>
												<!--<td><img src="./images/main/m_01.gif" onmouseover="mainMenuOver('1')" onclick="menuLink('10_01')"></td> -->
												<td><img src="./images/main/m_01.gif" onmouseover="mainMenuOver('1')" onclick="menuLink('10_01')"></td>
												<td><img src="./images/main/m_02.gif" onmouseover="mainMenuOver('2')" onclick="menuLink('2_01')"></td>
												<td><img src="./images/main/m_03.gif" onmouseover="mainMenuOver('3')" onclick="menuLink('3_01')"></td>
												<td><img src="./images/main/m_04.gif" onmouseover="mainMenuOver('4')" onclick="menuLink('4_01')"></td>
												<td><img src="./images/main/m_05.gif" onmouseover="mainMenuOver('5')" onclick="menuLink('5_01')"></td>
												<td><img src="./images/main/m_06.gif" onmouseover="mainMenuOver('6')" onclick="menuLink('6_01')"></td>
												<td><img src="./images/main/m_07.gif" onmouseover="mainMenuOver('7')" onclick="menuLink('7_01')"></td>
												<td><img src="./images/main/m_08.gif" onmouseover="mainMenuOver('8')" onclick="menuLink('8_01')"></td>
											</tr>
											<tr>
												<td height="24" colspan="8" background="./images/main/m_bg.gif">
												<!--
													<div id="sub1" style="display:none;text-align:center;padding-top:3px">
													     <a href="#" onclick="menuLink('10_01')">건설업양도양수</a>
													</div>
												-->
													<div id="sub1" style="display:none;text-align:center;padding-top:3px">
														<a href="#" onclick="menuLink('10_01')">양도기업물건</a>
													</div>
													<div id="sub2"  style="display:none;text-align:center;padding-top:3px">
														<a href="#" onclick="menuLink('2_01')">양도시구비서류</a> |
														<a href="#" onclick="menuLink('2_02')">M&A구비서류</a>
													</div>
													<div id="sub3"  style="display:none;text-align:center;padding-top:3px">
														<a href="#" onclick="menuLink('3_01')">신규면허등록</a> |
														<a href="#" onclick="menuLink('3_02')">건설업 면허분류</a> |
														<a href="#" onclick="menuLink('3_03')">주기적 신고</a>
													</div>
													<div id="sub4"  style="display:none;text-align:center;padding-top:3px">
														<a href="#" onclick="menuLink('4_01')">일반건설업</a> |
														<a href="#" onclick="menuLink('4_02')">전문건설업</a> |
														<a href="#" onclick="menuLink('4_03')">전기공사업</a> |
														<a href="#" onclick="menuLink('4_04')">소방공사업</a> |
														<a href="#" onclick="menuLink('4_05')">주택건설업</a> |
														<a href="#" onclick="menuLink('4_06')">설비공사업</a>
													</div>
													<div id="sub5"  style="display:none;text-align:center;padding-top:3px">
														<a href="#" onclick="menuLink('5_01')">주식회사</a> |
														<a href="#" onclick="menuLink('5_02')">유한회사</a> |
														<a href="#" onclick="menuLink('5_03')">합명회사</a> |
														<a href="#" onclick="menuLink('5_04')">합자회사</a>
													</div>
													<div id="sub6"  style="display:none;text-align:center;padding-top:3px">
														<a href="#" onclick="menuLink('6_01')">재무재표증명</a> |
														<a href="#" onclick="menuLink('6_02')">구비서류</a> |
														<a href="#" onclick="menuLink('6_03')">의뢰서</a>
													</div>
													<div id="sub7"  style="display:none;text-align:center;padding-top:3px">
														<a href="#" onclick="menuLink('7_01')">공제조합/출자금</a>
													</div>
													<div id="sub8"  style="display:none;text-align:center;padding-top:3px">
														<a href="#" onclick="menuLink('8_01')">기술자격증</a> |
														<a href="#" onclick="menuLink('8_02')">인정기술자</a>
													</div>
												</td>
											</tr>
										</table>
									</td>
								</tr>
							</table>
						</td>
					</tr>
				</table>
			</td>
		</tr>
		<!--Top menu end-->
		<tr>
			<td align="center">
				<table width="0%" border="0" cellspacing="0" cellpadding="0" align="center">
					<tr>
						<td width="250" valign="top">
							<!--배너 start-->
							<%@ include file="./inc/banner_new2.jsp" %>
							<!--배너 end-->
						</td>
						<td align="left" valign="top">
							<!--타이틀 start-->
							<table width="800" border="0" cellspacing="0" cellpadding="0" id="location_view">
								<tr>
									<td>
										<table width="100%" border="0" cellspacing="0" cellpadding="0">
											<tr>
												<td><img src="./images/icon/titleic.gif" width="31" height="40"></td>
												<td id="sub_title"></td>
												<td align="right" style="padding:8 10 3" valign="bottom">
													<table width="0%" border="0" cellspacing="0" cellpadding="0">
														<tr>
															<td><img src="./images/icon/home.gif"></td>
															<td class="loc_"> > </td>
															<td class="loc_" id="tit_main"></td>
															<td class="loc_b" id="tit_sub"></td>
														</tr>
													</table>
												</td>
												<td width="10"></td>
											</tr>
										</table>
									</td>
								</tr>
								<tr>
									<td height="7" colspan="2" background="./images/icon/tib.gif"></td>
								</tr>
								<tr>
									<td height="10" colspan="2"></td>
								</tr>
							<!--타이틀 end-->
							<!--Contents start-->
							</table>
							<table width="780" border="0" cellspacing="0" cellpadding="0">
								<!--타이틀 end-->
								<tr>
									<td id="content_view"></td>
								</tr>
							<!--Contents start-->
							</table>
						</td>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td height="20" colspan="2">&nbsp;</td>
		</tr>
		<!--buttom start-->
		<tr>
 			<td background="./images/main/bottom_bg_1.gif"> 
<!--			<td >-->
				<table width="0%" height="95" border="0" cellspacing="0" cellpadding="0" align="center">
					<tr>
						<td><div ><img src="./images/main/bottom_1.gif" width=204px /></div></td>
						<td>
							<table width="850" border="0" cellspacing="0" cellpadding="0">
								<tr height="40"><td colspan="4"></td></tr>
								<tr>
									<td class="tt9" colspan="3">
										상호: <%=admin.getCmpnNm()%><!-- 프라임코리아 -->&nbsp;&nbsp;&nbsp;
										대표: <%=admin.getName()%>&nbsp;&nbsp;&nbsp;
										이메일:<%=admin.getEmail()%>
									</td>
									<td class="tt4" id="goToAdmin">
										<a href="#" onfocus="this.blur()">[ 관리자 ]</a>
									</td>
								</tr>
								<tr>
									<td class="tt9" colspan="3">
										[주소] <%=admin.getCmpnAddr()%>&nbsp;&nbsp;&nbsp;
<%-- 										사업자번호: <%=admin.getCompanyNumber()%>&nbsp;&nbsp;&nbsp; --%>
									</td>
									<td>
										<table width="0%" border="0" cellspacing="0" cellpadding="0" >
											<tr>
												<td class="tt10">TEL:</td>
												<td class="tt11"> <%=admin.getCmpnTel()%>&nbsp;</td>
												<td class="tt10">FAX:</td>
												<td class="tt11"> <%=admin.getCmpnFax()%> </td>
											</tr>
										</table>
									</td>
								</tr>
							</table>
						</td>
					</tr>
				</table>
			</td>
		</tr>
		<!--buttom end-->
	</table>
</body>
</html>

