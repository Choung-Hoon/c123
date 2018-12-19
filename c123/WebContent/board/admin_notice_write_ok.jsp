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
	long MOVIE_MAX_SIZE = PropertyManager.getInstance().getLong("attach.movie.max.size");
	
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
		if(file1 != null && file1.exists() && file1.length() > MOVIE_MAX_SIZE) 
		{ 
			goAlert(pageContext, "최대 200M 까지만 등록하실 수 있습니다."); 
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
	
	//===========================================================================//
	// [STEP 3] 검색 파라메터 가져오기  
	//===========================================================================//
	String bdId = upload.getParameter("bdId");
	
	//===========================================================================//
	// [STEP 4] INSERT 
	//===========================================================================//
	BoardMgr boardMgr = mgr.getBoardMgr();
	int maxContId = boardMgr.getBoardMaxId() + 1;
	
	Board board = new Board();
	board.setContId(maxContId);
	board.setBdId(Integer.parseInt(bdId));
	board.setTitle(title);
	board.setContent(content);	
	board.setRef(maxContId);
	board.setStep("1");
	board.setLevel(1);
	board.setRegId(curAdminInfo.getUserid());
	board.setRegName(curAdminInfo.getName());	
	
	boardMgr.insertBoard(board);	
	
	//===========================================================================//
	// [STEP 5] FILE INSERT 
	//===========================================================================//
	if(file1 != null && maxContId > 0){
		BoardFile boardFile = new BoardFile();
		boardFile.setContId(maxContId);
		boardFile.setFileType("1");		//1:첨부파일, 2:메인이미지, 3:썸네일이미지, 4:이미지
		boardFile.setRname(rFileName1);
		boardFile.setCname(cFileName1);		
		
		boardMgr.insertBoardFile(boardFile);
		
	}
	
%>

<script language="JavaScript">
  	alert("등록이 완료되었습니다");
	location.href="./admin_notice_list.jsp";
</script>