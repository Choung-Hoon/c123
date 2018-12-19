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

function goNoticePage(pageNum)
{
	var param = "listSize=" + $("#listSize").val()
			  + "&pageNum=" + pageNum ;
	
	$("#tit_main").text("건업양도양수 > ");
	$("#tit_sub").text("공지사항");
	//$("#sub_title").html('<img src="./images/icon/title1_01.gif">');
	$("#sub_title").html('<img src="./images/icon/notice_title_01.gif">');
	$("#content_view").load("./sub/sub11_01.jsp?" + param);
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
			out.println( "<a href='javascript:goNoticePage(1);' class='text'>처음</a>" );
			out.println( "<a href='javascript:goNoticePage(" + ( ( navPage - 1 ) * 10 ) + ")' class='text none_num'>이전</a>" );
		} 
	
		for( int i = ((navPage-1)*10)+1; i <= (navPage*10) && i<= totalPage; i++ ) 
		{
			if( i != currentPage ) out.print( "<a href='javascript:goNoticePage(" + i + ");'>" + i + "</a>" );
			else out.print( "<a href='javascript:goNoticePage(" + i + ");'><strong>" + i + "</strong></a>" );
		}
	
		if( navPage < totalNavPage ) 
		{ 
			out.println( "<a href='javascript:goNoticePage(" + ( ( navPage * 10 ) + 1 ) + ")' class='text none_num'>다음</a>" );
			out.println( "<a href='javascript:goNoticePage(" + totalPage + ");' class='last text'>마지막</a>" );
		}
		out.println("</span>");
		out.println("</div>"); 		
	}
%>	
