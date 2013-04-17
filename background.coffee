# variables for po


chrome.extension.onMessage.addListener (request, sender, sendResponse) -> 
  element = request.element

# interesting coffeescript idiom -- in order to get 
# function xyz instead of var xyz = function, you have to 
# bind the function to the window or this, which is 
# represented by @ in coffee. Took awhile =.=

@loadBootstrap = -> 
  chrome.tabs.getSelected null, (tab) ->
    chrome.tabs.sendMessage(tab.id, {action: "loadBootstrap"})

@changeFont = (element, font) ->
  chrome.tabs.getSelected null, (tab) ->
    chrome.tabs.sendMessage(tab.id, {action: "changeFont", element: element, font: font})

@changeColor = (element, color) ->
  chrome.tabs.getSelected null, (tab) ->
    chrome.tabs.sendMessage tab.id,
      action: "changeColor"
      element: element
      color: color

# method for add classes to element 
@changeElement = (element, changeClass)  -> 
  chrome.tabs.getSelected null, (tab) -> 
    chrome.tabs.sendMessage(tab.id, {action: "changeElement", element: element, changeClass: changeClass})