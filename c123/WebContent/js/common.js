var pop = "";
var Common = {
    /**
     * 필드가 비어 있는 지 검사
     */
    isValue: function(str){
    	if (( str == null) || (str == "") || Common.isblank(str))
    		return false;
    	return true;
    },

    /**
     * 문자열에 공백 문자만 포함된 경우에는 true를 반환하는 유틸리티 함수
     */
    isblank: function(str) {
    	for(var i = 0; i < str.length ; i++ ){
    		var c = str.charAt(i);
    		if ( (c != ' ') && (c != '\n') && (c != '\et')) {
    			return false;
    		}
    	}
    	return true;
    },
    /**
    * 문자열 길이가 제한수를 넘지 않으면 true를 반환
    */
    chkByteLen: function(field, maxlimit) {

    	var str = $("#"+field).val();
        var len = 0;
        var intMax = 0;
        var onechar;

        for(var i=0; i<str.length; i++) {
            len += (str.charCodeAt(i) > 128) ? 3 : 1;
            onechar = str.charAt(i);

            if(escape(onechar)=='%0A') {
                len++;
            }
            if (intMax == 0 && len > maxlimit){
                intMax = i;
            }
        }

        if (len > maxlimit) {
            alert("최대 " + maxlimit + "byte 이므로 초과된 글자수는 자동으로 삭제됩니다.");
            $("#"+field).attr("value", str.substring(0, intMax-1));
            len = maxlimit;
            return false;
        }

        return true;
    },
      
    /**
     * 문자열 길이가 제한수를 넘지 않으면 true를 반환
     */
     chkByteLen2: function(field, maxlimit) {

     	var str = $("#"+field).val();
         var len = 0;
         var intMax = 0;
         var onechar;

         for(var i=0; i<str.length; i++) {
             len += (str.charCodeAt(i) > 128) ? 3 : 1;
             onechar = str.charAt(i);

             if(escape(onechar)=='%0A') {
                 len++;
             }
             if (intMax == 0 && len > maxlimit){
                 intMax = i;
             }
         }

         if (len > maxlimit) {
             return false;
         }

         return true;
     },   
     
     
     
    /**
     * 정규식(Regular Expression)을 사용한 앞뒤 트림임다.
     */
    trim: function(str) {
    	 regExp = /([^\s*$]?)(\s*$)/;
    	 newStr = str.replace(regExp, "$1");
    	 regExp = /(^\s*)(.+)/;
    	 newStr = newStr.replace(regExp, "$2");

    	 return newStr;
     },
     /**
      * 파일 확장자 체크.
      * @param {checkExt} 허용하는 확장자 (eg. jpg|gif|bmp|...)
      */
     checkExt: function(str, checkExt) {

    	 if(str == "") return true;

    	 var dotIndex = str.lastIndexOf(".");
    	 var ext = str.substring(dotIndex+1).toLowerCase();
    	 var pattern = eval("/^(" + checkExt.toLowerCase() + "){1}$/");

    	 return (ext.search(pattern) != -1);
     },
     /**
     * 로그인 체크(메세지 포함, 세션키존재시:true)
     * @param {redirct url, sessionKey}
     */
     checkLogin : function(webserver, from_url, sessionKey) {

    	 var bRtn = false;

    	 if(sessionKey == "") {

    		 if(confirm("로그인 후 사용이 가능합니다.\n\n로그인 하시겠습니까?"))
    			 location.href = webserver+"/kr/site/login/loginForm.do?from_url="+escape(from_url);
    	 }
    	 else
    		 bRtn = true;

    	 return bRtn;
     }
};

