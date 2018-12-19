<%@ page contentType="text/html;charset=utf-8" %>

<%@ include file="../common/_includeInit.inc" %>
<%@ include file="../common/_includeCommon.inc" %>
<%@ include file="../common/_checkLogin.inc" %>

<%
	String strProductId = request.getParameter( "productId" );
	int currentPage = 1;
	int listSize = 10;

	// 게시물 ID
	if(strProductId == null || strProductId.equals(""))
	{
		goAlert(pageContext, "상품 ID가 누락되었습니다.");
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


	ProductMgr productMgr = mgr.getProductMgr();
	HashMap params = new HashMap();
	params.put("productId", strProductId);
	params.put("searchType", searchType);
	params.put("searchValue", searchValue);
	params.put("pageNum", (currentPage - 1) * listSize);
	params.put("listSize", listSize);

	// 게시물 정보
	Product product = productMgr.getProduct(params);

	//첨부파일
	ProductFile[] productFileList = null;
	//if(product.getProductFileCnt() > 0){
		productFileList = productMgr.getProductFileList(product.getProductId());
	//}
%>

<%@ include file="../include/global_head.jsp" %>

<script type="text/javascript">
	$(document).ready(function() {
		//-- 업로드 이미지 제거
		var productCnt = <%= productFileList.length %> ;
		for(a=productCnt + 1; a <= 10; a++)
			$("#addImg" + a).hide();

	});
	
	function updProduct(){

		if(!Common.isValue($("#jobKind").val()))
		{
			alert("업종을 입력하세요.");
		  	$("#jobKind").focus();
		  	return;
		}

		if(!Common.isValue($("#companyNm").val()))
		{
			alert("회사명을 입력하세요.");
		  	$("#companyNm").focus();
		  	return;
		}

		if(!Common.isValue($("#handoverCond").val()))
		{
			alert("양도조건을 입력하세요.");
		  	$("#handoverCond").focus();
		  	return;
		}


		if(!Common.isValue($("#contents").val()))
		{
		  	alert('내용을 입력하세요');
		  	$("#contents").focus();
		  	return;
		}

		$("#myform").attr("action", "./product_update_ok.jsp");
  		$("#myform").submit();
	}

	function ProductView() {
		history.back(-1);
	}
	function display_img_add(){
		var fileCnt = 0;
		for(a=1; a<=10; a++){
			if($("#addImg" + a).css("display") == "none"){
				$("#addImg" + a).show();
				break;
			}
			fileCnt++;
		}

		if(fileCnt >= 10)
			alert("이미지 등록은 최대 10개 까지 가능합니다.");
	}
	function display_img_del(num){
		//-- file 속성이 readonly 이므로 value 변경이 불가능하여 새로 생성.
		var strHtml = "<th scope='row'><label for='fileImg" + num + "'>이미지 " + num + "</label></th>\n";
		strHtml += "<td>\n";
		strHtml += "<input type='file' id='fileImg" + num + "' name='fileImg" + num + "' class='file_input' />\n";
		strHtml += "&nbsp;&nbsp;<button type='button' class='admin_text_btn01' onclick='display_img_del(" + num + ")'>삭제</button>\n";
		strHtml += "</td>\n";

		$("#addImg" + num).html(strHtml);
		$("#addImg" + num).hide();
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
				<h1>포토뉴스</h1>
				<p>
					<a href="../main/main.jsp">홈</a> &gt;
					<a href="../product/mentoring_notice_list.jsp">게시판관리</a> &gt;
					<a href="../product/mentoring_notice_list.jsp">장학사업</a> &gt;
					<strong>활동게시판</strong>
				</p>
			</div>

			<!-- 컨텐츠 시작 -->
			<div class="contents">
				<form name="myform" id="myform" method="post" action="" enctype="multipart/form-data">
					<input type="hidden" id="productId" name="productId" value="<%=strProductId %>"/>
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
								<th scope="row"><label for="jobKind">업종</label></th>
								<td><input type="text" id="jobKind" name="jobKind" value="<%=product.getJobKind()%>" class="text_input" /></td>
							</tr>
							<tr>
								<th scope="row"><label for="content">회사명</label></th>
								<td><input type="text" id="companyNm" name="companyNm" value="<%=product.getCompanyNm()%>"  size="50" class="text_input" /></td>
							</tr>
							<tr>
								<th scope="row"><label for="content">양도조건</label></th>
								<td><input type="text" id="handoverCond" name="handoverCond" value="<%=product.getHandoverCond()%>"  size="80" class="text_input" /></td>
							</tr>
							<tr>
								<th scope="row"><label for="contents">내용</label></th>
								<td>
									<textarea id="contents" name="contents" style="width:98%; height:50px; margin-top:3px;"><%=product.getContents()%></textarea>
								</td>
							</tr>
							
							<%
								int fileCnt = productFileList.length;
								int imgCnt = 1;
								StringBuilder sb = new StringBuilder();

								for(int a=0; a<10; a++){
								
									StringBuilder sbTemp = new StringBuilder();

									if( a < fileCnt && productFileList[a].getFileType().equals("4")){
										sbTemp.append("<input type='hidden' id='fileId" + a + "' name='fileId" + a + "' value='" + productFileList[a].getBfileId() + "' />  \n");
										sbTemp.append("<input type='hidden' id='oldRname" + a + "' name='oldRname" + a + "' value='" + productFileList[a].getRname() + "' />  \n");
										sbTemp.append("<p>	\n " + productFileList[a].getCname() + "&nbsp;  \n");
										sbTemp.append("<input type='checkbox' id='fileDelChk" + a + "' name='fileDelChk" + a + "' value='Y' class='checkbox' /><label for='fileDelChk" + a + "'>파일삭제</label>  \n</p>  \n");
									}

									sb.append("<tr id='addImg" + imgCnt + "'>  \n");
									sb.append("<th scope='row'><label for='fileImg" + imgCnt + "'>이미지" + imgCnt + "</label></th>  \n");
									sb.append("<td>  \n");
									sb.append(sbTemp.toString());
									sb.append("<input type='file' id='fileImg" + imgCnt + "' name='fileImg" + imgCnt + "' class='file_input' />  \n");

									if( a >= fileCnt)
										sb.append("&nbsp;&nbsp;<button type='button' class='admin_text_btn01' onclick='display_img_del(" + (a+1) + ")'>삭제</button>");

									sb.append("</td>  \n");
									imgCnt++;

									sb.append("</tr>  \n");
								}
								out.println(sb.toString());
							%>

						</table>
						<div class="paging_wrap">
							<p class="registration_btn">
								<button type="button" class="admin_text_btn01" onclick="display_img_add()">+ 이미지 추가</button>
							</p>
							<p class="left_input">
								<button type="button" class="admin_text_btn01" onclick="updProduct()">확인</button>
								<button type="button" class="admin_text_btn04" onclick="ProductView()">취소</button>
							</p>
						</div>
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