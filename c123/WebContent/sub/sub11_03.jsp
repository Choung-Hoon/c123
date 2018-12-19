<%@ page contentType="text/html;charset=utf-8" %>

<%@ include file="../common/_includeInit.inc" %>
<%@ include file="../common/_includeCommon.inc" %>

<%
	String strBoardId = ConstantUtil.BOARD_CODE_ADMIN_NOTICE;
	String strContId = request.getParameter( "contId" ); 
	int currentPage = 1;	
	int listSize = 10;
	
	// 게시물 ID
	if(strContId == null || strContId.equals(""))
	{
		goAlert(pageContext, "게시물 ID가 누락되었습니다.");
		return;		
	}
	
	// 현재 페이지
	String strCurrentPage = request.getParameter("pageNum");	
	if( strCurrentPage ==  null || strCurrentPage.equals("") || strCurrentPage.equals("0") ) {
		currentPage = 1;
	} else {
		currentPage = Integer.parseInt(strCurrentPage);
	}	
	
	// 페이지 리스트 갯수
	String strListSize = request.getParameter( "listSize" );
	if( strListSize == null || strListSize.equals("") )
		listSize = 10;
	else 
		listSize = Integer.parseInt(strListSize);
	
	// 검색 조건 가져오기	
	String searchType =  request.getParameter( "searchType" );
	if( searchType == null || searchType.equals("null") ) 
		searchType = "";
	
	String searchValue = request.getParameter( "searchValue" );
	if( searchValue == null || searchValue.equals("null") ) 
		searchValue = "";
	
	
	BoardMgr boardMgr = mgr.getBoardMgr();
	HashMap params = new HashMap();
	params.put("bdId", strBoardId);
	params.put("contId", strContId);
	params.put("showYn", "Y");	
	params.put("searchType", searchType);
	params.put("searchValue", searchValue);
	params.put("pageNum", (currentPage - 1) * listSize);
	params.put("listSize", listSize);
	
	// 게시물 정보
	boardMgr.updateBoardViewCnt(params); 
	Board board = boardMgr.getBoard(params);	 

	//첨부파일
	BoardFile[] boardFileList = null;
	if(board.getBoardFileCnt() > 0){
		boardFileList = boardMgr.getBoardFileList(board.getContId());
	}
%>

<%@ include file="../include/global_head.jsp" %>

<script type="text/javascript">
	$(document).ready(function() {		
	});	
	
	function boardList() {
		//$("#myform").attr("action", "./admin_notice_list.jsp");
		//$("#myform").submit();
		
		alert($( "embed" ).attr("src")) ;
		
		//동영상 embed 종료 시킴
		$("embed").attr("src","")
		$("embed").attr("hidden",true)
		
		alert($( "embed" ).attr("src")) ;
		
		var param = "contId=" + $("#contId").val() 
		          + "&bdId=" + $("#bdId").val()
				  + "&listSize=" + $("#listSize").val()
				  + "&pageNum=" + $("#pageNum").val();
		
		$("#tit_main").text("건업양도양수 > ");                                             
		$("#tit_sub").text("공지사항");                                           
		$("#sub_title").html('<img src="./images/icon/notice_title_01.gif">');
		$("#content_view").load("./sub/sub11_01.jsp?" + param );
		
		
	}
	
	function fileDownload(cfileName, rfileName){
		$("#rfileName").attr("value", rfileName);
		$("#cfileName").attr("value", cfileName);
		
		$("#myform").attr("action", "/servlet/board.dn");
		$("#myform").attr("encoding", "application/x-www-form-urlencoded");
		$("#myform").submit();		
	}
	
</script>

<body>
<div id="wrap_popup">
 
 	<!--%@ include file="../include/top_navi.jsp" %-->
	<hr />
	
		<!--%@ include file="../include/left.jsp" %-->
		
		
			<!-- 컨텐츠 시작 -->
			<div class="contents">
				<table summary="동영상관리" class="admin_skin_view01">
					<caption class="hidden">동영상관리</caption>
					<colgroup>
						<col width="17%" />
						<col width="33%" />
						<col width="17%" />
						<col width="33%" />
					</colgroup>
					<tbody>
					<tr class="first_td">
						<th scope="row" colspan="4" class="center"><%=board.getTitle() %></th>
					</tr>
					<tr>
						<th scope="row">작성자</th>
						<td colspan="3" align="center"><%=board.getRegName() %></td>
					</tr>
					<tr>
						<th scope="row">등록일</th>
						<td  align="center" ><%=board.getRegDate().substring(0,10) %></td>
						<th scope="row">조회수</th>
						<td  align="center"><%=board.getHitCnt() %></td>
					</tr>
					<tr>
						<th scope="row">첨부화일</th>
						<td colspan="3">
						<%
							if(boardFileList != null && boardFileList.length > 0){
								for(int a=0; a<boardFileList.length; a++){
						%>
							<a href="javascript:fileDownload('<%=boardFileList[a].getCname()%>','<%=boardFileList[a].getRname()%>')"><img  src="<%=ConstantUtil.SERVER_HOST%>/images/admin/icon_file.gif" alt="첨부파일" />&nbsp;<%=boardFileList[a].getCname() %></a>&nbsp;&nbsp;
						<%
								}
							}
						%>
						</td>
					</tr>
					<tr>
						<th scope="row">내용</th>
						<td colspan="3"><%=board.getContent().replaceAll("\\r\\n","<br/>") %></td>
					</tr>
					
					</tbody>
				</table>
				<p class="skin_btn center">
				<!--	<a href="javascript:productList();" class="admin_text_btn01">목록</a>
				-->
					<a href="javascript:l_close();" class="admin_text_btn06">닫기</a>
				</p>
			
				<form name="myform" id="myform" method="post" action="">
					<input type="hidden" id="bdId" name="bdId" value="<%=strBoardId %>" />
					<input type="hidden" id="contId" name="contId" value="<%=strContId %>"/>
					<input type="hidden" id="pageNum" name="pageNum" value="<%=currentPage %>" />					
					<input type="hidden" id="listSize" name="listSize" value="<%=listSize %>" />
					<input type="hidden" id="fileType" name="fileType" value="board" />
					<input type="hidden" id="rfileName" name="rfileName" />
					<input type="hidden" id="cfileName" name="cfileName" />		
				</form>
			</div>
			<!-- 컨텐츠 끝 -->
	<hr />
</div>
</body>
</html>