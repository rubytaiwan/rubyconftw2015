document.querySelector( "#nav-toggle" )
  .addEventListener( "click", function() {
    this.classList.toggle( "active" );
    if ($('#nav-toggle').hasClass( "active" )) {
      $('.fullNavOverlay').addClass('navbar-fade-in');
      $('.fullNavOverlay').css({
        top: '0',
        left: '0',
        transform: 'rotate(0deg)',
        zIndex: '5'
      });
      $(".fullNavOverlay ul li a").dequeue("fadeIn");
    }
    else {
      $('.fullNavOverlay').removeClass('navbar-fade-in');
      $('.fullNavOverlay').addClass('navbar-fade-out');
      $('.fullNavOverlay').css({
          top: '-100%',
          left: '100%',
          transform: 'rotate(15deg)',
          zIndex: '0'
        });
    }
    $('.fullNavOverlay a').click(function() {
        $('#nav-toggle').removeClass('active');
        $('.fullNavOverlay').removeClass('navbar-fade-in');
        $('.fullNavOverlay').addClass('navbar-fade-out');
        $('.fullNavOverlay').css({
            top: '-100%',
            left: '100%',
            transform: 'rotate(15deg)',
            zIndex: '0'
          });
    });
  });

