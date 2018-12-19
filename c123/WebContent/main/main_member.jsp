<%@ page contentType="text/html;charset=utf-8" %>

<%@ page errorPage="../common/error.jsp" %>

<%@ include file="../common/inc_import_00.jsp" %>
<%@ include file="../common/_includeInit.inc" %>
<%@ include file="../common/_includeCommon.inc" %>
<%@ include file="../common/_checkLogin.inc" %>

<%
	int chkUserType = Integer.parseInt( curAdminInfo.getUserType() );

%>

<%@ include file="../include/global_head.jsp" %>

<script type="text/javascript">

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

</script>

<body>
<div id="wrap">

 	<%@ include file="../include/top_navi.jsp" %>
	<hr />
	<div id="container">
		<%@ include file="../include/left.jsp" %>
		<div class="contents_wrap">
			<div class="location">
				<h1>회원메인</h1>
				<p><a href="main.jsp">홈</a> &gt; <strong>메인</strong></p>
			</div>
			<div class="contents">
				<p><%=DateUtils.getToday("yyyy.MM.dd") %> (<%=DateUtils.getWeekText(Locale.KOREA, true) %>)</p>

				<h2 class="h2_title subname">회원 패스워드 관리</h2>
				<table summary="회원 정보" class="admin_skin_list01">
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
							<input  id="memberID" name="memberID" value="<%=curAdminInfo.getUserid()%>" maxlength="18" style="width:300px;text-align:center;ime-mode:disabled;" maxlength="12" readonly>
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