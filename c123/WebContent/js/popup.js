$(function(){
  
    var embed = $('.cont').html(); //동영상 코드
  
    $('.button').click(function(){ //레이어 열때
        var path = $(this).attr('href');
        $('.cont').html(embed);
        $(path).show();
        $('.dim').show();
    })
  
    $('.close').click( function(){ //레이어 닫을때
        $(this).parents('#layer').hide();
        $('.dim').hide();
        $('.cont').empty();
    })
  
  $('.dim').click( function(){
    $(this).hide();
    $('#layer').hide();
    $('.cont').empty();
  })
  
});