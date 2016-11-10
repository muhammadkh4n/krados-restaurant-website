$(document).ready(function() {
  // slider menu
  if ($('.menu-slider').length) {
    var list = $('.menu-slider .menu-list');
    var initialPos = list.position().top;
    var pos = list.position().top;
    var startPos = $('#startPos').position().top;
    var endPos = $('#endPos').position().top;
    var menuSlider = setInterval(function() {
      pos -= 1;
      list.css({top: pos});
      if (endPos <= startPos) {
        list.css({top: initialPos});
        pos = initialPos;
        endPos = $('#endPos').position().top;
      }
      endPos--;
    }, 40);

    clearInterval(menuSlider);

    // fullscreen button
    $("#menu-full").click(function() {
      $('.menu-slider').fullScreen(true);
    });
  }
});
