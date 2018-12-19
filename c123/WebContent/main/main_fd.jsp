<%@ page contentType="text/html;charset=utf-8" %>

<%@ page errorPage="../common/error.jsp" %>

<%@ include file="../common/inc_import_00.jsp" %>
<%@ include file="../common/_includeInit.inc" %>
<%@ include file="../common/_includeCommon.inc" %>
<%@ include file="../common/_checkLogin.inc" %>

<%
	int chkUserType = Integer.parseInt( curAdminInfo.getUserType() );

	// 재단 관리자가 아니면 접근 권한 오류
	if( chkUserType >= 4 )
	{
		goAlert( pageContext, "접근 권한이 없습니다." );
		return;
	}

	//
	HashMap paramA = new HashMap();
	paramA.put( "userid", curAdminInfo.getUserid() );
	AdminMgr adminMgr = mgr.getAdminMgr();
	Admin admin = adminMgr.getAdmin( paramA );

	/*
	ScholarMgr scholarMgr = mgr.getScholarMgr();

	// 운영중인 장학사업
	HashMap param = new HashMap();
	param.put( "gubun", "ing" );
	param.put( "startPos", 0);
	param.put( "listSize", 100);

	// 목록 가져오기
	Scholarship[] scList = scholarMgr.getScholarshipList( param );
	*/

	// 관리자 공지사항
	BoardMgr boardMgr = mgr.getBoardMgr();
	HashMap param = new HashMap();
	param.put("bdId", ConstantUtil.BOARD_CODE_ADMIN_NOTICE);
	param.put("showYn", "Y");
	param.put("pageNum", 0);
	param.put("listSize", 4);

	Board[] boardList = boardMgr.getBoardList(param);

	// 신규 게시글 갯수
	int newTotalCnt = boardMgr.getNewTotalCount();
	//==========  신규 회원 count 시작 =================

	String YYYY = "";
  	String MM = "";
  	String DD = "";
  	String searchSDate ="";
  	int newMemberCount = 0;
  	int retireMemberCount = 0;

	Calendar cal = Calendar.getInstance ( );//오늘 날짜를 기준으루..
	YYYY = cal.get ( cal.YEAR )+".";

	if(cal.get ( cal.MONTH ) + 1 < 10 ){
		MM = "0"+(cal.get ( cal.MONTH ) + 1)+".";
	}else{
		MM = (cal.get ( cal.MONTH ) + 1)+".";
	}

	if(cal.get ( cal.DATE ) < 10 ){
		DD = "0"+cal.get ( cal.DATE );
	}else{
	 	DD = cal.get ( cal.DATE )+"";
	}
	searchSDate = YYYY+MM+DD;


	HashMap params = new HashMap();
	params.put("sDate", searchSDate);
	params.put("eDate", searchSDate);

	newMemberCount = adminMgr.getValidMemberMainCnt(params);
	//==========  신규 회원 count 끝 ===================

	//==========  탈퇴 회원 count 시작 =================
	retireMemberCount = adminMgr.getInvalidMemberMainCnt(params);
	//==========  탈퇴 회원 count 끝 ===================

%>

<%@ include file="../include/global_head.jsp" %>

<script type="text/javascript">
	function noticeView(contId){
		location.href = "../scholar_fd/admin_notice_view.jsp?contId=" + contId;
	}

	function newMember(){
		$("#pageNum").attr("value", "1");

		$("#memberFrom").attr("action", "../member/member_list.jsp");
  		$("#memberFrom").submit();
	}

	function retireMember(){
		$("#pageNum").attr("value", "1");
		$("#memberFrom").attr("action", "../member/retire_member_list.jsp");
  		$("#memberFrom").submit();

	}

function updPwd()
{
	if( !Common.isValue($("#userpw").val()) )
	{
		alert("패스워드를 입력하세요.");
		$("#userpw").focus();
		return;
	}

	if( !confirm("패스워드를 수정하시겠습니까?") )
	{
		return;
	}

	var append = 'field=userpw&value=' + $("#userpw").val();

    jQuery.ajax({
        type : 'GET',
        url  : '../main/admin_update_ok.jsp',
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

function memberUpdPwd()
{

	if( !Common.isValue($("#memberID").val()) )
	{
		alert("수정할 회원ID를 입력하세요.");
		$("#memberID").focus();
		return;
	}

	if( !Common.isValue($("#memberPW").val()) )
	{
		alert("패스워드를 입력하세요.");
		$("#memberPW").focus();
		return;
	}

	if( !confirm("패스워드를 수정하시겠습니까?") )
	{
		return;
	}

	var append = 'field=userpw&value=' + $("#memberPW").val()
				+ '&USERID=' + $("#memberID").val();

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
        	alert( '수정 과정에서 오류가 발생했습니다.' );
        }
     });

}

function updIpList()
{
	if( !Common.isValue($("#ipList").val()) )
	{
		$("#ipList").attr("value","");
	}

	if( !confirm("접속허용 IP 목록을 수정하시겠습니까?") )
	{
		return;
	}

    jQuery.ajax({
        type : 'GET',
        url  : '../main/admin_update_ok.jsp?field=ipList&value=' + $("#ipList").val(),
        dataType : 'html',
        success: function(string) {
			alert( Common.trim(string) );
			location.reload();
        },
        error: function(string) {
        	alert( '수정 과정에서 오류가 발생했습니다.' );
        }
     });

}

