<%@ page pageEncoding="utf-8" %>
<%
	String requestURI = request.getRequestURI();

	int userType = Integer.parseInt(curAdminInfo.getUserType());

	// 재단관리자 (수퍼/일반), 재단관리자(일반)인 경우 특정 메뉴만 노출
	if( requestURI.indexOf("/scholar_fd/") >= 0
		|| requestURI.indexOf("/main/main_fd.jsp") >= 0 )
	{
%>
		<div id="left">
			<h2>관리자화면</h2>
			<ul>
				<li><a href="../main/main_fd.jsp">관리자화면<a>
				</li>
			</ul>
		</div>
<%
	}
	else if( requestURI.indexOf("/main/main_member.jsp") >= 0 )
	{
%>
		<div id="left">
			<h2>회원화면</h2>
			<ul>
				<li><a href="../main/main_member.jsp">회원화면</a>
				</li>
			</ul>
		</div>

<%
	}
	else if( requestURI.indexOf("/board/") >= 0 && userType == 1)
	{
%>
		<div id="left">
			<h2>동영상관리</h2>
			<ul>
				<li><a href="../board/admin_notice_list.jsp">동영상등록</a>
				</li>
			</ul>
		</div>
<%
	}
	else if( requestURI.indexOf("/board/") >= 0 && userType == 3)
	{
%>
		<div id="left">
			<h2>동영상정보</h2>
			<ul>
				<li><a href="../board/member_file_list.jsp">동영상리스트</a>
				</li>
			</ul>
		</div>

<%
	}
	else if( requestURI.indexOf("/member/") >= 0)
	{
%>
		<div id="left">
			<h2>회원 관리</h2>
			<ul>
				<li><a href="../member/member_list.jsp">유효회원목록</a></li>
				<li><a href="../member/retire_member_list.jsp">만기회원목록</a></li>
			</ul>
		</div>
<%
	}
	else if( requestURI.indexOf("/product/") >= 0)
	{
%>
		<div id="left">
			<h2>물건 관리</h2>
			<ul>
				<li><a href="../product/product_list.jsp">물건등록/조회</a></li>
			</ul>
		</div>
<%
	}
	else if( requestURI.indexOf("/site/") >= 0 )
	{
%>
		<div id="left">
			<h2>사이트 관리</h2>
			<ul>
				<li><a href="#">팝업존 관리</a></li>
			</ul>
		</div>
<%
	}
	else if( requestURI.indexOf("/dhx/") >= 0 )
	{
%>
		<div id="left">
			<h2>DHX 테스트</h2>
			<ul>
				<li><a href="../dhx/dhxTest1.jsp">DHX 테스트</a>
					<ul>
						<li><a href="../dhx/dhxTest1.jsp">DHX 테스트예제1</a></li>
						<li><a href="../dhx/dhxTest2.jsp">DHX 테스트예제2</a></li>
						<li><a href="../dhx/dhxTest3.jsp">DHX 테스트예제3</a></li>
						<li><a href="../dhx/dhxTest4.jsp">DHX 테스트예제4</a></li>
					</ul>
				</li>
			</ul>
		</div>
<%
	}
%>