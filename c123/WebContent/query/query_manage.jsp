<%@ page contentType="text/html;charset=utf-8" %>

<%@ page import="kr.go.seoul.ssf.common.config.*" %> 
<%@ page import="kr.go.seoul.ssf.bean.*" %> 
<%@ page import="kr.go.seoul.ssf.manager.*" %> 
<%@ page import="kr.go.seoul.ssf.common.util.*" %>
<%@ page import="kr.go.seoul.ssf.common.servlet.*" %>
<%@ page import="kr.go.seoul.ssf.session.*" %>
<%@ page import="java.util.*" %>

<%@ include file="../common/_includeInit.inc" %>
<%@ include file="../common/_includeCommon.inc" %>
<%@ include file="../common/_checkLogin.inc" %> 
   
<%@ include file="../include/global_head.jsp" %>

<script language="javascript">


	function changeMail() {
	  var frm = document.myform;
	  frm.email2.value = frm.email3.value;
	}
	
	
	function executeQuery(){
		
		if(!Common.isValue($("#query").val())){
		    alert("쿼리를 입력하세요");
		    $("#query").focus();
		    return;
		}
	  	
		if( !confirm("쿼리를 실행하겠습니까?")) return;
		
		alert($("#query").val());
		
		$("#myform").attr("action", "query_manage_execute.jsp");
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
		
			<div class="location">
				<h1>쿼리관리자</h1>
				<p><a href="main.jsp"></a> 홈&gt; <strong>쿼리관리자</strong></p>
			</div>
			<form name="myform" id="myform" method="post" >
			<div class="contents">
				<h2 class="h2_title">쿼리관리자</h2>
				<table summary="쿼리관리자" class="admin_skin_view01 skin_btn">
					<caption class="hidden">쿼리관리자</caption>
					<colgroup>
						<col width="20%" />
						<col width="80%" />
					</colgroup>
					<tr>
						<th scope="row" class="left"><strong class="red_color">*</strong>쿼리구분</th>
						<td >
							<select id="gubun" name="gubun" class="select1">
                            <option value="get">select</option>
                            <option value="set">insert/update/delete</option>
						</select>  
						</td>
					</tr>
					<tr>
						<th scope="row" class="left"><strong class="red_color">*</strong>쿼리</th>
						<td >
						<textarea name="query" id="query" rows="1" cols="1" style="width:500px; height:200px; border:1px solid #ccc; padding:5px; font-size:1em;"></textarea>
						</td>
					</tr>
					<tr>
						<th scope="row" class="left"><strong class="red_color">*</strong>결과</th>
						<td ><input type="text" name="result" id="result" class="text_input width_style04" /></td>
					</tr>
					</tbody>
			</table>
			<p class="skin_btn right">
				<a href="javascript:executeQuery();" class="admin_text_btn01">실행</a> 
			</p>
			</div><!-- Łƙķ ³¡ -->
		</form>
		</div>
	</div>
	<hr />
</div>
</body>
</html>  
