<%@ page contentType="text/html;charset=utf-8" %>

<%@ include file="../common/_includeInit.inc" %>
<%@ include file="../common/_includeCommon.inc" %>

<%
	String strBoardId = ConstantUtil.BOARD_CODE_ADMIN_NOTICE;
	int currentPage = 1;
	int listSize = 10;
	int totalCount = 0;
	int totalPage = 1;

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
	else
		searchValue = java.net.URLDecoder.decode(searchValue,"UTF-8");
		
	BoardMgr boardMgr = mgr.getBoardMgr();
	HashMap params = new HashMap();
	params.put("bdId", strBoardId);
	params.put("showYn", "Y");
	params.put("searchType", searchType);
	params.put("searchValue", searchValue);
	params.put("pageNum", (currentPage - 1) * listSize);
	params.put("listSize", listSize);

	//총갯수
	totalCount = boardMgr.getBoardListCnt(params);
	totalPage = totalCount / listSize;
	if( totalCount % listSize > 0 || totalCount == 0)
		totalPage = totalCount / listSize + 1;

	//목록
	Board[] boardList = boardMgr.getBoardList(params);
%>

<%@ include file="../include/global_head.jsp" %>

<script type="text/javascript">
	$(document).ready(function() {
		$("#searchType > option[value='<%=searchType%>']").attr("selected", true);

		$("#searchValue").keydown(function(event) {
  		if (event.keyCode == 13) {
  		  boardSearch();
  		  return false;
	    }
	  });
	});
	
	
	function boardSearch(){
		var param = "pageNum=1&searchType=" + $("#searchType").val()
			  + "&searchValue=" + encodeURI(encodeURIComponent($("#searchValue").val())) ;
		
		$("#tit_main").text("건업양도양수 > ");
		$("#tit_sub").text("공지사항");
		//$("#sub_title").html('<img src="./images/icon/title1_01.gif">');
		$("#sub_title").html('<img src="./images/icon/notice_title_01.gif">');
		$("#content_view").load("./sub/sub11_01.jsp?" + param);
		
	}
	
/*	
	function boardView(contId){
		//$("#contId").attr("value", contId);
		//$("#myform").attr("action", "./admin_notice_view.jsp");
		//$("#myform").submit();
		
		var param = "contId=" + contId 
				  + "&listSize=" + $("#listSize").val()
				  + "&pageNum=" + $("#pageNum").val() ;
				  
		$("#tit_main").text("건업양도양수 > ");                                             
		$("#tit_sub").text("공지사항");                                           
		$("#sub_title").html('<img src="./images/icon/notice_title_01.gif">');
		$("#content_view").load("./sub/sub11_02.jsp?" + param );
	}   
*/	
	function boardView(contId){
		//$("#productId").attr("value", productId);
		//$("#myformView").attr("action", "./product_view.jsp");
  		//$("#myformView").submit();


		var param = "?contId="   + contId;
		var openUrl = "/sub/sub11_03.jsp" + param;
		l_viewPopup2(openUrl,'boardInfo', '820','650' );

	}
        
	function chkAll()
	{
		var frm = document.myform;
		var onAndOff = frm.chkParam.checked

		//리스트가 없으면
		if(frm.param == null) {
		
			return;
		}

		//리스트가 하나면
		if(frm.param.length == null){
			if(frm.param.checked == true){
				frm.param.checked = false;
			}else{
				frm.param.checked = true;
			}
		}else{

			for(i=0 ; i<frm.param.length ; i++){

				if(onAndOff == true){
					frm.param[i].checked = true;
				}else{
					frm.param[i].checked = false;
				}
			}
		}
	}


</script>

<body>


		<!--  로케이션 -->
			
		<form name="myform" id="myform" method="post">
			<input type="hidden" name="condIdList" id="condIdList" value=""/>

			<!-- 컨텐츠 시작 -->
			<div class="contents">
				<p class="list_num">[전체목록 : <%=totalCount %>건]</p>
				<table summary="관리자메인" class="admin_skin_list01">
				<caption class="hidden">관리자메인</caption>
				<thead>
					<tr>
					<!--	<th scope="col" width="8%"><input type="checkbox" name="chkParam" id="chkParam" onclick="chkAll();"/>선택</th> -->
						<th scope="col" width="8%">번호</th>
						<th scope="col" width="*">제목</th>
						<th scope="col" width="12%">작성자</th>
						<th scope="col" width="12%">등록일</th>
					<!--	<th scope="col" width="10%">동영상보기</th> -->
						<th scope="col" width="8%">조회</th>
					</tr>
				</thead>
				<tbody>
				<%
					if( boardList.length > 0){
						int rowCnt = totalCount - (currentPage - 1) * listSize;
						for(int i=0; i<boardList.length; i++, rowCnt--){
				%>
					<tr>
				<!--
						<td>
                            <input type="checkbox" name="param" id="param" value="<%=boardList[i].getContId()%>"/>
						</td>
				-->		
						<td><%=rowCnt %></td>
						<td class="left"><a href="javascript:boardView('<%=boardList[i].getContId() %>');">&nbsp;&nbsp;<%=boardList[i].getTitle() %></a></td>
						<td><%=boardList[i].getRegName() %></td>
						<td><%=boardList[i].getRegDate().substring(0,10) %></td>
						<td><%=boardList[i].getHitCnt() %></td>
					</tr>
				<%
						}
					}
					else {
				%>
					<tr>
						<td colspan="7">조회된 데이터가 없습니다.</td>
					</tr>
				<%
					}
				%>
				</tbody>
				</table>
				<div class="paging_wrap">
				<%
		           // 페이징 부분 출력 위한 변수
		           request.setAttribute("currentPage", String.valueOf(currentPage) );
		           request.setAttribute("totalCount", String.valueOf(totalCount) );
		           request.setAttribute("listSize", String.valueOf(listSize) );
		        %>
		            <jsp:include page="../common/notice_paging.jsp" flush="true" />
				</div>

				<!-- 검색  -->
				<!--<form name="myform" id="myform" method="post" action=""> -->
					<input type="hidden" id="pageNum" name="pageNum" value="<%=currentPage%>" />
					<input type="hidden" id="listSize" name="listSize" value="<%=listSize%>" />
					<input type="hidden" id="contId" name="contId" />
					<input type="hidden" id="fileType" name="fileType" value="board" />
					
					<fieldset>
					<legend>게시물 검색</legend>
					<div class="list_search">
						<select id="searchType" name="searchType">
							<option value="title">제목</option>
							<option value="content">내용</option>
						</select>
<!-- 						onkeypress="if(event.keyCode == 13) boardSearch(); return false;" -->
						<input type="text" id="searchValue" name="searchValue" value="<%=searchValue %>" class="search_input" />
						<img  src="<%=ConstantUtil.SERVER_HOST%>/images/admin/btn_search.gif" alt="검색" onclick="boardSearch()" style="cursor:pointer"/>
					</div>
				</fieldset>
					
					
				<!-- 검색 끝  -->
			</div>
			<!-- 컨텐츠 끝 -->
	</form>
</body>
</html>