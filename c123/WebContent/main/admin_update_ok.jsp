<%@ page contentType="text/html;charset=utf-8" %>

<%@ page import="lee.common.util.MD5Cryptor" %>
<%@ include file="../common/inc_import_00.jsp" %>
<%@ include file="../common/_includeInit.inc" %>
<%@ include file="../common/_includeCommon.inc" %>
<%@ include file="../common/_checkLogin.inc" %>

<%
try {
	String field = request.getParameter( "field" );
	String value = request.getParameter( "value" );
	String userID = request.getParameter( "USERID" );
	String returnMsg = "" ;

	AdminMgr adminMgr = mgr.getAdminMgr();
	HashMap param = new HashMap();

	if ( "".equals(userID) || userID == null)
		param.put("userid", curAdminInfo.getUserid());
	else
		param.put("userid", userID);

	//param.put("userid", "subroot");

	if( field.equals("email") )
	{
		param.put(field, value);
		adminMgr.updateEmailAdmin(param);
		returnMsg = "이메일 수정 완료했습니다" ;
	}
	else if( field.equals("phone") )
	{
		param.put(field, value);
		adminMgr.updatePhoneAdmin(param);
		returnMsg = "핸드폰 수정 완료했습니다" ;
	}
	else if( field.equals("userpw") )
	{
		param.put(field, MD5Cryptor.getMD5Crypt(value));
		adminMgr.updatePwdAdmin(param);
		returnMsg = "패스워드 수정 완료했습니다" ;
	}
	else if( field.equals("ipList") )
	{
		param.put(field, value);
		adminMgr.updateIpListAdmin(param);
		returnMsg = "IP List 수정 완료했습니다" ;
	}
	else if( field.equals("schoolPwd") )
	{
		param.put(field, MD5Cryptor.getMD5Crypt(value));
		param.put("schoolType", request.getParameter("schoolType") );
		adminMgr.updateSchoolPwdAdmin(param);
		returnMsg = "회원 패스워드 수정 완료했습니다" ;
	}
	else if( field.equals("validDate") )
	{
		param.put("userType", request.getParameter( "userType" ));
		param.put("validEndDate", request.getParameter( "eDate" ));
		param.put("validStDate", request.getParameter( "sDate" ));
		adminMgr.updateValidDate(param);
		returnMsg = "기간 연장 수정 완료했습니다" ;
	}
	else if( field.equals("memberDelete") )
	{

		param.put("useridList", userID);
		adminMgr.deleteAdmin(param);
		returnMsg = "삭제 완료했습니다" ;
	}


	out.println(returnMsg);

} catch(Exception e) {
	e.printStackTrace();
}
%>