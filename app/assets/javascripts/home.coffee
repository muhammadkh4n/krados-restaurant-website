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

  $.fn.bootstrapDropdownHover({
    clickBehavior: 'disable',
    hideTimeout: 300
  })

  $(".head-dishes button.uploadButton").on 'click', ->
    $(".head-dishes .inputfile").click()

  $(".head-dishes .inputfile").on 'change', (e) ->
    $(".menuForm").submit()


  AOS.init
    disable: 'mobile'
  setTimeout ->
    AOS.refresh()
  , 300

  $(".panorama").panorama_viewer
    repeat: false,              # The image will repeat when the user scroll reach the bounding box. The default value is false.
    direction: "horizontal",    # Let you define the direction of the scroll. Acceptable values are "horizontal" and "vertical". The default value is horizontal
    animationTime: 700,         # This allows you to set the easing time when the image is being dragged. Set this to 0 to make it instant. The default value is 700.
    easing: "ease-out",         # You can define the easing options here. This option accepts CSS easing options. Available options are "ease", "linear", "ease-in", "ease-out", "ease-in-out", and "cubic-bezier(...))". The default value is "ease-out".
    overlay: true

  image = $("#mission .image")
  img = image.find 'img'
  image_modal = $('#image-modal')
  image_html = image_modal.find "#image-html"
  img.click (e) ->
    e.preventDefault()
    html = $(this).parent().html()
    image_html.html(html)
    image_modal.modal('show')

  $("li.dropdown").mouseleave ->
    $(".navbar-nav li a").blur()

  # ADD SLIDEDOWN ANIMATION TO DROPDOWN //
  $('.dropdown').on 'show.bs.dropdown', ->
    $(this).find('.dropdown-menu').first().stop(true, true).slideDown(200)

  # ADD SLIDEUP ANIMATION TO DROPDOWN //
  $('.dropdown').on 'hide.bs.dropdown', ->
    $(this).find('.dropdown-menu').first().stop(true, true).slideUp(200)
