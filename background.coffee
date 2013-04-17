chrome.extension.onMessage.addListener (request, sender, sendResponse) -> 
  element = request.element

test = () -> 
  alert "test"

changeFont = (font, element) ->
  chrome.tabs.getSelected null, (tab) ->
    chrome.tabs.sendMessage tab.id,
      action: "changeFont"
      font: font
      element: element

# method for add classes to element 
changeElement = (element, changeClass)  -> 
  alert 'changing element'
  chrome.tabs.getSelected null, (tab) -> 
    chrome.tabs.sendMessage(tab.id, {action: "changeElement", element: element, changeClass: changeClass})