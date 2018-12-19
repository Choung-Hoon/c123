var oldText = "";
 
 function replaceComma(str) { // 콤마 없애기 
  while(str.indexOf(",") > -1) { 
   str = str.replace(",", ""); 
  } 
  return str; 
 } 
 
 function numChk(num){
 
  var rightchar = replaceComma(num.value);
  var moneychar = "";
 
  for(index = rightchar.length-1; index>=0; index--){
   splitchar = rightchar.charAt(index);
   if (isNaN(splitchar)) {
    alert(splitchar +"는 숫자가 아닙니다. \n다시 입력해주세요");
    num.value = "0"; 
    num.focus();
    return;
   }
   moneychar = splitchar+moneychar;
   if(index%3==rightchar.length%3&&index!=0){ moneychar=','+moneychar; }
  }
  oldText = moneychar;
  num.value = moneychar;
}

 function num2won(szNumber){
	 szNumber = "" + szNumber;

	 if(szNumber == "" || szNumber == "0")
	  return "";
	  
	 var returnValue = 0;
	 var temp1 = replaceComma(szNumber);
	 var temp = temp1.split('.');
	 
	 var num1 = "";
	 var comma = 1;
	 for(var i = temp[0].length -1; i >= 0; i--){
	  num1 += temp[0].charAt(i);

	  if(comma % 3 == 0 && comma != 0){
	   num1 += ",";
	  } 
	  comma++;
	 } 
	 

	 var num2 = "";
	 for(var i = num1.length -1; i >= 0; i--){
	  num2 += num1.charAt(i);
	 } 
	 
	 if(temp.length > 1){

	  var num3 = "";
	  for(var i=1; i <= temp[1].length; i++){
	   num3 += temp[1].charAt(i-1);
	   
	   if((i%3 == 0) && (i != 0)){
	    num3 += ",";
	   }
	  } 
	  
	  var num4 = num2 + "." + num3;
	  returnValue = num4.replace(/(^,)|(,$)/g,"");
	 } 
	 else
	  returnValue = num2.replace(/(^,)|(,$)/g,"");; 
	  
	 if(returnValue == "" || returnValue == ".")
	  return ""
	 else
	  return returnValue;
	}





function chkMaxlength(obj, maxlength)
{
	if( calcBytes(obj.value) >= maxlength )
	{
        obj.value = obj.value.substring(0, maxlength-1);
		alert( maxlength + "자를 초과하셧습니다.");
		return;
	}
}

function calcBytes(szValue){
	  var tcount = 0;
	  var tmpStr = new String(szValue);
	  var temp = tmpStr.length;
	  var onechar;
	  for ( k=0; k<temp; k++ ){
	    onechar = tmpStr.charAt(k);
	    if (escape(onechar).length > 4){
	      tcount += 2;
	    }else{
	      tcount += 1;
	    }
	  }
	return tcount;
}

//*�ѿ��� �ƿ� �̹���
function menuOver() {
	//alert(this.src);
	this.src = this.src.replace(".gif", "_on.gif");
}
function menuOut() {
	this.src = this.src.replace("_on.gif", ".gif");
}

function menuClick() {
	if(this.id.indexOf("menu-image") > -1) {
		var submenu = document.getElementById("menu" + this.id.substring(10));
		var uls = submenu.getElementsByTagName("ul");
		if(uls.length>0){
			if(uls[0].style.display == "none")
				uls[0].style.display = "block";
			else
				uls[0].style.display = "none";
		}
	}
}
function menuOut() {
		this.src = this.src.replace("_on.gif", ".gif");
}

function initImgEffect(ImgEls,SelImg) {
	
	MenuImg = document.getElementById(ImgEls).getElementsByTagName("img");
	MenuImgLen = MenuImg.length;

	for (i=0; i<MenuImgLen; i++) {
		MenuImg.item(i).onmouseover = menuOver;
		MenuImg.item(i).onmouseout = menuOut;
		if (i == SelImg) {
			MenuImg.item(i).onmouseover();
			MenuImg.item(i).onmouseover = null;
			MenuImg.item(i).onmouseout = null;
		}
	}
}

function MM_swapImgRestore() { //v3.0
  var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
}

function MM_preloadImages() { //v3.0
  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
}

function MM_findObj(n, d) { //v4.01
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
  if(!x && d.getElementById) x=d.getElementById(n); return x;
}

