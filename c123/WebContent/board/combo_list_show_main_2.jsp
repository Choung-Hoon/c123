<%@ page language="java" contentType="text/xml; charset=utf-8" pageEncoding="utf-8"%>

<%@ page import="lee.common.config.*" %>
<%@ page import="lee.bean.*" %>
<%@ page import="lee.manager.*" %>
<%@ page import="lee.common.util.*" %>
<%@ page import="lee.common.servlet.*" %>
<%@ page import="lee.session.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.net.*" %>
<%@ page import="lee.common.db.JResultSet" %>

<%@ include file="/common/_includeInit.inc" %>
<%@ include file="/common/_includeCommon.inc" %>

<%
	/******************************************************************
	1. 첫 페이지 로딩 시, 하단 검색 페이지에 양도가 기준으로 오름차순으로 100건 보여주고, 
		하단에 페이지 수 보여줌
	2. 검색 방법을 기존 홈페이지(www.prmna.com) 화면처럼 [전체]를 선택하면 조건 없이 물건 정보를 조회하여 
	   검색화면에 보며 줌
	
	* 검색 방법
	1. 전체를 선택하면 검색조건 없이 모든 물건을 날짜 기준으로 내림차순
	2. 하나만 체크 한 경우, [선택한 업종만 검색], [선택한 업종 포함한 검색]으로 구분하여 검색
	3. 2개 이상 체크한 경우, [선택한 업종 포함한 검색]으로 검색
	*******************************************************************/
