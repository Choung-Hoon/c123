<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import="kr.go.seoul.ssf.common.config.*" %> 
<%@ page import="kr.go.seoul.ssf.bean.*" %> 
<%@ page import="kr.go.seoul.ssf.manager.*" %> 
<%@ page import="kr.go.seoul.ssf.common.util.*" %>
<%@ page import="kr.go.seoul.ssf.common.servlet.*" %>
<%@ page import="kr.go.seoul.ssf.session.*" %>
<%@ page import="java.util.*" %>

<%@ page errorPage="../common/error.jsp" %>
<%@ include file="../common/_includeInit.inc" %>
<%@ include file="../common/_includeCommon.inc" %>
<%@ include file="../common/_checkLogin.inc" %> 


	
<%@ include file="../include/global_head.jsp" %>

<script language="javascript">


	function goMemberList() {
	  $("#myform").attr("action", "member_list.jsp");
	  $("#myform").submit();
	}
	
	function chkFilterKey(filter) 
	{
	  if( filter )
	  {
	    var sKey = String.fromCharCode(event.keyCode);
	    var re = new RegExp(filter);
			       
	    if(!re.test(sKey))
	    {
	      event.returnValue=false;
	
	      if(filter.match("0-9"))
	      {
	        if(event.keyCode > 95 && event.keyCode < 106)
	        {
	          event.returnValue=true;
	        }
	      }
	     }
	    }
	
	    if(event.keyCode == 8 || event.keyCode == 9 || event.keyCode == 13 || event.keyCode == 20 || event.keyCode == 17 || event.keyCode == 18){
	      event.returnValue=true;
	  }
	}
	
	function changeMail() {
	  var frm = document.myform;
	  frm.email2.value = frm.email3.value;
	}
	
	
	function goMemberWrite()
	{
	  /*
	  if(!Common.isValue($("#name").val())) 
	  {
	    alert("이름을 입력하세요.");
	    $("#name").focus();
	    return;
	  }
	
	  if(!Common.isValue($("#phone2").val())) 
	  {
	    alert("연락처를 입력하세요.");
	    $("#phone2").focus();
	    return;
	  }
	  
	  if(!Common.isValue($("#phone3").val())) 
	  {
	    alert("연락처를 입력하세요.");
	    $("#phone3").focus();
	    return;
	  }
	  
	  $("#phone").attr("value", $("#phone1").val()+"-"+$("#phone2").val()+"-"+$("#phone3").val());
	  
	  if(!Common.isValue($("#email1").val())) 
	  {
		  alert("이메일을 입력하세요.");
	    $("#email1").focus();
	    return;
	  }
	  
	  if(!Common.isValue($("#email2").val())) 
	  {
		  alert("이메일을 입력하세요.");
	    $("#email2").focus();
	    return;
	  }
	  
	  $("#email").attr("value", $("#email1").val()+"@"+$("#email2").val());
	  
	  
	  if(!Common.isValue($("#zipcode1").val())) 
	  {
	    alert("우편번호를 조회하세요.");
	    return;
	  }
	
	  if(!Common.isValue($("#zipcode2").val())) 
	  {
	    alert("우편번호를 조회하세요.");
	    return;
	  }  
	  
	  $("#zipcode").attr("value", $("#zipcode1").val()+$("#zipcode2").val());
	  
	  if(!Common.isValue($("#address1").val())) 
	  {
	    alert("우편번호를 조회하세요.");
	    $("#address2").focus();
	    return;
	  }
	
	  if(!Common.isValue($("#address2").val())) 
	  {
	    alert("상세 주소를 입력하세요.");
	    $("#address2").focus();
	    return;
	  }
	
	  if(!Common.isValue($("#note").val())) 
	  {
	    alert("질문 또는 의견을 입력하세요.");
	    $("#note").focus();
	    return;
	  }  
	
	  $("#address1").attr("readonly", "false");
		*/
		
		
	  if( !confirm("등록하시겠습니까?") ) return;
	  
	  $("#myform").attr("action", "member_write_ok.jsp");
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
				<h1>관리자메인</h1>
				<p><a href="main.jsp">홈</a> &gt; <strong>메인</strong></p>
			</div>
			
			
			
			<form name="myform" id="myform" method="post">
			<!-- 컨텐츠 시작 -->
			<div class="contents">
				<h2 class="h2_title">회원정보</h2>
				<table summary="관리자메인" class="admin_skin_view01 skin_btn">
				<caption class="hidden">관리자메인</caption>
				<colgroup>
					<col width="17%" />
					<col width="33%" />
					<col width="17%" />
					<col width="33%" />
				</colgroup>
				<tr class="first_td">
					<th scope="row" class="left"><strong class="red_color">*</strong> 회원구분</th>
					<td colspan="3">
						<input type="radio" name="userType" id="userType" class="radio_check" value="1" checked /><label for="search_04" class="radio_check_label">학생</label>
						<input type="radio" name="userType" id="userType" class="radio_check" value="2"  /><label for="search_05" class="radio_check_label">일반</label>
					</td>
				</tr>
				<tr>
					<th scope="row" class="left"><strong class="red_color">*</strong> 이름</th>
					<td><input type="text" name="name" id="name" value="가나다" /></td>
					<th scope="row" class="left"><strong class="red_color">*</strong> 주민등록번호<br />(외국인등록번호)</th>
					<td><input type="text" name="jumin" id="jumin" value="1234561234567"/></td>
				</tr>
				<tr>
					<th scope="row" class="left"><strong class="red_color">*</strong> 아이디</th>
					<td colspan="3"><input type="text" name="userid" id="userid"/></td>
				</tr>
				<tr>
					<th scope="row" class="left"><strong class="red_color">*</strong> 비밀번호</th>
					<td colspan="3"><input type="text" name="userpw" id="userpw" value="1"/></td>
				</tr>
				<tr>
					<th scope="row" class="left"><strong class="red_color">*</strong> 생년월일</th>
					<td colspan="3">
						<input type="text" name="birthday" id="birthday" value="20110827"/>
						<input type="radio" name="solar" id="solar" class="radio_check" value="1" checked /><label for="search_04" class="radio_check_label">양력</label>
						<input type="radio" name="solar" id="solar" class="radio_check" value="2"  /><label for="search_05" class="radio_check_label">음력</label>
					</td>
				</tr>
				<tr>
					<th scope="row" class="left"><strong class="red_color">*</strong> 주소 </th>
					<td colspan="3">
						<input type="text" name="zipcode" id="zipcode" value="123-456"/>
						<input type="text" name="address1" id="address1" value="서울시 강서구 화곡1동"/>
						<input type="text" name="address2" id="address2" value = "1002-2번지 "/>
					</td>
				</tr>
				<tr>
					<th scope="row" class="left"><strong class="red_color">*</strong> 휴대전화번호</th>
					<td colspan="3">
						<input type="hidden" name="mobile" id="mobile" value = "021112222"/> 
						<select id="mobile1" name="mobile1" style="behavior: url('../js/selectbox.htc');" setDisplayCount="10">
                            <option value="02">02</option>
                            <option value="031">031</option>
                            <option value="032">032</option>
                            <option value="033">033</option>
                            <option value="041">041</option>
                            <option value="042">042</option>
                            <option value="043">043</option>
                            <option value="051">051</option>
                            <option value="052">052</option>
                            <option value="053">053</option>
                            <option value="054">054</option>
                            <option value="055">055</option>
                            <option value="061">061</option>
                            <option value="062">062</option>
                            <option value="063">063</option>
                            <option value="064">064</option>
                            <option value="070">070</option>
                            <option value="010">010</option>
                            <option value="011">011</option>
                            <option value="016">016</option>
                            <option value="017">017</option>
                            <option value="018">018</option>
                            <option value="019">019</option>
                          </select>
                          -
                          <input type="text" name="mobile2" id="mobile2" onkeydown="chkFilterKey('[0-9]');" maxLength="4"/>
                          -
                          <input type="text" name="mobile3" id="mobile3" onkeydown="chkFilterKey('[0-9]');" maxLength="4"/>
					</td>
				</tr>
				<tr>
					<th scope="row" class="left"><strong class="red_color">*</strong> 자택전화번호</th>
					<td colspan="3"><input type="text" name="phone" id="phone" onkeydown="chkFilterKey('[0-9]');" maxLength="10" value = "01012341234"/></td>
				</tr>
				<tr>
					<th scope="row" class="left"><strong class="red_color">*</strong> E-mail</th>
					<td colspan="3">
						<input type="hidden" name="email" id="email" value = "adsfefe@gmail.com"/>                        
                        <input type="text" name="email1" id="email1"/>
                        @
                        <input type="text" name="email2" id="email2"/>
                        <select style="behavior: url('../js/selectbox.htc');"  onChange="changeMail();" setDisplayCount="10" name="email3" id="email3">
                            <option value="hotmail.com">hotmail.com</option>
                            <option value="nate.com">nate.com</option>
                            <option value="naver.com">naver.com</option>
                            <option value="gmail.com">gmail.com</option>
                            <option value="dreamwiz.com">dreamwiz.com</option>
                            <option value="hanmail.net">hanmail.net</option>
                            <option value="paran.com">paran.com</option>
                            <option value="empal.com">empal.com</option>
                          </select>
					
					</td>
				</tr>
				<tr>
					<th scope="row" class="left"> 이메일 수신</th>
					<td colspan="3">
						<input type="radio" name="email_yn" id="email_yn" class="radio_check" value="Y" checked /><label for="search_04" class="radio_check_label">동의 </label>
						<input type="radio" name="email_yn" id="email_yn" class="radio_check" value="N"  /><label for="search_05" class="radio_check_label">동의 안함</label>
					</td>
				</tr>
				<tr>
					<th scope="row" class="left"> SMS 수신</th>
					<td colspan="3">
						<input type="radio" name="sms_yn" id="sms_yn" class="radio_check" value="Y" checked /><label for="search_04" class="radio_check_label">동의 </label>
						<input type="radio" name="sms_yn" id="sms_yn" class="radio_check" value="N"  /><label for="search_05" class="radio_check_label">동의 안함</label>
					</td>
				</tr>
				<tr>
					<th scope="row" class="left"> 뉴스 레터 수신</th>
					<td colspan="3">
						<input type="radio" name="news_yn" id="news_yn" class="radio_check" value="Y" checked /><label for="search_04" class="radio_check_label">동의 </label>
						<input type="radio" name="news_yn" id="news_yn" class="radio_check" value="N"  /><label for="search_05" class="radio_check_label">동의 안함</label>
					</td>
				</tr>
				
				</tbody>
			</table>
			<p class="skin_btn right">
				<a href="javascript:goMemberWrite();" class="admin_text_btn01">등록</a>
			</p>
			</div><!-- 컨텐츠 끝 -->
 	
		</form>



		</div>
	</div>
	<hr />
</div>
</body>
</html>