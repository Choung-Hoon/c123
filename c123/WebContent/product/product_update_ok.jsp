<%@ page contentType="text/html;charset=utf-8" %>

<%@ include file="../common/_includeInit.inc" %>
<%@ include file="../common/_includeCommon.inc" %>
<%@ include file="../common/_checkLogin.inc" %> 

<%
	// 임시 경로를 가져오기
	String attachTmpPath = ConfigManager.getInstance().getFileUpload();
	
	// 파일 크기 제한
	long IMAGE_MAX_SIZE = PropertyManager.getInstance().getLong("attach.file.max.size");
	long FILE_MAX_SIZE = PropertyManager.getInstance().getLong("attach.img.max.size");
	
	// 임시 디렉터리 생성
	String tempPath = attachTmpPath + File.separator + KeyGenerator.getDecreaseKey();
	File tmpDir = new File(tempPath);
	
	if(!tmpDir.exists()) 
	{
		tmpDir.mkdirs();
	}
	else if(tmpDir.isFile()) 
	{
		goAlert(pageContext, "임시 디렉터리를 생성할 수 없습니다. 관리자에게 문의하십시오." );
	}

	MultiFileUpload upload = new MultiFileUpload();
	upload.UpFile(request, tempPath);	
	
	//===========================================================================//
	// [STEP 1] 입력 항목가져오기 
	//===========================================================================//		
	String jobKind = StringUtil.toUTF8(upload.getParameter("jobKind"));
	String companyNm =  StringUtil.toUTF8(upload.getParameter("companyNm"));
	String handoverCond =  StringUtil.toUTF8(upload.getParameter("handoverCond"));
	String contents =  StringUtil.toUTF8(upload.getParameter("contents"));
	
	
	//===========================================================================//
	// [STEP 2] 업로드 파일 가져오기  
	//===========================================================================//
	// 실제 첨부파일이 저장될 경로
	String productAttachPath = ConfigManager.getInstance().getProductFileUpload();
	
	// 파일 가져오기
	File fileThumnail = upload.getFile("fileThumnail");
	File fileMain = upload.getFile("fileMain");
	File[] fileImg = new File[10];
	
	File rFileThumnail = null;
	File rFileMain = null;
	File[] rFileImg = {null, null, null, null, null, null, null, null, null, null};

	String rFileThumnailName = null;
	String rFileMainName = null;
	String[] rFileImgName = {null, null, null, null, null, null, null, null, null, null};

	String cFileThumnailName = null;
	String cFileMainName = null;
	String[] cFileImgName = {null, null, null, null, null, null, null, null, null, null};

/*	
	if(fileThumnail != null)
	{
		if(fileThumnail != null && fileThumnail.exists() && fileThumnail.length() > IMAGE_MAX_SIZE) 
		{ 
			goAlert(pageContext, "최대 1000KB 까지만 등록하실 수 있습니다."); 
			FileUtil.remove(tempPath);
			return; 
		}

		// 복사
		rFileThumnail = FileUtil.copyFile( fileThumnail, productAttachPath );	
		rFileThumnailName = rFileThumnail.getName();
		cFileThumnailName = fileThumnail.getName();
	}
	
	if(fileMain != null)
	{
		if(fileMain != null && fileMain.exists() && fileMain.length() > IMAGE_MAX_SIZE) 
		{ 
			goAlert(pageContext, "최대 1000KB 까지만 등록하실 수 있습니다."); 
			FileUtil.remove(tempPath);
			return; 
		}

		// 복사
		rFileMain = FileUtil.copyFile( fileMain, productAttachPath );	
		rFileMainName = rFileMain.getName();
		cFileMainName = fileMain.getName();
	}
*/
	for(int i=0; i<10; i++)
	{
		fileImg[i] = upload.getFile("fileImg" + (i + 1));		
		if(fileImg[i] != null)
		{
			if(fileImg[i] != null && fileImg[i].exists() && fileImg[i].length() > IMAGE_MAX_SIZE) 
			{ 
				goAlert(pageContext, "최대 1000KB 까지만 등록하실 수 있습니다."); 
				FileUtil.remove(tempPath);
				return; 
			}
	
			// 복사
			rFileImg[i] = FileUtil.copyFile( fileImg[i], productAttachPath );	
			rFileImgName[i] = rFileImg[i].getName();
			cFileImgName[i] = fileImg[i].getName();
		}
		
	}

	// 업로드된 임시 경로 삭제
	FileUtil.remove(tempPath);	
	
	//===========================================================================//
	// [STEP 3] 검색 파라메터 가져오기  
	//===========================================================================//
	String productId = upload.getParameter("productId");
	String pageNum = upload.getParameter("pageNum");
	String listSize = upload.getParameter("listSize");

	String searchType =  upload.getParameter("searchType");
	String searchValue = upload.getParameter("searchValue");
	//===========================================================================//
	// [STEP 4] UPDATE 
	//===========================================================================//
	ProductMgr productMgr = mgr.getProductMgr();
	
	Product product = new Product();
	product.setProductId(Integer.parseInt(productId));
	product.setJobKind(jobKind);
	product.setCompanyNm(companyNm);
	product.setHandoverCond(handoverCond);
	product.setContents(contents);

	productMgr.updateProduct(product);
	//===========================================================================//
	// [STEP 5] FILE INSERT, MODIFY, DELETE 
	//===========================================================================//
	int fileId;
	String oldRname;
	String fileDelChk;
	
	for (int a=0; a<10; a++){
		
		fileId = Integer.parseInt(upload.getParameter("fileId" + a) == null ? "0" : upload.getParameter("fileId" + a));
		oldRname = upload.getParameter("oldRname" + a);
		fileDelChk = upload.getParameter("fileDelChk" + a);
		
		if(a >= 0 && fileImg[a] != null){			
			ProductFile productFile = new ProductFile();
			productFile.setProductId(Integer.parseInt(productId));
			productFile.setFileType("4");
			productFile.setRname(rFileImgName[a]);
			productFile.setCname(cFileImgName[a]);
			productFile.setDescript(StringUtil.toUTF8(upload.getParameter("fileImg" + (a-1) + "Desc")));
			
			productMgr.deleteProductFile(fileId);		//삭제
			productMgr.insertProductFile(productFile);	//저장
			
			if(fileId > 0)		// 기존파일 삭제
				FileUtil.remove(productAttachPath + File.separator + oldRname);	//기존파일 삭제
		}		
				
		if(fileDelChk != null){
			productMgr.deleteProductFile(fileId);								//삭제	
			FileUtil.remove(productAttachPath + File.separator + oldRname);	//기존파일 삭제	
		}
		
	}	
%>
<form name="myform" id="myform" method="post" action="">
	<input type="hidden" id="productId" name="productId" value="<%=productId %>"/>
	<input type="hidden" id="pageNum" name="pageNum" value="<%=pageNum %>" />					
	<input type="hidden" id="listSize" name="listSize" value="<%=listSize %>" />
	<input type="hidden" id="searchType" name="searchType" value="<%=searchType %>" />
	<input type="hidden" id="searchValue" name="searchValue" value="<%=searchValue %>" />
</form>

<script language="JavaScript">
  	alert("수정 되었습니다.");
  	document.myform.action = "./product_view1.jsp";
  	document.myform.submit();
</script>