%>
<%

	/* 업종/3년 합계/양도가 필드명*/
	String fieldName = request.getParameter( "fieldName" );
	String f2List  = request.getParameter( "f2List" );

	/* 업종 검색  */
	String searchCond = request.getParameter( "searchCond" );
	
	/* 2014.02.15 양도가 검색 조건 추가 함 */
	String sAmount  = StringUtil.NVL(request.getParameter( "sAmount" ),"0"); //xxx백만이상
	//String eAmount  = StringUtil.NVL(request.getParameter( "eAmount" ),"0"); //xxx백만이하
	String eAmount  = StringUtil.NVL(request.getParameter( "eAmount" ),"1000"); //xxx백만이하
	
	// 버그 추적 용
	String userID = StringUtil.NVL(request.getParameter( "userID" ),"None");

	String COMMAND = request.getParameter( "COMMAND" );
	String excelID = StringUtil.NVL(request.getParameter( "excelID" ),"");
	
	/*
		크롬브라우저에서 한글이 깨져서 UTF8로 컨버젼 해야 함
	*/
	String isChromeBrowser = StringUtil.NVL(request.getParameter( "isChromeBrowser" ),"N") ;
	String returnGubn = StringUtil.NVL(request.getParameter( "returnGubn" ),"G"); // J.json, G.그리드

	HashMap param = new HashMap();

	//System.out.println("!!!!!!!!!! start : " + DateUtils.getToday("yyyy-MM-dd a hh:mm:ss"));
	//System.out.println("====> userID : " + userID);
	//System.out.println("====> fieldName : " + fieldName);
	//System.out.println("====> f2List1 : " + f2List);
	//System.out.println("====> f13List1 : " + f13List);
	//System.out.println("====> f15List1 : " + f15List);
	//
	//System.out.println("====> f2List1 : " + f2List);
	//System.out.println("====> f2List11 : " + StringUtil.toUTF8(f2List));
	//System.out.println("====> f2List111 : " + StringUtil.toKor(f2List));
	//System.out.println("====> COMMAND : " + COMMAND);

	param.put("searchCond", searchCond );
	param.put("sAmount"   , sAmount );
	param.put("eAmount"   , eAmount );
	param.put("f2List", f2List);
  /*
	if (!StringUtil.NVL(f2List).equals(""))
	{
		if ("Y".equals(isChromeBrowser))
			f2List = StringUtil.toUTF8(f2List);
		else
			f2List = StringUtil.toKor(f2List);

		param.put("f2List", f2List);
	}
  */
  
  System.out.println("====> f2List : " + f2List);
  
	JResultSet jrs = null;
	QueryMgr queryMgr = new QueryMgr();
	String xml = "";
	String sql = "";

	try {
    	// 사이트 접속 후 첫 조회 시
		if ( "FIRST".equals(COMMAND) ) {

			returnGubn = "G";

			/* 정렬 체크 값 넘김 */
			param.put("COMMAND", COMMAND);
			sql = creatSearchSqlStatement(param);
			jrs = (JResultSet)queryMgr.getSQL(sql);

      System.out.println("First SQL : " + sql);
			xml = DhxGrid.convertToXml(
	                  jrs
	                , null
	                , new String[] {
					      "excel_id"    //일련 번호
					     ,"f1"			//날짜
					     ,"f2"		    //업종
					     ,"f3"		    //지역
					     //,"f4"		//법인/면허
					     //,"f5"		//자본금
					     ,"f6"          //시평
					     ,"f7"          //좌수
					     ,"f8"          //잔액
					     //,"fst_Yr"		//2008
					     //,"scnd_Yr"		//2009
					     ,"f10"         //2009 ==> 2010
					     ,"f11"         //2010 ==> 2011
					     ,"f12"         //2011 ==> 2012
					     ,"f13"         //3년합계
					     ,"sum_of_5yr"  //5년합계
					     ,"f14"         //2012
					     //,"f9"          //2008 ==> 2013
					     ,"f15"         //양도가
					     //,"f16"       //협회
					     ,"f17"         //기타
					     ,"f18"         //업체
					     ,"f19"         //연락처
					  } // hidden Column 명 (null 시 hidden column 없음)
	                , null                  // hidden Column 명 (null 시 hidden column 없음)
	                , Integer.MIN_VALUE     // row count (Integer.MIN_VALUE 최대)
	                , null                  // link Column 명  (outbound 칼럼명)
	                , false);               // row no 출력 유무 (true, false)

	        out.print(xml);

		// 그리드 조회 시
		} else if ( "SEARCH".equals(COMMAND) ) {

			returnGubn = "G";

			/* 정렬 체크 값 넘김 */
			param.put("COMMAND", COMMAND);
			sql = creatSearchSqlStatement(param);
			jrs = (JResultSet)queryMgr.getSQL(sql);
			
      System.out.println("SEARCH SQL : " + sql);

			xml = DhxGrid.convertToXml(
	                  jrs
	                , null
	                , new String[] {
					      "excel_id"    //일련 번호
					     ,"f1"			//날짜
					     ,"f2"		    //업종
					     ,"f3"		    //지역
					     //,"f4"		    //법인/면허
					     //,"f5"		    //자본금
					     ,"f6"          //시평
					     ,"f7"          //좌수
					     ,"f8"          //잔액
					     //,"fst_Yr"		//2008
					     //,"scnd_Yr"		//2009
					     ,"f10"         //2009
					     ,"f11"         //2010
					     ,"f12"         //2011
					     ,"f13"         //3년합계
					     ,"sum_of_5yr"  //5년합계
					     ,"f14"         //2012
					     //,"f9"          //2008 ==> 2013
					     ,"f15"         //양도가
					     //,"f16"         //협회
					     ,"f17"         //기타
					     ,"f18"         //업체
					     ,"f19"         //연락처
					  } // hidden Column 명 (null 시 hidden column 없음)
	                , null                  // hidden Column 명 (null 시 hidden column 없음)
	                , Integer.MIN_VALUE     // row count (Integer.MIN_VALUE 최대)
	                , null                  // link Column 명  (outbound 칼럼명)
	                , false);               // row no 출력 유무 (true, false)

	        out.print(xml);

		// 상세 조회 시
		} else if ( "DETAIL".equals(COMMAND) ) {

			returnGubn = "G";

			param.put("COMMAND", COMMAND);
			param.put("excelID", excelID);

			sql = creatSearchSqlStatement(param);
			jrs = (JResultSet)queryMgr.getSQL(sql);
			
      System.out.println("DETAIL SQL : " + sql);

			xml = DhxGrid.convertToXml(
	                  jrs
	                , null
	                , new String[] {
					      "f1"			//날짜
					     ,"f2"		    //업종
					     ,"f3"		    //지역
					     ,"f4"		    //법인/면허
					     ,"f5"		    //자본금
					     ,"f6"          //시평
					     ,"f7"          //좌수
					     ,"f8"          //잔액
					     ,"fst_Yr"		//2008
					     ,"scnd_Yr"		//2009
					     ,"f10"         //2009
					     ,"f11"         //2010
					     ,"f12"         //2011
					     ,"f13"         //3년합계
					     ,"sum_of_5yr"  //5년합계
					     ,"f14"         //2012
					     ,"f9"          //2008 ==> 2013으로 변경함
					     ,"f15"         //양도가
					     ,"f16"         //협회
					     ,"f17"         //기타
					     ,"f18"         //업체
					     ,"f19"         //연락처
					  } // hidden Column 명 (null 시 hidden column 없음)
	                , null                                                  // hidden Column 명 (null 시 hidden column 없음)
	                , Integer.MIN_VALUE                                     // row count (Integer.MIN_VALUE 최대)
	                , null                                                  // link Column 명  (outbound 칼럼명)
	                , false);                                                // row no 출력 유무 (true, false)

	        out.print(xml);

		}

	}
	catch(Exception _e) {
		System.out.println("조회실패 : " + _e.getMessage());
        System.out.println("##########################################");
        System.out.println(DhxGrid.getExceptionResult(returnGubn, _e));
        System.out.println("##########################################");
        out.println(DhxGrid.getExceptionResult(returnGubn, _e));

    } catch (Throwable e){
		System.out.println("Grid to xml converting error.");
		e.printStackTrace();
	}
