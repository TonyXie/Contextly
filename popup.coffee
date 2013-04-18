$(document).ready ->

  # load bootstrap onto page 
  $('#loadBootstrap').click (e) -> 
    e.preventDefault()
    bkg.loadBootstrap()

  # Prendez la page de background
  bkg = chrome.extension.getBackgroundPage()

  # Changez le value de la bois de texte
  # see if the user has clicked an element on the page
  $('#getPageElement').click (e) -> 
    popupVars = bkg.getpopupVars()
    if popupVars.element?
      $("#elementSelectedText").val(popupVars.element)
      $("#changeFontSize").val(popupVars.fontSize)
    else 
      $("#elementSelectedText").val("h1")
      $("#changeFontSize").val("15px")

  # append class to selected element
  $('#changeElement').click (e) -> 
    e.preventDefault()
    element = $("#elementSelectedText").val()
    changeClass = $("#class-list").val()
    bkg.changeElement(element, changeClass)

  # change the font
  $('#font-style').click (e) -> 
    e.preventDefault()

    # get font type
    font = $('#font-list').val()

    # get element
    element = $("#elementSelectedText").val()

    # get font size
    fontSize = $("#changeFontSize").val()

    # get color 
    color = $("#fontColor").val()

    bkg.changeFont(element, font, fontSize, color) 
