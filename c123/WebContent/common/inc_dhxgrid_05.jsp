<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import="lee.common.config.ConstantUtil" %>
<!-- DHX Grid -->
<script type="text/javascript">
    $.blockUI.defaults.message = '<br><img src="<%=ConstantUtil.SERVER_HOST%>/images/comm/loading.gif" align="absmiddle" /> <font style="color:#000000; font-size:13px; font-weight:bold" >처리중입니다.</font>';
    $.blockUI.defaults.overlayCSS.backgroundColor = '#fff';
    $.blockUI.defaults.overlayCSS.opacity = '0.5';
    $.blockUI.defaults.css.width = '40%';
    $.blockUI.defaults.css.left  = '30%',
    $.blockUI.defaults.css.height = '85px';
    $.blockUI.defaults.css.border = '1px solid #ccc';
    $.blockUI.defaults.fadeIn = 100;
</script>
<!-- 공통 -->
<script type="text/javascript" src="<%=ConstantUtil.SERVER_HOST%>/share/js/masks.js"></script>
<script type="text/javascript" src="<%=ConstantUtil.SERVER_HOST%>/share/js/excel.js"></script>
<!-- DHX Grid -->
<link rel="stylesheet" type="text/css" href="<%=ConstantUtil.SERVER_HOST%>/dhx_new/dhtmlxgrid.css">
<script type="text/javascript">
    window.dhx_globalImgPath="<%=ConstantUtil.SERVER_HOST%>/dhx_new/imgs/";
</script>
<script type="text/javascript" src="<%=ConstantUtil.SERVER_HOST%>/dhx_new/dhtmlxcommon.js"></script>
<script type="text/javascript" src="<%=ConstantUtil.SERVER_HOST%>/dhx_new/dhtmlxgrid.js"></script>		
<script type="text/javascript" src="<%=ConstantUtil.SERVER_HOST%>/dhx_new/dhtmlxgridcell.js"></script>	
<script type="text/javascript" src="<%=ConstantUtil.SERVER_HOST%>/dhx_new/ext/dhtmlxgrid_nxml.js"></script>
<script type="text/javascript" src="<%=ConstantUtil.SERVER_HOST%>/dhx_new/ext/dhtmlxgrid_srnd.js"></script>
<script type="text/javascript" src="<%=ConstantUtil.SERVER_HOST%>/dhx_new/ext/dhtmlxgrid_splt.js"></script>
<script type="text/javascript" src="<%=ConstantUtil.SERVER_HOST%>/dhx_new/ext/dhtmlxgrid_pgn.js"></script>	
<script type="text/javascript" src="<%=ConstantUtil.SERVER_HOST%>/dhx_new/ext/dhtmlxgrid_start.js"></script>
<script type="text/javascript" src="<%=ConstantUtil.SERVER_HOST%>/dhx_new/ext/dhtmlxgrid_filter.js"></script>
<script type="text/javascript" src="<%=ConstantUtil.SERVER_HOST%>/dhx_new/ext/dhtmlxgrid_hmenu.js"></script>
<script type="text/javascript" src="<%=ConstantUtil.SERVER_HOST%>/dhx_new/ext/dhtmlxgrid_drag.js"></script>
<script type="text/javascript" src="<%=ConstantUtil.SERVER_HOST%>/dhx_new/excells/dhtmlxgrid_excell_link.js"></script>

<!-- DHX Combo -->
<link rel="stylesheet" type="text/css" href="<%=ConstantUtil.SERVER_HOST%>/dhx_new/dhtmlxcombo.css">
<script type="text/javascript" src="<%=ConstantUtil.SERVER_HOST%>/dhx_new/dhtmlxcombo.js"></script>
<!-- DHX Calendar -->
<link rel="stylesheet" type="text/css" href="<%=ConstantUtil.SERVER_HOST%>/dhx_new/dhtmlxcalendar.css">
<script type="text/javascript" src="<%=ConstantUtil.SERVER_HOST%>/dhx_new/dhtmlxcalendar.js"></script>