</script>

<body>
<div id="wrap">

 	<%@ include file="../include/top_navi.jsp" %>
	<hr />
	<div id="container">
		<%@ include file="../include/left.jsp" %>
		<div class="contents_wrap">
			<div class="location">
				<h1>관리자메인</h1>
				<p><a href="main.jsp">홈</a> &gt; <strong>메인</strong></p>
			</div>
			<div class="contents">
				<p><%=DateUtils.getToday("yyyy.MM.dd") %> (<%=DateUtils.getWeekText(Locale.KOREA, true) %>)</p>
				<table summary="관리자 정보" class="admin_skin_list01">
					<caption class="hidden">관리자 정보</caption>
					<colgroup>
						<col width="33%" />
						<col width="34%" />
						<col width="33%" />
					</colgroup>
					<thead>
					<tr class="first_td">
						<th scope="col">유효 회원 수</th>
						<th scope="col">기간 만기 회원 수</th>
						<th scope="col">등록파일 수</th>
					</tr>
					</thead>
					<tbody>
					<tr>
						<td><strong class="red_color"><%=newMemberCount %></strong> 명 <a href="javascript:newMember();">[회원목록보기]</a></td>
						<td><strong class="red_color"><%=retireMemberCount %></strong> 명 <a href="javascript:retireMember();">[회원목록보기]</a></td>
						<td><strong class="red_color"><%=newTotalCnt %></strong> 개</td>

						<form id="memberFrom" name="memberFrom" >
							<input type="hidden" id="pageNum" name="pageNum" />
							<input type="hidden" id="sDate" name="sDate" value="<%=searchSDate %>" />
							<input type="hidden" id="eDate" name="eDate" value="<%=searchSDate %>" />
						</form>

					</tr>
					</tbody>
				</table>

				<h2 class="h2_title subname">관리자 정보 관리</h2>
				<table summary="관리자 정보" class="admin_skin_list01">
					<caption class="hidden">관리자 정보</caption>
					<colgroup>
						<col width="20%" />
						<col width="80%" />
					</colgroup>
					<thead>
					<tr class="first_td">
						<th scope="col" colspan="2">관리자 정보</th>
					</tr>
					</thead>
					<tbody>
					<tr>
						<td>관리자 ID</td>
						<td><%=admin.getUserid()%></td>
					</tr>
					<tr>
						<td>관리자 이름</td>
						<td><%=admin.getOrgName()%></td>
					</tr>
					<tr>
						<td>패스워드</td>
						<td>
							<input type="password" id="userpw" name="userpw" value="" maxlength="18" style="width:300px;text-align:center;ime-mode:disabled;" maxlength="12">
							<a href="javascript:updPwd();" class="admin_text_btn02">수정</a>
						</td>
					</tr>
				<!--
					<% if( admin.getUserType().equals("1")) { %>
					<tr>
						<td>접속 허용 IP 목록</td>
						<td>
							<input type="text" id="ipList" name="ipList" value="<%=admin.getIpList()%>" maxlength="100" style="width:300px;ime-mode:disabled;" maxlength="12">
							<a href="javascript:updIpList();" class="admin_text_btn02">수정</a> <br/>
							(1) IP 뒤에는 항상 대각선(/)을 붙이십시오. <br/>
							예) 192.168.1.1<font color=red><b>/</b></font>192.168.1.2<font color=red><b>/</b></font><br/>
							(2) 공백을 입력할 시, 모든 IP 접속을 허용합니다.
						</td>
					</tr>
					<% } %>
				-->
					<tr>
						<td>최근접속일</td>
						<td><%=admin.getAccessDate()%></td>
					</tr>
					</tbody>
				</table>

				<h2 class="h2_title subname">회원 패스워드 관리</h2>
				<table summary="관리자 정보" class="admin_skin_list01">
					<caption class="hidden">회원 패스워드 관리</caption>
					<colgroup>
						<col width="20%" />
						<col width="80%" />
					</colgroup>
					<thead>
					<tr class="first_td">
						<th scope="col" colspan="2">회원 패스워드 수정</th>
					</tr>
					</thead>
					<tbody>
					<tr class="first_td">
						<td>ID</td>
						<td>
							<input  id="memberID" name="memberID" value="" maxlength="18" style="width:300px;text-align:center;" maxlength="12">
						<!--	<a href="javascript:findMemberID();" class="admin_text_btn02">찾기</a> -->
						</td>
					</tr>
					<tr class="first_td">
						<td>패스워드</td>
						<td>
							<input type="password" id="memberPW" name="memberPW" value="" maxlength="18" style="width:300px;text-align:center;ime-mode:disabled;" maxlength="12">
							<a href="javascript:memberUpdPwd();" class="admin_text_btn02">수정</a>
						</td>
					</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<hr />
</div>
</body>
</html>