var POPUP = {
	    open: function(url, popname, options) {
	var width = options.width;
	var height = options.height;
	var top = (screen.height - height) / 2 - 50;
	var left = (screen.width - width) / 2;
	var scroll = options.scroll;
	var resize = options.resize;
	var properties = 'width=' + width + ',height=' + height + ',top=' + top + ',left=' + left;
	properties += scroll && scroll === true ? ",scrollbars=yes" : "";
	properties += resize && resize === true ? ",resizable=yes" : "";
	pop = window.open(url, popname, properties);
	pop.focus();
	},
	openDong: function(url, popname, options) {
		var width = options.width;
		var height = options.height;
		var top = (screen.height - height) / 2 - 150;
		var left = (screen.width - width) / 2+100;
		var scroll = options.scroll;
		var resize = options.resize;
		var properties = 'width=' + width + ',height=' + height + ',top=' + top + ',left=' + left;
		properties += scroll && scroll === true ? ",scrollbars=yes" : "";
		properties += resize && resize === true ? ",resizable=yes" : "";
		var pop = window.open(url, popname, properties);
		pop.focus();
	},
	reload: function() {
		location.reload();
	},
	reloadAndClose: function() {
		opener.location.reload();
		self.close();
	},
	close: function() {
		self.close();
	},
	
	// by mhlee. post 방식
	openPost: function(frm, url, popname, options) {
		var width = options.width;
		var height = options.height;
		var top = (screen.height - height) / 2 - 50;
		var left = (screen.width - width) / 2;
		var scroll = options.scroll;
		var resize = options.resize;
		var status = options.status;
		var properties = 'width=' + width + ',height=' + height + ',top=' + top + ',left=' + left ;
		properties += scroll && scroll === true ? ",scrollbars=yes" : "";
		properties += resize && resize === true ? ",resizable=yes" : "";
		properties += status && status === true ? ",status=yes" : "";
		pop = window.open("", popname, properties);
		//pop.focus();
		
		frm.method = "post";
		frm.action = url;
		frm.target = popname;
		frm.submit();
	},
	
	// by mhlee, get/restrict
	openRestrict: function(url, popname, options) {
		var width = options.width;
		var height = options.height;
		var top = options.top;
		var left = option.left;
		var scroll = options.scroll;
		var resize = options.resize;
		var properties = 'width=' + width + ',height=' + height + ',top=' + top + ',left=' + left;
		properties += scroll && scroll === true ? ",scrollbars=yes" : "";
		properties += resize && resize === true ? ",resizable=yes" : "";
		pop = window.open(url, popname, properties);
		pop.focus();
	}	
}

var Check = {
    /**
     * 영문만 사용가능
     */
    english: function(str) {
    	var valid_reg = /[A-Za-z]/;
    	if ( valid_reg.test( str ) )
    	{
    		return true;
    	}

    	return false;
    },
    /**
     * 한글만 사용가능
     */
    korea: function(msg) {
    	re = /^[ㄱ-힣]*$/;

        if(re.test(msg)){
        	return true;
        }else{
        	return false;
        }
    },
    /**
     * 전화번호 유효성 체크
     */
    phone: function(num) {
    	var tels = num.split('-');
    	if(tels.length == 2){
    		num = '02-' + num;
    		tels = num.split('-');
    	}

    	var valid_reg = /^[0-9]{1,}\-[0-9]{1,}\-[0-9]{1,}$/
    	if ( !valid_reg.test( num ) )
    	{
    		return false;
    	}

    	if(tels[1].length > 4 || tels[2].length != 4)
    		return false;

    	return true;
    },
    /**
     * E-mail 체크
     */
    email: function(strMail) {
        var check1 = /(@.*@)|(\.\.)|(@\.)|(\.@)|(^\.)/;

        var check2 = /^[a-zA-Z0-9\-\.\_]+\@[a-zA-Z0-9\-\.]+\.([a-zA-Z]{2,4})$/;

        if ( !check1.test(strMail) && check2.test(strMail) ) {
            return true;
        } else {
            return false;
        }
    },
    /**
     * 숫자 체크
     */
    number: function(msg) {
    	re = /^[0-9]*$/;

        if(re.test(msg)){
        	return true;
        }else{
        	return false;
        }
    },
    /**
     * 영문소문자숫자 체크
     */
    engandnumber: function(msg) {
    	re = /^[a-z0-9]*$/;

        if(re.test(msg)){
        	return true;
        }else{
        	return false;
        }
    },
    /**
     * 영문대소문자숫자 체크
     */
    engandnumber2: function(msg) {
    	re = /^[a-zA-Z0-9]*$/;

        if(re.test(msg)){
        	return true;
        }else{
        	return false;
        }
    },
    /**
     * 영문대소문자숫자_-. 체크
     */
    engandnumber3: function(msg) {
    	re = /^[a-zA-Z0-9$_$.$-]*$/;

        if(re.test(msg)){
        	return true;
        }else{
        	return false;
        }
    },
    /**
    * 영문대소문자숫자_-./ 체크
    */
   engandnumber4: function(msg) {
   	re = /^[a-zA-Z0-9$_$.$\/$-]*$/;

       if(re.test(msg)){
       	return true;
       }else{
       	return false;
       }
   }
};

