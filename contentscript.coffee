$(document).ready ->

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
      element = request.element
      changeClass = request.changeClass

      # special case for navbar: have to add outer navbar then navbar-inner
      if changeClass is "navbar"

        # make the navbar
        $(element).wrap('<div class="navbar" />')
        $(element).addClass('brand')
        $(element).wrap('<div class="navbar-inner" />')

        # make the nav-items 
        $(".navbar-inner").append('<ul class="nav"></ul>')

      else if changeClass is "nav"

        # get previous content of the element
        text = $(element).text()

        # remove the element 
        $(element).remove()

        # add item to pre-existing ul.nav
        $('ul.nav').append("<li><a href='#'>#{text}</a></li>")

      else 
        # add wrapping div to selected element
        $(element).wrap('<div class=' + '"' + changeClass + '"' + ' />')

    # method for changing the font 
    if request.action is "changeFont"
      # set local variables
      font = request.font 
      element = request.element
      fontSize= request.fontSize
      color = "#" + request.color

      # get css stylesheet from googlefonts
      $("head").append("
        <link href='http://fonts.googleapis.com/css?family=" + font + "' rel='stylesheet' type='text/css'>
        ");

      # some magicking to get right font-name 
      font = font.split("+").join(" ")
      $(element).css

      # change css of element
      $(element).css('font-family', font)

      # change font-size
      $(element).css('font-size', fontSize)

      # change color
      $(element).css('color', color)


  # get clicked tags
  $('h1, h2, h3, p, a').click (e) -> 

    # get clicked element
    x = $(this)

    chrome.extension.sendMessage {
      # send information to background page
      "element": $(this).prop("tagName").toLowerCase()
      "fontSize": $(this).css("font-size")
    }
    x = $(this)