$(document).ready () ->

	get_location = ->
		$('#find_location').addClass("secondary")
		$('#signup').addClass("secondary")
		navigator.geolocation.getCurrentPosition(loc_details, loc_error)

	loc_details = (position) ->
		lat = position.coords.latitude
		lon = position.coords.longitude
		#sets values to be inserted into the signup form
		$('#user_latitude').val(lat)
		$('#user_longitude').val(lon)
		$('.spinner').fadeOut(300)
		$('#find_location').removeClass("secondary")
		$('#signup').addClass("secondary")


		# post_location(lat, lon)
		# print_map(lat, lon)


	loc_error = (positionError) ->
		if positionError == 1
			$('#locate').append("You say no??")
			alert "you said no??"
			$('#find_location').removeClass("secondary")
			$('#signup').addClass("secondary")
			#user said no to sharing!
		if positionError == 2
			$('#locate').append("mysterious error??")
			#actual error
			alert "mysterious error..."
			$('#find_location').removeClass("secondary")
			$('#signup').addClass("secondary")
		else
			alert "something is askew..."
		


	$("#find_location").click -> get_location()



# ----------------------------------------
# as an alternative (more compatible) there is also:     geoPosition.js

# if (geoPosition.init())         # init returns true if geoPosition is possible
#     geoPosition.getCurrentPosition(geoSuccess, geoError)
