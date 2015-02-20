# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
	$('.post').hover (event) ->
		$(this).toggleClass('hover')


	$('#gallery-favorite-button').click (event) ->
		console.log("I've been clicked!!!")
		
	$('#posts').imagesLoaded ->
    $('#posts').masonry
      itemSelector: '.box' 
      columnWidth: 1
      isFitWidth: true