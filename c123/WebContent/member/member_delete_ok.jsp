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
	String userID = request.getParameter( "userID" );


	HashMap map = new HashMap();
	map.put( "userID", userID );
	
	MemberMgr memberMgr = mgr.getMemberMgr();
	memberMgr.deleteMember( map );	 
	
%>

<script language="JavaScript">
  alert("삭제되었습니다."); 
  location.href = "./retire_member_list.jsp";
</script>