/**
* CheckBox 컨트롤 및 밸리데이션
*/
var CheckBox = {

	/**
	* CheckBox 전체선택/전체해제 컨트롤
	* @param {chkBoxId}	전체선택용 체크박스 Id
	* @param {chkListId}다중체크박스 Id
	* @param {btnSpnId}	전체선택용 버튼 Span Id
	*/
	allCheck: function(chkBoxId, chkListId, btnSpnId) {

		if($("#"+chkBoxId).is(':checked')) {
			$("input:checkbox[id="+chkListId+"]").each(function() {
				$(this).attr("checked", true);
			});
			if(btnSpnId != "")
				$("#"+btnSpnId).find("a").html("전체해제");
		}
		else {
			$("input:checkbox[id="+chkListId+"]").each(function() {
				$(this).attr("checked", false);
			});
			if(btnSpnId != "")
				$("#"+btnSpnId).find("a").html("전체선택");
		}
	},
	/**
	* CheckBox 전체선택/전체해제 컨트롤
	* @param {chkBoxId}	전체선택용 체크박스 Id
	* @param {chkListId}다중체크박스 Id
	* @param {btnSpnId}	전체선택용 버튼 Span Id
	*/
	allCheckName: function(chkBoxId, chkListId, btnSpnId) {

		if($("#"+chkBoxId).is(':checked')) {
			$("input:checkbox[name="+chkListId+"]").each(function() {
				$(this).attr("checked", true);
			});
			if(btnSpnId != "")
				$("#"+btnSpnId).find("a").html("전체해제");
		}
		else {
			$("input:checkbox[name="+chkListId+"]").each(function() {
				$(this).attr("checked", false);
			});
			if(btnSpnId != "")
				$("#"+btnSpnId).find("a").html("전체선택");
		}
	},
	/**
	* CheckBox 선택여부 판별(다중체크박스포함)
	* @param {chkBoxId} 체크박스 Id
	*/
	valChecked: function(chkBoxId) {

		if($("input:checkbox[id="+chkBoxId+"]:checked").length < 1)
			return false;
		else
			return true;
	},
	/**
	* CheckBox Multi Append
	* @param {divId} 	: 체크박스 그룹의 부모 div테그 Id
	* @param {chkBoxId} : 체크박스 Id
	* @param {labelName}: 체크박스 라벨명
	* @param {value}	: 체크박스 Value
	* @param {chkDiv} 	: 체크여부 (0:미체크/1:체크)
	*/
	append: function(divId, chkBoxId, labelName, value, chkDiv) {

		var htmlCheckBox= "";
		var strChecked	= "";

		if(chkDiv == 1)
			strChecked = "checked";

		htmlCheckBox += " <input type='checkbox' name='"+chkBoxId+"' id='"+chkBoxId+"' value='"+value+"' "+strChecked+" style='padding-bottom:5px;'/> "+labelName+"<br/>";

		return htmlCheckBox;

		/*
	    $("#"+divId).append(
        $(document.createElement("input")).attr({
                id		: chkBoxId
                ,name	: chkBoxId
                ,type	: "checkbox"
                ,value	: value
				,style	: "padding-bottom:5px;"
				,checked: chkDiv
        })).append(
             $(document.createElement('label')).attr({
            	 id		: "label"
        	}).text(" "+labelName)
		).append("<br/>");
	    */
	}
}

/**
* Dynamic Input 컨트롤
*/
var Input = {

	/**
	* Input Dynamic Append
	* @param {divId} 	: Append시킬 부모 노드의 Id
	* @param {inpType}	: Input Type (text, hidden..)
	* @param {inpId}	: Input Id
	* @param {inpName}	: Input Name
	* @param {inpValue}	: Input Value
	*/
	append: function(divId, inpType, inpId, inpName, inpValue) {

	    $("#"+divId).append(
        $(document.createElement("input")).attr({
                 id		: inpId
                ,name	: inpName
                ,type	: inpType
                ,value	: inpValue
        }));
	}
}

/**
* Dynamic SelectBox 컨트롤
*/
var selWidth=0;
var Select = {

	add : function(selId, keyValue, textValue) {

		var addOpt = document.createElement('option');
		var attWidth = (keyValue == "")? 50 : 30;
		var tmpWidth = (textValue.length * 11) + attWidth;

		if(selWidth < tmpWidth)
			selWidth = tmpWidth;

		addOpt.value = keyValue;
		addOpt.appendChild(document.createTextNode(textValue));

		$("#"+selId).css("width",selWidth);
		$("#"+selId).append(addOpt);
	},
	removeAll : function(selId) {
		$("#"+selId).find('option').each(function() {
			$(this).remove();
		});
	},
	removeUnit : function(selId) {
		$("#"+selId+" option:selected").remove();
	},
	length : function(selId) {
		var i = 0;
		$("#"+selId).find('option').each(function() {
			++i;
		});
		return i;
	}
}

/**
* 문자열 교체
* ex) str.replaceAll("a", "b") : "a"->"b"로 모두 교체
*/
String.prototype.replaceAll = replaceAll;
function replaceAll(strValue1, strValue2)
{
	var strTemp = ""+this;
	strTemp = strTemp.replace(new RegExp(strValue1, "g"), strValue2);
	return strTemp;
}

function setComma(str){
	var ch="";
	var j=1;
	var formatValue="";

	if(isNaN(str) == false){
		str = str + "";
	}
	len = str.length;

	for(var i=len; i>0; i--){
	    ch = str.substring(i-1, i);
	    formatValue = ch + formatValue;
	    if ((j%3) == 0 && i>1 ){
	    	formatValue=","+formatValue;
	    }
	    j++
	}

	return formatValue;
}

