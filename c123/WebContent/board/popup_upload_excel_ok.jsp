<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import="lee.common.config.*" %>
<%@ page import="lee.bean.*" %>
<%@ page import="lee.manager.*" %>
<%@ page import="lee.common.util.*" %>
<%@ page import="lee.common.servlet.*" %>
<%@ page import="lee.session.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>

<%@ page errorPage="/common/error.jsp" %>
<%@ include file="/common/_includeInit.inc" %>
<%@ include file="/common/_includeCommon.inc" %>

<%
	// 임시 경로를 가져오기
	String attachTmpPath = ConfigManager.getInstance().getFileUpload();

	// 파일 크기 제한
	long FILE_MAX_SIZE = PropertyManager.getInstance().getLong("attach.file.max.size"); //100000 * 1024; // 10MB
	long IMAGE_MAX_SIZE = PropertyManager.getInstance().getLong("attach.img.max.size");  // 100000 * 1024;  // 10MB
	String[] imgExts = new String[] {"xls", "xlsx"};

	// 임시 디렉터리 생성
	String tempPath = attachTmpPath + File.separator + KeyGenerator.getDecreaseKey();
	File tmpDir = new File( tempPath );

  //System.out.println("임시 디렉토리 : " + tempPath);
  
	if(!tmpDir.exists())
	{
		tmpDir.mkdirs();
	}
	else if( tmpDir.isFile() )
	{
		goAlert(pageContext, "임시 디렉터리를 생성할 수 없습니다. 관리자에게 문의하십시오." );
	}

	MultiFileUpload upload = new MultiFileUpload();
	upload.UpFile( request, tempPath );

	//===========================================================================//
	// 업로드 파일 가져오기
	//===========================================================================//
	String mode = StringUtil.toUTF8( upload.getParameter("mode") );
	if( mode == null || mode.trim().length() == 0 ) mode = "";

	// 실제 첨부파일이 저장될 경로
	String boardAttachPath = ConfigManager.getInstance().getBoardFileUpload();

	// 파일 가져오기
	File file = upload.getFile( "fileipt" );

	File cFile = null;
	String rFileName = null;
	String cFileName = null;

	if( file != null )
	{
		if( file != null && file.exists()
				&& !StringUtil.validateFileExt(file.getName(), imgExts))
		{
			goAlert( pageContext, "EXCEL포맷의 파일만 등록하실 수 있습니다." );
			FileUtil.remove( tempPath );
			return;
		}

		if( file != null && file.exists() && file.length() > IMAGE_MAX_SIZE )
		{
			goAlert( pageContext, "최대 10MB 까지만 등록하실 수 있습니다." );
			FileUtil.remove( tempPath );
			return;
		}

		// 복사
		cFile = FileUtil.copyFile( file, boardAttachPath );
		cFileName = cFile.getName();
		rFileName = file.getName();
	}

	// 업로드된 임시 경로 삭제
	FileUtil.remove( tempPath );

	//===========================================================================//
	// [STEP 0] 파일 업로드 시작
	//===========================================================================//
	ExcelLoadXlsAdapter c = new ExcelLoadXlsAdapter();
	String resultMsg = "파일 업로드가 정상적으로 완료되었습니다." ;

	try {
		String[] titles = {"날짜", "업종", "지역", "법인<br>/면허","자본금",
				"시평", "좌수", "잔액","2008", "2009","2010","2011","계","2012",
				"양도가","협회","기타","업체","연락처"};

		//c.updateTitle(conn, titles);
		c.updateData( boardAttachPath + File.separator + cFileName);

		long startTime = System.nanoTime();

		long elapsedTime = System.nanoTime() - startTime;
		System.out.println("elapsed Time : " + elapsedTime/1000000.0 + " ms");

		// 업로드된 파일의 이름을 특정파일명으로 바꿈
		//File tempFile = FileUtil.copyFile( cFile, boardAttachPath );
		File prmnaFile = FileUtil.rename( cFile, "prmna_excel.xls" );

	} catch (FileNotFoundException e) {
		e.printStackTrace();
		resultMsg = "해당 파일을 찾을수 없습니다.";
	} catch (IOException e) {
		e.printStackTrace();
		resultMsg = "알수 없는 IO 오류입니다.";
	}
%>

<script>
	alert('<%=resultMsg%>');
	self.close();
</script>