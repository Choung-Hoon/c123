<%@ page contentType="text/html;charset=utf-8" %>

<%@ page import="net.sf.jxls.transformer.XLSTransformer" %>

<%@ include file="../common/_includeInit.inc" %>
<%@ include file="../common/_includeCommon.inc" %>
<%@ include file="../common/_checkLogin.inc" %>

<%@page import="java.util.Calendar"%>

<%

	int currentPage = 1;
	int listSize = 15;
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
		listSize = 15;
	else
		listSize = Integer.parseInt(strListSize);

	// 검색 조건 가져오기
	String searchJobKind =  request.getParameter( "searchJobKind" );
	if( searchJobKind == null || searchJobKind.equals("null") )
		searchJobKind = "";

	String searchCompanyNm = request.getParameter( "searchCompanyNm" );
	if( searchCompanyNm == null || searchCompanyNm.equals("null") )
		searchCompanyNm = "";

	String searchHandoverCond = request.getParameter( "searchHandoverCond" );
	if( searchHandoverCond == null || searchHandoverCond.equals("null") )
		searchHandoverCond = "";

	String contents = request.getParameter( "contents" );
	if( contents == null || contents.equals("null") )
		contents = "";

	ProductMgr productMgr = mgr.getProductMgr();

	HashMap params = new HashMap();
	params.put("searchType", "valid");
	params.put("pageNum", (currentPage - 1) * listSize );
	params.put("listSize", listSize);

	//총갯수
	totalCount = productMgr.getProductListCnt(params);
	totalPage = totalCount / listSize;
	if( totalCount % listSize > 0 || totalCount == 0)
		totalPage = totalCount / listSize + 1;

	//목록
	Product[] productList = productMgr.getAllProductList(params);


	// 엑셀 생성 (항상 첫페이지만)
	String excelDownPath = "";
	String excelFileName = "";
	String excelFilePath = "";

/*
	if( currentPage == 1 && memberList.length >= 1 )
	{
		PropertyManager property = PropertyManager.getInstance();
		String excelTemplateFilePath = property.getString("excel.template") + File.separator + "mng_member.xls";

		// 존재하지 않으면
		excelDownPath = property.getString("excel.download");
		File file = new File(excelDownPath);
		if( !file.exists() ) file.mkdirs();

		// 엑셀 파일명 생성
		excelFileName = "member_"  + KeyGenerator.getKeyByDateFormat() + ".xls";
		excelFilePath = excelDownPath + File.separator + excelFileName;

		// 엑셀 파일 생성
		// =========================================================================================
		Map beans = new HashMap();
		beans.put( "memberList", memberMgr.getUserListForExcel( params ));
		XLSTransformer transformer = new XLSTransformer();
		transformer.transformXLS( excelTemplateFilePath, beans, excelFilePath );
	}
*/

%>

<%@ include file="../include/global_head.jsp" %>

<script src="../js/jquery-1.5.2.min.js"></script>
<script src="../js/jquery.mousewheel.min.js"></script>
<script src="../js/calendar_ahmax.js"></script>
<link rel='stylesheet' href='../share/css/calendar_ahmax.css' type='text/css' />