function MM_swapImage() { //v3.0
  var i,j=0,x,a=MM_swapImage.arguments; document.MM_sr=new Array; for(i=0;i<(a.length-2);i+=3)
   if ((x=MM_findObj(a[i]))!=null){document.MM_sr[j++]=x; if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];}
}

//JScript ����
var zoomRate = 20;
var maxRate = 200;
var minRate = 100;
var curRate = 100;
function zoomInOut(contentid, how)
{
	
	var bIE = new RegExp(/MSIE/).test(navigator.userAgent);
  if (bIE && (
  			((how == "in")&&(curRate >= maxRate)) ||
  			((how == "out") && (curRate <= minRate))
  	) ) {
    return;   /* ���� �ʰ�� �����Ѵ� */
  }
  if (how == "in") {
  	if(bIE) {
    	curRate = curRate + zoomRate;
    	document.body.style.zoom = curRate + '%';	/* ȭ�� Ȯ�� */s
    }
    else {    	
    	scaleFont(+1);
    }
  }
  else if (how == "def"){
  	if(bIE) {
  		document.body.style.zoom = 1;
  		curRate = 100;
  	}
  	else {
  		scaleFont(0);
	  }	
	}
	else{
		if(bIE) {
    	curRate = curRate + (-1)*zoomRate;
    	document.body.style.zoom = curRate + '%';	/* ȭ�� ��� */
    }
    else {
			scaleFont(-1);
    }
  }
}


var fSize = 11;
function scaleFont( n )
{
		if(n == 0) fSize = 11;
		else fSize = fSize + n;
		if(fSize > 20) { fSize = 20; return; }
		if(fSize < 11) { fSize = 11; return; }
    var objTd = document.getElementsByTagName( "td" );// <td>, <TD>�� ������ ��� �о��
		var objDiv = document.getElementsByTagName( "div" );
		var objSpan = document.getElementsByTagName( "span" );
		var objA = document.getElementsByTagName( "a" );
		var objP = document.getElementsByTagName( "p" );
		var objUl = document.getElementsByTagName( "ul" );
		var objDl = document.getElementsByTagName( "dl" );
		var objLi = document.getElementsByTagName( "li" );		
		var objH3 = document.getElementsByTagName( "h3" );		
		//var objFont = document.getElementsByTagName( "font" );
    for( i=0; i < objDiv.length; i++ )
    {
          objDiv[i].style.fontSize = fSize + "px";          
          if(fSize > 15) 
						objDiv[i].style.lineHeight = "1.5";
    }
    for( i=0; i < objTd.length; i++ )
    {
          objTd[i].style.fontSize = fSize + "px";
          if(fSize > 15) 
						objTd[i].style.lineHeight = "1.5";
    }
    for( i=0; i < objSpan.length; i++ )
    {
          objSpan[i].style.fontSize = fSize + "px";
          if(fSize > 15) 
						objSpan[i].style.lineHeight = "1.5";
    }
    for( i=0; i < objA.length; i++ )
    {
          objA[i].style.fontSize = fSize + "px";
          if(fSize > 15) 
						objA[i].style.lineHeight = "1.5";
    }
		for( i=0; i < objP.length; i++ )
    {
          objP[i].style.fontSize = fSize + "px";
          if(fSize > 15) 
						objP[i].style.lineHeight = "1.5";
    }
    	for( i=0; i < objUl.length; i++ )
    {
          objUl[i].style.fontSize = fSize + "px";
          if(fSize > 15) 
						objUl[i].style.lineHeight = "1.5";
    }
    	for( i=0; i < objDl.length; i++ )
    {
          objDl[i].style.fontSize = fSize + "px";
          if(fSize > 15) 
						objDl[i].style.lineHeight = "1.5";
    }
    	for( i=0; i < objLi.length; i++ )
    {
          objLi[i].style.fontSize = fSize + "px";
          if(fSize > 15) 
						objLi[i].style.lineHeight = "1.5";
    }
    	for( i=0; i < objH3.length; i++ )
    {
          objH3[i].style.fontSize = fSize + "px";
          if(fSize > 15) 
						objH3[i].style.lineHeight = "1.5";
    }
    /*for( i=0; i < objFont.length; i++ )
    {
          objFont[i].style.fontSize = fSize + "px";
          if(fSize > 15) 
						objFont[i].style.lineHeight = "1.5";
    }*/
}