%>

<%!

public String creatSearchSqlStatement(HashMap param)
{
	String COMMAND  = StringUtil.NVL((String)param.get( "COMMAND" ));
	String f2List  =  StringUtil.NVL((String)param.get( "f2List" ));
	String sAmount  = StringUtil.NVL((String)param.get( "sAmount" ));
	String eAmount  = StringUtil.NVL((String)param.get( "eAmount" ));
	
	System.out.println("f2List : " + f2List);
	
	String excelID = StringUtil.NVL((String)param.get( "excelID" ));
	String searchCond = StringUtil.NVL((String)param.get( "searchCond" )); // radio박스의 값
	
	StringBuffer sqlQueryBf = new StringBuffer()
	 	.append("SELECT  					").append("\n")
	 	.append("	 excel_id AS excelId	").append("\n")  
		.append("	,load_id  AS loadId     ").append("\n")  //  로드순번               
		.append("  	,f1 	                ").append("\n")  //  날짜                 
		.append("	,f2 	                ").append("\n")  //  업종                 
		.append("	,f3                     ").append("\n")  //  지역                 
		.append("	,f4                     ").append("\n")  //  법인/면허              
		.append("	,f5                     ").append("\n")  //  자본금                
		.append("	,f6                     ").append("\n")  //  시평                 
		.append("	,f7                     ").append("\n")  //  좌수                 
		.append("	,f8                     ").append("\n")  //  잔액   
		.append("	,fst_yr  AS fst_Yr      ").append("\n")  //  2008
		.append("	,scnd_yr AS scnd_Yr     ").append("\n")  //  2009                      
		.append("	,f9                     ").append("\n")  //  2008 ==> 2013 변경   
		.append("	,f10                    ").append("\n")  //  2009               
		.append("	,f11                    ").append("\n")  //  2010               
		.append("	,f12                    ").append("\n")  //  2011               
		.append("	,f13                    ").append("\n")  //  3년합계 
		.append("	,sum_of_5yr AS sumOf5yr ").append("\n")  //  5년합계                 
		.append("	,f14                    ").append("\n")  //  2012               
		.append("	,f15                    ").append("\n")  //  양도가                
		.append("	,f16                    ").append("\n")  //  협회                 
		.append("	,f17                    ").append("\n")  //  기타                 
		.append("	,f18                    ").append("\n")  //  업체                 
		.append("	,f19                    ").append("\n")  //  연락처   
		.append("    	,reg_id as regId        ").append("\n")  //  등록자ID              
	    	.append("    ,DATE_FORMAT(reg_date, '%Y/%m/%d') as regDate ").append("\n") //  등록일시
	 .append("FROM tb_excel_data ").append("\n")
	 .append("WHERE 1 = 1 ").append("\n")
	 //.append(" AND str_to_date(concat(year(curdate()),'/',f1),'%Y/%m/%d%') > date_sub(curdate(), interval 41 day) ").append("\n");
	 .append(" AND str_to_date( f1,'%Y/%m/%d%')> date_sub( curdate() ,INTERVAL 41 DAY) ").append("\n");
 
	 if ("DETAIL".equals(COMMAND) || "SELECT_PRINT".equals(COMMAND))
	 {
			sqlQueryBf.append(" AND excel_id IN (" + excelID + ") ").append("\n");

		//첫 화면 로드 시 쿼리 됨
	 } else if ("FIRST".equals(COMMAND)) {
		
		/********** 정렬 조건 조립***************/
		/* 양도가 정렬 필드 추가 함 */
		/*
		sqlQueryBf.append(" ORDER BY (	").append("\n")
				  .append("		CASE WHEN f15 REGEXP '[0-9]' THEN CAST(f15 AS DECIMAL(10,3)) ").append("\n")
				  .append("		ELSE 100000 ").append("\n")
				  .append("		END) ASC").append("\n")
				  .append(" LIMIT 100") ;
		*/
		/* 날자 기준 내림 차순 */
	  sqlQueryBf.append(" ORDER BY f1")
				  .append("	DESC").append("\n");
	} else {

		/********** 조건에 대한 조립***************/
		/* 업종 조건을 파라미터로 받아서 처리함 */
		if (!"".equals(f2List))
		{
			String[] searchToken = f2List.split(",");
			int searchTokenCnt = searchToken.length ;
			
			//선택한 업종만 검색
			if ("1".equals(searchCond)) {
				
				//선택한 업종 포함한 검색(AND 검색)
				sqlQueryBf.append(" AND ( ").append("\n");
				for(int count = 0 ; searchToken.length > count ; count++)
				{
					sqlQueryBf.append(" f2 LIKE '%" + searchToken[count] + "%' ").append("\n");
					if (count != (searchToken.length-1)) sqlQueryBf.append(" AND ") ;
				}
				
				sqlQueryBf.append(") ").append("\n");
				
				
				if (searchTokenCnt == 1 )
				{	
					sqlQueryBf.append(" AND f2 = '" + searchToken[0] + "' \n");
				} else {	
					// sqlQueryBf.append(" AND char_length(f2) = char_length('" + searchToken[0] + "' ").append("\n");
					// 검색어를 결합하고, 필요한 개수의 <br>을 추가 후 업종명의 길이와 결과 값의 길이가 같은 경우
					// 만 추출 함

					sqlQueryBf.append(" AND ( char_length(f2) = char_length('");
					for(int count = 0 ; searchToken.length > count ; count++)
					{
						sqlQueryBf.append(searchToken[count]);
						if (count != (searchToken.length-1)) sqlQueryBf.append("<br>") ;
					}
					
					sqlQueryBf.append("') ) ").append("\n");
					
				}	
			} else {
				
				//선택한 업종 포함한 검색(OR 검색)
				sqlQueryBf.append(" AND ( ").append("\n");
				for(int count = 0 ; searchToken.length > count ; count++)
				{
					sqlQueryBf.append(" f2 LIKE '%" + searchToken[count] + "%' ").append("\n");
					if (count != (searchToken.length-1)) sqlQueryBf.append(" OR ") ;
				}
				
				sqlQueryBf.append(") ").append("\n");
				
				
			}
			
		}
		
		/********** 양도가(f15)에 대한 조립***************/
		/* 양도가의 최소 ~ 최고 값을 파라미터로 받아서 처리함
		    백만단위가  디폴트로 입력됨 1 * 1000000
		 */
		if (!("0".equals(sAmount) || "0".equals(eAmount)))
		{
			sqlQueryBf.append(" AND ( f15 >= " + sAmount + " AND f15 <= " + eAmount + " ) ");
		
		}

		/********** 정렬 조건 조립***************/
		/* 양도가 정렬 필드 추가 함 */
		/*
		sqlQueryBf.append(" ORDER BY (	").append("\n")
				  .append("		CASE WHEN f15 REGEXP '[0-9]' THEN CAST(f15 AS DECIMAL(10,3)) ").append("\n")
				  .append("		ELSE 100000 ").append("\n")
				  .append("		END) ASC ").append("\n");
	  */
		/* 날자 기준 내림 차순 */
	  sqlQueryBf.append(" ORDER BY f1")
				  .append("	DESC").append("\n");
	}

	return sqlQueryBf.toString();

}

