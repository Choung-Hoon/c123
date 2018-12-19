<%@ page import="lee.common.config.*" %>
<%@ page import="lee.bean.*" %>
<%@ page import="lee.manager.*" %>
<%@ page import="lee.common.util.*" %>
<%@ page import="lee.common.servlet.*" %>
<%@ page import="lee.session.*" %>
<%@ page import="java.util.*" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ page errorPage="../common/error.jsp" %>
<%@ include file="../common/_includeInit.inc" %>
<%@ include file="../common/_includeCommon.inc" %>
<%

	String userid = curAdminInfo.getUserid() ;

	if(session.getAttribute(ADMIN_KEY) != null)
	{
		//
		HashMap param = new HashMap();
		param.put( "userid", curAdminInfo.getUserid() );

		AdminMgr adminMgr = mgr.getAdminMgr();
		adminMgr.updateAccessDateAdmin( param );

		session.removeAttribute(ADMIN_KEY);
	}

	SessionManager sessionMgr = SessionManager.getInstance();
	sessionMgr.removeSession(session.getId());

%>
<script language="javascript">
	alert('로그아웃 되었습니다.');
	window.close();
</script>
