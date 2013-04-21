$(document).ready ->

  # info flash messages 
  $('body').prepend('
     <div id="draggableFlash" class="hide alert alert-success" style="
    z-index: 1000;
    position: absolute;
    left: 41%;
    top: 2%;
    width: 200px;
">
      <a class="close" id= "closeMyFlash" href="#">×</a>
      <p>Element made draggable!</p>
    </div>
    ')

  # modal for changing font 
  $('body').append('
      <!-- Modal -->
      <div id="fontModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-header">
          <h3 id="myModalLabel">Change font</h3>
        </div>
        <div class="modal-body">
          <select name="font-list" id="font-list">
            <option value="Raleway">Raleway</option>
            <option value="Gabriela"> Gabriela </option>
            <option value="Abril+Fatface">Abril Fatface</option>
            <option value="Gentium+Book+Basic">Gentium Book Basic</option>
            <option value="Gravitas+One">Gravitas One</option>
            <option value="Lato">Lato</option>
            <option value="Merriweather">Merriweather</option>
            <option value="Old+Standard+TT">Old Standard TT</option>
            <option value="Open+Sans">Open Sans</option>
            <option value="Playfair+Display">Playfair Display</option>
            <option value="PT+Sans">PT Sans</option>
            <option value="PT+Sans+Narrow">PT Sans Narrow</option>
            <option value="PT+Serif">PT Serif</option>
            <option value="Vollkorn">Vollkorn</option>
          </select>
        <textarea name="Tony" id="changeFontSize" cols="1" rows="1">Current font size:</textarea>
        <input id="fontColor" class="color" value="000000" >
        </div>
        <div class="modal-footer">
          <button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
          <button id="fontChange" class="btn btn-primary" data-dismiss="modal">Save changes</button>
        </div>
      </div>  
    ')
  
  # Keyboard shortcuts modal
  $('body').append('
      <!-- Modal -->
      <div id="helpModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-header">
          <h3 id="myModalLabel">Help Menu</h3>
        </div>
        <div class="modal-body">
          <h3>Help menu: Shift + H</h3>
          <h3>Change font-styles: Shift + F</h3>
          <h3>Wrap element with class: Shift + W</h3>
          <h3>Change tagName: Shift + T</h3>
          <h3>Make element draggable: Shift + D</h3>
        </div>
        <div class="modal-footer">
          <button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
        </div>
      </div>  
    ')

  # wrap element in specified class modal
  $('body').append('
      <!-- Modal -->
      <div id="wrapElementModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-header">
          <h3 id="myModalLabel">Wrap Element Menu</h3>
        </div>
        <div class="modal-body">
          <textarea name="Tony" id="wrapElememtArea" cols="1" rows="1">Wrap element class:</textarea>
        </div>
        <div class="modal-footer">
          <button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
          <button id="wrapElement" class="btn btn-primary" data-dismiss="modal" >Save changes</button>
        </div>
      </div>  
    ')

  # change tagName modal
  $('body').append('
      <!-- Modal -->
      <div id="changeTagNameModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-header">
          <h3 id="myModalLabel">Change tagName</h3>
        </div>
        <div class="modal-body">
          <textarea name="Tony" id="changeTagNameArea" cols="1" rows="1">change tagName to:</textarea>
        </div>
        <div class="modal-footer">
          <button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
          <button id="changeTagName" class="btn btn-primary" data-dismiss="modal" >Save changes</button>
        </div>
      </div>  
    ')


  $(document).bind 'keypress', (e) ->

    # Display help menu
    if event.shiftKey and event.which is 72
      $("#helpModal").modal()

     # change font-size ( shift + F )
    if event.shiftKey and event.which is 70 
      # get current font-size 
      currFontSize = $('.clicked').css('font-size')
      $("#changeFontSize").val(currFontSize)
      $("#fontModal").modal()

    # Wrap with class ( shift + W )
    if event.shiftKey and event.which is 87
      $('#wrapElementModal').modal()

    # change tagName ( shift + T )
    if event.shiftKey and event.which is 84
      # fill in the modal with tagName of currently selected element
      currTagName = $('.clicked').prop('tagName').toLowerCase()
      $('#changeTagNameArea').val(currTagName)
      $("#changeTagNameModal").modal()

    # make something draggable to a 50 x 50 grid ( shift + D)
    if event.shiftKey and event.which is 68
      $('#draggableFlash').fadeIn 1500, -> 
        $('#draggableFlash').fadeOut()
      $('.clicked').draggable({
        grid: [50,50], 
        disabled: false,
        stop: -> 
          $(this).draggable('disable')
        })


   # message listener 
  chrome.extension.onMessage.addListener (request, sender, sendResponse) -> 
  
    # method for loading bootstrap into current page
    if request.action is "loadBootstrap"

      # inject bootstrap 
      $("head").append("
          <link href='//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.1/css/bootstrap-combined.min.css' rel='stylesheet'>
        ");

      # wrap body in container class 
      $('body').wrap('<div class="container" />')

    # method for adding wrapping parent nodes with specific classes
    if request.action is "changeElement"
      # get the clicked element
      element = $('.clicked')
      changeClass = request.changeClass

      # special case for navbar: have to add outer navbar then navbar-inner
      if changeClass is "navbar"

        # make the navbar
        element.wrap('<div class="navbar" />')
        element.addClass('brand')
        element.wrap('<div class="navbar-inner" />')

        # make the nav-items 
        $(".navbar-inner").append('<ul class="nav pull-right sortable"></ul>')

      else if changeClass is "nav"

        # get previous content of the element
        text = element.text()

        # remove the element 
        element.remove()

        # add item to pre-existing ul.nav
        $('ul.nav').append("<li><a href='#'>#{text}</a></li>")

      else if changeClass is "addToHero"
        # add element to hero-unit already existing 
        $(".hero-unit").append( element )

      else 
        # add wrapping div to selected element
        element.wrap('<div class=' + '"' + changeClass + '"' + ' />')

    # method for changing the tagName 
    if request.action is "changeTagName"
      changeTag = request.changeTag
      element = $('.clicked')

      # replace old tag with new tag while keeping the content 
      element.replaceWith -> 
        $("<h2 />").append element.contents()
  
    # method for changing the font 
    if request.action is "changeFont"
      changeFont(request.font, request.fontSize, request.color)

  # change font in modal
  $('body').on 'click', "#fontChange", (e) -> 
     # get font type
    font = $('#font-list').val()

    # get font size
    fontSize = $("#changeFontSize").val()

    # get color 
    color = $("#fontColor").val()

    # call changeFont
    changeFont(font, fontSize, color)

  # wrap element in modal 
  $('body').on 'click', "#wrapElement", (e) -> 
    # get element
    classToWrap = $('#wrapElememtArea').val()
    wrapElement classToWrap

  # change tagName in modal 
  $('body').on 'click', "#changeTagNameModal", (e) -> 
    # get tagName 
    tagName = $('#changeTagNameArea').val()
    changeTagName tagName

  # close flash
  $('body').on 'click', '#closeMyFlash', (e) -> 
    $('#draggableFlash').fadeOut()

  # get clicked tags
  $('body').on "click", "h1, h2, h3, p, a, li", (e) -> 

    # prevent default
    e.preventDefault()

    # get clicked element
    x = $(this)

    # remove background and class from previously clicked elements 
    $('.clicked').css('background', 'none')
    $('.clicked').removeClass('clicked')  

    # set background and class to highlight the clicked element
    x.addClass('clicked')
    x.css('background', 'rgb(255, 251, 204)')

    chrome.extension.sendMessage {
      # send information to background page
      "tagName": x.prop("tagName").toLowerCase()
      "fontSize": x.css("font-size")
    }

# method for changing the font 
changeFont = (font, fontSize, color) -> 
  # set local variables
  font = font 
  element = $('.clicked')
  fontSize= fontSize
  color = "#" + color

  # get css stylesheet from googlefonts
  $("head").append("
    <link href='http://fonts.googleapis.com/css?family=" + font + "' rel='stylesheet' type='text/css'>
    ");

  # some magicking to get right font-name 
  font = font.split("+").join(" ")

  # change css of element
  element.css('font-family', font)

  # change font-size
  element.css('font-size', fontSize)

  # change color
  element.css('color', color)

# method for wrapping elements in classes 
wrapElement = (wrapElement) -> 
  $('.clicked').wrap('<div class=' + '"' + wrapElement + '"' + ' />')

# method for changing the tagName of an element 
changeTagName = (tagName) -> 

  if tagName?
    $('.clicked').replaceWith -> 
      $("<#{tagName} />").append $('.clicked').contents()
