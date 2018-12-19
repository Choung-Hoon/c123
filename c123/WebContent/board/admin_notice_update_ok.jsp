<%@ page contentType="text/html;charset=utf-8" %>

<%@page import="lee.common.util.XlsAdapter"%>
<%@page import="java.io.FileNotFoundException"%>
<%@page import="java.io.IOException"%>

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
	String title = StringUtil.toUTF8(upload.getParameter("title"));
	String content =  StringUtil.toUTF8(upload.getParameter("content"));
	
	//===========================================================================//
	// [STEP 2] 업로드 파일 가져오기  
	//===========================================================================//
	// 실제 첨부파일이 저장될 경로
	String boardAttachPath = ConfigManager.getInstance().getBoardFileUpload();
	
	// 파일 가져오기
	File file1 = upload.getFile("attachFile1");
	File rFile1 = null;

	String rFileName1 = null;
	String cFileName1 = null;
	
	if(file1 != null)
	{
		if(file1 != null && file1.exists() && file1.length() > IMAGE_MAX_SIZE) 
		{ 
			goAlert(pageContext, "최대 1000KB 까지만 등록하실 수 있습니다."); 
			FileUtil.remove(tempPath);
			return; 
		}

		// 복사
		rFile1 = FileUtil.copyFile( file1, boardAttachPath );	
		rFileName1 = rFile1.getName();
		cFileName1 = file1.getName();
	}
	
	// 업로드된 임시 경로 삭제
	FileUtil.remove(tempPath);	
	
	// 업로드된 엑셀 파일 내용을 xml로 전환 하기
	/*
		c.readExcel("e:\\java\\Project\\leehouse\\src\\Root\\dhx\\sample\\샘플.xls"
					,"e:\\java\\Project\\leehouse\\src\\Root\\dhx\\sample");
	*/
	/* ----------------------------------------------------------------------------
	XlsAdapter xls = new XlsAdapter();
	try {
		
		xls.readExcel(boardAttachPath + File.separator + rFileName1
					,boardAttachPath);
	
	} catch (FileNotFoundException e) {
		e.printStackTrace();
		goAlert(pageContext, "업로드된 파일이 없습니다.");
		return ;
	} catch (IOException e) {
		e.printStackTrace();
		goAlert(pageContext, "파일 변환 실패하였습니다.");
		return ;
	}
	------------------------------------------------------------------- */
	
	//===========================================================================//
	// [STEP 3] 검색 파라메터 가져오기  
	//===========================================================================//
	String bdId = upload.getParameter("bdId");
	String contId = upload.getParameter("contId");
	String pageNum = upload.getParameter("pageNum");
	String listSize = upload.getParameter("listSize");
	String searchType =  upload.getParameter("searchType");
	String searchValue = upload.getParameter("searchValue");
	
	String strRef = upload.getParameter("ref");
	String strStep = upload.getParameter("step");
	String strLevel = upload.getParameter("level");
	
	//===========================================================================//
	// [STEP 4] UPDATE 
	//===========================================================================//
	BoardMgr boardMgr = mgr.getBoardMgr();
	
	Board board = new Board();
	board.setContId(Integer.parseInt(contId));
	board.setRef(Integer.parseInt(strRef));
	board.setStep(strStep);
	board.setLevel(Integer.parseInt(strLevel));
	board.setTitle(title);
	board.setContent(content);	
	board.setModId(curAdminInfo.getUserid());
	
	boardMgr.updateBoard(board);	
	
	//===========================================================================//
	// [STEP 5] FILE INSERT, MODIFY, DELETE 
	//===========================================================================//
	int fileId1 = Integer.parseInt(upload.getParameter("fileId1") == null ? "0" : upload.getParameter("fileId1"));
	String oldRname1 = upload.getParameter("oldRname1");
	String fileDelChk1 = upload.getParameter("fileDelChk1");
	
	if(file1 != null){
		BoardFile boardFile = new BoardFile();
		boardFile.setContId(Integer.parseInt(contId));
		boardFile.setFileType("1");
		boardFile.setRname(rFileName1);
		boardFile.setCname(cFileName1);
		
		boardMgr.deleteBoardFile(fileId1);		//삭제
		boardMgr.insertBoardFile(boardFile);	//저장
		
		if(fileId1 > 0)	{	
			// 기존파일 삭제
			FileUtil.remove(boardAttachPath + File.separator + oldRname1);	//기존파일 삭제
			//xml 삭제 함
			//FileUtil.remove(boardAttachPath + File.separator + oldRname1 + "_0.xml");	
			//title 삭제 함
			//FileUtil.remove(boardAttachPath + File.separator + oldRname1 + "_0.title");	
		}	
	}
		
	if(fileDelChk1 != null){
		boardMgr.deleteBoardFile(fileId1);		//삭제	
		FileUtil.remove(boardAttachPath + File.separator + oldRname1);	//기존파일 삭제	
		//xml 삭제 함
		//FileUtil.remove(boardAttachPath + File.separator + oldRname1 + "_0.xml");	
		//title 삭제 함
		//FileUtil.remove(boardAttachPath + File.separator + oldRname1 + "_0.title");	
	}

%>
<form name="myform" id="myform" method="post" action="">
	<input type="hidden" id="bdId" name="bdId" value="<%=bdId %>" />
	<input type="hidden" id="contId" name="contId" value="<%=contId %>"/>
	<input type="hidden" id="pageNum" name="pageNum" value="<%=pageNum %>" />					
	<input type="hidden" id="listSize" name="listSize" value="<%=listSize %>" />
	<input type="hidden" id="searchType" name="searchType" value="<%=searchType %>" />
	<input type="hidden" id="searchValue" name="searchValue" value="<%=searchValue %>" />
</form>

<script language="JavaScript">
  	alert("수정 되었습니다.");
  	document.myform.action = "./admin_notice_view.jsp";
  	document.myform.submit();
</script>