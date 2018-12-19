<%@ page contentType="text/html;charset=utf-8" %>

<%@ include file="../common/_includeInit.inc" %>
<%@ include file="../common/_includeCommon.inc" %>
<%@ include file="../common/_checkLogin.inc" %> 

<%
	//실제 첨부파일이 저장된 경로
	String productAttachPath = ConfigManager.getInstance().getProductFileUpload();
	ProductMgr productMgr = mgr.getProductMgr();
	int productId = Integer.parseInt(request.getParameter("productId") == null ? "0" : request.getParameter("productId"));
	String isPopup = request.getParameter("isPopup") == null ? "N" : request.getParameter("isPopup");
	
	if( productId <= 0)
		goAlert(pageContext, "[" + productId + "] 삭제에 실패하였습니다. 잠시후 다시 시도해 주세요." );
	
	// ProductFile 삭제 , 첨부된 파일 삭제 
	ProductFile[] productFileList = productMgr.getProductFileList(productId);
	if(productFileList.length > 0){
		for(int a=0; a<productFileList.length; a++){
			productMgr.deleteProductFile(productFileList[a].getBfileId());
			FileUtil.remove(productAttachPath + File.separator + productFileList[a].getRname());	//기존파일 삭제		
		}
	}
	
	// Product 삭제 
	productMgr.deleteProduct(productId);

%>

<script language="JavaScript">
  	alert("삭제 되었습니다");
<%
	if ("Y".equals(isPopup)) {
%>
	window.opener.location.href=window.opener.location.href;
	self.close();
<%
	} else {
%>
	location.href = "./product_list.jsp";
<%
	}
%>

</script>