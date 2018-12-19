<%@ page contentType="text/html;charset=utf-8" %>

<%@ include file="../common/_includeInit.inc" %>
<%@ include file="../common/_includeCommon.inc" %>
<%@ include file="../common/_checkLogin.inc" %>

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
	});

	function boardSearch(){
		//if(!Common.isValue($("#searchValue").val())){
		//	alert("검색할 단어를 입력해 주세요.");
		//	return;
		//}

		$("#pageNum").attr("value", "1");

		$("#myform").attr("action", "./admin_notice_list.jsp");
  		$("#myform").submit();
	}
	function boardView(contId){
		$("#contId").attr("value", contId);
		$("#myform").attr("action", "./admin_notice_view.jsp");
		$("#myform").submit();
	}

	function boardWrite(){
		$("#myform").attr("action", "./admin_notice_write.jsp");
  		$("#myform").submit();
	}

	function fileDownload(cfileName, rfileName){
		$("#rfileName").attr("value", rfileName);
		$("#cfileName").attr("value", cfileName);

		$("#myform").attr("action", "/servlet/board.dn");
		$("#myform").attr("encoding", "application/x-www-form-urlencoded");
		$("#myform").submit();
	}

	function open_win(filename, idx){
		window.open('<%=ConstantUtil.SERVER_HOST%>/dhx/dhxTest5.jsp?filename=' + filename ,'popup_'+idx , 'toolbar=no, location=no, directories=no, status=no, menubar=no, resizable=no, scrollbars=no, copyhistory=no');
	    //window.open('<%=ConstantUtil.SERVER_HOST%>/dhx/dhxTest5.jsp?filename=' + filename ,'popup_'+idx , 'toolbar=no, location=no, directories=no, status=no, menubar=no, resizable=no, scrollbars=no, copyhistory=no');
	    //window.open('<%=ConstantUtil.SERVER_HOST%>/dhx/dhxTest6.jsp?filename=' + filename ,'_blank','toolbar=0, location=0, status=0, menubar=0, scrollbars=1, resizable=1')
	 }
	
	function viewProduct(productId){
		var param = "?productId="   + productId;
		var openUrl = "/board/admin_movie_view1.jsp" + param;
		l_viewPopup2(openUrl,'productInfo', '840','700' );

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


    function delFile()
	{
		var frm = document.myform;
		var condIdList = "";

		var cnt = 0;

		//리스트가 없으면
		if( frm.param == null )
		{
			alert( '삭제할 동영상을 선택하십시오.');
			return;
		}

		//리스트가 하나면
		if(frm.param.length == null){
			if(frm.param.checked == true){
				condIdList = condIdList + frm.param.value + ",";
				cnt++;
			}
		}else{
			for(i=0 ; i<frm.param.length ; i++){
				if(frm.param[i].checked == true){
					condIdList = condIdList + frm.param[i].value + ",";
				cnt++;
				}
			}
		}

		// 목록 선택 여부 체크
		if(cnt == 0)
		{
			alert("삭제할 동영상을 선택하십시오.");
			return;
		}

		if( !confirm("선택한 동영상을 삭제하시겠습니까?") )
		{
			return;
		}

		// 마지막 페이지의 모든 내용을 삭제하면 이전 페이지로 이동
		if (<%=totalCount%> == ((parseInt(frm.pageNum.value)-1)*<%=listSize%> + cnt) )
		{
			frm.pageNum.value = "" + ( parseInt(frm.pageNum.value) - 1 );
		}

		frm.condIdList.value = condIdList;
		$("#myform").attr("action", "admin_notice_delete_ok.jsp");
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
				<h1>동영상등록</h1>
				<p>
					<a href="../main/main.jsp">홈</a> &gt;
					<a href="../board/admin_notice_list.jsp">동영상관리</a> &gt;
					<strong>동영상등록</strong>
				</p>
			</div>
		<form name="myform" id="myform" method="post">
			<input type="hidden" name="condIdList" id="condIdList" value=""/>

			<!-- 컨텐츠 시작 -->
			<div class="contents">
				<p class="list_num">[페이지 : <%=currentPage %>/<%=totalPage %>] [전체목록 : <%=totalCount %>건]</p>
				<table summary="관리자메인" class="admin_skin_list01">
				<caption class="hidden">관리자메인</caption>
				<thead>
					<tr>
						<th scope="col" width="8%"><input type="checkbox" name="chkParam" id="chkParam" onclick="chkAll();"/>선택</th>
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
						<td>
                            <input type="checkbox" name="param" id="param" value="<%=boardList[i].getContId()%>"/>
						</td>
						<td><%=rowCnt %></td>
						<td class="left"><a href="javascript:boardView('<%=boardList[i].getContId() %>');">&nbsp;&nbsp;<%=boardList[i].getTitle() %></a></td>
						<td><%=boardList[i].getRegName() %></td>
						<td><%=boardList[i].getRegDate().substring(0,10) %></td>
					<!--
						<td>
						<%
							BoardFile[] boardFileList = boardMgr.getBoardFileList(boardList[i].getContId());
							for(int a=0; a<boardFileList.length; a++)
							{
						%>
							<a href="javascript:open_win('<%=boardFileList[a].getRname()%>','<%=i%>')"><img  src="<%=ConstantUtil.SERVER_HOST%>/images/admin/icon_file.gif" alt="엑셀보기" /></a>

						<%
							}
						%>
						</td>
					-->	
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
		            <jsp:include page="../common/paging.jsp" flush="true" />
		<%
			if ( userTypeFlag <= 1)	{
		%>
					<p class="left_input">
						<a href="javascript:boardWrite();" class="admin_text_btn01">동영상등록</a>&nbsp;
						<a href="javascript:delFile();" class="admin_text_btn01">삭제하기</a>
					</p>
		<%
			}
		%>
				</div>
				<!-- 검색  -->
				<!--<form name="myform" id="myform" method="post" action=""> -->
					<input type="hidden" id="pageNum" name="pageNum" value="<%=currentPage%>" />
					<input type="hidden" id="listSize" name="listSize" value="<%=listSize%>" />
					<input type="hidden" id="contId" name="contId" />
					<input type="hidden" id="fileType" name="fileType" value="board" />
					<input type="hidden" id="rfileName" name="rfileName" />
					<input type="hidden" id="cfileName" name="cfileName" />

					<fieldset>
						<legend>게시물 검색</legend>
						<div class="list_search">
							<select id="searchType" name="searchType">
								<option value="title">제목</option>
								<option value="content">내용</option>
							</select>
							<input type="text" id="searchValue" name="searchValue" value="<%=searchValue %>" class="search_input" onkeypress="if(event.keyCode == 13) boardSearch();"/>
							<img  src="<%=ConstantUtil.SERVER_HOST%>/images/admin/btn_search.gif" alt="검색" onclick="boardSearch()" style="cursor:pointer"/>
						</div>
					</fieldset>
				<!-- 검색 끝  -->
			</div>
			<!-- 컨텐츠 끝 -->
	</form>
		</div>
	</div>
	<hr />
</div>
</body>
</html>