/* IE HTML rewrite */
function IE_HtmlRewrite(objParent) {
	if (window.ActiveXObject && objParent) {
		objParent.innerHTML = objParent.innerHTML;
	}
}

//IE Flicker Bug �ذ�
(function(){
	/*Use Object Detection to detect IE6*/
	var  m = document.uniqueID /*IE*/
	&& document.compatMode  /*>=IE6*/
	&& !window.XMLHttpRequest /*<=IE6*/
	&& document.execCommand ;
	try{
		if(!!m){ m("BackgroundImageCache", false, true) /* = IE6 only */ }
	}catch(oh){};
})();

function getCookie( name )
{
	var nameOfCookie = name + "=";
	var x = 0;
	while ( x <= document.cookie.length )
	{
		var y = (x+nameOfCookie.length);
		if ( document.cookie.substring( x, y ) == nameOfCookie )
		{
			if ( (endOfCookie=document.cookie.indexOf( ";", y )) == -1 )
				endOfCookie = document.cookie.length;
			return unescape( document.cookie.substring( y, endOfCookie ) );
		}
		x = document.cookie.indexOf( " ", x ) + 1;
		if ( x == 0 )
			break;
	}
	return "";
}

function setCookie( name, value,domain ,expireday)
{
	var todayDate = new Date();

	todayDate.setDate(todayDate.getDate() + expireday);

	document.cookie = name + "=" + escape( value ) + "; path=/; domain=" + domain + "; expires=" + todayDate.toGMTString() +";"
}


//���հԽ��� RSS�� script
function MM_openBrWindow(theURL,winName,features) { //v2.0
  window.open(theURL,winName,features);
}

function initSubmenuByMenuId(depth1, depth2, depth3,depth4, menuId) {
	selectDepth1 = "menu" + depth1 + "-" + depth2;
	selectDepth2 = "menu" + depth1 + "-" + depth2 + "-" + depth3;
	selectDepth3 = "menu" + depth1 + "-" + depth2 + "-" + depth3 + "-" + depth4;
	
	nav = document.getElementById(menuId);
	if(!nav) return;
	menuEl = nav.getElementsByTagName("li");	
		
	
	for(i = 0; i < menuEl.length; i++) {
		if (menuEl.item(i).id == selectDepth1 || menuEl.item(i).id == selectDepth2  || menuEl.item(i).id == selectDepth3  ) {
			var im = menuEl.item(i).getElementsByTagName("img");
			if(im && im.length > 0 ) {
				im.item(0).src = im.item(0).src.replace(".gif", "_on.gif");
			}
			else {
				var anc = menuEl.item(i).getElementsByTagName("a");
				if(anc && anc.length > 0) {
					anc.item(0).className = "on";
					if(menuEl.item(i).id == selectDepth3) {
						anc.item(0).className += " leaf";
					}
				}
			}
		} else {
			var im = menuEl.item(i).getElementsByTagName("img");
			if( im == null || im.length == 0)  continue;
			im.item(0).onmouseover = menuOver;
			im.item(0).onmouseout = menuOut;
			im.item(0).onfocus = menuOver;
			im.item(0).onblur = menuOut;
			if (menuEl.item(i).getElementsByTagName("ul").item(0)) {
				menuEl.item(i).getElementsByTagName("ul").item(0).style.display = "none";
			}
		}
	}	
	menuId = "menu" + depth1;
	initTopmenuByMenuId(depth1,depth2,depth3,depth4,menuId);
}

