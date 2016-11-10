$(document).ready(function() {
  // slider menu
  if ($('.menu-slider').length) {
    function slider(stopAtEnd) {
      var list = $('.menu-slider .menu-list');
      var initialPos = list.position().top;
      var pos = list.position().top;
      var startPos = $('#startPos').position().top;
      var endPos = $('#endPos').position().top;
      var interval = setInterval(function() {
        pos -= 1;
        list.css({top: pos});
        if (endPos <= startPos) {
          list.css({top: initialPos});
          pos = initialPos;
          endPos = $('#endPos').position().top;
          if (stopAtEnd)
            clearInterval(interval);
        }
        endPos--;
      }, 40);
      return interval;
    }

    var s = null;

    $('#menu-full').click(function () {
      $('.menu-slider').fullScreen(true);
      s = slider(false);
    });

    $('#menu-record').click(function () {
      $('.menu-slider').fullScreen(true);
      setTimeout(function () {
        clearInterval(s);
        s = slider(true);
      }, 5000);
    })
  }
});
