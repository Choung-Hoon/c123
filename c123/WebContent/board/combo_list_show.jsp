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
  System.out.println("combo_list_show");
    
	/* 업종/3년 합계/양도가 필드명*/
	String fieldName = request.getParameter( "fieldName" );
	String f2List  = request.getParameter( "f2List" );
	String f13List = request.getParameter( "f13List" );
	String f15List = request.getParameter( "f15List" );
	String orderByF13 = StringUtil.NVL(request.getParameter( "orderByF13" ),"");
	String orderByF15 = StringUtil.NVL(request.getParameter( "orderByF15" ),"");

	/* 업종 텍스트 검색 시 사용함 */
	String searchValue = request.getParameter( "searchValue" );
	if (null != searchValue)
    System.out.println("====> searchValue : " + searchValue);

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
	System.out.println("====> f2List1 : " + f2List);
	System.out.println("====> f13List1 : " + f13List);
	System.out.println("====> f15List1 : " + f15List);
	//
	//System.out.println("====> f2List1 : " + f2List);
	//System.out.println("====> f2List11 : " + StringUtil.toUTF8(f2List));
	//System.out.println("====> f2List111 : " + StringUtil.toKor(f2List));

	if (!StringUtil.NVL(fieldName).equals(""))
		param.put("fieldName", fieldName );

	if (!StringUtil.NVL(f2List).equals(""))
	{
		// 마지막 , 제거
		if ("Y".equals(isChromeBrowser))
			//f2List = StringUtil.replace( StringUtil.toUTF8(f2List), "''", "'");
			f2List = StringUtil.replace( f2List, "''", "'");
		else
			//f2List = StringUtil.replace( StringUtil.toKor(f2List), "''", "'");
			f2List = StringUtil.replace( f2List, "''", "'");

		f2List = StringUtil.replace( f2List, "/", "<br>");
		param.put("f2List", f2List);
	}
	
	if (!StringUtil.NVL(f13List).equals(""))
	{
		// 마지막 , 제거
		if ("Y".equals(isChromeBrowser))
			//f13List = StringUtil.replace( StringUtil.toUTF8(f13List), "''", "'");
			f13List = StringUtil.replace( f13List, "''", "'");
		else
			//f13List = StringUtil.replace( StringUtil.toKor(f13List), "''", "'");
			f13List = StringUtil.replace( f13List, "''", "'");

		f13List = StringUtil.replace( f13List, "/", "<br>");
		param.put("f13List", f13List);
	}
  
	if (!StringUtil.NVL(f15List).equals(""))
	{
		// 마지막 , 제거
		if ("Y".equals(isChromeBrowser))
			//f15List = StringUtil.replace( StringUtil.toUTF8(f15List), "''", "'");
			f15List = StringUtil.replace( f15List, "''", "'");
		else
			//f15List = StringUtil.replace( StringUtil.toKor(f15List), "''", "'");
			f15List = StringUtil.replace( f15List, "''", "'");

		f15List = StringUtil.replace( f15List, "/", "<br>");
		param.put("f15List", f15List);
	}

	/* 업종 텍스트 검색 시
	if (!StringUtil.NVL(searchValue).equals(""))
	{
		// 마지막 , 제거
		if ("Y".equals(isChromeBrowser))
			searchValue = StringUtil.replace( StringUtil.toUTF8(searchValue), "''", "'");
		else
			searchValue = StringUtil.replace( StringUtil.toKor(searchValue), "''", "'");

		searchValue = StringUtil.replace( searchValue, "/", "<br>");
		param.put("searchValue", searchValue);
	}
	 */
  /* 업종 텍스트 검색 시  */
	if (!StringUtil.NVL(searchValue).equals(""))
	{
		// 마지막 , 제거
		if ("Y".equals(isChromeBrowser))
			searchValue = StringUtil.replace( searchValue, "''", "'");
		else
			searchValue = StringUtil.replace( searchValue, "''", "'");

		searchValue = StringUtil.replace( searchValue, "/", "<br>");
		
		System.out.println("searchValue: " + searchValue);
		param.put("searchValue", searchValue);
	}

	JResultSet jrs = null;
	QueryMgr queryMgr = new QueryMgr();
	String xml = "";

	try {
    	// 조회
		if ( "COMBO".equals(COMMAND) ) {
			jrs = (JResultSet)queryMgr.getSQL(creatFieldSqlStatement(param));

			// 지점명|지점코드

	        if( jrs != null ) {

	            if ("G".equals(returnGubn))
	            {

		            xml = DhxGrid.convertToXml(
		                  jrs
		                , null
		                , new String[] {"CHK"								// 체크박스
									   ,fieldName							// 지점명
									   ,fieldName							// 지점코드
						  } // hidden Column 명 (null 시 hidden column 없음)
		                , null                                                  // hidden Column 명 (null 시 hidden column 없음)
		                , Integer.MIN_VALUE                                     // row count (Integer.MIN_VALUE 최대)
		                , null                                                  // link Column 명  (outbound 칼럼명)
		                , false);     
		                
                                          // row no 출력 유무 (true, false)

				} else if ("J".equals(returnGubn))
				{

		            xml = DhxGrid.convertToJson(
		                  jrs
		                , new String[] {"CHK"								// 체크박스
									   ,fieldName							// 지점명
									   ,fieldName							// 지점코드
						  } // hidden Column 명 (null 시 hidden column 없음)
		                , null                                                  // hidden Column 명 (null 시 hidden column 없음)
		                , null                                                  // link Column 명  (outbound 칼럼명)
		                );
	            }

              System.out.println("Cobmo_list_show : 1");
	            out.print(xml);
	        } //End of if

		// 그리드 조회 시
		} else if ( "SEARCH".equals(COMMAND) ) {

			returnGubn = "G";

			/* 정렬 체크 값 넘김 */
			param.put("COMMAND", COMMAND);
			param.put("orderByF13", orderByF13);
			param.put("orderByF15", orderByF15);

			jrs = (JResultSet)queryMgr.getSQL(creatSearchSqlStatement(param));

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
					     //,"f7"          //좌수
					     ,"f8"          //잔액
					     ,"fst_Yr"		//2008
					     ,"scnd_Yr"		//2009
					     ,"f10"         //2009
					     ,"f11"         //2010
					     ,"f12"         //2011
					     ,"f13"         //3년합계
					     ,"sum_of_5yr"  //5년합계
					     ,"f14"         //2012
					     ,"f9"          //2008 ==> 2013
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
System.out.println("Cobmo_list_show : 3");
	        out.print(xml);

		// 텍스트 값 조회 시
		} else if ( "TEXT_SEARCH".equals(COMMAND) ) {

			returnGubn = "G";

			/* 정렬 체크 값 넘김 */
			param.put("COMMAND", COMMAND);

			jrs = (JResultSet)queryMgr.getSQL(creatSearchSqlStatement(param));

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
					     //,"f7"          //좌수
					     ,"f8"          //잔액
					     ,"fst_Yr"		//2008
					     ,"scnd_Yr"		//2009
					     ,"f10"         //2009
					     ,"f11"         //2010
					     ,"f12"         //2011
					     ,"f13"         //3년합계
					     ,"sum_of_5yr"  //5년합계
					     ,"f14"         //2012
					     ,"f9"          //2008 ==> 2013
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
System.out.println("Cobmo_list_show : 4");
	        out.print(xml);
		// 상세 조회 시
		} else if ( "DETAIL".equals(COMMAND) ) {

			returnGubn = "G";

			param.put("COMMAND", COMMAND);
			param.put("excelID", excelID);

			jrs = (JResultSet)queryMgr.getSQL(creatSearchSqlStatement(param));

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
System.out.println("Cobmo_list_show : 2");
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
public String creatFieldSqlStatement(HashMap param)
{
	String fieldName = StringUtil.NVL((String)param.get("fieldName"));
	String f2List  = StringUtil.NVL((String)param.get( "f2List" ));
	String f13List = StringUtil.NVL((String)param.get( "f13List" ));
	String f15List = StringUtil.NVL((String)param.get( "f15List" ));
	String searchValue = StringUtil.NVL((String)param.get("searchValue"));

	if ("".equals(fieldName))
		return "" ;

	StringBuffer sqlQueryBf = new StringBuffer()
	 .append("SELECT DISTINCT REPLACE(" + fieldName + ",'<br>','/') AS " + fieldName ).append("\n")
	 .append(" , '' AS CHK ").append("\n")
	 .append("FROM tb_excel_data ").append("\n")
	 .append("WHERE 1 = 1 ").append("\n");

	/* 업종 */
	if (!"".equals(f2List))
		 sqlQueryBf.append(" AND f2 IN (" + f2List + ") ").append("\n");

	/* 3년 합계*/
	if (!"".equals(f13List))
		 sqlQueryBf.append(" AND f13 IN (" + f13List + ") ").append("\n");

	/* 양도가 */
	if (!"".equals(f15List))
		 sqlQueryBf.append(" AND f15 IN (" + f15List + ") ").append("\n");


	/* 업종 텍스트 검색 조건 추가 함 */
	if (!"".equals(searchValue))
		 /* 업종 조건 */
		sqlQueryBf.append(" AND f2 LIKE '%" + searchValue.trim() + "%' ").append("\n");


	if ("f2".equals(fieldName))
	{
		sqlQueryBf.append("ORDER BY " + fieldName );

	} else {
		sqlQueryBf.append(" ORDER BY (	").append("\n")
				  .append("		CASE WHEN " + fieldName + " REGEXP '[0-9]' THEN CAST(" + fieldName + " AS DECIMAL(10,3)) ").append("\n")
				  .append("		ELSE 100000 ").append("\n")
				  .append("		END)	").append("\n");
	}

	return sqlQueryBf.toString();

}

public String creatSearchSqlStatement(HashMap param)
{
	String COMMAND  = StringUtil.NVL((String)param.get( "COMMAND" ));
	String f2List  = StringUtil.NVL((String)param.get( "f2List" ));
	String f13List = StringUtil.NVL((String)param.get( "f13List" ));
	String f15List = StringUtil.NVL((String)param.get( "f15List" ));
	String orderByF13 = StringUtil.NVL((String)param.get( "orderByF13" ));
	String orderByF15 = StringUtil.NVL((String)param.get( "orderByF15" ));
	String excelID = StringUtil.NVL((String)param.get( "excelID" ));

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
	    .append("    ,DATE_FORMAT(reg_date, '%Y/%m/%d') as regDate ").append("\n")
	 .append("FROM tb_excel_data ").append("\n")
	 .append("WHERE 1 = 1 ").append("\n");

	if ("DETAIL".equals(COMMAND))
	{
		sqlQueryBf.append(" AND excel_id = " + excelID).append("\n");

	}
	else if ("TEXT_SEARCH".equals(COMMAND))
	{
		/* 업종 조건 */
		sqlQueryBf.append(" AND f2 LIKE '%" + f2List.trim() + "%' ").append("\n");

		/********** 정렬 조건 조립***************/
		/* 양도가 정렬 필드 추가 함 */
		sqlQueryBf.append(" ORDER BY (	").append("\n")
				  .append("		CASE WHEN f15 REGEXP '[0-9]' THEN CAST(f15 AS DECIMAL(10,3)) ").append("\n")
				  .append("		ELSE 100000 ").append("\n")
				  .append("		END) ").append("\n");

	} else {

		/********** 조건에 대한 조립***************/
		/* 업종 조건 */
		if (!"".equals(f2List))
			 sqlQueryBf.append(" AND f2 IN (" + f2List + ") ").append("\n");

		/* 3년 합계 조건*/
		if (!"".equals(f13List))
			 sqlQueryBf.append(" AND f13 IN (" + f13List + ") ").append("\n");

		/* 양도가 조건*/
		if (!"".equals(f15List))
			 sqlQueryBf.append(" AND f15 IN (" + f15List + ") ").append("\n");

		/********** 정렬 조건 조립***************/
		/* 양도가 정렬 필드 추가 함 */
		sqlQueryBf.append(" ORDER BY (	").append("\n")
				  .append("		CASE WHEN f15 REGEXP '[0-9]' THEN CAST(f15 AS DECIMAL(10,3)) ").append("\n")
				  .append("		ELSE 100000 ").append("\n")
				  .append("		END) ").append("\n");
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