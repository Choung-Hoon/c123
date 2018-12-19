<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import="java.io.BufferedReader" %>
<%@ page import="java.io.InputStreamReader" %>
<%@ page import="java.io.IOException" %>
<%@ page import="java.io.FileReader" %>
<%@ page import="java.io.FileWriter" %>
<%@ page import="java.io.BufferedWriter" %>
<%@ page import="java.io.OutputStreamWriter" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.*" %>
<%@ page import=" java.io.File"%>
<%@ page import=" java.text.SimpleDateFormat"%>
<%@ page import=" java.util.Date"%>
<%@ page import=" java.util.Calendar"%>
<html>
  <head>
  </head>
  <body>
            <%
            
            String today_file = application.getRealPath("count.txt");
            File file = new File(today_file);
            String newLastModified = "20130623";
            SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
            //need convert the above date to milliseconds in long value
            Date newDate = sdf.parse(newLastModified);
            file.setLastModified(newDate.getTime());
        %>
    </body>
</html>