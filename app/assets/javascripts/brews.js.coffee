# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery ->
	$(window).bind "load", ->
        $('#brews').masonry itemSelector: ".box"
jQuery ($) ->
  $("#beername").tooltip()

jQuery ($) ->
  $("#beerstory").tooltip()

jQuery ($) ->
  $("#brewday").tooltip()
