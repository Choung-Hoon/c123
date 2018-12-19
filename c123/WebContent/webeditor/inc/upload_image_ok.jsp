<%@ page import="lee.common.config.*" %> 
<%@ page import="lee.bean.*" %> 
<%@ page import="lee.manager.*" %> 
<%@ page import="lee.common.util.*" %>
<%@ page import="lee.common.servlet.*" %>
<%@ page import="lee.session.*" %>
<%@ page import="java.io.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
  ConfigManager confMgr = ConfigManager.getInstance();

%>
<%
	String temp = confMgr.getFileTemp() + File.separator + session.getId();
	
	 File tmpDir = new File( temp + File.separator + session.getId() );
	 if( !tmpDir.exists() ) {
		tmpDir.mkdirs();
	 } else if( tmpDir.isFile() ) {
	    throw new IOException( tmpDir.getAbsolutePath() + " is file" );
	 }
	
	 MultiFileUpload upload = new MultiFileUpload();
	 upload.UpFile( request, temp );
	
	 File upimage = upload.getFile( "upimage" );
	
	 String align = upload.getParameter("align");
	 if( align == null ) align = "";
	
	 String width = upload.getParameter("width");
	 if( width == null ) width = "";
	 
	 if(!width.equals("")){
	   width = "width='" + width + "'";
	 }
	
	 String height = upload.getParameter("height");
	 if( height == null ) height = "";
	
	 if(!height.equals("")){
		height = "height='" + height + "'";
	 }
	
	 String border = upload.getParameter("border");
	 if( border == null ) border = "0";	 
	
	String alt = "";
	String img_url = "";
	
	
	 String filePath = confMgr.getBoardFileUpload();
	
	 if(upimage != null) {
	   File file = FileUtil.copyFile(upimage, filePath);
	
	  // out.println(upimage.getName());
	  // out.println(file.getName());
	
	   //img_url = "../../upload/board/" +  file.getName();
	   img_url = "/upload/board/" +  file.getName();
  }
  %>
  <script>
	  alert('<%= img_url %>');
	  var str = "<img src='<%= img_url %>' <%= width %> <%= height %> border='<%= border %>' align='<%= align %>' alt='<%= alt %>'>";
	  opener.WebEditorUtil._editor.innerHTML(str);
	  self.close();
	</script>
