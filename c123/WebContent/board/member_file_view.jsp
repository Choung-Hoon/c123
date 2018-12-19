<%@ page contentType="text/html;charset=utf-8" %>

<%@ include file="../common/_includeInit.inc" %>
<%@ include file="../common/_includeCommon.inc" %>
<%@ include file="../common/_checkLogin.inc" %> 

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
		$("#myform").attr("action", "./member_file_list.jsp");
		$("#myform").submit();
	}
	function updBoard(){
		$("#myform").attr("action", "./member_file_update.jsp");
		$("#myform").submit();
	}
	function delBoard(){
		if(confirm("정말 삭제하시겠습니까?")){
			$("#myform").attr("action", "./member_file_delete_ok.jsp");
			$("#myform").submit();
		}
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
<div id="wrap">
 
 	<%@ include file="../include/top_navi.jsp" %>
	<hr />
	<div id="container">
	
		<%@ include file="../include/left.jsp" %>
		
		<div class="contents_wrap">
		
			<!--  로케이션 -->
			<div class="location">
				<h1>파일관리</h1>
				<p>
					<a href="../main/main.jsp">홈</a> &gt; 
					<strong>파일관리</strong>
				</p>
			</div>
			
			<!-- 컨텐츠 시작 -->
			<div class="contents">
				<table summary="파일관리" class="admin_skin_view01">
					<caption class="hidden">파일내용보기</caption>
					<colgroup>
						<col width="17%" />
						<col width="33%" />
						<col width="17%" />
						<col width="33%" />
					</colgroup>
					<tbody>
					<tr class="first_td">
						<th scope="row" colspan="4" class="left"><%=board.getTitle() %></th>
					</tr>
					<tr>
						<th scope="row">작성자</th>
						<td colspan="3"><%=board.getRegName() %></td>
					</tr>
					<tr>
						<th scope="row">등록일</th>
						<td><%=board.getRegDate().substring(0,10) %></td>
						<th scope="row">조회수</th>
						<td><%=board.getHitCnt() %></td>
					</tr>
					<tr>
						<td colspan="4"><%=board.getContent() %></td>
					</tr>
					</tbody>
				</table>
				
				<p class="skin_btn right">
					<a href="javascript:boardList();" class="admin_text_btn01">목록</a>
		<%			
			if ( userTypeFlag <= 1)	{
		%>
					<a href="javascript:updBoard();" class="admin_text_btn01">수정</a> 
					<a href="javascript:delBoard();" class="admin_text_btn04">삭제</a>
		<%
			}
		%>
				</p>	

				<form name="myform" id="myform" method="post" action="">
					<input type="hidden" id="bdId" name="bdId" value="<%=strBoardId %>" />
					<input type="hidden" id="contId" name="contId" value="<%=strContId %>"/>
					<input type="hidden" id="pageNum" name="pageNum" value="<%=currentPage %>" />					
					<input type="hidden" id="listSize" name="listSize" value="<%=listSize %>" />
					<input type="hidden" id="searchType" name="searchType" value="<%=searchType %>" />
					<input type="hidden" id="searchValue" name="searchValue" value="<%=searchValue %>" />	
					
					<input type="hidden" id="fileType" name="fileType" value="board" />
					<input type="hidden" id="rfileName" name="rfileName" />
					<input type="hidden" id="cfileName" name="cfileName" />			
				</form>
			</div>
			<!-- 컨텐츠 끝 -->
			
		</div>
	</div>	
	<hr />
</div>
</body>
</html>