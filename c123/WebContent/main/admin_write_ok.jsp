<%@ page contentType="text/html;charset=utf-8" %>

<%@ page import="lee.common.util.MD5Cryptor" %>
<%@ include file="../common/inc_import_00.jsp" %>
<%@ page errorPage="../common/error.jsp" %>
<%@ include file="../common/_includeInit.inc" %>
<%@ include file="../common/_includeCommon.inc" %>
<%@ include file="../common/_checkLogin.inc" %>

<%
try {
	AdminMgr memberMgr = mgr.getAdminMgr();

	String userid =		  request.getParameter( "userid" ); // 아이디
	String name   =		  request.getParameter( "name" ); // 이름
	String validStDate  = request.getParameter( "sDate" ); // 유효시작일
	String validEndDate = request.getParameter( "eDate" ); // 유효종료일
	String userType 	= request.getParameter( "userType" ); // 관리자구분
	
	/* 2014.03.01 6개 필드 추가*/
	//회사이름
	String cmpnNm =  request.getParameter( "cmpnNm" );
	//회사 URL
	String cmpnUrl =  request.getParameter( "cmpnUrl" );
	//회사 주소
	String cmpnAddr =  request.getParameter( "cmpnAddr" );
	//회사 ZIP
	String cmpnZip =  request.getParameter( "cmpnZip" );
	//회사 FAX
	String cmpnFax =  request.getParameter( "cmpnFax" );
	//회사 전화번호
	String cmpnTel=  request.getParameter( "cmpnTel" );
	//사용자 핸드폰
	String userPhone=  request.getParameter( "userPhone" );
	// 공지사항
	String informContent =  request.getParameter( "informContent" );
	// email
	String email =  request.getParameter( "email" );
	// 사업자번호
	String cmpnNumber =  request.getParameter( "companyNumber" );
	
	String regDate = "";         // 등록일시
	String modDate = "";        // 최종수정일시

	String insertOrUpdate  = request.getParameter( "insertOrUpdate" );  //INSERT , UPDATE

  System.out.println("informContent : " + informContent);

	if( insertOrUpdate == null ||  "".equals(insertOrUpdate) )
	{
		out.println("등록 또는 수정 파라미터가 없습니다. \n 재시도하세요");
		return;
	}

	//===========================================================================//
	// INSERT OR UPDATE
	//===========================================================================//
	String message = "" ;

	// 아이디 중복 체크 함
	HashMap param = new HashMap();
	param.put("userid", userid );

	Admin joinedMember = memberMgr.getAdmin(param);

	if ("INSERT".equals(insertOrUpdate)) {

		message = "등록";

		if (joinedMember != null)
		{	out.println("등록할 사용자 아이디가 중복되었습니다\n다시 입력해주세요");
			return;
		}

		Admin member = new Admin();

		member.setUserid(userid);
		member.setUserpw(MD5Cryptor.getMD5Crypt("1234")); //초기패스워드 세팅
		
		member.setUserType(userType); // 1:관리자(슈퍼), 2:관리자(일반), 3:정액회원(필드보여줌), 4:일반회원(필드숨김)
		member.setName(name);

		member.setAuth("2"); //권한(1:장학관리사업, 2:게시판관리, 3:회원관리, 4:사이트관리, 5:운영관리, 6:통계관리, 여러개인 경우 콤마로 구분)
		member.setDept("");
		member.setPhone("");
		member.setEmail("");
		member.setOrgCd("");
		member.setOrgName("");
		member.setLocCd("");

		member.setRegId(curAdminInfo.getUserid());
		member.setModId(curAdminInfo.getUserid());
		member.setRegDate(regDate);
		member.setModDate(modDate);
		member.setIpList("");
		member.setValidStDate(validStDate);
		member.setValidEndDate(validEndDate);
		
		/* 2014.03.01 6개 필드 추가*/
		member.setCmpnNm(cmpnNm);			//회사이름
		member.setCmpnUrl(cmpnUrl);			//회사 URL
		member.setCmpnAddr(cmpnAddr.replaceAll("''","`"));		//회사 주소
		member.setCmpnZip(cmpnZip);			//회사 ZIP
		member.setCmpnFax(cmpnFax);			//회사 FAX
		member.setCmpnTel(cmpnTel);			//회사 전화번호
		member.setUserPhone(userPhone);		//사용자 핸드폰
		member.setInformContent(informContent); // 공지사항
		member.setEmail(email);     		// 이메일
		member.setCompanyNumber(cmpnNumber); // 사업자 아이지
		
		memberMgr.insertAdmin( member );

	} else {

		message = "수정";

		if (joinedMember == null)
		{	out.println("수정할 사용자 아이디가 없습니다.\n다시 시도해주세요");
			return;
		}

		Admin member = new Admin();

		member.setUserid(userid);
		
		//관리자는 무조건 "1"로 세팅함
		if ("root".equals(userid)) userType = "1" ;
		member.setUserType(userType); // 1:관리자(슈퍼), 2:관리자(일반), 3:정액회원(필드보여줌), 4:일반회원(필드숨김)
		member.setName(name);

		member.setAuth(joinedMember.getAuth()); //권한(1:장학관리사업, 2:게시판관리, 3:회원관리, 4:사이트관리, 5:운영관리, 6:통계관리, 여러개인 경우 콤마로 구분)
		member.setDept("");
		member.setPhone("");
		member.setEmail("");
		member.setOrgCd("");
		member.setOrgName("");
		member.setLocCd("");

		member.setRegId(curAdminInfo.getUserid());
		member.setModId(curAdminInfo.getUserid());
		member.setRegDate(regDate);
		member.setModDate(modDate);
		member.setIpList(joinedMember.getIpList());
		member.setValidStDate(validStDate);
		member.setValidEndDate(validEndDate);
		
		/* 2014.03.01 6개 필드 추가*/
		member.setCmpnNm(cmpnNm);			//회사이름
		member.setCmpnUrl(cmpnUrl);			//회사 URL
		member.setCmpnAddr(cmpnAddr.replaceAll("''","`"));		//회사 주소
		member.setCmpnZip(cmpnZip);			//회사 ZIP
		member.setCmpnFax(cmpnFax);			//회사 FAX
		member.setCmpnTel(cmpnTel);			//회사 전화번호
		member.setUserPhone(userPhone);		//사용자 핸드폰
		member.setInformContent(informContent); // 공지사항
		member.setEmail(email);     // 이메일
		member.setCompanyNumber(cmpnNumber); // 사업자 아이디
		
		memberMgr.updateAdmin( member );
	}

	out.println(message + " 완료했습니다.");

} catch(Exception e) {
	e.printStackTrace();
}
%>