/**
 * @author Daegeun Kim (machone@machone.kr)
 */
$.fn.ajaxSubmit = function(options) {
	var self = $(this);
	$(this).attr("showerrors", "true");
	if (self.valid()) {
		var params = {};
		self.find("input[checked], input[type=text], input[type=hidden], input[type=password], option[selected], textarea") .each(function()
{var k = this.name || this.id || this.parentNode.name || this.parentNode.id;if (params[k]) {if ($.isArray(params[k]))
{params[k].push(this.value);} else {params[k] = [params[k], this.value];}} else {params[k] = this.value;}});
		$.post(self.attr("action") + "?callType=ajax", params, function(json) {
			if (options && $.isFunction(options.success)) {
				options.success.call(null, json);
			}
		}, "json");
	}
	return this;
}

if ($.datepicker) {
	$.datepicker.setDefaults({
		dateFormat: "yy.mm.dd",
		monthNames: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
		monthNamesShort: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
		dayNamesMin: ["일", "월", "화", "수", "목", "금", "토"],
		dayNamesShort: ["일", "월", "화", "수", "목", "금", "토"],
		showOn: 'button', buttonImage: "/kr/common/img/calendar/ic_calendar.gif", buttonImageOnly: true
	});

	$(function() {
		var options = null;
		try {
			options = datepickerOptions.call(null);
		} catch (e) {
		}
		if (options != null) {
			$("input.ui-calendar").datepicker(options);
		} else {
			$("input.ui-calendar").datepicker();
		}
	});
}

/**
* ajax - html 처리
*/
/*$.fn.ajaxSubmitHtml = function(options) {
	var self = $(this);
	$(this).attr("showerrors", "true");
	if (self.valid()) {
		var params = {};
		self.find("input[checked], input[type=text], input[type=hidden], input[type=password], option[selected], textarea") .each(function()
{var k = this.name || this.id || this.parentNode.name || this.parentNode.id;if (params[k]) {if ($.isArray(params[k]))
{params[k].push(this.value);} else {params[k] = [params[k], this.value];}} else {params[k] = this.value;}});
		$.post(self.attr("action") + "?callType=ajax", params, function(html) {
			if (options && $.isFunction(options.success)) {
				options.success.call(null, html);
			}
		}, "html");
	}
	return this;
}*/


function go_login_page(return_url){
    location.href = "../account/login.php?return_url=" + escape(return_url) + "";
}

function getOffsetTop2(obj){ return obj ? obj.offsetTop + getOffsetTop2(obj.offsetParent) : 0; }
function getOffsetLeft2(obj){ return obj ? obj.offsetLeft + getOffsetLeft2(obj.offsetParent) : 0; }

function showLayerDiv( hook, div_id, nLyrWidth, nLyrInt ){

	var oPrev = document.getElementById(div_id) ;
	var oBody = ( document.compatMode && document.compatMode!="BackCompat" ) ? document.documentElement : document.body  ;

	var nArrowInt = 0 ;
	var nHookLeft = getOffsetLeft2(hook) ;
	var nHookTop = getOffsetTop2(hook) ;

	if ( nHookLeft + nLyrWidth > oBody.scrollWidth )
	{

		nLyrLeft = oBody.scrollWidth - nLyrWidth - 5 ;
		//nArrowLeft = nHookLeft-nLyrLeft+nLyrInt+nArrowInt ;
	}else{

		nLyrLeft = nHookLeft+nLyrWidth ;
		//nArrowLeft = nArrowInt ;
	}

	nLyrTop = nHookTop + hook.clientHeight+nLyrInt ;

	oPrev.style.left = nLyrLeft + "px" ;
	oPrev.style.top = nLyrTop + "px" ;
	oPrev.style.display = "block" ;
}

function hideLayerDiv( div_id ){
	var oPrev = document.getElementById(div_id) ;
	oPrev.style.display = "none" ;

}



//숫자만 입력
function chkFilterKey(filter)
{
	if( filter )
	{
	 var sKey = String.fromCharCode(event.keyCode);
	 var re = new RegExp(filter);
			       
	 if(!re.test(sKey))
	 {
	   event.returnValue=false;
	
	   if(filter.match("0-9"))
	   {
	     if(event.keyCode > 95 && event.keyCode < 106)
	     {
	       event.returnValue=true;
	     }
	   }
	  }
	 }
	
	 if(event.keyCode == 8 || event.keyCode == 9 || event.keyCode == 13 || event.keyCode == 20 || event.keyCode == 17 || event.keyCode == 18){
	   event.returnValue=true;
	}
}
