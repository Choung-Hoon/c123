<%!
  private String cPage( PageContext pageContext ) throws Exception {

    HttpServletRequest request = (HttpServletRequest)pageContext.getRequest();

    String conPath = request.getContextPath();

    String uri = request.getRequestURI();
    String cPath = "";
    String cPath1 = "";
    String cPath2 = "";

    if( conPath != "/" || conPath.equals( "/" ) ) {
      cPath = uri.substring( conPath.length() + 1, uri.length() );
    } else {
      cPath = uri.substring( 1, uri.length() );
    }
	
    cPath1 = cPath.substring( 0, cPath.lastIndexOf( "/" ) );
    cPath2 = cPath.substring( cPath.lastIndexOf( "/" ) );
	
    if( cPath1.lastIndexOf( "/" ) > 0 ) {
      cPath = cPath1.substring( 0, cPath1.length() - (cPath1.length() - cPath1.lastIndexOf( "/" ) )) + cPath2;
    } else {
      cPath = cPath2;
    }
    return cPath;
  }

  /**
   * SQL Injection & XSS Prevention arameter Validation Check
   *
   * @param source 
   * @return String
   */
  private String filterString(String str) {

    if (str == null || str.equals("")) {
      return str;
    }

    str = str.replaceAll("'", "''");
    str = str.replaceAll("--", "__");
    str = str.replaceAll(";", "|");
    //str = str.replaceAll("%", "");
    str = str.replaceAll("<", "&lt;");
    str = str.replaceAll(">", "&gt;");

    return str;
  }
%>
<% 
  // set Header
  //String cPath = cPage( pageContext );
  //String listSizeStr = request.getParameter("listSize");
  //int listSize = listSizeStr != null && !listSizeStr.equals( "" ) ? Integer.parseInt( listSizeStr ) : 10;

  //String curPage = request.getParameter("curPage");
  //int pageNum = curPage == null || curPage.equals("") ? 1 : Integer.parseInt(curPage);

  //String pagingPath = "../common/paging.jsp";
  String cssPath    = "../css";
  String imgPath    = "../images";
  String jsPath     = "../js";

  //request.setAttribute("listSize", new Integer(listSize));
%>
