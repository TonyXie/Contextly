// Generated by CoffeeScript 1.4.0
(function() {
  var LinkedList, addElementToDiv, changeFont, changeTagName, commandList, wrapElement;

  LinkedList = (function() {

    function LinkedList() {}

    (function() {
      return this._head = null;
    });

    LinkedList.prototype.add = function(element, method, tagName) {
      var current, node;
      node = {
        element: element,
        method: method,
        tagName: tagName,
        next: null
      };
      current = this._head || (this._head = node);
      if (this._head !== node) {
        while (current.next) {
          current = current.next;
        }
        current.next = node;
      }
      return this;
    };

    LinkedList.prototype.item = function(index) {
      var current, i;
      if (index < 0) {
        return null;
      }
      current = this._head || null;
      i = -1;
      while (current && index > (i += 1)) {
        current = current.next;
      }
      return current && current.data;
    };

    LinkedList.prototype.pop = function() {
      var current, data, prev;
      current = this._head;
      while (current.next !== null) {
        prev = current;
        current = current.next;
      }
      data = current;
      if (prev != null) {
        prev.next = null;
      } else {
        this._head = null;
      }
      return data;
    };

    LinkedList.prototype.remove = function(index) {
      var current, i, previous, _ref;
      if (index < 0) {
        return null;
      }
      current = this._head || null;
      i = -1;
      if (index === 0) {
        this._head = current.next;
      } else {
        while (index > (i += 1)) {
          _ref = [current, current.next], previous = _ref[0], current = _ref[1];
        }
        previous.next = current.next;
      }
      return current && current.data;
    };

    LinkedList.prototype.size = function() {
      var count, current;
      current = this._head;
      count = 0;
      while (current) {
        count += 1;
        current = current.next;
      }
      return count;
    };

    LinkedList.prototype.toArray = function() {
      var current, result;
      result = [];
      current = this._head;
      while (current) {
        result.push(current.data);
        current = current.next;
      }
      return result;
    };

    LinkedList.prototype.toString = function() {
      return this.toArray().toString();
    };

    return LinkedList;

  })();

  commandList = new LinkedList;

  $(document).ready(function() {
    $('body').prepend('\
     <div id="draggableFlash" class="hide alert alert-success" style="\
    z-index: 10000000;\
    position: fixed;\
    left: 41%;\
    top: 2%;\
    width: 200px;\
      ">\
      <a class="close" id= "closeMyFlash" href="#">×</a>\
      <p>Element made draggable</p>\
    </div>\
    ');
    $('body').prepend('\
     <div id="changeFontFlash" class="hide alert alert-success" style="\
    z-index: 10000000;\
    position: fixed;\
    left: 41%;\
    top: 2%;\
    width: 200px;\
      ">\
      <a class="close" id= "closeMyFlash" href="#">×</a>\
      <p>Font changed</p>\
    </div>\
    ');
    $('body').prepend('\
     <div id="wrapClassFlash" class="hide alert alert-success" style="\
    z-index: 10000000;\
    position: fixed;\
    left: 41%;\
    top: 2%;\
    width: 230px;\
      ">\
      <a class="close" id= "closeMyFlash" href="#">×</a>\
      <p>Element wrapped in specified div</p>\
    </div>\
    ');
    $('body').prepend('\
     <div id="addToClassFlash" class="hide alert alert-success" style="\
    z-index: 10000000;\
    position: fixed;\
    left: 41%;\
    top: 2%;\
    width: 230px;\
      ">\
      <a class="close" id= "closeMyFlash" href="#">×</a>\
      <p>Element added to specified div</p>\
    </div>\
    ');
    $('body').prepend('\
     <div id="changeTagNameFlash" class="hide alert alert-success" style="\
    z-index: 10000000;\
    position: fixed;\
    left: 41%;\
    top: 2%;\
    width: 200px;\
      ">\
      <a class="close" id= "closeMyFlash" href="#">×</a>\
      <p>Element\'s tagName changed</p>\
    </div>\
    ');
    $('body').prepend('\
     <div id="modifyClassFlash" class="hide alert alert-success" style="\
    z-index: 10000000;\
    position: fixed;\
    left: 41%;\
    top: 2%;\
    width: 200px;\
      ">\
      <a class="close" id= "closeMyFlash" href="#">×</a>\
      <p>Class changed</p>\
    </div>\
    ');
    $('body').prepend('\
     <div id="resizableFlash" class="hide alert alert-success" style="\
    z-index: 10000000;\
    position: fixed;\
    left: 41%;\
    top: 2%;\
    width: 200px;\
      ">\
      <a class="close" id= "closeMyFlash" href="#">×</a>\
      <p>Element made resizable</p>\
    </div>\
    ');
    $('body').prepend('\
     <div id="revertFlash" class="hide alert alert-success" style="\
    z-index: 10000000;\
    position: fixed;\
    left: 41%;\
    top: 2%;\
    width: 200px;\
      ">\
      <a class="close" id= "closeMyFlash" href="#">×</a>\
      <p>Change reverted</p>\
    </div>\
    ');
    $('body').prepend('\
     <div id="failRevertFlash" class="hide alert alert-error" style="\
    z-index: 10000000;\
    position: fixed;\
    left: 41%;\
    top: 2%;\
    width: 200px;\
      ">\
      <a class="close" id= "closeMyFlash" href="#">×</a>\
      <p>No changes to revert</p>\
    </div>\
    ');
    $('body').append('\
      <!-- Modal -->\
      <div id="fontModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">\
        <div class="modal-header">\
          <h3 id="myModalLabel">Change font</h3>\
        </div>\
        <div class="modal-body">\
          <select name="font-list" id="font-list">\
            <option value="Raleway">Raleway</option>\
            <option value="Gabriela"> Gabriela </option>\
            <option value="Abril+Fatface">Abril Fatface</option>\
            <option value="Gentium+Book+Basic">Gentium Book Basic</option>\
            <option value="Gravitas+One">Gravitas One</option>\
            <option value="Lato">Lato</option>\
            <option value="Merriweather">Merriweather</option>\
            <option value="Old+Standard+TT">Old Standard TT</option>\
            <option value="Open+Sans">Open Sans</option>\
            <option value="Playfair+Display">Playfair Display</option>\
            <option value="PT+Sans">PT Sans</option>\
            <option value="PT+Sans+Narrow">PT Sans Narrow</option>\
            <option value="PT+Serif">PT Serif</option>\
            <option value="Vollkorn">Vollkorn</option>\
          </select>\
        <textarea name="Tony" id="changeFontSize" cols="1" rows="1">Current font size:</textarea>\
        <input id="fontColor" class="color" value="000000" >\
        </div>\
        <div class="modal-footer">\
          <button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>\
          <button id="fontChange" class="btn btn-primary" data-dismiss="modal">Save changes</button>\
        </div>\
      </div>  \
    ');
    $('body').append('\
      <!-- Modal -->\
      <div id="helpModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">\
        <div class="modal-header">\
          <h3 id="myModalLabel">Help Menu</h3>\
        </div>\
        <div class="modal-body">\
          <p>Help menu: Shift + H</p>\
          <p>Change font-styles: Shift + F</p>\
          <p>Wrap element with class: Shift + W</p>\
          <p>Change tagName: Shift + T</p>\
          <p>Make element draggable: Shift + D</p>\
          <p>Add element to existing div: Shift + A</p>\
          <p>Choose element to make resizable: Shift + R</p>\
          <p>Modify existing class: Shift + M</p>\
          <p>Undo last change: Shift + X</p>\
        </div>\
        <div class="modal-footer">\
          <button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>\
        </div>\
      </div>  \
    ');
    $('body').append('\
      <!-- Modal -->\
      <div id="wrapElementModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">\
        <div class="modal-header">\
          <h3 id="myModalLabel">Wrap Element Menu</h3>\
        </div>\
        <div class="modal-body">\
          <b style="font-size: 50px">.</b><textarea name="Tony" id="wrapElememtArea" cols="1" rows="1">Wrap element class:</textarea>\
        </div>\
        <div class="modal-footer">\
          <button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>\
          <button id="wrapElement" class="btn btn-primary" data-dismiss="modal" >Save changes</button>\
        </div>\
      </div>  \
    ');
    $('body').append('\
      <!-- Modal -->\
      <div id="changeTagNameModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">\
        <div class="modal-header">\
          <h3 id="myModalLabel">Change tagName</h3>\
        </div>\
        <div class="modal-body">\
          <textarea name="Tony" id="changeTagNameArea" cols="1" rows="1">change tagName to:</textarea>\
        </div>\
        <div class="modal-footer">\
          <button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>\
          <button id="changeTagNameSubmit" class="btn btn-primary" data-dismiss="modal" >Save changes</button>\
        </div>\
      </div>  \
    ');
    $('body').append('\
      <!-- Modal -->\
      <div id="addElementToDivModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">\
        <div class="modal-header">\
          <h3 id="myModalLabel">Add Element to Existing Class</h3>\
        </div>\
        <div class="modal-body">\
          <b style="font-size: 50px">.</b><textarea name="Tony" id="addElementToDivArea" cols="1" rows="1">Choose div to add element to:</textarea>\
        </div>\
        <div class="modal-footer">\
          <button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>\
          <button id="addElementToDiv" class="btn btn-primary" data-dismiss="modal" >Save changes</button>\
        </div>\
      </div>  \
    ');
    $('body').append('\
      <!-- Modal -->\
      <div id="resizableModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">\
        <div class="modal-header">\
          <h3 id="myModalLabel">Make Class resizable</h3>\
        </div>\
        <div class="modal-body">\
          <b style="font-size: 50px">.</b><textarea name="Tony" id="resizableClassArea" cols="1" rows="1">Choose class to make resizable:</textarea>\
        </div>\
        <div class="modal-footer">\
          <button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>\
          <button id="makeResizable" class="btn btn-primary" data-dismiss="modal" >Save changes</button>\
        </div>\
      </div>  \
    ');
    $('body').append('\
      <!-- Modal -->\
      <div id="modifyClassModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">\
        <div class="modal-header">\
          <h3 id="myModalLabel">Change class things</h3>\
        </div>\
        <div class="modal-body">\
          <b style="font-size: 50px">.</b><textarea name="Tony" id="modifyClassArea" cols="1" rows="1">Choose class</textarea>\
            <textarea name="Tony" id="modifyClassBackgroundColor" cols="1" rows="1">Background color?</textarea>\
            <textarea name="Tony" id="modifyClassAreaHeight" cols="1" rows="1">Height</textarea>\
            <textarea name="Tony" id="modifyClassAreaWidth" cols="1" rows="1">Width</textarea>\
        </div>\
        <div class="modal-footer">\
          <button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>\
          <button id="modifyClass" class="btn btn-primary" data-dismiss="modal" >Save changes</button>\
        </div>\
      </div>  \
    ');
    $(document).bind('keypress', function(e) {
      var action, currFontSize, currTagName, element, method, tagName;
      if (event.shiftKey && event.which === 72) {
        $("#helpModal").modal();
      }
      if (event.shiftKey && event.which === 70) {
        currFontSize = $('.clicked').css('font-size');
        $("#changeFontSize").val(currFontSize);
        $("#fontModal").modal();
      }
      if (event.shiftKey && event.which === 87) {
        $('#wrapElementModal').modal();
      }
      if (event.shiftKey && event.which === 84) {
        currTagName = $('.clicked').prop('tagName').toLowerCase();
        $('#changeTagNameArea').val(currTagName);
        $("#changeTagNameModal").modal();
      }
      if (event.shiftKey && event.which === 68) {
        $('#draggableFlash').fadeIn(1500, function() {
          return $('#draggableFlash').fadeOut();
        });
        $('.clicked').draggable({
          grid: [50, 50],
          disabled: false,
          stop: function() {
            return $(this).draggable('disable');
          },
          opacity: 1
        });
        commandList.add($('.clicked'));
        console.log(commandList);
      }
      if (event.shiftKey && event.which === 65) {
        $('#addElementToDivModal').modal();
      }
      if (event.shiftKey && event.which === 82) {
        $('#resizableModal').modal();
      }
      if (event.shiftKey && event.which === 77) {
        $("#modifyClassModal").modal();
      }
      if (event.shiftKey && event.which === 90) {
        if (commandList.size() > 0) {
          $('#revertFlash').fadeIn(1500, function() {
            return $(this).fadeOut();
          });
          action = commandList.pop();
          element = action.element;
          method = action.method;
          tagName = action.tagName;
          if (method === "changeTagName") {
            alert(element);
            alert(method);
            alert(tagName);
            alert($(element).prop('tagName'));
            $(element).replaceWith(function() {
              return $("<" + tagName + " />").append($(element).contents());
            });
          } else {
            $(element).removeAttr('style');
          }
        } else {
          $('#failRevertFlash').fadeIn(1500, function() {
            return $(this).fadeOut();
          });
        }
        return console.log(commandList);
      }
    });
    chrome.extension.onMessage.addListener(function(request, sender, sendResponse) {
      var changeClass, changeTag, element, text;
      if (request.action === "loadBootstrap") {
        $("head").append("          <link href='//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.1/css/bootstrap-combined.min.css' rel='stylesheet'>        ");
        $('body').wrap('<div class="container" />');
      }
      if (request.action === "changeElement") {
        element = $('.clicked');
        changeClass = request.changeClass;
        if (changeClass === "navbar") {
          element.wrap('<div class="navbar" />');
          element.addClass('brand');
          element.wrap('<div class="navbar-inner" />');
          $(".navbar-inner").append('<ul class="nav pull-right sortable"></ul>');
        } else if (changeClass === "nav") {
          text = element.text();
          element.remove();
          $('ul.nav').append("<li><a href='#'>" + text + "</a></li>");
        } else if (changeClass === "addToHero") {
          $(".hero-unit").append(element);
        } else {
          element.wrap('<div class=' + '"' + changeClass + '"' + ' />');
        }
      }
      if (request.action === "changeTagName") {
        changeTag = request.changeTag;
        element = $('.clicked');
        element.replaceWith(function() {
          return $("<h2 />").append(element.contents());
        });
      }
      if (request.action === "changeFont") {
        return changeFont(request.font, request.fontSize, request.color);
      }
    });
    $('body').on('click', "#fontChange", function(e) {
      var color, font, fontSize;
      font = $('#font-list').val();
      fontSize = $("#changeFontSize").val();
      color = $("#fontColor").val();
      changeFont(font, fontSize, color);
      $("#changeFontFlash").fadeIn(1500, function() {
        return $(this).fadeOut();
      });
      commandList.add($('.clicked'));
      return console.log(commandList);
    });
    $('body').on('click', "#wrapElement", function(e) {
      var classToWrap;
      classToWrap = $('#wrapElememtArea').val();
      wrapElement(classToWrap);
      $('#wrapClassFlash').fadeIn(1500, function() {
        return $(this).fadeOut();
      });
      return commandList.add($('.clicked'));
    });
    $('body').on('click', "#changeTagNameSubmit", function(e) {
      var tagName;
      tagName = $('#changeTagNameArea').val();
      changeTagName(tagName);
      return commandList.add($('.clicked'), $('#changeTagNameFlash').fadeIn(1500, function() {
        return $(this).fadeOut();
      }));
    });
    $('body').on('click', '#closeMyFlash', function(e) {
      return $(this).fadeOut();
    });
    $('body').on('click', '#addElementToDiv', function(e) {
      var classToAdd;
      classToAdd = $('#addElementToDivArea').val();
      addElementToDiv(classToAdd);
      $('#addToClassFlash').fadeIn(1500, function() {
        return $(this).fadeOut();
      });
      return commandList.add($('.clicked'));
    });
    $('body').on('click', '#makeResizable', function(e) {
      var element;
      element = "." + $('#resizableClassArea').val();
      $(element).resizable();
      $('#resizableFlash').fadeIn(1500, function() {
        return $(this).fadeOut();
      });
      return commandList.add($('.clicked'));
    });
    $('body').on('click', "#modifyClass", function(e) {
      var background, element, height, width;
      element = "." + $('#modifyClassArea').val();
      background = $('#modifyClassBackgroundColor').val();
      height = $('#modifyClassAreaHeight').val();
      width = $('#modifyClassAreaWidth').val();
      $(element).css('background', background);
      $(element).css('height', height);
      $(element).css('width', width);
      $('#modifyClassFlash').fadeIn(1500, function() {
        return $(this).fadeOut();
      });
      return commandList.add($('.clicked'), 'tagName', $('.clicked').prop('tagName').toLowerCase());
    });
    return $('body').on("click", "h1, h2, h3, p, a, li", function(e) {
      var x;
      e.preventDefault();
      x = $(this);
      $('.clicked').css('background', 'none');
      $('.clicked').removeClass('clicked');
      x.addClass('clicked');
      x.css('background', 'rgb(255, 251, 204)');
      return chrome.extension.sendMessage({
        "tagName": x.prop("tagName").toLowerCase(),
        "fontSize": x.css("font-size")
      });
    });
  });

  changeFont = function(font, fontSize, color) {
    var element;
    font = font;
    element = $('.clicked');
    fontSize = fontSize;
    color = "#" + color;
    $("head").append("    <link href='http://fonts.googleapis.com/css?family=" + font + "' rel='stylesheet' type='text/css'>    ");
    font = font.split("+").join(" ");
    element.css('font-family', font);
    element.css('font-size', fontSize);
    return element.css('color', color);
  };

  wrapElement = function(wrapElement) {
    return $('.clicked').wrap('<div class=' + '"' + wrapElement + '"' + ' />');
  };

  changeTagName = function(tagName) {
    if (tagName != null) {
      return $('.clicked').replaceWith(function() {
        commandList.add($(this), "changeTagName", $('.clicked').prop('tagName').toLowerCase());
        return $("<" + tagName + " />").append($('.clicked').contents());
      });
    }
  };

  addElementToDiv = function(classToAdd) {
    var element;
    if (classToAdd != null) {
      classToAdd = "." + classToAdd;
      element = $('.clicked');
      return $(classToAdd).append(element);
    }
  };

}).call(this);
