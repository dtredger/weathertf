#http://diveintohtml5.info/geolocation.html
$(document).ready () ->

	get_location = ->
		# if (Modernizr.geolocation)
			navigator.geolocation.getCurrentPosition(loc_details, loc_error)
		# else
		# 	alert("no suppert??")
		# # no native support; maybe try a fallback?

	loc_details = (position) ->
		lat = position.coords.latitude
		lon = position.coords.longitude
		
		# post_location(lat, lon)
		print_map(lat, lon)

	print_map = (lat, lon) ->  L.map 'map',
		center: [lat, lon]
		zoom: 13

		$('#locate').append("<p>you're at #{lat}, #{lon}</p>")
		$('#user_lat').val(lat)
		$('#user_lon').val(lon)


	loc_error = (positionError) ->
		# if positionError == 1
		# 	$('#locate').append("You say no??")
		# 	#user said no to sharing!
		# else positionError ==2
		# 	$('#locate').append("mysterious error??")
		# 	#actual error

	post_location = (lat, lon) ->
		$.ajax
		    	url: '/users',
		    	type: "POST",
		    	data:
		            lat: lat,
		            lon: lon
            success: (resp) ->
	    		alert(resp)







	$("#find_location").click -> get_location()

	$("#signup").click -> get_location()


# $("#cool").click -> $.ajax
# 	url: '/users/new'
# .done (html) ->
# 	$('#locate').append html
# 	console.log "cool clicked"









	# cloudmade_api = $("#map").data("cloudmadekey")
	# L.tileLayer("http://{s}.tile.cloudmade.com/#{cloudmade_api}/997/256/{z}/{x}/{y}.png",
 #      	attribution: 'Map data &copy; <a href="http://openstreetmap.org">OpenStreetMap</a> contributors, <a href="http://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, Imagery © <a href="http://cloudmade.com">CloudMade</a>',
 #      	maxZoom: 18
 #      .addTo(map)



#   google maps api to convert lat/longitude to city name ??
#   https://developers.google.com/maps/documentation/geocoding/#GeocodingResponses
# limit 2500

# http://developer.mapquest.com/web/products/dev-services/geocoding-ws
# limit 5000

		# $.ajax({ url:'http://maps.googleapis.com/maps/api/geocode/json?latlng='+position.coords.latitude+','+position.coords.longitude+'&sensor=true',
		#            success: function(data){
		#            alert(data.results[4].formatted_address);

		#            }
		#            });



# ----------------------------------------
# as an alternative (more compatible) there is also:     geoPosition.js


# if (geoPosition.init())         # init returns true if geoPosition is possible
#     geoPosition.getCurrentPosition(geoSuccess, geoError)