public String convertToJson(ExcelData[] excelDataList, String fieldName)
{


	StringBuffer defaultValue = new StringBuffer();

	defaultValue.append("{\n")
				.append("  data:\n")
				.append("  [	\n");

	String code = null;
	String name = null;
	for(int count = 0 ; excelDataList.length > count ; count++)
	{
		boolean needsAppendComma = false;

		// 업종
		if ("f2".equals(fieldName))
		{
			code = excelDataList[count].getF2();
			name = excelDataList[count].getF2();
		} // 3년 합계
		else if ("f13".equals(fieldName))
		{
			code = excelDataList[count].getF13();
			name = excelDataList[count].getF13();
		} // 양도가
		else if ("f15".equals(fieldName))
		{
			code = excelDataList[count].getF15();
			name = excelDataList[count].getF15();
		}

		needsAppendComma = count < (excelDataList.length - 1);

		defaultValue.append("{");

		defaultValue.append("	\"").append("CODE").append("\"")
					.append(":")
					.append("\"").append(code).append("\"")
					.append(",")
					.append("	\"").append("NAME").append("\"")
					.append(":")
					.append("\"").append(name).append("\"");

		defaultValue.append(" 	}\n");

		if (needsAppendComma) {
			defaultValue.append(",");
		}

	}

	defaultValue.append("  ]\n")
				.append("}\n");

	return defaultValue.toString();
}

%>