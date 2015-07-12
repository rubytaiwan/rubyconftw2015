(function($){

	$.fn.fullNav = function(options) {

		var settings = {
			background: '#173E71',
			color: '#fff',
			linkPadding: '10px',
			fontSize: '3em',
			linkBackground: 'transparent',
			fontFamily: 'Tamil',
			hoverColor: '#fff',
			fade: true,
			closeContent: 'X'
		};

		$.extend( settings, options );
		var overlay = $('<div/>', {
		    class: 'fullNavOverlay'
		});
		var close = $('<div/>', {
			class: 'fullNavOverlayCloseBtn',
			html: settings.closeContent
		});

		// prepend to the body
		overlay.prependTo('body');

		// move this' html to overlay's html
		overlay.html(this.html());

		// Remove the template
		this.remove();

		overlay.prepend(close);

		// styling up
		$('.fullNavOverlay').css({
			position: 'fixed',
			top: '-90%',
			left: '60%',
			transform: 'rotate(15deg)',
			minHeight: '100%',
			width: '100%',
			background: settings.background,
			overflow: 'hidden',
			opcity:'0'
		});
		$('.fullNavOverlay').css('z-index', 0)


		$('.fullNavOverlay ul').css({
			listStyle: 'none',
			padding: 0,
			marginTop: '15px'
		});

		$('.fullNavOverlay ul li').css({

		});

		$('.fullNavOverlay ul li a').css({
			display: 'block',
			color: settings.color,
			padding: settings.linkPadding,
			textAlign: 'center',
			fontSize: settings.fontSize,
			fontFamily: settings.fontFamily,
			textDecoration: 'none',
			textTransform: 'uppercase'
		});

    // Hover
		$('.fullNavOverlay ul li a').hover(function(){
			$(this).css('color', settings.hoverColor);
		}, function(){
			$(this).css('color', settings.color);
		});

		// Close Button
		$('.fullNavOverlay .fullNavOverlayCloseBtn').css({
			fontFamily: settings.fontFamily,
			float: 'right',
			top: '0',
			right: '15px',
			color: settings.color,
			cursor: 'pointer',
			fontSize: '3em',
			clear: 'both',
			position: 'absolute'
		});

		$('.fullNavOverlay .fullNavOverlayCloseBtn').click(function() {
			if ( settings.fade ) {
				$(this).parent('.fullNavOverlay').removeClass('navbar-fade-in');
				$(this).parent('.fullNavOverlay').addClass('navbar-fade-out');
				$(this).parent('.fullNavOverlay').css({
						top: '-90%',
						left: '60%',
						transform: 'rotate(15deg)',
						zIndex: '0'
					});
			} else {
				$(this).parent('.fullNavOverlay').hide();
			}
		});

		//Each link
		$('.fullNavOverlay a').click(function() {
			if ( settings.fade ) {
				$('.fullNavOverlay').removeClass('navbar-fade-in');
				$('.fullNavOverlay').addClass('navbar-fade-out');
				$('.fullNavOverlay').css({
						top: '-90%',
						left: '60%',
						transform: 'rotate(15deg)',
						zIndex: '0'
					});
			} else {
				$(this).parent('.fullNavOverlay').hide();
			}
		});

		//
		// var t = 1000;
		// $('.fullNavOverlay ul li a').each( function(index) {
		//   $(this).delay(index*t*0.25).animate(
		//     {
		//       'letter-spacing':'10px',
		//       'padding-left':'75px',
		//       'opacity':'0.8'
		//     },
		//     t
		//   ).animate(
		//     {
		//       'letter-spacing':'1px',
		//       'padding-left':'50px',
		//       'opacity':'1'
		//     },
		//     0.5*t
		//   );
		// });

		var item = $(".fullNavOverlay > a") , time = 300;
    item.show();
    item.css("opacity",0);

    for(var i = 0 ; i <= 100 ; i +=10){
        (function(ind){ //use ind to protect variable "i",or it will always be 100
            $(".fullNavOverlay > a").queue("fadeIn",function(next){ //put all the process into queue
                item.css("opacity", ind/100  );
                setTimeout(next,time); //every 500 ms
            });
        })(i);
    }



		// Listen for data-showfullnav
		$('*[data-showfullnav]').each(function(){
			$(this).on('click', function(e) {
				e.preventDefault();
				if (settings.fade) {
					overlay.css({
						top: '0',
						left: '0',
						transform: 'rotate(0deg)',
						zIndex: '5'
					});
					overlay.addClass('navbar-fade-in');
					 $(".fullNavOverlay ul li a").dequeue("fadeIn"); //start to run items!
				} else {
					overlay.show();
				}
			});
		});
	};

})(jQuery);
