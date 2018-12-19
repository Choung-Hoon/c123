<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import="lee.common.config.ConstantUtil" %>
<!-- DHX Grid -->
<link rel="stylesheet" type="text/css" href="<%=ConstantUtil.SERVER_HOST%>/dhx/dhtmlxGrid/codebase/dhtmlxgrid.css">
<script type="text/javascript">
    window.dhx_globalImgPath="<%=ConstantUtil.SERVER_HOST%>/dhx/dhtmlxGrid/codebase/imgs/";
</script>
<!--
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
-->
<script type="text/javascript" src="<%=ConstantUtil.SERVER_HOST%>/dhx/dhtmlxGrid/codebase/dhtmlxcommon.js"></script>
<script type="text/javascript" src="<%=ConstantUtil.SERVER_HOST%>/dhx/dhtmlxGrid/codebase/dhtmlxgrid.js"></script>
<script type="text/javascript" src="<%=ConstantUtil.SERVER_HOST%>/dhx/dhtmlxGrid/codebase/dhtmlxgridcell.js"></script>
<script type="text/javascript" src="<%=ConstantUtil.SERVER_HOST%>/dhx/dhtmlxGrid/codebase/ext/dhtmlxgrid_nxml.js"></script>
<script type="text/javascript" src="<%=ConstantUtil.SERVER_HOST%>/dhx/dhtmlxGrid/codebase/ext/dhtmlxgrid_srnd.js"></script>
<script type="text/javascript" src="<%=ConstantUtil.SERVER_HOST%>/dhx/dhtmlxGrid/codebase/ext/dhtmlxgrid_start.js"></script>
<script type="text/javascript" src="<%=ConstantUtil.SERVER_HOST%>/dhx/dhtmlxGrid/codebase/ext/dhtmlxgrid_filter.js"></script>
<script type="text/javascript" src="<%=ConstantUtil.SERVER_HOST%>/dhx/dhtmlxGrid/codebase/ext/dhtmlxgrid_drag.js"></script>
<script type="text/javascript" src="<%=ConstantUtil.SERVER_HOST%>/dhx/dhtmlxGrid/codebase/ext/dhtmlxgrid_pgn.js"></script>
<!--
<script type="text/javascript" src="<%=ConstantUtil.SERVER_HOST%>/dhx/ext/dhtmlxgrid_splt.js"></script>
<script type="text/javascript" src="<%=ConstantUtil.SERVER_HOST%>/dhx/ext/dhtmlxgrid_hmenu.js"></script>
-->

<script type="text/javascript" src="<%=ConstantUtil.SERVER_HOST%>/dhx/dhtmlxGrid/codebase/excells/dhtmlxgrid_excell_link.js"></script>
<script type="text/javascript" src="<%=ConstantUtil.SERVER_HOST%>/dhx/dhtmlxGrid/codebase/excells/dhtmlxgrid_excell_sub_row.js"></script>
<link rel="stylesheet" type="text/css" href="<%=ConstantUtil.SERVER_HOST%>/dhx/dhtmlxGrid/codebase/skins/dhtmlxgrid_dhx_skyblue.css">

<!-- DHX Combo -->
<link rel="stylesheet" type="text/css" href="<%=ConstantUtil.SERVER_HOST%>/dhx/dhtmlxCombo/codebase/dhtmlxcombo.css">
<script type="text/javascript" src="<%=ConstantUtil.SERVER_HOST%>/dhx/dhtmlxCombo/codebase/dhtmlxcombo.js"></script>

<!-- DHX Calendar -->
<link rel="stylesheet" type="text/css" href="<%=ConstantUtil.SERVER_HOST%>/dhx/dhtmlxCalendar/codebase/dhtmlxcalendar.css">
<script type="text/javascript" src="<%=ConstantUtil.SERVER_HOST%>/dhx/dhtmlxCalendar/codebase/dhtmlxcalendar.js"></script>


<link rel="stylesheet" type="text/css" href="<%=ConstantUtil.SERVER_HOST%>/share/css/kais_kaml.css">

