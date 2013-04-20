$(document).ready ->

  $(document).bind 'keypress', (e) ->

     # change font-size ( shift + J )
    if event.shiftKey and event.which is 74 
      fontsize = window.prompt("font-size?", "#{$('.clicked').css('font-size')}")

      # account for null 
      if fontsize? 
        $('.clicked').css('font-size', fontsize)

    # Wrap with class ( shift + W )
    if event.shiftKey and event.which is 87
      changeClass = window.prompt("What class to wrap with")

      if changeClass?
        $('.clicked').wrap('<div class=' + "'" + changeClass + "'" + '/>')

    # change tagName ( shift + T )
    if event.shiftKey and event.which is 84
      tagName = window.prompt("tagName?", "#{$('.clicked').prop('tagName').toLowerCase()}")

      if tagName?
        $('.clicked').replaceWith -> 
          $("<#{tagName} />").append $('.clicked').contents()

    # make something draggable to a 50 x 50 grid ( shift + D)
    if event.shiftKey and event.which is 68
      $('.clicked').draggable({
        grid: [50,50], 
        stop: -> 
          $(this).draggable('disable')
        })


   # message listener 
  chrome.extension.onMessage.addListener (request, sender, sendResponse) -> 
  
    # method for loading bootstrap into current page
    if request.action is "loadBootstrap"

      # inject bootstrap 
      $("head").append("
          <link href='//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.1/css/bootstrap-combined.min.css' rel='stylesheet'>
        ");

      # wrap body in container class 
      $('body').wrap('<div class="container" />')

    # method for adding wrapping parent nodes with specific classes
    if request.action is "changeElement"
      # get the clicked element
      element = $('.clicked')
      changeClass = request.changeClass

      # special case for navbar: have to add outer navbar then navbar-inner
      if changeClass is "navbar"

        # make the navbar
        element.wrap('<div class="navbar" />')
        element.addClass('brand')
        element.wrap('<div class="navbar-inner" />')

        # make the nav-items 
        $(".navbar-inner").append('<ul class="nav pull-right sortable"></ul>')

      else if changeClass is "nav"

        # get previous content of the element
        text = element.text()

        # remove the element 
        element.remove()

        # add item to pre-existing ul.nav
        $('ul.nav').append("<li><a href='#'>#{text}</a></li>")

      else if changeClass is "addToHero"
        # add element to hero-unit already existing 
        $(".hero-unit").append( element )

      else 
        # add wrapping div to selected element
        element.wrap('<div class=' + '"' + changeClass + '"' + ' />')

    # method for changing the tagName 
    if request.action is "changeTagName"
      changeTag = request.changeTag
      element = $('.clicked')

      # replace old tag with new tag while keeping the content 
      element.replaceWith -> 
        $("<h2 />").append element.contents()
  
    # method for changing the font 
    if request.action is "changeFont"
      # set local variables
      font = request.font 
      element = $('.clicked')
      fontSize= request.fontSize
      color = "#" + request.color

      # get css stylesheet from googlefonts
      $("head").append("
        <link href='http://fonts.googleapis.com/css?family=" + font + "' rel='stylesheet' type='text/css'>
        ");

      # some magicking to get right font-name 
      font = font.split("+").join(" ")
      element.css

      # change css of element
      element.css('font-family', font)

      # change font-size
      element.css('font-size', fontSize)

      # change color
      element.css('color', color)


  # get clicked tags
  $('body').on "click", "h1, h2, h3, p, a, li", (e) -> 

    # prevent default
    e.preventDefault()

    # get clicked element
    x = $(this)

    # remove background and class from previously clicked elements 
    $('.clicked').css('background', 'none')
    $('.clicked').removeClass('clicked')  

    # set background and class to highlight the clicked element
    x.addClass('clicked')
    x.css('background', 'rgb(255, 251, 204)')

    chrome.extension.sendMessage {
      # send information to background page
      "tagName": x.prop("tagName").toLowerCase()
      "fontSize": x.css("font-size")
    }
