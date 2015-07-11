(function($){

	$.fn.fullNav = function(options) {

		var settings = {
			background: '#173E71',
			color: 'white',
			linkPadding: '10px',
			fontSize: '3em',
			linkBackground: 'transparent',
			fontFamily: 'Tamil',
			hoverColor: 'rgb(196, 196, 196)',
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
			marginTop: '130px'
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

		$('.fullNavOverlay ul li a').hover(function(){
			$(this).css('color', settings.hoverColor);
		}, function(){
			$(this).css('color', settings.color);
		});

		// Close Button
		$('.fullNavOverlay .fullNavOverlayCloseBtn').css({
			fontFamily: settings.fontFamily,
			float: 'right',
			top: '50px',
			right: '50px',
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
				$('.fullNavOverlay').fadeOut();
			} else {
				$(this).parent('.fullNavOverlay').hide();
			}
		});

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
				} else {
					overlay.show();
				}
			});
		});

	};

})(jQuery);
