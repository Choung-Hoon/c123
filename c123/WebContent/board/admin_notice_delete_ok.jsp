<%@ page contentType="text/html;charset=utf-8" %>

<%@ include file="../common/_includeInit.inc" %>
<%@ include file="../common/_includeCommon.inc" %>
<%@ include file="../common/_checkLogin.inc" %> 

<%
	//실제 첨부파일이 저장된 경로
	String boardAttachPath = ConfigManager.getInstance().getBoardFileUpload();
	BoardMgr boardMgr = mgr.getBoardMgr();
	
	int contId  = StringUtil.stoi(request.getParameter("contId"));
	int fileId1 = StringUtil.stoi(request.getParameter("fileId1"));
	int fileId2 = StringUtil.stoi(request.getParameter("fileId2"));
	String oldRname1 = request.getParameter("oldRname1");
	String oldRname2 = request.getParameter("oldRname2");
	
	String condIdList = request.getParameter("condIdList");
	String pageNum = request.getParameter( "pageNum" );	
	
	String goUrl = "./admin_notice_list.jsp" ;
	
	// 뷰페이지에서 하나만 삭제 할 경우
	if (condIdList == null || "".equals(condIdList))
	{
		if( contId <= 0)
			goAlert(pageContext, "삭제에 실패하였습니다. 잠시후 다시 시도해 주세요." );
		
		// BoardFile 삭제 , 첨부된 파일 삭제 
		BoardFile[] boardFileList = boardMgr.getBoardFileList(contId);
		if(boardFileList.length > 0){
			for(int a=0; a<boardFileList.length; a++){
				boardMgr.deleteBoardFile(boardFileList[a].getBfileId());
				FileUtil.remove(boardAttachPath + File.separator + boardFileList[a].getRname());	//기존파일 삭제	
				FileUtil.remove(boardAttachPath + File.separator + boardFileList[a].getRname() + "_0.xml");	//xml파일 삭제
				FileUtil.remove(boardAttachPath + File.separator + boardFileList[a].getRname() + "_0.title");//title파일 삭제
			}
		}
		
		// Board 삭제 
		boardMgr.deleteBoard(contId);
		
	} else {
		
		// 파라미터로 넘어오면 "'"가 붙어서 옴
		String[] deleteIdList = StringUtil.stringTokenizer(condIdList, "," );

		for(int i=0; i<deleteIdList.length; i++)
		{
			// BoardFile 삭제 , 첨부된 파일 삭제 
			contId = Integer.parseInt(deleteIdList[i]) ;
			BoardFile[] boardFileList = boardMgr.getBoardFileList(contId);
			if(boardFileList.length > 0){
				for(int a=0; a<boardFileList.length; a++){
					boardMgr.deleteBoardFile(boardFileList[a].getBfileId());
					FileUtil.remove(boardAttachPath + File.separator + boardFileList[a].getRname());	//기존파일 삭제	
					FileUtil.remove(boardAttachPath + File.separator + boardFileList[a].getRname() + "_0.xml");	//xml파일 삭제
					FileUtil.remove(boardAttachPath + File.separator + boardFileList[a].getRname() + "_0.title");//title파일 삭제
				}
			}
			
			// Board 삭제 
			boardMgr.deleteBoard(contId);
			
		}
		
		//goUrl += "?pageNum=" + pageNum ;
	}		

%>

<script language="JavaScript">
  	alert("삭제 되었습니다");
	location.href="<%=goUrl%>";
</script>