function initTopMenu(el,depth1) {
	topMenuOut(el.getElementsByTagName("img").item(0));
	if(el.id == "top-menu" + depth1) {
		topMenuOver(el.getElementsByTagName("img").item(0));
	}
}
function topMenuOver(img) {
	img.src = img.src.replace(".gif", "_on.gif");
}
function topMenuOut(img) {
	img.src = img.src.replace("_on.gif", ".gif");
}
function selectTopmenuByMenuId() {
	var depth1 = this.id.substring("top-menu-head".length,this.id.length);
	var menuId = "sub-menu" + depth1;		
	var selectDepth1 = "top-" + depth1 + "-1";
	var topnav = document.getElementById("lnb");
	if(!topnav) return;
	var topEl = topnav.getElementsByTagName("ul");
	for(i = 0 ; i < topEl.length ; i++){
		if(topEl[i].id.substring(0,12) == "top-sub-menu") {
			topEl[i].style.display = "none";
		}
	}
	var topEl2 = topnav.getElementsByTagName("li");
	for(i = 0 , seq = 1; i < topEl2.length ; i++){
		if(topEl2[i].id.substring(0,8) == "top-menu") {
			initTopMenu(topEl2[i],depth1);
		}
	}
	
	var nav = document.getElementById("top-" + menuId);
	if(!nav) return;
	nav.style.display = "block";
	menuEl = nav.getElementsByTagName("li");
	for(i = 0; i < menuEl.length; i++) {
		var imgEl = menuEl.item(i).getElementsByTagName("img")
		if(imgEl != null && imgEl.length>0) {
			imgEl.item(0).onmouseover = menuOver;
			imgEl.item(0).onmouseout = menuOut;
			imgEl.item(0).onfocus = menuOver;
			imgEl.item(0).onblur = menuOut;
		}
	}
}
function initTopmenuByMenuId(depth1, depth2, depth3, depth4, menuId) {
	var selectDepth1 = "top-" + depth1 + "-" + depth2;
	var selectDepth2 = "top-" + depth1 + "-" + depth2 + "-" + depth3;
	var selectDepth3 = "top-" + depth1 + "-" + depth2 + "-" + depth3 + "-" + depth4;
	var topnav = document.getElementById("lnb");
	if(!topnav) return;
	var topEl = topnav.getElementsByTagName("ul");	
	for(var i = 0 ; i < topEl.length ; i++){
		if(topEl[i].id.substring(0,12) == "top-sub-menu") {
			topEl[i].style.display = "none";
		}
	}
	var topEl3 = topnav.getElementsByTagName("li");
	for(i = 0 , seq = 1; i < topEl3.length ; i++){
		if(topEl3[i].id.substring(0,8) == "position") {
			if(depth1 == seq) topEl3[i].style.display = "block";
			else topEl3[i].style.display = "none";
			seq++;
		}
	}
	
	var topEl2 = topnav.getElementsByTagName("a");


	for(i = 0, seq = 0 ; i < topEl2.length ; i++){
		if(topEl2[i].id.substring(0,13) == "top-menu-head") {
			topEl2[i].onmouseover =  selectTopmenuByMenuId;
			topEl2[i].onfocus = selectTopmenuByMenuId;
			if ( topEl2[i].id.substring(13) == depth1) {
				topEl2[i].onmouseover();
			}
			seq++;
		}
	}
	
	
	
	var nav = document.getElementById("top-" + menuId);
	if(!nav) return;
	nav.style.display = "block";
	menuEl = nav.getElementsByTagName("li");
	for(i = 0; i < menuEl.length; i++) {
		var menuElItm = menuEl.item(i);
		var imgEl = menuElItm.getElementsByTagName("img");
		if(imgEl == null || imgEl.length == 0)  {
			var aEl = menuElItm.getElementsByTagName("a");
			var itm = aEl.item(0);
			if (menuElItm.id == selectDepth1 || menuElItm.id == selectDepth2  || menuElItm.id == selectDepth3  ) {
				itm.className = "on";
				itm.onmouseover = null;
				itm.onmouseout = null;
				itm.onfocus = null;
				itm.onblur = null;
			}
			else {
				itm.onmouseover = menuOver;
				itm.onmouseout = menuOut;
				itm.onfocus = menuOver;
				itm.onblur = menuOut;
			}
		} else {
			var itm = imgEl.item(0);
			if (menuElItm.id == selectDepth1 || menuElItm.id == selectDepth2  || menuElItm.id == selectDepth3  ) {
				itm.src = itm.src.replace(".gif", "_on.gif");
				itm.onmouseover = null;
				itm.onmouseout = null;
				itm.onfocus = null;
				itm.onblur = null;
			}
			else {
				itm.onmouseover = menuOver;
				itm.onmouseout = menuOut;
				itm.onfocus = menuOver;
				itm.onblur = menuOut;
			}
		}
	}
}

//�ٷΰ���
function goURLPop(o) {
	var f=o;
	if(f.selectbudget.value == "") return false;
	location.href=f.selectbudget.value;
}

//�ؽ�Ʈ�� �Ǿ��ִ� �Ǹ޴�
 function ctabmenuView(a) {
if(!document.getElementById) return false;
if(!document.getElementsByTagName) return false;
if(!document.getElementById("ctabmenu")) return false;
var a;
var el = document.getElementById("ctab4m"+a);
if(el && el.nodeName == "LI")
{
el.className = "on";
el.getElementsByTagName("a")[0].className = "on";
}
}

