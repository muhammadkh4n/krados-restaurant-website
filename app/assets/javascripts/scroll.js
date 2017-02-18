$(document).ready(function() {
  if ($('.home-page').length) {
    var welcome = $("#welcome");
    var about = $("#about");
    var mission = $("#mission");
    var specials = $("#specials");
    var contact = $("#contact");
    var menu = $("#menu");

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
      scrolltoSection(this, getPosition(about) - 100, e);
    });

    $("#mission-a a").on('click', function(e) {
      var m = $("#about-a a");
      scrolltoSection(m, getPosition(mission) - 100, e);
    });

    $("#specials-a a").on('click', function(e) {
      scrolltoSection(this, getPosition(specials) - 100, e);
    });

    $("#contact-a a").on('click', function(e) {
      scrolltoSection(this, getPosition(contact) - 100, e);
    });

    $("#menu-a a").on('click', function(e) {
      scrolltoSection(this, getPosition(menu) - 100, e);
    });

    $("#menu-tabs a[data-toggle='tab']").click(function(e){
      e.preventDefault();
      var id = $(this).attr("href");
      $(".tab-pane").removeClass("in active");
      $(id).addClass("in active");
      $(".nav-tabs li").removeClass("active");
      $(".nav-tabs a[href='" + id + "']").parent().addClass("active");
      AOS.refresh()
    });

    $(window).on('scroll', function() {
      var pos = $(this).scrollTop();

      if (!clicked) {
        if (pos < 100); {
          removeActive(links);
          $("#welcome-a").addClass("active");
        }
        if (pos > getPosition(about) - 150 && pos < getPosition(specials) - 50) {
          removeActive(links);
          $("#about-a").addClass("active");
        }
        if (pos > getPosition(specials) - 150 && pos < getPosition(mission) - 50) {
          removeActive(links);
          $("#specials-a").addClass("active");
        }
        if (pos > getPosition(mission) - 150 && pos < getPosition(menu) - 50) {
          removeActive(links);
          $("#about-a").addClass("active");
        }
        if (pos > getPosition(menu) - 150 && pos < getPosition(contact) - 50) {
          removeActive(links);
          $("#menu-a").addClass("active");
        }
        if (pos > getPosition(contact) - 150) {
          removeActive(links);
          $("#contact-a").addClass("active");
        }
      }

    });
  }
});
