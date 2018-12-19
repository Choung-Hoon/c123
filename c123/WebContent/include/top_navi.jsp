<%@ page pageEncoding="utf-8" %>
<%@ page import="lee.common.util.*" %>
<%@ page import="lee.common.config.ConstantUtil" %>
<%@ page import="lee.common.config.PropertyManager" %>
 	<div id="header">

			<%
				int userTypeFlag = Integer.parseInt(curAdminInfo.getUserType());
				String mainUrl = "";
				if( userTypeFlag <= 2) mainUrl = "main_fd.jsp";
				else if( userTypeFlag == 3 ) mainUrl = "main_member.jsp";
				else if( userTypeFlag == 4 ) mainUrl = "main_member.jsp";

				//남은기간 화면 출력 함
				int remainDyas = DateUtils.daysBetween(DateUtils.getDateString("yyyyMMdd"),curAdminInfo.getValidEndDate().replaceAll("/",""));
				StringBuffer periodBuf = new StringBuffer()
					.append("<font color=\"red\">[<strong>유효기간 : </strong>")
					.append(curAdminInfo.getValidStDate()).append(" ~ " ).append(curAdminInfo.getValidEndDate())
					.append("(<strong>" + remainDyas + "</strong>일 남음)]</font> ");
			%>
		<div class="top_navi">
		<!--<h1><a href="../main/<%=mainUrl%>"><img  src="<%=ConstantUtil.SERVER_HOST%>/images/admin/admin_logo.gif" alt="관리자모드" /></a></h1>-->
			<p class="gnb"><span><%=periodBuf.toString()%><strong><%=curAdminInfo.getName()%></strong>님 로그인</span>
			<a href="<%=ConstantUtil.SERVER_HOST%>">첫페이지로 이동</a>
			<a href="../main/<%=mainUrl%>">사용자 메인</a>
			<a href="../common/do_logout.jsp">로그아웃</a></p>
		</div>
		<div id="lnb">
			<ul>

			<%

			boolean leftAuth = false;
			String[] leftAuthList = StringUtil.stringTokenizer( curAdminInfo.getAuth(),"," );
			for(int i=0; i<leftAuthList.length; i++)
			{
				if( leftAuthList[i].equals("1") ) // 파일관리
				{
					leftAuth = true;
				}
			}

			// 전체관리자이면 무조건 OK
			if( userTypeFlag == 1 ) leftAuth = true;

				//======== 각 관리자마다 초기 페이지가 다름 ==================
				if( userTypeFlag <= 1 && leftAuth ) { // 재단관리자
			%>
				<li><a href="../main/main_fd.jsp">관리자메인</a></li>
				<li><a href="../board/admin_search_list.jsp">리스트 </a></li>
			<%
				} else {
			%>
				<li><a href="../main/main_member.jsp">회원메인</a></li>
				<li><a href="../board/admin_search_list.jsp">리스트 </a></li>
			<%
				}

				if( userTypeFlag <= 4 )
				{
					String[] authList = StringUtil.stringTokenizer( curAdminInfo.getAuth(),"," );
					for(int i=0; i<authList.length; i++)
					{
						if( authList[i].equals("1") ) {
			%>
				<li><a href="../board/admin_notice_list.jsp">동영상관리 </a></li>
			<%
						} else if( authList[i].equals("3") ) {
			%>
				<li><a href="../member/member_list.jsp">회원관리</a></li>
				<li><a href="../product/product_list.jsp">물건관리</a></li>
			<%
						}
					}
				}
			%>
			</ul>
		</div>
	</div>
