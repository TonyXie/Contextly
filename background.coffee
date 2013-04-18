# variables for popup to retrieve
popupVars = new Object() 

chrome.extension.onMessage.addListener (request, sender, sendResponse) -> 
  popupVars.element = request.element
  popupVars.fontSize = request.fontSize
  popupVars.tagName = request.tagName

# interesting coffeescript idiom -- in order to get 
# function xyz instead of var xyz = function, you have to 
# bind the function to the window or this, which is 
# represented by @ in coffee. Took awhile =.=

# load bootstrap
@loadBootstrap = -> 
  chrome.tabs.getSelected null, (tab) ->
    chrome.tabs.sendMessage(tab.id, {action: "loadBootstrap"})

# method for changing the font
@changeFont = (element, font, fontSize, color) ->
  chrome.tabs.getSelected null, (tab) ->
    chrome.tabs.sendMessage(tab.id, {
      action: "changeFont"
      element: element
      font: font
      fontSize: fontSize
      color: color
    })

# method for add classes to element 
@changeElement = (element, changeClass)  -> 
  chrome.tabs.getSelected null, (tab) -> 
    chrome.tabs.sendMessage(tab.id, {action: "changeElement", element: element, changeClass: changeClass})

# methods for popup.coffee to retrieve variables from this page
@getpopupVars = -> 
  popupVars