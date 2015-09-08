if($("#nav-toggle").length > 0){
  document.querySelector( "#nav-toggle" )
    .addEventListener( "click", function() {
      $('#nav-toggle').toggleClass( 'active' );
      $('.fullNavOverlay').toggleClass( 'full-active' );

    $('.fullNavOverlay a').click(function() {
      $('#nav-toggle').removeClass( "active" )
      $('.fullNavOverlay').removeClass( "full-active" );
    });
  });
}
