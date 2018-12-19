    //Calendar localization
    dhtmlxCalendarLangModules = new Array();//create array if it doesn't exist  
    //define settings for the new language (Korean)
    dhtmlxCalendarLangModules['ko'] = {
        langname: 'ko',
        dateformat: '%Y-%m-%d',
        monthesFNames: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
        monthesSNames: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
        daysFNames: ["일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일"],
        daysSNames: ["일", "월", "화", "수", "목", "금", "토"],
        weekend: [0, 6],
        weekstart: 0,
        msgClose: "닫기",
        msgMinimize: "최소화",
        msgToday: "오늘"
    }

        /*
     * Calendar 생성 및 초기화 
     * cal : 생성할 칼렌다 변수명
     * divId : 칼렌다 들어갈 DIV의 ID
     * initDate : 초기일자 (YYYY-MM-DD형식)
     * relInput : 관련 input의 ID
     * btnId : 관련 버튼 ID
     * !!! DHTMLXCalendar,jQuery와 같이 사용 되어야 한다.ㄴ
     */
    function l_newCalendarSet(cal, divId, initDate, inputId, btnId){

        //버튼 클릭시 처음 누를때 칼렌다 초기화 
        $("#"+btnId).one("click",function(){
            l_newCalendar(cal, divId, initDate, inputId, btnId);
            $(this).click();
        });
    }
    
            /*
     * Calendar 생성 및 초기화 
     * cal : 생성할 칼렌다 변수명
     * divId : 칼렌다 들어갈 DIV의 ID
     * initDate : 초기일자 (YYYY-MM-DD형식)
     * relInput : 관련 input의 ID
     * btnId : 관련 버튼 ID     
     * !!! DHTMLXCalendar,jQuery와 같이 사용 되어야 한다.ㄴ
     */
    function l_newCalendar(cal, divId, initDate, inputId, btnId){
        var t = new Date();
        var toYear = t.getFullYear();
        //초기일자 없거나 형식에 맞지 않으면 오늘로
        if(!/^(\d{4})-([0-1][0-9])-([0-3][0-9])$/.test(initDate)){
            initDate = toYear + "-" + (t.getMonth() + 1) + "-" + t.getDate();
        }
        var left = $('#'+inputId).offset().left;
        var top = $('#'+inputId).offset().top;
        $("#"+divId).css("left",left+"px"    );
        $("#"+divId).css("top" ,(top+20)+"px");

        cal = new dhtmlxCalendarObject(divId,false,{isYearEditable:true,isMonthEditable:true,yearsRange:[toYear-20,toYear]});
        cal.loadUserLanguage("ko");                                         //한글 로컬라이징
        cal.setFormatedDate("%Y-%m-%d", initDate);                          //초기값 set
        cal.setOnClickHandler(function(date){
            $("#" + inputId).val(cal.getFormatedDate("%Y-%m-%d", date));
            cal.hide();
        });                                                                 //onlick시 set
        //버튼 클릭시 칼렌다 토글
        $("#"+btnId).click(function(){
            //클릭시 입력한 일자로 셋팅
            var inputDate = $("#" + inputId).val();
            if(/^(\d{4})-([0-1][0-9])-([0-3][0-9])$/.test(inputDate)){
                cal.setFormatedDate("%Y-%m-%d", inputDate);  
            }
            //칼렌다 토글
            l_toggleCalendar(cal);
        });
  
        //마우스 벗어날때 달력 숨기기
        $("#"+divId).bind("mouseleave",function(){cal.hide();});
        return cal;
    }

    //calendar toggle
    function l_toggleCalendar(cal){
        if(cal.isVisible()){
                cal.hide();
            } else {
                cal.show();
            }
    }