//��ü�޴�����ݱ�
function onoff(obj)
{
var obj=document.getElementById(obj); 
if(obj.style.display=="inline") 
obj.style.display="none"; 
else obj.style.display="inline"; 
} 

// ���ҽ� �Խ���
function mainBoardChange(idx) {
	var obj;
	var obj2;
	for (var z=1; z<=16; z++) {
		obj = document.getElementById('mainBoard' + z);
		obj2 = document.getElementById('mainBoardMore' + z);
		obj3 = document.getElementById('bImg' + z);
		if ( obj && obj2 && obj3 ) {
			ln1 = obj3.src.substring(0,obj3.src.lastIndexOf(".") -1) + "2.gif";
			ln2 = obj3.src.substring(0,obj3.src.lastIndexOf(".") -1) + "1.gif";
			if (z == idx){
				obj.className="";
				obj2.className="more";
				obj3.src = ln1;
			} else {
				obj.className="hid";
				obj2.className="more_hid";
				obj3.src = ln2;
			}

		}
	}
}

function bestBoardChange(idx) {
	var obj;
	var obj2;
	for (var z=1; z<=5; z++) {
		obj = document.getElementById('bestBoard' + z);
		obj2 = document.getElementById('bestBoardMore' + z);
		obj3 = document.getElementById('best' + z);
		if ( obj && obj2 && obj3 ) {
			ln1 = obj3.src.substring(0,obj3.src.lastIndexOf(".") -1) + "2.gif";
			ln2 = obj3.src.substring(0,obj3.src.lastIndexOf(".") -1) + "1.gif";
			if (z == idx){
				obj.className="";
				obj2.className="more";
				obj3.src = ln1;
			} else {
				obj.className="hid";
				obj2.className="more_hid";
				obj3.src = ln2;
			}

		}
	}
}

function photoBoardChange(idx) {
	var obj;
	var obj2;
	for (var z=1; z<=5; z++) {
		obj = document.getElementById('photoBoard' + z);
		obj2 = document.getElementById('photoBoardMore' + z);
		obj3 = document.getElementById('photo' + z);
		if ( obj && obj2 && obj3 ) {
			ln1 = obj3.src.substring(0,obj3.src.lastIndexOf(".") -1) + "2.gif";
			ln2 = obj3.src.substring(0,obj3.src.lastIndexOf(".") -1) + "1.gif";
			if (z == idx){
				obj.className="";
				obj2.className="more";
				obj3.src = ln1;
			} else {
				obj.className="hid";
				obj2.className="more_hid";
				obj3.src = ln2;
			}

		}
	}
}

function photoBoardChange(idx) {
	var obj;
	var obj2;
	for (var z=1; z<=2; z++) {
		obj = document.getElementById('specialZoneBoard' + z);
		obj2 = document.getElementById('photoBoardMore' + z);
		obj3 = document.getElementById('photo' + z);
		if ( obj && obj2 && obj3 ) {
			ln1 = obj3.src.substring(0,obj3.src.lastIndexOf(".") -1) + "2.gif";
			ln2 = obj3.src.substring(0,obj3.src.lastIndexOf(".") -1) + "1.gif";
			if (z == idx){
				obj.className="";
				obj2.className="more";
				obj3.src = ln1;
			} else {
				obj.className="hid";
				obj2.className="more_hid";
				obj3.src = ln2;
			}

		}
	}
}

// Tab Content
function initTabMenu(tabContainerID) {
	var tabContainer = document.getElementById(tabContainerID);
	var tabAnchor = tabContainer.getElementsByTagName("a");
	var i = 0;

	for(i=0; i<tabAnchor.length; i++) {
		if (tabAnchor.item(i).className == "tab")
			thismenu = tabAnchor.item(i);
		else
			continue;

		thismenu.container = tabContainer;
		thismenu.targetEl = document.getElementById(tabAnchor.item(i).href.split("#")[1]);
		thismenu.targetEl.style.display = "none";
		thismenu.imgEl = thismenu.getElementsByTagName("img").item(0);
		thismenu.onclick = function tabMenuClick() {
			currentmenu = this.container.current;
			if (currentmenu == this)
				return false;

			if (currentmenu) {
				currentmenu.targetEl.style.display = "none";
				if (currentmenu.imgEl) {
					currentmenu.imgEl.src = currentmenu.imgEl.src.replace("_on.gif", ".gif");
				} else {
					currentmenu.className = currentmenu.className.replace(" on", "");
				}
			}
			this.targetEl.style.display = "";
			if (this.imgEl) {
				this.imgEl.src = this.imgEl.src.replace(".gif", "_on.gif");
			} else {
				this.className += " on";
			}
			this.container.current = this;

			return false;
		};

		if (!thismenu.container.first)
			thismenu.container.first = thismenu;
	}
	if (tabContainer.first)
		tabContainer.first.onclick();
}

