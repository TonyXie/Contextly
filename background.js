chrome.browserAction.onClicked.addListener(function(tab) {
  alert("To use Contextly, go to a localhost or file:/// url and press shift + H. \n\nIf you want to edit on a 'file:///' url then go to the 'chrome://extensions' url and toggle the 'Allow accesss to file urls' option underneath the Contextly extension");
});