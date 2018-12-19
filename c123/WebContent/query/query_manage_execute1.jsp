<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import="kr.go.seoul.ssf.common.config.*" %> 
<%@ page import="kr.go.seoul.ssf.bean.*" %> 
<%@ page import="kr.go.seoul.ssf.manager.*" %> 
<%@ page import="kr.go.seoul.ssf.common.util.*" %>
<%@ page import="kr.go.seoul.ssf.common.servlet.*" %>
<%@ page import="kr.go.seoul.ssf.session.*" %>
<%@ page import="java.util.*" %>
<%@ page import="kr.go.seoul.ssf.manager.queryMgr" %>
<%@ page import="kr.go.seoul.ssf.common.db.JResultSet" %>

<%@ include file="../common/_includeInit.inc" %>
<%@ include file="../common/_includeCommon.inc" %>
<%@ include file="../common/_checkLogin.inc" %> 

<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Statement" %>

<%@ page import="javax.sql.*, javax.naming.*" %>


<%
	String query = request.getParameter("query");
	String gubun = request.getParameter("gubun");
	JResultSet jrs = null ; 
	int totalCount = 0;

	query = query.replaceAll("''","'") ;
	String result = "" ;
	
	if ("set".equals(gubun))
	{
		if (setSQL(query))
		{
			result = "성공했습니다.";
		} else {
			result= "실패했습니다.";
		}
		
	} else if ("get".equals(gubun))
	{
		jrs = getSQL(query);
		totalCount = jrs.getRowCount();
	}	
	
	if ("set".equals(gubun))
	{
%>
<form name="myform" method="post">
</form>	
<script language="JavaScript">
	alert('<%=result%>');
	location.href = "./query_manage.jsp";
</script>

<%	
	} else if ("get".equals(gubun))
	{
		int columnCnt = jrs.getColumnCount();
%>	
	<!-- 컨텐츠 시작 -->
	<div class="contents">
	<p class="list_num">결과 총 <%=totalCount %>건</p>
	<table summary="결과" class="admin_skin_list01">
	<caption class="hidden">결과 테이블</caption>
	<thead>
		<tr>
	<%	// 테이블 타이틀 생성
		for(int i = 0; i < columnCnt ; i ++){	
	%>	
			<th scope="col"><%=jrs.getColumnName(i)%></th>
	<%
		}
	%>		
		</tr>
	</thead>
	<tbody>
	<%
		if (totalCount != 0 ) {
			//필드 매핑
			while(jrs != null && jrs.next()){	
	%>		
		<tr>
	<%
				for(int i = 0; i < columnCnt ; i ++){								
	%>
					<td><%=jrs.getString(jrs.getColumnName(i)) %></td>
	<%
				}
	%>		
		</tr>
	<%
				}
		}
		else {						
	%>
		<tr>
			<td colspan="<%=columnCnt%>">조회된 데이터가 없습니다.</td>						
		</tr>
	<%
		}
	%>					
	</tbody>
	</table>
	
	<fieldset>
		<div class="list_search">
			<a href="./query_manage.jsp" onclick="" >쿼리관리자</a>
		</div>
	</fieldset>
	</form>
	<!-- 검색 끝  -->
</div>
<!-- 컨텐츠 끝 -->
<%
	}
%>

<%!
	public boolean setSQL(String sql){
        Connection conn = null;
        Statement  stmt = null;        
                
        try {
            
            conn = getConnection();
            conn.setAutoCommit(false);
            stmt = conn.createStatement();

            System.out.println(sql);
            stmt.executeUpdate(sql);

        } catch(Exception e){
                    
            System.out.println(e.toString());
             if (conn != null){
             
                 try{ 
                 
                     conn.rollback(); 
                     
                 }catch (Exception e1){ 
                 
                 }
             }
                
             return false;
                
        } finally {
        
              if ( stmt != null ) try {stmt.close(); }catch(Exception e){} 
              if ( conn != null ) 
                    try{
                        conn.setAutoCommit(true);
                        conn.commit();
                        conn.close();
                    }catch(Exception e){} 

        }
        
        return true ;        
        
    }
    
    public JResultSet getSQL(String sql){
        
        Connection conn = null;
        Statement  stmt = null;
        JResultSet jrs = null;
        
        try {
        
            conn = getConnection();

            stmt = conn.createStatement();

            System.out.println(sql);
           jrs =  new JResultSet(stmt.executeQuery(sql)) ;

        } catch(Exception e){
            
                System.out.println(e.toString());

        } finally {
        
              if ( stmt != null ) try {stmt.close(); }catch(Exception e){} 
              if ( conn != null ) 
                    try{
                        conn.close();
                    }catch(Exception e){} 

        }        
        
        return jrs;
    }

    public Connection getConnection(){
    
	   Connection conn = null;
    
	    try{
			
		   	Context initCnt = new InitialContext();
		   	Context env = (Context) initCnt.lookup("java:comp/env/");
		   	DataSource ds = (DataSource) env.lookup("jdbc/jndi_ssf");
		   	
	        /*
	        String DB_DRIVER = "org.gjt.mm.mysql.Driver" ;
	        String DB_URL = "jdbc:mysql://localhost:3306/hissfdb";              
	        String DB_USER = "hissf";                                      
	        String DB_PASSWORD= "wkdgkrwoeks20!!";                                   
	    	*/
	        //Class.forName(DB_DRIVER);  
	        //conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
	        conn = ds.getConnection();
        
	   }catch(Exception e){
                
         System.out.println(e.toString());

	   }
      
        return conn ;      
   	}


%>