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
  } else {

  String loginErroMsg = "로그인이 필요합니다.";
%>
<script language="javascript" type="text/javascript">
<!--

    alert("<%=loginErroMsg%>");
/*
    if(top.opener) {
      top.opener.parent.location.href = "<%=request.getContextPath()%>/webadm/common/login.jsp";
      top.window.close();
      top.opener.parent.focus();
    } else if(top.dialogArguments) {
      window.dialogArguments.location = "<%=request.getContextPath()%>/webadm/common/login.jsp";
      window.close();
    } else {
      top.location.href = "<%=request.getContextPath()%>/webadm/common/login.jsp";
    }
 */
 
 	if(top.dialogArguments) {
      window.dialogArguments.location = "<%=request.getContextPath()%>/common/login.jsp";
      window.close();
    } else {
      top.location.href = "<%=request.getContextPath()%>/common/login.jsp";
    }
//-->
</script>
<%
    return;
  }
%>
