	    var geocoder;

        var mode = 'DRIVING';

        var destination = '200 Eastern Pkwy New York, NY 11238';

        var pos;

        var rendererOptions = {
            draggable: true
        };

        var directionsDisplay = new google.maps.DirectionsRenderer(rendererOptions); ;
        var directionsService = new google.maps.DirectionsService();
        var map;
        var map1;

        function initializer() {
            geocoder = new google.maps.Geocoder();

            var mapOptions = {
                zoom: 7,
                mapTypeId: google.maps.MapTypeId.ROADMAP
            };
            map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);


            // Try HTML5 geolocation

            if (navigator.geolocation) {

                navigator.geolocation.getCurrentPosition(function (position) {
                    pos = new google.maps.LatLng(position.coords.latitude,
                                       position.coords.longitude, showError);

                    var infowindow = new google.maps.InfoWindow({
                        map: map,
                        position: pos,
                        content: 'Your Here'
                    });

                    map.setCenter(pos);

                    calcRoute(mode);
                },
	function () {
	    handleNoGeolocation(true);
	});
            }
            else {
                // Browser doesn't support Geolocation
                handleNoGeolocation(false);
            }

            directionsDisplay.setMap(map);
            directionsDisplay.setPanel(document.getElementById('directionsPanel'));

            google.maps.event.addListener(directionsDisplay, 'directions_changed', function () {
                computeTotalDistance(directionsDisplay.directions);
            });

            geocoder = new google.maps.Geocoder();
        }


        function handleNoGeolocation(errorFlag) {
            if (errorFlag) {
                var content = 'Error: The Geolocation service failed.';
            } else {
                var content = 'Error: Your browser doesn\'t support geolocation.';
            }

            var options = {
                map: map,
                position: new google.maps.LatLng(60, 105),
                content: content
            };

            var infowindow = new google.maps.InfoWindow(options);
            map.setCenter(options.position);

        }


        function calcRoute(mode) {
            
    
            var request = {
                origin: window.pos,
                destination: window.destination,
                travelMode: google.maps.TravelMode[mode]
            };
            directionsService.route(request, function (response, status) {
                if (status == google.maps.DirectionsStatus.OK) {
                    directionsDisplay.setDirections(response);
                }
            });
        }

        function computeTotalDistance(result) {
            var total = 0;
            var myroute = result.routes[0];
            for (var i = 0; i < myroute.legs.length; i++) {
                total += myroute.legs[i].distance.value;
            }
            total = total / 1000.
            document.getElementById('total').innerHTML = total + ' km';
        }

        function codeAddress(address) {

            destination = '200 Eastern Pkwy New York, NY 11238';
            pos = address;
            geocoder.geocode({ 'address': address }, function (results, status) {
                if (status == google.maps.GeocoderStatus.OK) {
                    map.setCenter(results[0].geometry.location);
                    var marker = new google.maps.Marker({
                        map: map,
                        position: results[0].geometry.location
                    });

                    calcRoute(mode);

                    var infowindow1 = new google.maps.InfoWindow({
                        map: map,
                        position: pos,
                        content: 'This is your destination'
                    });


                } else {
                    alert('Geocode was not successful for the following reason: ' + status);
                }
            });
        }


        function showError(error) {
            switch (error.code) {
                case error.PERMISSION_DENIED:
                    x.innerHTML = "User denied the request for Geolocation."
                    break;
                case error.POSITION_UNAVAILABLE:
                    x.innerHTML = "Location information is unavailable."
                    break;
                case error.TIMEOUT:
                    x.innerHTML = "The request to get user location timed out."
                    break;
                case error.UNKNOWN_ERROR:
                    x.innerHTML = "An unknown error occurred."
                    break;
            }
        }


        google.maps.event.addDomListener(window, 'load', initializer);