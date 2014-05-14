# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


$(document).ready ->

  spin_opts = 
    lines: 10
    length: 0
    width: 40
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
  
  target = document.getElementById('location_zone')
  $('#find_location').click ->
    spinner = new Spinner(spin_opts).spin(target)
    # $('#location_zone').css("background-color", "black")

  # $('#settings').click -> 
  #   $.ajax(url: "/users/edit").done (html) ->
  #     $("#results").append html

# $(".login_button").addClass('disabled');