//popupzone
 var popup_timer = null;
 var popup_delay_time = 4000;
 var popup_pause = false;
 var popup_button_pause = false;
 var select_popup_num = 1;
 var popup_object_num = 4;
 function popup_open(url, target, width, height){
 if( url == '') return ;
 window.open(url, target, 'width='+width+',height='+height);
 }

 function popup_display(popupIDX, move) {
 if(!popupIDX) {
 popupIDX = select_popup_num;
 if(popup_pause==false && !move) return;
 if(popup_button_pause==false && !move) return;
 if(!move) move = 'next';
 hide_popup(popupIDX);
 }else{
 hide_popup(select_popup_num);
 }
 if(move=='prev') {
 if(popupIDX==1) {
 popupIDX = popup_object_num;
 } else {
 popupIDX--;
 }
 } else if(move=='next') {
 if(popupIDX==popup_object_num) {
 popupIDX = 1;
 } else {
 popupIDX++;
 }

 }
 show_popup(popupIDX);
 select_popup_num = popupIDX;
 }

 function hide_popup(num) {
 document.getElementById("popupzoneImage" + num).style.display = 'none';
 document.getElementById("popupzoneNumber" + num).src = '/images/main/pop_num' + num + '_off.gif';
 }

 function show_popup(num) {
 document.getElementById("popupzoneImage" + num).style.display = 'block';
 document.getElementById("popupzoneNumber" + num).src = 'images/main/pop_num' + num + '_on.gif';
 }
 function popup_scroll() {
 popup_timer = setInterval("popup_display()",popup_delay_time);
 }

 popup_scroll();

 ///// ZonnInOut //////////////////////////////////////////////////////////////////////////////	

 var nowZoom = 100; // �������
 var maxZoom = 200; // �ִ����
 var minZoom = 100; // �ּҺ���(����� ���ƾ� ��)


 function zoomNo(){
 	location.reload();
 }

 	//ȭ�� Ű���.
 function zoomIn() {
 	scaleFont(1);
 	return;
 	if (nowZoom < maxZoom) {
 		nowZoom += 10; // 10%�� Ŀ���.
 	} else {
 		return;
 	}
 	document.body.style.zoom = nowZoom + "%";
 }

 //ȭ�� ���δ�.
 function zoomOut() {
 	scaleFont(-1);
 	return;
 	if (nowZoom > minZoom) {
 		nowZoom -= 10; // 10%�� �۾����.
 	} else {
 		return;
 	}

 	document.body.style.zoom = nowZoom + "%";
 }
 var fontSize = 13;
 function scaleFont(val) {

     var fontSizeSave = fontSize;
 	
     if (val > 0) {
         if (fontSize <= 20) {
             fontSize = fontSize + val; 
         }
     } else {
         if (fontSize > 10) {
             fontSize = fontSize + val; 
         }
     }
     if (fontSize != fontSizeSave) {
         drawFont(fontSize);
     }
     //set_cookie("ck_fontsize", fontSize, 30); 
 }


 function drawFont(fontSize) {
//     if (!fontSize) {
//         fontSize = getFontSize();
//     }
 	var con_font = document.getElementById("right");
 	con_fonts = con_font.getElementsByTagName("li");
 	for(i = 0; i < con_fonts.length; i++) {
 		con_fonts.item(i).style.fontSize = fontSize + "px";
 	}
 	con_fonts = con_font.getElementsByTagName("dd");
 	for(i = 0; i < con_fonts.length; i++) {
 		con_fonts.item(i).style.fontSize = fontSize + "px";
 	}
 	con_fonts = con_font.getElementsByTagName("p");
 	for(i = 0; i < con_fonts.length; i++) {
 		con_fonts.item(i).style.fontSize = fontSize + "px";
 	}
 	con_fonts = con_font.getElementsByTagName("th");
 	for(i = 0; i < con_fonts.length; i++) {
 		con_fonts.item(i).style.fontSize = fontSize + "px";
 	}
 	con_fonts = con_font.getElementsByTagName("td");
 	for(i = 0; i < con_fonts.length; i++) {
 		con_fonts.item(i).style.fontSize = fontSize + "px";
 	}
 	con_fonts = con_font.getElementsByTagName("label");
 	for(i = 0; i < con_fonts.length; i++) {
 		con_fonts.item(i).style.fontSize = fontSize + "px";
 	}

 	con_fonts = con_font.getElementsByTagName("textarea");
 	for(i = 0; i < con_fonts.length; i++) {
 		con_fonts.item(i).style.fontSize = fontSize + "px";
 	}

 }

