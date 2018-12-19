<html>
<head>
<title>▨▧프라임코리아-건설면허 양도양수 전문업체▨▧</title>
<meta http-equiv="content-type" content="text/html; charset=euc-kr" />
<link rel="stylesheet" type="text/css" href="./share/css/text.css" />
<script language="javascript" type="text/javascript"  src="./js/jquery-1.5.2.min.js"></script>
<style>
	.tt7{font-size:11px;FONT-WEIGHT: bold;color:#7E7E7E;font-family: "굴림,verdana";}
	.tt8{font-size:11px;FONT-WEIGHT: bold;color:#408FC9;font-family: "굴림,verdana";}
	.tt9{font-size:11px;FONT-WEIGHT: bold;color:#AEAAAA;font-family: "굴림,verdana";}
	.tt10{font-size:12px;FONT-WEIGHT: bold;color:#000000;font-family: "굴림,verdana";}
	.tt11{font-size:12px;FONT-WEIGHT: bold;color:#A24444;font-family: "굴림,verdana";}
</style>
</head>
<script type="text/javascript">

	$(document).ready(function() {

		$("#goToList").click(function()
        {
            goToList();
        });

		$("#goToAdmin").click(function()
        {
            goToAdmin();
        });


	});

	function goToList()
	{
		location.href="main.jsp";border="1"
	}

	function goToAdmin()
	{
		//location.href="../common/login.jsp";
		location.href="../board/admin_search_list.jsp";
	}
	/*메뉴 link, 타이틀 출력 */
	
	function menuLink(m){
		
		var tit_main = "";
		var tit_sub = "";
		var m_url = "";
		
		
		switch(m){
			case '1_01': 
									//m_url		="sub1_01.jsp";
								 	tit_main	="건설업양도양수";
								 	tit_sub		="양도리스";
			break;
			case '2_01': 
									//m_url		="";
								 	tit_main	="양도양수구비서류";
								 	tit_sub		="양도시 구비서류";		
			break;
			case '2_02': 
									//m_url		="";
								 	tit_main	="양도양수구비서류";
								 	tit_sub		="M&A 구비서류";		
			break;			
			case '3_01': 
									//m_url		="";
								 	tit_main	="신규면허등록/주기적신고";
								 	tit_sub		="신규면허등록";		
			break;
			case '3_02': 
									//m_url		="";
								 	tit_main	="신규면허등록/주기적신고";
								 	tit_sub		="건설업 면허분류";		
			break;	
			case '3_03': 
									//m_url		="";
								 	tit_main	="신규면허등록/주기적신고";
								 	tit_sub		="주기적신고";		
			break;					
			case '4_01': 
									//m_url		="";
								 	tit_main	="건설업면허분류";
								 	tit_sub		="일반건설업";		
			break;
			case '4_02': 
									//m_url		="";
								 	tit_main	="건설업면허분류";
								 	tit_sub		="전문건설업";		
			break;
			case '4_03': 
									//m_url		="";
								 	tit_main	="건설업면허분류";
								 	tit_sub		="전기건설업";		
			break;
			case '4_04': 
									//m_url		="";
								 	tit_main	="건설업면허분류";
								 	tit_sub		="소방건설업";		
			break;
			case '4_05': 
									//m_url		="";
								 	tit_main	="건설업면허분류";
								 	tit_sub		="주택건설업";		
			break;												
			case '4_06': 
									//m_url		="";
								 	tit_main	="건설업면허분류";
								 	tit_sub		="설비건설업";		
			break;			
			case '5_01': 
									//m_url		="";
								 	tit_main	="법인설립";
								 	tit_sub		="주식회사";		
			break;
			case '5_02': 
									//m_url		="";
								 	tit_main	="법인설립";
								 	tit_sub		="유한회사";		
			break;
			case '5_03': 
									//m_url		="";
								 	tit_main	="법인설립";
								 	tit_sub		="합명회사";		
			break;
			case '5_04': 
									//m_url		="";
								 	tit_main	="법인설립";
								 	tit_sub		="합자회사";		
			break;									
			case '6_01': 
									//m_url		="";
								 	tit_main	="기업진단신청";
								 	tit_sub		="재무재표증명";		
			break;
			case '6_02': 
									//m_url		="";
								 	tit_main	="기업진단신청";
								 	tit_sub		="구비서류";		
			break;
			case '6_03': 
									//m_url		="";
								 	tit_main	="기업진단신청";
								 	tit_sub		="의뢰서";		
			break;			
			case '7_01': 
									//m_url		="";
								 	tit_main	="공제조합.출자금";
								 	tit_sub		="공제조합/출자금";		
			break;
			case '8_01': 
									//m_url		="";
								 	tit_main	="기술자격증";
								 	tit_sub		="기술자격증";		
			break;
			case '8_02': 
									//m_url		="";
								 	tit_main	="기술자격증";
								 	tit_sub		="인정기술자";		
			break;															
			default:
									//m_url		="sub1_01.jsp";
								 	tit_main	="건설업양도양수";
								 	tit_sub		="양도리스";			
			 break;
			 
			 
			}
		
		$("#tit_main").text(tit_main);
		$("#tit_sub").text(tit_sub);
		$("#content_view").load("./sub"+m+".jsp");
	}

	
	
</script>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
	<table width="100%" border="1" cellspacing="0" cellpadding="0">
		<tr>
			<td align="left">
				<table border="1" cellspacing="0" cellpadding="0">
					<tr>
						<td>
							<table width="100%" border="1" cellspacing="0" cellpadding="0" background="./images/main/top_bg.gif">
								<tr>
									<td width="250" valign="top">
										<table width="100%" border="1" cellspacing="0" cellpadding="0">
											<tr>
												<td colspan="2">
													<!--Top start-->
													
													<table height="85" height="0%" border="1" cellspacing="0" cellpadding="0">
															<tr>
																<td width="250" >
																		<img src="./images/main/log.gif">
																</td>
																<td style="top-padding:15px">
																	<table height="100%" height="0%" border="1" cellspacing="0" cellpadding="0">
																		<tr>
																			<td><img src="./images/main/m_01.gif" click="menuLink('1_01')"></td>
																			<td><img src="./images/main/m_02.gif" click="menuLink('2_01')"></td>
																			<td><img src="./images/main/m_03.gif" click="menuLink('3_01')"></td>
																			<td><img src="./images/main/m_04.gif" click="menuLink('4_01')"></td>
																			<td><img src="./images/main/m_05.gif" click="menuLink('5_01')"></td>
																			<td><img src="./images/main/m_06.gif" click="menuLink('6_01')"></td>
																			<td><img src="./images/main/m_07.gif" click="menuLink('7_01')"></td>
																			<td><img src="./images/main/m_08.gif" click="menuLink('8_01')"></td>																			
																		</tr>
																		<tr>
																				<td height="32" colspan="8" background="./images/main/m_bg.gif">&nbsp;aaaa</td>
																		</tr>
																	</table>
																</td>
															</tr>													
													</table>
													<!--Top end-->
												</td>
											</tr>
											<tr>
												<td valign="top">
													<!--배너 start-->
													<%@ include file="./inc/banner.jsp" %>			
													<!--배너 end-->
												</td>
												<td align="right" valign="top">
													<!--타이틀 start-->
													<table width="700" border="1" cellspacing="0" cellpadding="0" background="./images/main/top_bg.gif">
														<tr>
															<td>&nbsp;</td>
															<td width="200">
																<table width="0%" border="1" cellspacing="0" cellpadding="0">
																	<tr>
																		<td><img src="./images/icon/home.gif"></td>
																		<td class="loc_"> > </td>
																		<td class="loc_" id="tit_main"></td>
																		<td class="loc_b" id="tit_sub"></td>
																	</tr>
																</table>
															</td>
														</tr>
													</table>
													<!--타이틀 end-->	
													<div id="content_view">
													<!--Contents start-->
																			