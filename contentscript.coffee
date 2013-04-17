$(document).ready ->

   # message listener 
  chrome.extension.onMessage.addListener (request, sender, sendResponse) -> 
    if request.action is "changeElement"
      # add wrapping div to selected element
      $(request.element).wrap('<div class=' + '"' + request.changeClass + '"' + ' />')


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