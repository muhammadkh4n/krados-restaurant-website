$(document).ready(function() {
  var welcome = $("#welcome");
  var about = $("#about");
  var mission = $("#mission");
  var specials = $("#specials");
  var contact = $("#contact");
  var menu = $("#menu");

  var links = $(".nav.navbar-nav li");

  function removeActive(element) {
    element.each(function() {
      $(this).removeClass("active");
    });
  }

  // Get position of the top border of element.
  function getPosition(element) {
    return element.position().top;
  }

  var clicked = false;
  function scrolltoSection(element, position, e) {
    e.preventDefault();
    clicked = true;
    $("body, html").animate({ scrollTop: position }, 500, function() {
      clicked = false;
    });
    removeActive(links);
    $(element).parent().addClass("active");
  }

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

  $("#krados-tab").click(function(e){
    e.preventDefault();
    $("#krados").addClass("active");
    $("#krados-grill").removeClass("active");
    $(".nav-tabs a[href='#krados']").parent().addClass("active");
    $(".nav-tabs a[href='#krados-grill']").parent().removeClass("active");
  });

  $("#krados-grill-tab").click(function(e){
    e.preventDefault();
    $("#krados-grill").addClass("active");
    $("#krados").removeClass("active");
    $(".nav-tabs a[href='#krados-grill']").parent().addClass("active");
    $(".nav-tabs a[href='#krados']").parent().removeClass("active");
  });

  $(window).on('scroll', function(e) {
    e.preventDefault();
    var pos = $(this).scrollTop();

    if (!clicked) {
      if (pos < 100); {
        removeActive(links);
        $("#welcome-a").addClass("active");
      }
      if (pos > getPosition(specials) - 200) {
        removeActive(links);
        $("#specials-a").addClass("active");
      }
      if (pos > getPosition(about) - 200) {
        removeActive(links);
        $("#about-a").addClass("active");
      }
      if (pos > getPosition(mission) - 200) {
        removeActive(links);
        $("#about-a").addClass("active");
      }
      if (pos > getPosition(menu) - 200) {
        removeActive(links);
        $("#menu-a").addClass("active");
      }
      if (pos > getPosition(contact) - 200) {
        removeActive(links);
        $("#contact-a").addClass("active");
      }
    }

  });
});
