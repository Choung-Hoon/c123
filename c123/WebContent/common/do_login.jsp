<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ page import="lee.common.config.*" %>
<%@ page import="lee.bean.*" %>
<%@ page import="lee.manager.*" %>
<%@ page import="lee.common.util.*" %>
<%@ page import="lee.common.servlet.*" %>
<%@ page import="lee.session.*" %>

<%@ page errorPage="../common/error.jsp" %>
<%@ include file="/common/_includeInit.inc" %>
<%@ include file="/common/_includeCommon.inc" %>
<%
	String userid = request.getParameter("userid");

	if( userid == null || userid.equals("") )
	{
		goAlert(pageContext, "아이디를 입력하세요");
		return;
	}

	String userpw = request.getParameter("userpw");

	if( userpw == null || userpw.equals("") )
	{
		goAlert(pageContext, "비밀번호를 입력하세요.");
		return;
	}

	//
	HashMap param = new HashMap();
	param.put( "userid", userid );

	AdminMgr adminMgr = mgr.getAdminMgr();
	Admin admin = adminMgr.getAdmin( param );

	if( admin == null )
	{
		goAlert(pageContext, "해당 아이디로 가입된 회원이 없습니다.\\n다시 입력해주시기 바랍니다.");
		return;
	}
	else
	{
		if( !admin.getUserpw().equals(MD5Cryptor.getMD5Crypt(userpw)) )
		{
			goAlert(pageContext, "패스워드가 불일치합니다.\\n다시 입력해주시기 바랍니다.");
			return;
		}
	}


	// User 세션
	session.removeAttribute(ADMIN_KEY);
	session.setAttribute(ADMIN_KEY, admin);

	SessionManager sessionMgr = SessionManager.getInstance();
	sessionMgr.removeSession(session.getId());
	sessionMgr.addSession(session.getId(), request.getRemoteAddr(), admin);

	// 관리자 유형에 따른 메인 페이지 분기
	int userType = Integer.parseInt( admin.getUserType() );
	String mainUrl = "";

	//검색창을 통해 호출 된 페이지와 정식 화면으로 들어 온 페이지 판단함
	String targetPage = request.getParameter("targetPage");

	if( userType <= 1) {

		if( "GRID".equals(targetPage) )
		{
			mainUrl = "../dhx/dhxSearch.jsp";
		} else mainUrl = "../board/admin_search_list.jsp";

	} else {
		mainUrl = "../board/admin_search_list.jsp";
	}
	
	//if ("root".equals(userid)) userType = 1 ;

	if( userType > 2 )
	{
		String myMacAddress = request.getParameter("MAC");
		//myMacAddress = "2001:0:9d38:6abd:1063:2cae:3f57:e6fd";
		
		//지정된 컴퓨터에서 접근했는지 체크
		if (myMacAddress == null || "".equals(myMacAddress))
		{
			goAlert(pageContext, "등록된 컴퓨터에서의 접근이 아닙니다.\\n관리자에게 문의 하세요");
			return;
		}


		//1. IP 체크
		if( admin.getIpList().length() > 0 )
		{
			String[] ipAuthList = StringUtil.stringTokenizer( admin.getIpList(), "/" );

			boolean isSuccess = false;
			for(int i=0; i<ipAuthList.length; i++)
			{
				if( myMacAddress.equals(ipAuthList[i]) )
				{
					isSuccess = true;
					break;
				}
			}

			if( !isSuccess )
			{
			  // 아이피 체크 하는지
				//goAlert(pageContext, "등록된 컴퓨터에서의 접근이 아닙니다.\\n관리자에게 문의 하세요");
				//return;
			}

		//첫 로그인 시 MAC ADDRESS를 저장한 후 다시 로그인하라는 메세지 출력함
		} else {

			param = new HashMap();
			param.put("userid", userid);
			param.put("ipList", myMacAddress);
			adminMgr.updateIpListAdmin(param);

			goAlert(pageContext, "가입이 정상적으로 되었습니다.\\n재 로그인 해주세요");
			return;

		}

		//2. 유효기일 체크
		String today = DateUtils.getToday();
		String endDate = admin.getValidEndDate().replaceAll("/","");

		if ( StringUtil.stoi(today) > StringUtil.stoi(endDate))
		{
			goAlert(pageContext, "서비스 유효기일이 만료 되었습니다.\\n관리자에게 문의 하시기 바랍니다.");
			return;
		}

	}

%>
<script language="javascript">
	location.href = "<%=mainUrl%>";
</script>
