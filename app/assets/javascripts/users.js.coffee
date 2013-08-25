# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


# $("#cool").click -> $.ajax
# 	url: '/users/new'
# .done (html) ->
# 	$('#results').append html
# 	console.log "cool clicked"


$(document).ready ->
  $(".send_sms").on("ajax:success", (e, data, status, xhr) ->
    $(".alert-box").append xhr.responseText
  ).bind "ajax:error", (e, xhr, status, error) ->
    $(".alert-box").append "<p>Something's gone wrong</p>"