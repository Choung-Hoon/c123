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
		goAlert(pageContext, "[" + strProductId + "] 상품 ID가 누락되었습니다.");
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
	//productMgr.updateProductViewCnt(params); 
	Product product = productMgr.getProduct(params);	 
	
	// 이전글, 다음글
	//Product nextProduct = productMgr.getNextProduct(params);
	//Product prevProduct = productMgr.getPrevProduct(params);

	//첨부파일
	ProductFile[] productFileList = null;
	//if(product.getProductFileCnt() > 0){
		productFileList = productMgr.getProductFileList(product.getProductId());
	//}
%>

<%@ include file="../include/global_head.jsp" %>

<script type="text/javascript">
	$(document).ready(function() {
		var strDesc = $("#imgMainDesc").html();		
		$("#description").html(strDesc);	
	});	
	function productList() {
		$("#myform").attr("action", "./product_list.jsp");
		$("#myform").submit();
	}
	function updProduct(){
		$("#myform").attr("action", "./product_update.jsp");
		$("#myform").submit();
	}
	function delProduct(){
		if(confirm("정말 삭제하시겠습니까?")){
			$("#myform").attr("action", "./product_delete_ok.jsp");
			$("#myform").submit();
		}
	}
	
	function fileDownload(cfileName, rfileName){
		$("#rfileName").attr("value", rfileName);
		$("#cfileName").attr("value", cfileName);
		
		$("#myform").attr("action", "/servlet/product.dn");
		$("#myform").attr("encoding", "application/x-www-form-urlencoded");
		$("#myform").submit();		
	}	
	function imageView(imgNum){
		var imgSrc = $("#subImg_" + imgNum).attr("src");
		var strDesc = $("#img" + imgNum + "Desc").html();
		
		$("#mainImg").attr("src", imgSrc);
		$("#description").html(strDesc);
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
					<a href="../product/scholarship_student_list.jsp">재단소식</a> &gt; 
					<strong>피플 인터뷰</strong>
				</p>
			</div>
			
			<!-- 컨텐츠 시작 -->
			<div class="contents">
				<table summary="관리자메인" class="admin_skin_view01">
					<caption class="hidden">관리자메인</caption>
					<colgroup>
						<col width="17%" />
						<col width="33%" />
						<col width="17%" />
						<col width="33%" />
					</colgroup>
					<tbody>
					<tr class="first_td">
						<th scope="row">업종</th>
						<td colspan="3"><%=product.getJobKind() %></th>
					</tr>
					<tr>
						<th scope="row">회사명</th>
						<td colspan="3"><%=product.getCompanyNm() %></td>
					</tr>
					<tr>
						<th scope="row">양도조건</th>
						<td colspan="3"><%=product.getHandoverCond() %></td>
					</tr>
					<tr>
						<th scope="row">내용</th>
						<td colspan="3"><%=product.getContents().replaceAll("\\r\\n","<br/>") %></td>
					</tr>
					<tr>
						<th scope="row">첨부화일</th>
						<td colspan="3">
						<%
							if(productFileList != null && productFileList.length > 0){
								for(int a=0; a<productFileList.length; a++){
									if(productFileList[a].getFileType().equals("4")){
						%>
							<a href="javascript:fileDownload('<%=productFileList[a].getCname()%>','<%=productFileList[a].getRname()%>')"><img src="../images/admin/icon_file.gif" alt="첨부파일" />&nbsp;<%=productFileList[a].getCname() %></a>&nbsp;&nbsp;
						<%
									}
								}
							}
						%>
						</td>
					</tr>
					<tr>
						<td colspan="4">
							<div class="thumbnail_box">
								<%
									String strMainImg = "";
									String strImgs = "";
									String strHidden = "";
									boolean isFirst = true ; 
									if(productFileList != null && productFileList.length > 0){
										for(int a=0; a<productFileList.length; a++){
											if(productFileList[a].getFileType().equals("4") && isFirst){
												strMainImg += "<img id='mainImg' src='/servlet/product.dn?fileType=product&cfileName=" + productFileList[a].getCname() + "&rfileName=" + productFileList[a].getRname() + "' alt='" + productFileList[a].getCname() + "' onerror='javascript:this.src=\"../images/admin/noImg.gif\"' />";
												strHidden += "<span id='imgMainDesc' style='display:none;'>" + productFileList[a].getDescript().replaceAll("\\r\\n","<br/>") + "</span>";
												isFirst = false ;
											}
											
											if(productFileList[a].getFileType().equals("4")){
												strImgs += "<a href='javascript:imageView(" + a + ");'><img id='subImg_" + a + "' src='/servlet/product.dn?fileType=product&cfileName=" + productFileList[a].getCname() + "&rfileName=" + productFileList[a].getRname() + "' alt='" + productFileList[a].getCname() + "' width='50' height='50' onerror='javascript:this.src=\"../images/admin/noImg.gif\"'/></a> \n";
												strHidden += "<span id='img" + a + "Desc' style='display:none;'>" + productFileList[a].getDescript().replaceAll("\\r\\n","<br/>") + "</span>";
											}											
										}
									}									
								%>													
								<p class="big"><%=strMainImg %></p>
								<p id="description"></p>
																
								<div class="small"><%=strImgs %></div>
								<br/>
								<%=strHidden %>
							</div>							
						</td>
					</tr>					
					</tbody>
				</table>
				<p class="skin_btn right">
				<!--	<a href="javascript:productList();" class="admin_text_btn01">목록</a>
				-->
					<a href="javascript:updProduct();" class="admin_text_btn01">수정</a> 
					<a href="javascript:delProduct();" class="admin_text_btn04">삭제</a>
				</p>
			
				<form name="myform" id="myform" method="post" action="">
					<input type="hidden" id="productId" name="productId" value="<%=strProductId %>"/>
					<input type="hidden" id="pageNum" name="pageNum" value="<%=currentPage %>" />					
					<input type="hidden" id="listSize" name="listSize" value="<%=listSize %>" />
					<input type="hidden" id="searchType" name="searchType" value="<%=searchType %>" />
					<input type="hidden" id="searchValue" name="searchValue" value="<%=searchValue %>" />	
					
					<input type="hidden" id="fileType" name="fileType" value="product" />
					<input type="hidden" id="rfileName" name="rfileName" />
					<input type="hidden" id="cfileName" name="cfileName" />			
				</form>
			</div>
			<!-- 컨텐츠 끝 -->
			
			<!-- 이전글, 다음글  -->
			<div class="contents">
				<table summary="이전글, 다음글" class="admin_skin_view01">
					<caption class="hidden">관리자메인</caption>
					<colgroup>
						<col width="20%" />
						<col width="*" />						
					</colgroup>
					<tbody>
					</tbody>
				</table>				
			</div>
			<!-- 이전글, 다음글  끝  -->
			
		</div>
	</div>	
	<hr />
</div>
</body>
</html>