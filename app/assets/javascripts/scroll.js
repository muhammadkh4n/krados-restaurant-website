$(document).ready(function() {
  if ($('.home-page').length) {
    var welcome = $("#welcome");
    var about = $("#about");
    var mission = $("#mission");
    var specials = $("#specials");
    var contact = $("#contact");
    var menu = $("#menu");
    var offsetTop = 200;
    var offsetBottom = 50;
    var clickOffset = 100;

    var links = $(".nav.navbar-nav li");

    var removeActive = function (element) {
      element.each(function() {
        $(this).removeClass("active");
      });
    };

    // Get position of the top border of element.
    var getPosition = function (element) {
      return element.position().top;
    };

    var clicked = false;
    var scrolltoSection = function (element, position, e) {
      e.preventDefault();
      clicked = true;
      $("body, html").animate({ scrollTop: position }, 500, function() {
        clicked = false;
      });
      removeActive(links);
      $(element).parent().addClass("active");
    };

    $("#welcome-a").on('click', function(e) {
      scrolltoSection(this, 0, e);
    });

    $("#about-a a.main-link").on('click', function(e) {
      scrolltoSection(this, getPosition(about) - clickOffset, e);
    });

    $("#mission-a a").on('click', function(e) {
      var m = $("#about-a a");
      scrolltoSection(m, getPosition(mission) - clickOffset, e);
    });

    $("#specials-a a").on('click', function(e) {
      scrolltoSection(this, getPosition(specials) - clickOffset, e);
    });

    $("#contact-a a").on('click', function(e) {
      scrolltoSection(this, getPosition(contact) - clickOffset, e);
    });

    $("#menu-a a").on('click', function(e) {
      scrolltoSection(this, getPosition(menu) - clickOffset, e);
    });

    $("#menu-tabs a[data-toggle='tab']").click(function(e){
      e.preventDefault();
      var id = $(this).attr("href");
      $(".tab-pane").removeClass("in active");
      $(id).addClass("in active");
      $(".nav-tabs li").removeClass("active");
      $(".nav-tabs a[href='" + id + "']").parent().addClass("active");

      AOS.refresh();
    });

    $('a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
      AOS.refresh();
    });

    $(window).on('scroll', function() {
      var pos = $(this).scrollTop();

      if (!clicked) {
        if (pos < 100); {
          removeActive(links);
          $("#welcome-a").addClass("active");
        }
        if (pos > getPosition(about) - offsetTop && pos < getPosition(specials) - offsetBottom) {
          removeActive(links);
          $("#about-a").addClass("active");
        }
        if (pos > getPosition(specials) - offsetTop && pos < getPosition(mission) - offsetBottom) {
          removeActive(links);
          $("#specials-a").addClass("active");
        }
        if (pos > getPosition(mission) - offsetTop && pos < getPosition(menu) - offsetBottom) {
          removeActive(links);
          $("#about-a").addClass("active");
        }
        if (pos > getPosition(menu) - offsetTop && pos < getPosition(contact) - offsetBottom) {
          removeActive(links);
          $("#menu-a").addClass("active");
        }
        if (pos > getPosition(contact) - offsetTop) {
          removeActive(links);
          $("#contact-a").addClass("active");
        }
      }

    });
  }
});
