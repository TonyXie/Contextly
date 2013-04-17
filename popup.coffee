$(document).ready ->
$(document).ready ->

  # Prendez la page de background
  bkg = chrome.extension.getBackgroundPage()

  # Changez le value de la bois de texte
  $("#elementSelectedText").val("h1")

  # append class to selected element
  $('#changeElement').click (e) -> 
    e.preventDefault(); 
    element = $("#elementSelectedText").val()
    changeClass = $("#class-list").val()
    bkg.test()
    bkg.changeFont("raleway", "h1")
    bkg.changeElement(element, changeClass)