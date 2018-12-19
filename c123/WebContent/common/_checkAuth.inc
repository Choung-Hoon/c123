<%@ page import="lee.common.config.*" %> 
<%@ page import="lee.bean.*" %> 
<%@ page import="lee.manager.*" %> 
<%@ page import="lee.common.util.*" %>
<%@ page import="lee.common.servlet.*" %>
<%@ page import="lee.session.*" %>
<%@ page import="java.util.*" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%
/**
  String mnStr = request.getParameter("menu");
  if(mnStr == null) mnStr = "101";

  int mn = Integer.parseInt(mnStr);
  
  boolean isAuth = false; // 관리자
  boolean[] topIsAuth = new boolean[9];
  for(int i=0; i<topIsAuth.length; i++)
  {
  	topIsAuth[i] = false;
  }
  
  // 권한 구성 방식
  // 전시 > 특별전시 : Y (101)
  // 전시 > 대관전시 : N (102)
  // 어느 하나라도 Y이면 topIsAuth[0] = true 임.
  
  //Super Master
  if(user.getUtype().equals("1")) {
    isAuth = true;
  //Local Master
  } else if(user.getUtype().equals("2")) {

    // 전시
    if( mn == 101 ) {
      if(user.getAuthVal(1).equals("Y")) { isAuth = true; topIsAuth[0] = true; }
    }

    // 교육/행사
    if( mn == 201 ) {
      if(user.getAuthVal(2).equals("Y")) { isAuth = true; topIsAuth[1] = true; }
    }

    // 소장유물
    if(mn == 301) {
      if(user.getAuthVal(3).equals("Y")) { isAuth = true; topIsAuth[2]  = true; }
    }

    // 조사/연구
    if(mn == 401) {
      if(user.getAuthVal(4).equals("Y")) { isAuth = true; topIsAuth[3]  = true; }
    }

    // 알림
    if(mn == 501) {
      if(user.getAuthVal(5).equals("Y")) { isAuth = true; topIsAuth[4]  = true; }
    }

    // 참여
    if(mn == 601) {
      if(user.getAuthVal(6).equals("Y")) { isAuth = true; topIsAuth[5]  = true; }
    }

    // 이용안내
    if(mn == 701) {
      if(user.getAuthVal(7).equals("Y")) { isAuth = true; topIsAuth[6] = true; }
    }

    // 회원관리
    if(mn == 801) {
      if(user.getAuthVal(8).equals("Y")) { isAuth = true; topIsAuth[7]  = true; }
    }

    // 접속통계
    if(mn == 901) {
      if(user.getAuthVal(9).equals("Y")) { isAuth = true; topIsAuth[8] = true; }
    }
  }
 */
%>
