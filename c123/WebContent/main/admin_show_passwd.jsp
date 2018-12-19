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

<%
try {
	String field = request.getParameter( "field" );
	String value = request.getParameter( "value" );

	AdminMgr adminMgr = mgr.getAdminMgr();
	HashMap param = new HashMap();
	
	param.put("userid", curAdminInfo.getUserid());
	//param.put("userid", "subroot");
	
	if( field.equals("email") )
	{
		param.put(field, value);
		adminMgr.updateEmailAdmin(param);
	}
	else if( field.equals("phone") )
	{ 
		param.put(field, value);
		adminMgr.updatePhoneAdmin(param);
	}	
	else if( field.equals("userpw") )
	{ 
		param.put(field, MD5Cryptor.getMD5Crypt(value));
		adminMgr.updatePwdAdmin(param); 
	}	
	else if( field.equals("ipList") )
	{ 
		param.put(field, value);
		adminMgr.updateIpListAdmin(param);
	}		
	else if( field.equals("schoolPwd") )
	{ 
		param.put(field, MD5Cryptor.getMD5Crypt(value));
		param.put("schoolType", request.getParameter("schoolType") );
		adminMgr.updateSchoolPwdAdmin(param); 
	}		
	
	
	out.println("수정 완료했습니다.");
} catch(Exception e) {
	e.printStackTrace();
}
%>