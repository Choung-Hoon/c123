<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import="kr.go.seoul.ssf.common.config.*" %> 
<%@ page import="kr.go.seoul.ssf.bean.*" %> 
<%@ page import="kr.go.seoul.ssf.manager.*" %> 
<%@ page import="kr.go.seoul.ssf.common.util.*" %>
<%@ page import="kr.go.seoul.ssf.common.servlet.*" %>
<%@ page import="kr.go.seoul.ssf.session.*" %>
<%@ page import="java.util.*" %>

<%@ page errorPage="../common/error.jsp" %>
<%@ include file="../common/_includeInit.inc" %>
<%@ include file="../common/_includeCommon.inc" %>
<%@ include file="../common/_checkLogin.inc" %> 
<%
		int currentPage = 1;	
		int listSize = 10;
		int totalCount = 0;
		int totalPage = 1;
		
		// 현재 페이지
		String strCurrentPage = request.getParameter("pageNum");	
		if( strCurrentPage ==  null || strCurrentPage.equals("") || strCurrentPage.equals("0") ) {
			currentPage = 1;
		} else {
			currentPage = Integer.parseInt(strCurrentPage);
		}	
		
		// 페이지 리스트 갯수
		String strListSize = request.getParameter( "listSize" );
		if( strListSize == null || strListSize.equals("") )
			listSize = 10;
		else 
			listSize = Integer.parseInt(strListSize);
		
		// 검색 조건 가져오기	
		String searchUserID =  request.getParameter( "userID" );
		if( searchUserID == null || searchUserID.equals("null") ) 
			searchUserID = "";
		
		String searchUserName = request.getParameter( "userName" );
		if( searchUserName == null || searchUserName.equals("null") ) 
			searchUserName = "";
		
		String searchUserType = request.getParameter( "userType" );
		if( searchUserType == null || searchUserType.equals("null") ) 
			searchUserType = "";
		
		
		String searchSDate = request.getParameter( "sDate" );
		if( searchSDate == null || searchSDate.equals("null") ){
		
			String YYYY = "";
		   	String MM = "";
		   	String DD = "";
				
				Calendar cal = Calendar.getInstance ( );//오늘 날짜를 기준으루..
				cal.add ( cal.MONTH, -1 ); //1개월 전....
				
				YYYY = cal.get ( cal.YEAR )+".";
				
				if(cal.get ( cal.MONTH ) + 1 < 10 )
					MM = "0"+(cal.get ( cal.MONTH ) + 1)+".";
				else
					MM = (cal.get ( cal.MONTH ) + 1)+".";
				
				if(cal.get ( cal.DATE ) < 10 )
					DD = "0"+cal.get ( cal.DATE );
				else
				 	DD = cal.get ( cal.DATE )+"";
				
				searchSDate = YYYY+MM+DD;
			
		} 
		
		String searchEDate = request.getParameter( "eDate" );
		if( searchEDate == null || searchEDate.equals("null") ) 
		{
				Calendar cal = Calendar.getInstance ( );//오늘 날짜를 기준으루..
			      
		    String YYYY = "";
		   	String MM = "";
		   	String DD = "";
		  	
			YYYY = cal.get ( cal.YEAR )+".";
				
				if(cal.get ( cal.MONTH ) + 1 < 10 )
					MM = "0"+(cal.get ( cal.MONTH ) + 1)+".";
				else
					MM = (cal.get ( cal.MONTH ) + 1)+".";
				
				if(cal.get ( cal.DATE ) < 10 )
					DD = "0"+cal.get ( cal.DATE );
				else
				 	DD = cal.get ( cal.DATE )+"";
				
				searchEDate = YYYY+MM+DD;
		
		}
	
	HashMap map = new HashMap();
	map.put( "userID",  request.getParameter("hidUserID") );
	
	// 게시물 정보 가져오기
	MemberMgr memberMgr = mgr.getMemberMgr();
	Member member = memberMgr.getMember( map );	 
	
%>	
<%@ include file="../include/global_head.jsp" %>

<script language="javascript">


	function goMemberList() {
	  $("#myform").attr("action", "member_list.jsp");
	  $("#myform").submit();
	}
</script>



