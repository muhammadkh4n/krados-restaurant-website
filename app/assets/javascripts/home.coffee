# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $("#specials-slider").lightSlider({
    item: 3
    autoWidth: false
    slideMove: 1 # slidemove will be 1 if loop is true
    slideMargin: 10

    addClass: ''
    mode: "slide"
    useCSS: true,
    cssEasing: 'ease' #'cubic-bezier(0.25, 0, 0.25, 1)',//
    easing: 'linear' #'for jquery animation',////

    speed: 400 #ms'
    auto: false
    pauseOnHover: false
    loop: false
    slideEndAnimation: true
    pause: 2000

    keyPress: false
    controls: true
    prevHtml: ''
    nextHtml: ''

    rtl:false
    adaptiveHeight:false

    vertical:false
    verticalHeight:500
    vThumbWidth:100

    thumbItem:10
    pager: true
    gallery: false
    galleryMargin: 5
    thumbMargin: 5
    currentPagerPosition: 'middle'

    enableTouch:true
    enableDrag:true
    freeMove:true
    swipeThreshold: 40

    responsive : [
      {
        breakpoint:988,
        settings: {
          item:2,
          slideMove:1,
          slideMargin:6,
        }
      },
      {
        breakpoint:630,
        settings: {
          item:1,
          slideMove:1
        }
      }
    ]})

  #AOS.init()

  $.fn.bootstrapDropdownHover({
    clickBehavior: 'disable',
    hideTimeout: 300
  })
