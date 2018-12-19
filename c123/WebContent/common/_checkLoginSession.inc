<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import="lee.common.config.*" %> 
<%@ page import="lee.bean.*" %> 
<%@ page import="lee.manager.*" %> 
<%@ page import="lee.common.util.*" %>
<%@ page import="lee.common.servlet.*" %>
<%@ page import="lee.session.*" %>

<%@ page errorPage="../common/error.jsp" %>
<%
  SessionManager sessionMgr = SessionManager.getInstance();

  if(curAdminInfo != null) {
    sessionMgr.validateSession(session.getId());
    session.setMaxInactiveInterval(10 * 60 * 60);
  } 
  
%>
