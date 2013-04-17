$(document).ready ->

   # message listener 
  chrome.extension.onMessage.addListener (request, sender, sendResponse) -> 

    # method for loading bootstrap into current page
    if request.action is "loadBootstrap"

      # inject bootstrap 
      $("head").append("<link href='//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.1/css/bootstrap-combined.min.css' rel='stylesheet'>");

    # method for adding wrapping parent nodes with specific classes
    if request.action is "changeElement"

      # add wrapping div to selected element
      $(request.element).wrap('<div class=' + '"' + request.changeClass + '"' + ' />')

    # method for changing the font 
    if request.action is "changeFont"
      font = request.font 
      element = request.element

      # get css stylesheet from googlefonts
      $("head").append("<link href='http://fonts.googleapis.com/css?family=" + font + "' rel='stylesheet' type='text/css'>");

      # some magicking to get right font-name 
      font = font.split("+").join(" ")
      $(request.element).css

      # change css of element
      $(element).css('font-family', font)


  $('h1').click (e) -> 
    chrome.extension.sendMessage {
      # get tag name
      "element": "h1"
    }

  $('h2').click (e) -> 
    chrome.extension.sendMessage {
      # get tag name
      "element": "h2"
    }

  $('h3').click (e) -> 
    chrome.extension.sendMessage {
      # get tag name
      "element": "h3"
    }

  $('p').click (e) -> 
    chrome.extension.sendMessage {
      # get tag name
      "element": "p"
    }