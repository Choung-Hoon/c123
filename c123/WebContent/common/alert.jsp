<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
  String alertMsg = (String)request.getAttribute( "__alertMsg" );
%>
<script>
  alert( '<%=alertMsg%>' );
  if( history.length > 0 ) {
    history.back();
  } else if( opener ) {
    window.close();
  } else if( dialogArguments ) {
    window.close();
  } else {
  }
</script>

