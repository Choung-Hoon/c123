<%@ page contentType="text/html;charset=utf-8" %>

<%@ include file="../common/inc_import_00.jsp" %>
<%@ page errorPage="../common/error.jsp" %>
<%@ include file="../common/_includeInit.inc" %>
<%@ include file="../common/_includeCommon.inc" %>
<%@ include file="../common/_checkLogin.inc" %> 


<%

	AdminMgr memberMgr = mgr.getAdminMgr();

	String userid = request.getParameter( "userid" );          // 아이디
	String userpw = request.getParameter( "userpw" );         // 비밀번호(암호화처리)
	String userType = request.getParameter( "userType" );        // 회원구분(1:학생회원, 2:일반회원)
	String name = request.getParameter( "name" );           // 이름
	String jumin = request.getParameter( "jumin" );           // 주민번호/외국인등록번호
	
	String birthday = request.getParameter( "birthday" );       // 생년월일(형식:YYYYMMDD)
	String solar = request.getParameter( "solar" );           // 양력/음력구분(1:양력, 2:음력)
	String sex = request.getParameter( "jumin" ).substring(6,7);            // 성별구분(1:남, 2:여)
	String zipcode = request.getParameter( "zipcode" );         // 우편번호
	String address1 = request.getParameter( "address1" );       // 기본주소
	
	String address2 = request.getParameter( "address2" );       // 상세주소
	String phone = request.getParameter( "phone" );          // 전화번호
	String mobile = request.getParameter( "mobile" );         // 휴대폰번호
	String email = request.getParameter( "email" );          // 이메일
	String emailYn = request.getParameter( "email_yn" );        // 이메일수신동의여부(Y:예, N:아니오)
	
	String smsYn = request.getParameter( "sms_yn" );          // SMS수신동의여부(Y:예, N:아니오)
	String newsYn = request.getParameter( "news_yn" );         // 뉴스레터수신동의여부(Y:예, N:아니오)
	String joinType = request.getParameter( "joinType" );       // 인증구분(1:실명인증, 2:공공아이핀인증)
	String nation = request.getParameter( "nation" );         // 내/외국인구분(1:내국인, 2:외국인)
	String ipin = request.getParameter( "ipin" );           // 아이핀번호
	
	String retireYn = "N";       // 탈퇴여부(Y:탈퇴, N:미탈퇴)
    String retireDate = "";     // 탈퇴일자(형식:YYYYMMDD)
	String delYn = "N";          // 삭제여부(Y:삭제, N:미삭제)
	String regDate = "";         // 등록일시
	String modDate = "";        // 최종수정일시
	
	
	//===========================================================================//
	// INSERT  
	//===========================================================================//
	
	Admin member = new Admin();
	
	member.setUserid(userid);
	member.setUserpw(userpw);
	member.setUserType(userType);
	member.setName(name);
	member.setJumin(jumin);
	
	member.setBirthday(birthday);
	member.setSolar(solar);
	member.setSex(sex);
	member.setZipcode(zipcode);
	member.setAddress1(address1);
	
	member.setAddress2(address2);
	member.setPhone(phone);
	member.setMobile(mobile);
	member.setEmail(email);
	member.setEmailYn(emailYn);
	
	member.setSmsYn(smsYn);
	member.setNewsYn(newsYn);
	member.setJoinType(joinType);
	member.setNation(nation);
	member.setIpin(ipin);
	
	member.setRetireYn(retireYn);
	member.setRetireDate(retireDate);
	member.setDelYn(delYn);
	member.setRegDate(regDate);
	member.setModDate(modDate);
	
	
	memberMgr.insertMember( member );

%>

<form name="myform" method="post">

</form>
<script language="JavaScript">
  	alert("등록이 되었습니다.");
	document.myform.action = "./member_list.jsp";
	document.myform.submit();
</script>


