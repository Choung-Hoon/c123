<%@ page contentType="text/html;charset=utf-8" %>

<%@ include file="../common/_includeInit.inc" %>
<%@ include file="../common/_includeCommon.inc" %>
<%@ include file="../common/_checkLogin.inc" %> 

<%
	String strBoardId = ConstantUtil.BOARD_CODE_ADMIN_NOTICE;
	int currentPage = 1;	
	int listSize = 10;
	
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
	 
%>

<%@ include file="../include/global_head.jsp" %>

<script type="text/javascript">
	$(document).ready(function() {
		
	});
	function insBoard(){
		if(!Common.isValue($("#title").val())) 
		{
			alert("제목을 입력하세요.");
		  	$("#title").focus();
		  	return;
		}
		var content = wEditor_ContA.getHtml();
		if(content.length == ""){
		    /* if no contents, set dummy value
		  	alert('내용을 입력하세요');
		  	return;
		  	*/
		  	content = "...";
		}
		
		$("#content").attr("value", content);
		$("#myform").attr("action", "./admin_notice_write_ok.jsp");
  		$("#myform").submit();
	}
	function boardList() {
		history.back(-1);
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
				<h1>동영상 등록</h1>
				<p>
					<a href="../main/main.jsp">홈</a> &gt; 
					<a href="../board/admin_notice_list.jsp">동영상 관리</a> &gt; 
					<strong>동영상 등록</strong>
				</p>
			</div>
			
			<!-- 컨텐츠 시작 -->
			<div class="contents">
				<form name="myform" id="myform" method="post" action="" enctype="multipart/form-data">
					<input type="hidden" id="bdId" name="bdId" value="<%=strBoardId %>" />
					<input type="hidden" id="pageNum" name="pageNum" value="<%=currentPage %>" />					
					<input type="hidden" id="listSize" name="listSize" value="<%=listSize %>" />
					<input type="hidden" id="searchType" name="searchType" value="<%=searchType %>" />
					<input type="hidden" id="searchValue" name="searchValue" value="<%=searchValue %>" />
					
					<fieldset>
						<legend>글쓰기</legend>
						<table summary="글쓰기" class="admin_skin_view01">
							<caption class="hidden">글쓰기</caption>
							<colgroup>
								<col width="17%" />
								<col width="83%" />
							</colgroup>
							<tr class="first_td">
								<th scope="row">작성자</th>
								<td colspAn="3"><strong><%=curAdminInfo.getName() %></strong></td>
							</tr>
							<tr>
								<th scope="row"><label for="write_01">제목</label></th>
								<td><input type="text" id="title" name="title" value="" class="text_input width_style04" /></td>
							</tr>
							<tr>
								<th scope="row"><label for="write_02">내용</label></th>
								<td>
									<textarea id="content" name="content"></textarea>
									<script>
				  		              	var wEditor_ContA = new WebEditor("content");
				  		              	wEditor_ContA.cfg.width = "620px";
				  		              	wEditor_ContA.cfg.height = "250px";
				  		             	wEditor_ContA.cfg.Btn = ["preview","bar","all","undo","redo","bar","font","size","bar","color","hilite","bar","bold","italic","underline","strike","bar","sup","sub","bar","clean","del","bar","outdent","indent","bar","ul1","ul2","bar","left","center","right","justify","bar","hr","link","unlink","bar","table","image","upload_image","bar","source"];
				  		            	wEditor_ContA.init();
									</script>
								</td>
							</tr>
							<tr>
								<th scope="row"><label for="write_03">동영상파일 첨부</label></th>
								<td><input type="file" id="attachFile1" name="attachFile1" class="file_input" /></td>
							</tr>
						</table>
						<p class="skin_btn right">
							<button type="button" class="admin_text_btn01" onclick="insBoard()">확인</button>&nbsp; 
							<button type="button" class="admin_text_btn04" onclick="boardList()">취소</button> 
					</fieldset>
				</form>
			</div>
			<!-- 컨텐츠 끝 -->
			
		</div>
	</div>	
	<hr />
</div>
</body>
</html>