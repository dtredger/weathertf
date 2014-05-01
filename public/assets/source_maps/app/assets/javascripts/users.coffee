# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


# $("#cool").click -> $.ajax
#   url: '/users/new'
# .done (html) ->
#   $('#results').append html
#   console.log "cool clicked"


$(document).ready ->
  $(".send_sms").on("ajax:success", (e, data, status, xhr) ->
    $(".alert-box").append xhr.responseText
  ).bind "ajax:error", (e, xhr, status, error) ->
    $(".alert-box").append "<p>Something's gone wrong</p>"

  opts = {
    lines: 17
    length: 0
    width: 30
    radius: 0
    corners: 0.4
    rotate: 0
    direction: 1
    color: '#000'
    speed: 1.2
    trail: 50
    shadow: false
    hwaccel: false
    className: 'spinner'
    zIndex: 2e9
    top: 'auto'
    left: 'auto'
  };
  target = document.getElementById('location_zone')
  $('#find_location').click ->
    spinner = new Spinner(opts).spin(target)
    # $('#location_zone').css("background-color", "black")

  # $('#settings').click -> 
  #   $.ajax(url: "/users/edit").done (html) ->
  #     $("#results").append html

# $(".login_button").addClass('disabled');

