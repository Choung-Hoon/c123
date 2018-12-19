<%@ page import="java.util.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="_includeInit.inc" %>
<%
  String alertMsg  = (String)request.getAttribute( "__alertMsg" );
  String link      = (String)request.getAttribute( "__link" );
  String params    = (String)request.getAttribute( "__params" );
  String target    = (String)request.getAttribute( "__target" );
  String selfClose = (String)request.getAttribute( "__selfClose" );

  target = "defaultPopupTarget".equalsIgnoreCase( target ) ? target : "'" + target + "'";

  String paramName = null;
  String paramValue = null;
%>
<form name="myform" method="post">
<%
  if( params != null ) {
    StringTokenizer tk = new StringTokenizer( params, "&" );
    String param = null;
    while( tk.hasMoreTokens() ) {
      param = tk.nextToken();
      paramName = param.substring( 0, param.indexOf( "=" ) );
      paramValue = param.substring( param.indexOf( "=" ) + 1 );
%>
<input type="hidden" name="<%=paramName%>" value="<%= paramValue == null? "" : paramValue %>" >
<%
    }
  }
%>
<%
  Enumeration en = request.getParameterNames();
  while( en.hasMoreElements() ) {
    paramName = (String)en.nextElement();
    paramValue = request.getParameter( paramName );
%>
<input type="hidden" name="<%=paramName%>" value="<%= paramValue == null? "" : paramValue %>" >
<%
  }
%>

</form>
<script src="../js/common.js"></script>
<script>
  alert( '<%=alertMsg%>' );
  <%= selfClose != null && selfClose.equalsIgnoreCase( "true" ) ? "if( opener || dialogArguments ) window.close();" : "" %>
  <%--
  <%= selfClose == null || !selfClose.equalsIgnoreCase( "true" ) ? ("goLink( '" + link +"', " +target+");"):"" %>
	-->
</script>

