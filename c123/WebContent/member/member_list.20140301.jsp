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
	String searchUserID =  request.getParameter( "userID" );
	if( searchUserID == null || searchUserID.equals("null") )
		searchUserID = "";

	String searchUserName = request.getParameter( "userName" );
	if( searchUserName == null || searchUserName.equals("null") )
		searchUserName = "";


	String searchSDate = request.getParameter( "sDate" );
	if( searchSDate == null || searchSDate.equals("null") ){

		String YYYY = "";
       	String MM = "";
       	String DD = "";

 		Calendar cal = Calendar.getInstance ( );//오늘 날짜를 기준으루..
 		YYYY = cal.get ( cal.YEAR )+".";

 		if(cal.get ( cal.MONTH ) + 1 < 10 )
 			MM = "0"+(cal.get ( cal.MONTH ) + 1)+".";
 		else
 			MM = (cal.get ( cal.MONTH ) + 1)+".";

 		if(cal.get ( cal.DATE ) < 10 )
 			DD = "0"+cal.get ( cal.DATE );
 		else
 		 	DD = cal.get ( cal.DATE )+"";

 		searchSDate = YYYY+MM+DD;

	}

	String searchEDate = request.getParameter( "eDate" );
	if( searchEDate == null || searchEDate.equals("null") )
	{
 		Calendar cal = Calendar.getInstance ( );//오늘 날짜를 기준으루..
		cal.add ( cal.MONTH, +1 ); //1개월 후....

        String YYYY = "";
       	String MM = "";
       	String DD = "";

		YYYY = cal.get ( cal.YEAR )+".";

 		if(cal.get ( cal.MONTH ) + 1 < 10 )
 			MM = "0"+(cal.get ( cal.MONTH ) + 1)+".";
 		else
 			MM = (cal.get ( cal.MONTH ) + 1)+".";

 		if(cal.get ( cal.DATE ) < 10 )
 			DD = "0"+cal.get ( cal.DATE );
 		else
 		 	DD = cal.get ( cal.DATE )+"";

 		searchEDate = YYYY+MM+DD;

	}

	AdminMgr adminMgr = mgr.getAdminMgr();

	HashMap params = new HashMap();
	params.put("searchType", "valid");
	params.put("pageNum", (currentPage - 1) * listSize );
	params.put("listSize", listSize);

	//총갯수
	totalCount = adminMgr.getAdminListCnt(params);
	totalPage = totalCount / listSize;
	if( totalCount % listSize > 0 || totalCount == 0)
		totalPage = totalCount / listSize + 1;

	//목록
	Admin[] memberList = adminMgr.getAdminList(params);


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

	/* 달력 초기화 */
	initCal("sDate");
	initCal("eDate");
	/* 달력 초기화 */

	$(document).ready(function() {
		$("#expandDate").hide();
		$("#initiateInfo").hide();
		$("#memberResister").show();

		$('#memberResister').click(memberResisterF);
		$('#initiateInfo').click(initiateInfoF);
		$('#expandDate').click(expandDateF);

	});

	function search(){

		$("#pageNum").attr("value", "1");

		$("#myform").attr("action", "./member_list.jsp");
  		$("#myform").submit();
	}

	function goMemberView( userId )
	{
	  $("#hidUserID").attr( "value", userId );
	  $("#myform").attr("action", "member_view.jsp");
	  $("#myform").submit();
	}

	function goRegist(){
	  $("#myform").attr("action", "member_write.jsp");
	  $("#myform").submit();
	}

	function goDownload( excelFileName )
	{
	  if(!Common.isValue(excelFileName)) return;

	  document.myform.action = "/servlet/ExcelDownLoadServlet";
	  document.myform.encoding = "application/x-www-form-urlencoded";
	  document.myform.filename.value = excelFileName;
	  document.myform.submit();
	}

	function memberResisterF()
	{

		if ($("#userID").val() == "root")
		{
			alert("관리자ID는 등록/수정/삭제 할 수 없습니다.");
			return ;
		}

		if( !Common.isValue($("#userID").val()) )
		{
			alert("ID를 입력하세요.");
			$("#userID").focus();
			return;
		}

		if( !Common.isValue($("#userName").val()) )
		{
			alert("회원명을 입력하세요.");
			$("#userName").focus();
			return;
		}

		if( $("#userType").val() == '9' )
		{
			alert("권한을 선택하세요");
			$("#userType").focus();
			return;
		}


		if( !Common.isValue($("#sDate").val()) )
		{
			alert("시작일을 입력하세요.");
			$("#sDate").focus();
			return;
		}

		if( !Common.isValue($("#eDate").val()) )
		{
			alert("종료일을 입력하세요.");
			$("#eDate").focus();
			return;
		}

		var append = "insertOrUpdate=INSERT"
					  + "&userid=" + $("#userID").val()
					  + "&name=" + $("#userName").val()
					  + "&userType=" + $("#userType").val()
					  + "&sDate=" + $("#sDate").val()
					  + "&eDate=" + $("#eDate").val() ;

	    jQuery.ajax({
	        type : 'POST',
	        url  : '../main/admin_write_ok.jsp',
	        dataType : 'html',
	        data : append,
	        success: function(string) {
				alert( Common.trim(string) );
				location.reload();
	        },
	        error: function(string) {
	        	alert( '수정 과정에서 오류가 발생했습니다.' );
	        }
	     });
	}

	function expandDateF()
	{

		if( !Common.isValue($("#userID").val()) )
		{
			alert("리스트에서 연장할 회원의 아이디를 클릭하세요.");
			return;
		}

		if( !Common.isValue($("#userName").val()) )
		{
			alert("회원명을 입력하세요.");
			$("#userName").focus();
			return;
		}


		if( $("#userType").val() == '9' )
		{
			alert("권한을 선택하세요");
			$("#userType").focus();
			return;
		}


		if( !Common.isValue($("#sDate").val()) )
		{
			alert("연장 시작일을 입력하세요.");
			$("#sDate").focus();
			return;
		}

		if( !Common.isValue($("#eDate").val()) )
		{
			alert("연장 종료일을 입력하세요.");
			$("#eDate").focus();
			return;
		}

		var append = "insertOrUpdate=UPDATE"
					  + "&userid=" + $("#userID").val()
					  + "&name=" + $("#userName").val()
					  + "&userType=" + $("#userType").val()
					  + "&sDate=" + $("#sDate").val()
					  + "&eDate=" + $("#eDate").val() ;

/*
	    jQuery.ajax({
	        type : 'GET',
	        url  : '../main/admin_write_ok.jsp?' + append ,
	        dataType : 'html',
	        success: function(string) {
				alert( Common.trim(string) );
				location.reload();
	        },
	        error: function(string) {
	        	alert( '수정 과정에서 오류가 발생했습니다.' );
	        }
	     });
*/
		jQuery.ajax({
	        type : 'POST',
	        url  : '../main/admin_write_ok.jsp',
	        dataType : 'html',
	        data : append,
	        success: function(string) {
				alert( Common.trim(string) );
				location.reload();
	        },
	        error: function(string) {
	        	alert( '수정 과정에서 오류가 발생했습니다.' );
	        }
	     });

	}

	function goMemberDelete(strUserID){

		if(!confirm(strUserID + "님의 모든 데이터를 삭제 하시겠습니까?")){
			return ;
		}

		var append = "field=memberDelete"
				  + "&USERID=" + strUserID;

		jQuery.ajax({
	        type : 'POST',
	        url  : '../main/admin_update_ok.jsp',
	        dataType : 'html',
	        data : append,
	        success: function(string) {
				alert( Common.trim(string) );
				location.reload();
	        },
	        error: function(string) {
	        	alert( '삭제 과정에서 오류가 발생했습니다.' );
	        }
	     });

	}

	function setInfo(userId, name, userType,sDate,eDate ){
		$("#userID").val(userId);
		$("#userName").val(name);
		$("#userType").val(userType);
		$("#sDate").val(sDate.replaceAll("/","."));
		$("#eDate").val(eDate.replaceAll("/","."));

		$("#userID").attr('disabled',true);
		$("#expandDate").show();
		$("#initiateInfo").show();
		$("#memberResister").hide();
	}

	function initiateInfoF(){

		$("#userID").val("");
		$("#userName").val("");
		$("#userType").val("9");
		$("#sDate").val($("#displaySdate").val());
		$("#eDate").val($("#displayEdate").val());

  	    $("#userID").removeAttr("disabled");

		$("#expandDate").hide();
		$("#initiateInfo").hide();
		$("#memberResister").show();




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
				<h1>회원관리</h1>
				<p>
				<a href="../main/main.jsp">홈</a> &gt;
				<a href="../member/member_list.jsp.jsp">회원관리</a> &gt;
				<strong>유효회원목록</strong>
			</p>

			</div>


			<!-- 컨텐츠 시작 -->
			<div class="contents">

				<fieldset>
					<legend>게시물 검색</legend>
						<!-- 검색  -->
						<form name="myform" id="myform" method="post" action="">

						<input type=hidden name="pageNum" id="pageNum" value="<%=currentPage%>">
						<input type=hidden name="hidUserID" id="hidUserID" value="">
						<input type=hidden name="filename" id="filename" value="">

						<input type=hidden name="displaySdate" id="displaySdate" value="<%=searchSDate %>">
						<input type=hidden name="displayEdate" id="displayEdate" value="<%=searchEDate %>">


						<div class="search">
							<div>
								<p class="terms_check">
									<strong><label for="search_01">ID : </label></strong>
									<input type="text" id="userID" name="userID" class="text_input" value="<%=searchUserID%>"  />
								</p>
								<p class="terms_check">
									<strong><label for="search_02">회원명 : </label></strong>
									<input type="text" id="userName" name="userName" class="text_input" value="<%=searchUserName %>" />
								</p>
								<p class="terms_check">
									<strong><label for="search_02">권한 : </label></strong>
									<select id="userType" name="userType" style="border:1px solid #bbbbbb;height:18px;font-size:1em;">
								    	<option value="9">선택하세요</option>
								    	<option value="4">필드숨김</option>
								    	<option value="3">필드보여줌</option>
								    </select>
								</p>
								<p class="terms_check">
									<strong>유효기간</strong>
									<input type="text" id="sDate" name="sDate" title="날짜" class="text_input" readonly="true" value="<%=searchSDate %>" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									~
									<input type="text" id="eDate" name="eDate" title="날짜" class="text_input" readonly="true" value="<%=searchEDate %>" />

								</p>
								</p>
									<strong> * 초기 비밀번호는 "1234" 입니다.. 회원님  로그인 후 변경하실 수 있습니다.</strong>
								</p>
									<strong> * 아이디/성명/권한/유효기간 잘못  생성시 삭제 후 재 생성 해주세요 </strong>
								</p>
									<strong> * 리스트에서 <B>아이디</B> 클릭 시 수정 가능합니다.</strong>
							</div>
						</div>
						<p class="skin_btn right">
						<!--
							<button type="button" class="admin_text_btn01" id="memberResister" onclick="javascript:memberResisterF();">등록</button> &nbsp;
							<button type="button" class="admin_text_btn01" id="expandDate" onclick="javascript:expandDateF();">수정</button> &nbsp;
							<button type="button" class="admin_text_btn01" id="initiateInfo"onclick=""javascript:initiateInfoF();" >초기화</button>
						 -->
						 	<button type="button" class="admin_text_btn01" id="memberResister" >등록</button> &nbsp;
							<button type="button" class="admin_text_btn01" id="expandDate" >수정</button> &nbsp;
							<button type="button" class="admin_text_btn01" id="initiateInfo" >초기화</button>
						</p>

						</form>
						<!-- 검색  -->
						<p class="list_num sub_table">[페이지 : <%=currentPage %>/<%=totalPage %>] [전체목록 : <%=totalCount %>건]</p>

						<table summary="관리자메인" class="admin_skin_list01">
						<caption class="hidden">관리자메인</caption>
						<thead>
							<tr>
								<th scope="col">번호</th>
								<th scope="col">ID</th>
								<th scope="col">이름</th>
								<th scope="col">등록일</th>
								<th scope="col">최근접속일시</th>
								<th scope="col">권한</th>
								<th scope="col">유효시작일</th>
								<th scope="col">유효종료일</th>
								<th scope="col">삭제</th>
							</tr>
						</thead>
						<tbody>
							<%
								if(memberList.length > 0){

									int rowCnt = totalCount - (currentPage - 1) * listSize;
									for(int i=0; i<memberList.length; i++){

							%>
								<tr >
									<td><%=rowCnt %></td>
									<td >
										<a href="javascript:setInfo('<%=memberList[i].getUserid()%>','<%=memberList[i].getName()%>','<%=memberList[i].getUserType()%>','<%=memberList[i].getValidStDate()%>','<%=memberList[i].getValidEndDate()%>');"><%=memberList[i].getUserid()%></a>
									</td>
									<td><%=memberList[i].getName()%></td>
									<td><%=memberList[i].getRegDate()%></td>
									<td><%=memberList[i].getAccessDate()%></td>
									<td><%=memberList[i].getUserTypeName()%></td>
									<td><%=memberList[i].getValidStDate()%></td>
									<td><%=memberList[i].getValidEndDate()%></td>
							<%
								if("root".equals(memberList[i].getUserid())){
							%>
									<td>&nbsp;</td>

							<%
								} else {
							%>
									<td><a href="javascript:goMemberDelete('<%=memberList[i].getUserid() %>');" >[ 삭제 ]</a></td>
							<%
								}
							%>

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

					<div class="paging_wrap">
					<%
			           // 페이징 부분 출력 위한 변수
			           request.setAttribute("currentPage", String.valueOf(currentPage) );
			           request.setAttribute("totalCount", String.valueOf(totalCount) );
			           request.setAttribute("listSize", String.valueOf(listSize) );
			        %>
			            <jsp:include page="../common/paging.jsp" flush="true" />
					<% if( excelFileName.length() > 0 ) { %>
            			<p class="left_input"><button  type="button"  class="admin_text_btn01" onclick="goDownload('<%=excelFileName%>');">엑셀 다운로드</button></p>
        			<% } %>
					</div>

				</fieldset>

			</div>
			<!-- 컨텐츠 끝 -->




		</div>
	</div>
	<hr />
</div>
</body>
</html>