<body>
<div id="wrap">
 
 	<%@ include file="../include/top_navi.jsp" %>
	<hr />
	<div id="container">
	
		<%@ include file="../include/left.jsp" %>
		
		<div class="contents_wrap">
		
			<!--  로케이션 -->
			<div class="location">
				<h1>관리자메인</h1>
				<p><a href="main.jsp">홈</a> &gt; <strong>메인</strong></p>
			</div>
			
			
			
			<form name="myform" id="myform" method="post" action="">
				<input type="hidden" name="menu" value="<%=request.getParameter("menu")%>" /> 
				<input type=hidden name="pageNum" id="pageNum" value="<%=currentPage%>">
				<input type=hidden name="listSize" id="listSize" value="<%=listSize%>">
				<input type=hidden name="userID" id="userID" value="<%=searchUserID%>">
				<input type=hidden name="userName" id="userName" value="<%=searchUserName%>">
				<input type=hidden name="userType" id="userType" value="<%=searchUserType%>">
				<input type=hidden name="sDate" id="sDate" value="<%=searchSDate%>">
				<input type=hidden name="eDate" id="eDate" value="<%=searchEDate%>">   
			</form>
			
			
			
			
			
			<!-- 컨텐츠 시작 -->
			<div class="contents">
				<h2 class="h2_title">회원정보</h2>
				<table summary="관리자메인" class="admin_skin_view01 skin_btn">
				<caption class="hidden">관리자메인</caption>
				<colgroup>
					<col width="17%" />
					<col width="33%" />
					<col width="17%" />
					<col width="33%" />
				</colgroup>
				<tr class="first_td">
					<th scope="row" class="left"><strong class="red_color">*</strong> 회원구분</th>
					<td colspan="3">
					<%
						String type = member.getUserType();
						String strType = "";
						if(type == "1")
							strType = "학생회원";
						else
							strType = "일반회원";
							
					%>
					
					<%=strType %></td>
				</tr>
				<tr>
					<th scope="row" class="left"><strong class="red_color">*</strong> 이름</th>
					<td><%=member.getName() %></td>
					<th scope="row" class="left"><strong class="red_color">*</strong> 주민등록번호<br />(외국인등록번호)</th>
					<td><%=member.getJumin() %></td>
				</tr>
				<tr>
					<th scope="row" class="left"><strong class="red_color">*</strong> 아이디</th>
					<td colspan="3"><%=member.getUserid() %></td>
				</tr>
				<tr>
					<th scope="row" class="left"><strong class="red_color">*</strong> 비밀번호</th>
					<td colspan="3"><%=member.getUserpw() %></td>
				</tr>
				<tr>
					<th scope="row" class="left"><strong class="red_color">*</strong> 생년월일</th>
					<td colspan="3">
						<%
							String birth = member.getBirthday();
							String YYYY="";
							String MM="";
							String DD="";
							
							String strSolar = "";
								
							if(birth != "" ) {
								if(birth.length() >= 8){	
									YYYY = birth.substring(0,4);
									MM = birth.substring(4,6);
									DD = birth.substring(6,8);
								}
							}
							
							if( member.getSolar() == "1")
								strSolar = "양력";
							else 
								strSolar = "음력"; 
						
						%>
					
					<%=YYYY %> 년 <%=MM %>월  <%=DD %>일   <%=strSolar %>
					
					
					</td>
				</tr>
				<tr>
					<th scope="row" class="left"><strong class="red_color">*</strong> 주소 </th>
					<td colspan="3"><%=member.getZipcode() %><br /><%=member.getAddress1() %><br /><%=member.getAddress2() %></td>
				</tr>
				<tr>
					<th scope="row" class="left"><strong class="red_color">*</strong> 휴대전화번호</th>
					<td colspan="3"><%=member.getMobile() %></td>
				</tr>
				<tr>
					<th scope="row" class="left"><strong class="red_color">*</strong> 자택전화번호</th>
					<td colspan="3"><%=member.getPhone() %></td>
				</tr>
				<tr>
					<th scope="row" class="left"><strong class="red_color">*</strong> E-mail</th>
					<td colspan="3"><%=member.getEmail() %></td>
				</tr>
				<tr>
					<th scope="row" class="left">* 부가사항</th>
					<td colspan="3">
						<%
						String strEtc = "";
						 
					 	if(member.getEmailYn().equals("Y"))
					 		strEtc += "이메일수신,";
					 	
					 	if(member.getSmsYn().equals("Y"))
					 		strEtc += "SMS수신,";
					 	
					 	if(member.getNewsYn().equals("Y"))
					 		strEtc += "뉴스레터수신";
					 	%>
						 <%=strEtc %>
					</td>
				</tr>
				</tbody>
			</table>
			<p class="skin_btn right">
				<a href="javascript:goMemberList();" class="admin_text_btn01">목록</a>
			</p>
			</div><!-- 컨텐츠 끝 -->
 	




		</div>
	</div>
	<hr />
</div>
</body>
</html>

