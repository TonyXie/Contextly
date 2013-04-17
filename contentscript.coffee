$(document).ready ->

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

  # message listener 
  chrome.extension.onMessage.addListener (request, sender, sendResponse) -> 
    alert "got message"