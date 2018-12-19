<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    response.setHeader("pragma", "no-cache");
    response.setHeader("Expires", "-1");
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>이미지 삽입</title>
<style>
body {
    background: threedface;
    color: windowtext;
    margin: 10px;
    border-style: none;
    font:9pt 돋움;
    text-align:center;
}
body, button, div, input, select, td, legend { font:9pt 돋움; }
input,select {color:highlight}
button {width:80px;}
fieldset { margin-bottom:5px;text-align:left;padding:5px }

</style>
<script type="text/javascript">
<!--
function insertImage()
{
    var str="";
    var f=document.tform;
    var src = f.upimage.value;
    if(!src.match(/\.(gif|jpg|png)$/i)) { alert("이미지파일을 첨부 해주세요!"); return; }
    f.submit();
}


function viewImage(src) {
	if(src.match(/\.(gif|jpg|jpeg)$/i)) {
	// 복사용 개체에 그림 삽입하고 실제 크기 구하기
		var obj = document.getElementById("previewPhotoGara");
		obj.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(src='" + src + "',sizingMethod=image)";
		var w = obj.offsetWidth;
		var h = obj.offsetHeight;
		if(w > 150) { // 가로 길이가 115 이상일 경우만 축소하기
			var x_axis = w / 150; // X축의 축소 비율 구하기
			var y_axis = parseInt(h / x_axis); // X축이 들어든 만큼 Y축의 크기를 축소한다.
		} else {
			var y_axis = h;
		}
	// 썸네일 컨테이너의 크기 조정
		document.getElementById("previewPhotoBox").style.width = '115px';
		document.getElementById("previewPhotoBox").style.height = y_axis + 'px';

	// 썸네일에 그림 삽입하고 이상유무 첵~
		document.getElementById("previewPhoto").style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(src='" + src + "',sizingMethod=scale)";
	} else {


	}
}

//-->
</script>
</head>

<body scroll="no">
<form action="upload_image_ok.jsp" name="tform" method="post" enctype="multipart/form-data">
    <fieldset>
    <legend>미리보기</legend>
    <table border=0 cellspacing=0 cellpadding=0 width="100%">
    <tr><td align="center" style="height:150px" id="td_img">
<DIV style="overflow:hidden; width:115px; height:150px"><!-- 썸네일 크롭핑 -->
    <DIV id=previewPhotoBox style="width:115px; height:150px"><!-- 썸네일 컨테이너 -->
    <DIV id=previewPhoto style="width:115px; height:150px"><!-- 썸네일 -->
    </DIV>
    </DIV>
    </DIV>

    <DIV style="overflow:hidden; width:1px; height:1px">
      <DIV id=previewPhotoGara></DIV>
    </DIV>

    </td></tr></table>
    </fieldset>

    <fieldset>
    <legend>이미지 선택</legend>
    <input type="file" name="upimage" style="width:100%" onchange="viewImage(this.value)" />
    </fieldset>

    <fieldset>
    <legend>옵션</legend>
    <table border=0 cellspacing=6 cellpadding=0>
    <tr>
    <td>정렬</td>
    <td>
    <select name="align">
    <option value="" selected>없음
    <option value="baseline">기준선</option>
    <option value="top">위쪽</option>
    <option value="middle">가운데</option>
    <option value="bottom">아래쪽</option>
    <option value="texttop">문자열 위쪽</option>
    <option value="absmiddle">선택 영역의 가운데</option>
    <option value="absbottom">선택 영역의 아래쪽</option>
    <option value="left">왼쪽</option>
    <option value="right">오른쪽</option>
    </select>
    </td>
    </tr>
    <tr>
    <td>가로*세로</td>
    <td>
    <input type="text" name="width" value="" size="3" maxlength=4 onfocus="this.select();"> *
    <input type="text" name="height" value="" size="3" maxlength=4 onfocus="this.select();">px
    </td>
    </tr>
    <tr>
    <td>두께</td>
    <td>
    <input type="text" name="border" value="0" size="2" maxlength=2 onfocus="this.select();">px
    </td>
    </tr>
    </table>
    </fieldset>

    <button onclick="insertImage()">확인</button>

</form>
</body>
</html>