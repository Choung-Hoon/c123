<%@ page contentType="text/html;charset=utf-8" %>

<%@ include file="../common/_includeInit.inc" %>
<%@ include file="../common/_includeCommon.inc" %>
<%@ include file="../common/_checkLogin.inc" %>

<%
	// 임시 경로를 가져오기
	String attachTmpPath = ConfigManager.getInstance().getFileUpload();

	// 파일 크기 제한
	long IMAGE_MAX_SIZE = PropertyManager.getInstance().getLong("attach.img.max.size");
	long FILE_MAX_SIZE = PropertyManager.getInstance().getLong("attach.file.max.size");

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
	String bdId = upload.getParameter("bdId");
	String pageNum = upload.getParameter("pageNum");
	String listSize = upload.getParameter("listSize");

	String searchType =  upload.getParameter("searchType");
	String searchValue = upload.getParameter("searchValue");

	//===========================================================================//
	// [STEP 4] INSERT
	//===========================================================================//
	ProductMgr productMgr = mgr.getProductMgr();
	int maxpProductId = productMgr.getProductMaxId() + 1;

	Product product = new Product();
	product.setProductId(maxpProductId);
	product.setJobKind(jobKind);
	product.setCompanyNm(companyNm);
	product.setHandoverCond(handoverCond);
	product.setContents(contents);

	product.setRegId(curAdminInfo.getUserid());
	product.setRegName(curAdminInfo.getName());

	productMgr.insertProduct(product);

	//===========================================================================//
	// [STEP 5] FILE INSERT
	//===========================================================================//
	for(int i=0; i<10; i++){
		if(fileImg[i] != null && maxpProductId > 0){
			ProductFile productFile = new ProductFile();
			productFile.setProductId(maxpProductId);
			productFile.setFileType("4");		//1:첨부파일, 2:메인이미지, 3:썸네일이미지, 4:이미지
			productFile.setRname(rFileImgName[i]);
			productFile.setCname(cFileImgName[i]);
			productFile.setDescript(StringUtil.toUTF8(upload.getParameter("fileImg" + (i+1) + "Desc")));

			productMgr.insertProductFile(productFile);
		}
	}


%>

<script language="JavaScript">
  	alert("등록이 완료되었습니다");
	location.href="./product_list.jsp";
</script>