<script type="text/javascript">

	$(document).ready(function()
	{
		//-- 업로드 이미지 제거
		for(a=2; a<=10; a++)
			$("#addImg" + a).hide();
	});

	function display_img_add(){
		var fileCnt = 1;
		for(a=2; a<=10; a++){
			if($("#addImg" + a).css("display") == "none"){
				$("#addImg" + a).show();
				break;
			}
			fileCnt++;
		}

		if(fileCnt >=10)
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

	function insProduct(){

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

		$("#myform").attr("action", "./product_write_ok.jsp");
  		$("#myform").submit();
	}

	function fileDownload(cfileName, rfileName){
		$("#rfileName").attr("value", rfileName);
		$("#cfileName").attr("value", cfileName);

		$("#downform").attr("action", "/servlet/product.dn");
		$("#downform").attr("encoding", "application/x-www-form-urlencoded");
		$("#downform").submit();
	}

	function viewProduct(productId){
		//$("#productId").attr("value", productId);
		//$("#myformView").attr("action", "./product_view.jsp");
  		//$("#myformView").submit();


		var param = "?productId="   + productId;
		var openUrl = "/product/product_view1.jsp" + param;
		l_viewPopup2(openUrl,'productInfo', '840','700' );

	}

	function delProduct(productId){
		if(confirm("정말 삭제하시겠습니까?")){
			$("#productId").attr("value", productId);
			$("#myformView").attr("action", "./product_delete_ok.jsp");
			$("#myformView").submit();
		}
	}

	function goDownload( excelFileName )
	{
	  if(!Common.isValue(excelFileName)) return;

	  document.myform.action = "/servlet/ExcelDownLoadServlet";
	  document.myform.encoding = "application/x-www-form-urlencoded";
	  document.myform.filename.value = excelFileName;
	  document.myform.submit();
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
				<h1>물건 등록</h1>
				<p>
				<a href="../main/main.jsp">홈</a> &gt;
				<a href="../product/product_list.jsp.jsp">물건관리</a> &gt;
				<strong>물건등록/조회</strong>
			</p>

			</div>


			<!-- 컨텐츠 시작 -->
			<div class="contents">

				<fieldset>
					<legend>게시물 검색</legend>
						<!-- 검색  -->
						<form name="myform" id="myform" method="post" action="" enctype="multipart/form-data">

						<input type=hidden name="pageNum" id="pageNum" value="<%=currentPage%>">
						<input type=hidden name="hidUserID" id="hidUserID" value="">
						<input type=hidden name="filename" id="filename" value="">

<!--
						<div class="search">
							<div>
								<p class="terms_check">
									<strong><label for="search_01">업종  </label></strong>
									<input type="text" id="jobKind" name="jobKind" class="text_input" value="<%=searchJobKind%>"  />
								</p>
								<p class="terms_check">
									<strong><label for="search_02">회사명  </label></strong>
									<input type="text" id="companyNm" name="companyNm" class="text_input" size="50" value="<%=searchCompanyNm %>" />
								</p>
								<p class="terms_check">
									<strong><label for="search_02">양도조건  </label></strong>
									<input type="text" id="handoverCond" name="handoverCond" class="text_input" size="80" value="<%=searchHandoverCond %>" />
								</p>
								<p class="terms_check">
									<strong><label for="search_02">내용  </label></strong>
										<textarea id="contents" name="contents" rows="2" cols="80"></textarea>
								</p>
							</div>
						</div>
-->
						<table summary="글쓰기" class="admin_skin_view01">
							<caption class="hidden">글쓰기</caption>
							<colgroup>
								<col width="17%" />
								<col width="83%" />
							</colgroup>
							<tr class="first_td">
								<th scope="row"><label for="jobKind">업종</label></th>
								<td><input type="text" id="jobKind" name="jobKind" value="" class="text_input" /></td>
							</tr>
							<tr>
								<th scope="row"><label for="content">회사명</label></th>
								<td><input type="text" id="companyNm" name="companyNm" value=""  size="50" class="text_input" /></td>
							</tr>
							<tr>
								<th scope="row"><label for="content">양도조건</label></th>
								<td><input type="text" id="handoverCond" name="handoverCond" value=""  size="80" class="text_input" /></td>
							</tr>
							<tr>
								<th scope="row"><label for="contents">내용</label></th>
								<td>
									<textarea id="contents" name="contents" style="width:98%; height:50px; margin-top:3px;"></textarea>
								</td>
							</tr>
							<tr>
								<th scope="row"><label for="fileImg1">이미지 1</label></th>
								<td>
									<input type="file" id="fileImg1" name="fileImg1" class="file_input" />
								</td>
							</tr>
							<tr id="addImg2">
								<th scope="row"><label for="fileImg2">이미지 2</label></th>
								<td>
									<input type="file" id="fileImg2" name="fileImg2" class="file_input" />
									&nbsp;&nbsp;<button type="button" class="admin_text_btn01" onclick="display_img_del(2)">삭제</button>
								</td>
							</tr>
							<tr id="addImg3">
								<th scope="row"><label for="fileImg3">이미지 3</label></th>
								<td>
									<input type="file" id="fileImg3" name="fileImg3" class="file_input" />
									&nbsp;&nbsp;<button type="button" class="admin_text_btn01" onclick="display_img_del(3)">삭제</button>
								</td>
							</tr>
							<tr id="addImg4">
								<th scope="row"><label for="fileImg4">이미지 4</label></th>
								<td>
									<input type="file" id="fileImg4" name="fileImg4" class="file_input" />
									&nbsp;&nbsp;<button type="button" class="admin_text_btn01" onclick="display_img_del(4)">삭제</button>
								</td>
							</tr>
							<tr id="addImg5">
								<th scope="row"><label for="fileImg5">이미지 5</label></th>
								<td>
									<input type="file" id="fileImg5" name="fileImg5" class="file_input" />
									&nbsp;&nbsp;<button type="button" class="admin_text_btn01" onclick="display_img_del(5)">삭제</button>
								</td>
							</tr>
							<tr id="addImg6">
								<th scope="row"><label for="fileImg6">이미지 6</label></th>
								<td>
									<input type="file" id="fileImg6" name="fileImg6" class="file_input" />
									&nbsp;&nbsp;<button type="button" class="admin_text_btn01" onclick="display_img_del(6)">삭제</button>
								</td>
							</tr>
							<tr id="addImg7">
								<th scope="row"><label for="fileImg7">이미지 7</label></th>
								<td>
									<input type="file" id="fileImg7" name="fileImg7" class="file_input" />
									&nbsp;&nbsp;<button type="button" class="admin_text_btn01" onclick="display_img_del(7)">삭제</button>
								</td>
							</tr>
							<tr id="addImg8">
								<th scope="row"><label for="fileImg8">이미지 8</label></th>
								<td>
									<input type="file" id="fileImg8" name="fileImg8" class="file_input" />
									&nbsp;&nbsp;<button type="button" class="admin_text_btn01" onclick="display_img_del(8)">삭제</button>
								</td>
							</tr>
							<tr id="addImg9">
								<th scope="row"><label for="fileImg8">이미지 9</label></th>
								<td>
									<input type="file" id="fileImg9" name="fileImg9" class="file_input" />
									&nbsp;&nbsp;<button type="button" class="admin_text_btn01" onclick="display_img_del(9)">삭제</button>
								</td>
							</tr>
							<tr id="addImg10">
								<th scope="row"><label for="fileImg10">이미지 10</label></th>
								<td>
									<input type="file" id="fileImg10" name="fileImg10" class="file_input" />
									&nbsp;&nbsp;<button type="button" class="admin_text_btn01" onclick="display_img_del(10)">삭제</button>
								</td>
							</tr>
						</table>
						<div class="paging_wrap">
							<p class="registration_btn">
								<button type="button" class="admin_text_btn01" onclick="display_img_add()">+ 이미지 추가</button>
							</p>
							<p class="left_input">
								<button type="button" class="admin_text_btn01" onclick="insProduct()" >등록</button> &nbsp;
							</p>
						</div>

						</form>
						<!-- 검색  -->
						<p class="list_num sub_table">[전체목록 : <%=totalCount %>건]</p>

						<table summary="관리자메인" class="admin_skin_list01">
						<caption class="hidden">관리자메인</caption>
						<thead>
							<tr>
								<th scope="col" width="40">번호</th>
								<th scope="col" width="80">업종</th>
								<th scope="col" width="150">회사명</th>
								<th scope="col" width="200">양도조건</th>
								<th scope="col">파일</th>
								<th scope="col" width="50">삭제</th>
							</tr>
						</thead>
						<tbody>
							<%
								if(productList.length > 0){

									int rowCnt = totalCount - (currentPage - 1) * listSize;
									for(int i=0; i<productList.length; i++){

							%>
								<tr >
									<td><%=rowCnt %></td>
									<td ><a href="javascript:viewProduct('<%=productList[i].getProductId()%>')"><%=productList[i].getJobKind()%></a></td>
									<td class="left"><%=productList[i].getCompanyNm()%></td>
									<td class="left"><%=productList[i].getHandoverCond()%></td>
									<td class="left">
						<%
							ProductFile[] productFileList = null;
							productFileList = productMgr.getProductFileList(productList[i].getProductId());

							if(productFileList != null && productFileList.length > 0){
								for(int a=0; a<productFileList.length; a++){

						%>
							<a href="javascript:fileDownload('<%=productFileList[a].getCname()%>','<%=productFileList[a].getRname()%>')"><img src="../images/admin/icon_file.gif" alt="첨부파일" />&nbsp;<%=productFileList[a].getCname() %></a>&nbsp;&nbsp;
						<%
								}
							}
						%>
									</td>
									<td><a href="javascript:delProduct('<%=productList[i].getProductId() %>');" >[ 삭제 ]</a></td>
								</tr>
							<%
									rowCnt = rowCnt -1;
									}
								}else{
							%>
									<tr>
										<td colspan="7">조회된 데이터가 없습니다.</td>
									</tr>
							<%
								}
							%>
						</tbody>
					</table>

				</fieldset>

			</div>
			<!-- 컨텐츠 끝 -->
		</div>
	</div>
	<hr />
</div>

<form name="downform" id="downform" method="post" action="">
	<input type="hidden" id="fileType" name="fileType" value="product" />
	<input type="hidden" id="rfileName" name="rfileName" />
	<input type="hidden" id="cfileName" name="cfileName" />
</form>

<form name="myformView" id="myformView" method="post" action="" >
	<input type=hidden name="pageNum" id="pageNum" value="<%=currentPage%>">
	<input type=hidden name="hidUserID" id="hidUserID" value="">
	<input type=hidden name="filename" id="filename" value="">
	<input type=hidden name="productId" id="productId" value="">
</form>
</body>
</html>