<%@ page import="java.net.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.File" %>
<%@ page import="java.io.IOException" %>
<%@ page import="lee.common.config.*" %> 
<%@ page import="lee.bean.*" %> 
<%@ page import="lee.manager.*" %> 

 
<%!
  private static final String ADMIN_KEY     = "admin.key.user";
  private static final String LOGIN_DATE    = "admin.key.logindate";
  private String loginPath = "/";
  private static final String alertPath      = "../common/alert.jsp";
  private static final String alertAndGoPath = "../common/alertAndGo.jsp";

  public void jspInit() {}

  private void goAlert( PageContext pageContext, String alertMsg ) throws Exception {
    pageContext.getRequest().setAttribute( "__alertMsg", alertMsg );
    pageContext.forward( alertPath );
  }

  private void alertAndGo( PageContext pageContext, String alertMsg, String link, String params, String target, boolean selfClose ) throws Exception {
    pageContext.getRequest().setAttribute( "__alertMsg", alertMsg );
    pageContext.getRequest().setAttribute( "__link", link );
    pageContext.getRequest().setAttribute( "__params", params );
    pageContext.getRequest().setAttribute( "__target", target );
    if( selfClose ) pageContext.getRequest().setAttribute( "__selfClose", "true" );

    pageContext.forward( alertAndGoPath );
  }
%>
<%
  MgrFactory mgr = MgrFactory.getMgrFactory();
  
  // 현재 로그인된 관리자 세션 정보
  Admin curAdminInfo = (Admin)session.getAttribute(ADMIN_KEY);
  
%>
<%
  response.setHeader("Pragma", "no-cache");
  response.setHeader("Expires", "-1");
%>