/* IE HTML rewrite */
function IE_HtmlRewrite(objParent) {
	if (window.ActiveXObject && objParent) {
		objParent.innerHTML = objParent.innerHTML;
	}
}

// ��Ű �Է�
function set_cookie(name, value, expirehours, domain) {
	var today = new Date();
	today.setTime(today.getTime() + (60*60*1000*expirehours));
	document.cookie = name + "=" + escape( value ) + "; path=/; expires=" + today.toGMTString() + ";";
	if (domain) {
		document.cookie += "domain=" + domain + ";";
	}
}

// ��Ű ����
function get_cookie(name) {
	var find_sw = false;
	var start, end;
	var i = 0;

	for (i=0; i<= document.cookie.length; i++) {
		start = i;
		end = start + name.length;

		if(document.cookie.substring(start, end) == name) {
			find_sw = true
			break
		}
	}

	if (find_sw == true) {
		start = end + 1;
		end = document.cookie.indexOf(";", start);

		if(end < start)
			end = document.cookie.length;

		return document.cookie.substring(start, end);
	}
	return "";
}

// ��Ű ����
function delete_cookie(name) {
	var today = new Date();

	today.setTime(today.getTime() - 1);
	var value = get_cookie(name);
	if(value != "")
		document.cookie = name + "=" + value + "; path=/; expires=" + today.toGMTString();
}


//IE WebFont
var IE_WebFont_Boolean = true;
if(get_cookie("wf_toggle")=="F"){
	IE_WebFont_Boolean = false;
}

function webFont(){
	
	var webfontbtn = document.getElementById("WebFontBtn");
	var bodyObj = document.getElementsByTagName("body");
	var body = bodyObj[0];

	if(IE_WebFont_Boolean){
		set_cookie("wf_toggle","T",365*24);	
		body.style.fontFamily = 'wooriSaebom,Dotum,AppleGothic,sans-serif';
		webfontbtn.src = "/images/common/btn_webfont.gif";
		webfontbtn.alt = "����Ʈ ����";
		IE_WebFont_Boolean = false;
	}else{
		set_cookie("wf_toggle","F",365*24);	
		body.style.fontFamily = 'Dotum,AppleGothic,sans-serif';
		webfontbtn.src = "/images/common/btn_webfont_on.gif";
		webfontbtn.alt = "����Ʈ ���";
		IE_WebFont_Boolean = true;
	}
}

if(!get_cookie("wf_toggle")){
	set_cookie("wf_toggle","T",365*24);	
}

//Q&A
var showmenu = "";//�ʱ� ��� ����
function menuclick(faq){
    if( showmenu != faq ) {//showmenu�� ��� id ���ڿ��� ��ũ��Ʈ ����ÿ� ��� privacy�� ��
  if( showmenu !="" ) {//showmenu�� ����� �ƴϸ� showmenu�� �ش��ϴ� id�� display="none"
   eval(document.getElementById(showmenu)).style.display = "none";
  }
  eval(document.getElementById(faq)).style.display = "block"; //Ŭ���� privacy�� display="block"
  showmenu = faq;//����� Ŭ���� submenu id�� ����ش�
    } else {
        eval(document.getElementById(faq)).style.display = 'none';
        showmenu = ""; //��� �ʱ�ȭ, ���� �޴��� Ŭ����������ε�..
    }
}

	 /** quick menu **/
