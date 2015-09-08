$(window).scroll( function(){
    $('.fadeIn').each(function(i) {
        var bottom_of_object = $(this).offset().top + $(this).outerHeight() - 200 ;
        var bottom_of_window = $(window).scrollTop() + $(window).height();
        var result = (bottom_of_object - bottom_of_window) ;
        if( result < 0 ){
            var j = i%3 ;
            $(this).delay((j++) * 300).animate({'opacity':'1'},1000);
        }
    });
});
