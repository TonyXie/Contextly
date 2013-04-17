$(document).ready ->

  # Prendez la page de background
  bkg = chrome.extension.getBackgroundPage()

  # Changez le value de la bois de texte
  $("#elementSelectedText").val("h1")

  # append class to selected element
  $('#changeElement').click (e) -> 
    e.preventDefault()
    element = $("#elementSelectedText").val()
    changeClass = $("#class-list").val()
    bkg.changeElement(element, changeClass)

  # change the font
  $('#font-style').click (e) -> 
    e.preventDefault()
    font = $('#font-list').val()
    element = $("#elementSelectedText").val()
    bkg.changeFont(element, font)