function initMoving(target) {
	if (!target)
		return false;

	var obj = target;
	obj.initTop = 0;
	obj.initLeft = 910;
	obj.bottomLimit = document.documentElement.scrollHeight - 580;
	obj.topLimit = 0;

	obj.style.position = "absolute";
	obj.top = obj.initTop;
	obj.left = obj.initLeft;
	obj.style.top = obj.top + "px";
	obj.style.left = obj.left + "px";

	obj.getTop = function() {
		if (document.documentElement.scrollTop) {
			return document.documentElement.scrollTop;
		} else if (window.pageYOffset) {
			return window.pageYOffset;
		} else {
			return -75;
		}
	}
	obj.getHeight = function() {
		if (self.innerHeight) {
			return self.innerHeight;
		} else if(document.documentElement.clientHeight) {
			return document.documentElement.clientHeight;
		} else {
			return 900;
		}
	}
	obj.move = setInterval(function() {
		pos = obj.getTop() + obj.getHeight() / 5 - 15;

		if (pos > obj.bottomLimit)
			pos = obj.bottomLimit
		if (pos < obj.topLimit)
			pos = obj.topLimit

		interval = obj.top - pos;
		obj.top = obj.top - interval / 5;
		obj.style.top = obj.top + "px";
	}, 40)
}

	/* ��ü�޴� */
	//<!--
	function onView(){
		var objDiv=document.getElementById("nx_svclist");
		if(objDiv.style.display=="none"){
			objDiv.style.display="block";
		}else{
			objDiv.style.display="none";
		}
	}
	
	function onView01(){
		var objDiv=document.getElementById("site_pop");
		if(objDiv.style.display=="none"){
			objDiv.style.display="block";
		}else{
			objDiv.style.display="none";
		}
	}
/* �̹��� �Ѹ� */
	 var popup_timer = null;
	 var popup_delay_time = 4000;
	 var popup_pause = false;
	 var popup_button_pause = false;
	 var select_popup_num = 1;
	 var popup_object_num = 4;
	 function popup_open(url, target, width, height){
	 if( url == '') return ;
	 window.open(url, target, 'width='+width+',height='+height);
	 }
	
	 function popup_display(popupIDX, move) {
	 if(!popupIDX) {
	 popupIDX = select_popup_num;
	 if(popup_pause==false && !move) return;
	 if(popup_button_pause==false && !move) return;
	 if(!move) move = 'next';
	 hide_popup(popupIDX);
	 }else{
	 hide_popup(select_popup_num);
	 }
	 if(move=='prev') {
	 if(popupIDX==1) {
	 popupIDX = popup_object_num;
	 } else {
	 popupIDX--;
	 }
	 } else if(move=='next') {
	 if(popupIDX==popup_object_num) {
	 popupIDX = 1;
	 } else {
	 popupIDX++;
	 }
	
	 }
	 show_popup(popupIDX);
	 select_popup_num = popupIDX;
	 }
	
	 function hide_popup(num) {
	 document.getElementById("popupzoneImage" + num).style.display = 'none';
	 document.getElementById("popupzoneNumber" + num).src = '/images/h01_rilcs/num_' + num + '_off.gif';
	 }
	
	 function show_popup(num) {
	 document.getElementById("popupzoneImage" + num).style.display = 'block';
	 document.getElementById("popupzoneNumber" + num).src = '/images/h01_rilcs/num_' + num + '_on.gif';
	 }
	 function popup_scroll() {
	 popup_timer = setInterval("popup_display()",popup_delay_time);
	 }
	
	 popup_scroll();


/* GIS */
function openGisSearch(x,y,name){
	var win = window.open("http://gis.junggu.seoul.kr/tour/index.php?x="+x+"&y="+y+"&sName="+name, "SearchMap", "width=1000px; height=768px; scrollbars=yes;");
	if(win) win.focus();				
}
/* VR */
function openVrLink(vrLink){
	var win = window.open("http://tournew.junggu.seoul.kr/tour/vr/vrPlayer.jsp?vrLink="+vrLink, "vrLink", "width=635px; height=480px; scrollbars=no;");
	if(win) win.focus();				
}

/* photogallery*/
function openPhotoGallery(link){
	var win = window.open("http://tournew.junggu.seoul.kr"+link, "PhotoGallery", "toolbar=no,location=no,directories=no,status=no,scrollbars=no,resizeable=no,copyhistory=no,menubar=no,fullscreen=yes");
	if(win) win.focus();				
}

