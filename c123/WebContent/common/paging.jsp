<%@ page contentType="text/html; charset=utf-8" %>
<%@ page errorPage="../common/error.jsp" %>
<% 
	int currentPage = Integer.parseInt((String)request.getAttribute( "currentPage" ));	
	int totalCount = Integer.parseInt((String)request.getAttribute( "totalCount" )); 
	int listSize = Integer.parseInt((String)request.getAttribute( "listSize" ));
%>
<script type="text/javascript">
function goList(pageNum) {
	$("#pageNum").attr("value", pageNum);
	$("#myform").submit();
	$("#myform").target = "";
}
</script>
<%
	// 페이징 계산
	int totalPage = ( ( totalCount % listSize ) == 0 ) ? totalCount / listSize : ( totalCount / listSize ) + 1;
	currentPage = ( currentPage > totalPage ) ? totalPage : currentPage;
	int navPage = ( (currentPage%10) == 0 ) ? (currentPage/10) : (currentPage/10) + 1;
	int totalNavPage = ( (totalPage%10) == 0 ) ? (totalPage/10) : (totalPage/10) + 1;

	if( currentPage > 0  && totalCount > 0 ) 
	{
		out.println("<div class='paging'>");		
		out.println("<span>");
		
		if( navPage > 1 ) 
		{
			out.println( "<a href='javascript:goList(1);' class='text'>처음</a>" );
			out.println( "<a href='javascript:goList(" + ( ( navPage - 1 ) * 10 ) + ")' class='text none_num'>이전</a>" );
		} 
	
		for( int i = ((navPage-1)*10)+1; i <= (navPage*10) && i<= totalPage; i++ ) 
		{
			if( i != currentPage ) out.print( "<a href='javascript:goList(" + i + ");'>" + i + "</a>" );
			else out.print( "<a href='javascript:goList(" + i + ");'><strong>" + i + "</strong></a>" );
		}
	
		if( navPage < totalNavPage ) 
		{ 
			out.println( "<a href='javascript:goList(" + ( ( navPage * 10 ) + 1 ) + ")' class='text none_num'>다음</a>" );
			out.println( "<a href='javascript:goList(" + totalPage + ");' class='last text'>마지막</a>" );
		}
		out.println("</span>");
		out.println("</div>"); 		
	}
%>	
