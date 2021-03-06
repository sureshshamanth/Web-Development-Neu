<!DOCTYPE html>
<html>
<head>
    <title>Draggable directions</title>
    <!-- Bootstrap -->
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="assets/css/bootstrap-responsive.css" rel="stylesheet">
    <link href="//netdna.bootstrapcdn.com/bootswatch/3.0.2/spacelab/bootstrap.min.css"
        rel="stylesheet">
    <style>
        html, body
        {
            height: 100%;
        }
        #wrapper
        {
            margin: 0 auto;
            width: 75%;
        }
        #header
        {
            width: auto;
            padding: 10px;
            border: 2px solid Black;
            color: #74C2E1;
            height: auto;
            background: #005B9A;
            text-align: center;
            font-size: xx-large;
        }
        
        option
        {
            /* Whatever color  you want */
            background-color: #005B9A;
        }
        #leftcolumn
        {
            color: #333;
            border: 2px solid Black;
            background: #005B9A;
            padding: 10px;
            height: 480px;
            width: 200px;
            float: left;
        }
        
        
        #map-canvas
        {
            height: 500px;
            width: auto;
        }
        
        #panel
        {
            float: left;
            height: auto;
            background-color: #74C2E1;
            padding: 5px;
            color: #005B9A;
        }
        
        #directionsPanel
        {
            width: auto;
            height: 300px;
            overflow: scroll;
            padding: 5px;
            background-color: #74C2E1;
            color: #74C2E1;
        }
        
        
        #footer
        {
            width: auto;
            clear: both;
            color: #333;
            border: 2px solid Black;
            background: #005B9A;
            padding: 10px;
            color: #74C2E1;
        }
    </style>
    <script src="http://maps.googleapis.com/maps/api/js?key=AIzaSyCv-p8ZXLnylxoEndQhj854AVSGe6MGDaI&sensor=false">
    </script>
</head>
  <body> 
  <div class="jumbotron">
  <div class="container">
  <div class="page-header">
  <h2>Geolocations for Brooklyn Museum<small> Google Maps API</small></h2>
</div>
<ul class="nav nav-pills nav-justified">
    <li><a href="ProjectHomeBootstrap.aspx">Home</a></li>
  <li class="active">
    <a href="Maps_experiment1.aspx">Visit</a>
  </li>
  <li><a href="ProjectSearchPage.aspx">Search</a></li>
   <li><a href="ProjectCommentsPage.aspx">Feedback</a></li>
  <li><a href="ProjectTickets.aspx">Tickets</a></li>
</ul>
      <div class="row">
          <div class="col-sm-3">
              <div class="panel panel-primary">
                  <div class="panel-heading">
                      <h3 class="panel-title">
                          Preferences</h3>
                  </div>
                  <div class="panel-body">
                      <div class="btn-group">
                          <a class="btn btn-primary" data-toggle="dropdown" href="#">Mode of Travel <span class="caret">
                          </span></a>
                          <ul class="dropdown-menu">
                              <!-- dropdown menu links -->
                              <li><a onclick="calcRoute('DRIVING')" href="#">Driving</a></li>
                              <li><a onclick="calcRoute('WALKING')" href="#">Walking</a></li>
                              <li><a onclick="calcRoute('BICYCLING')" href="#">Bicycling</a></li>
                              <li><a onclick="calcRoute('TRANSIT')" href="#">Transit</a></li>
                          </ul>
                      </div>
                      <h3>Click on any of our locations:</h3>
                      <a onclick="codeAddress('1000 Jefferson Dr., SW Washington, DC')" href="#">Smithsonian
                          Castle</a> </br> <a onclick="codeAddress('950 Independence Ave., SW')" href="#">African
                              Art Museum</a> </br> <a onclick="codeAddress('8th and F Streets, N.W. Washington, D.C. 20004')"
                                  href="#">American Art Museum</a> </br> <a onclick="codeAddress('17th St. at Pennsylvania Ave., NW')"
                                      href="#">Renwick Gallery</a>
                  </div>
              </div>
      </div>
      <div class="col-sm-9">
                         <div class="panel panel-primary">
                            <div class="panel-heading">
                              <h3 class="panel-title">Map</h3>
                            </div>
                              <div id="map-canvas">
                              </div>
                          </div>
            </div>         
    </div> 
        <div class="panel panel-primary">
        <div class="panel-heading">
            Detailed Directions</div>
        <div id="directionsPanel">
        </div>
    </div>
    <div id="footer">
        Powered by Google Maps
    </div>
    </div>
    </div>
        <script src="http://code.jquery.com/jquery.js"></script>
    <script src="js/bootstrap.js"></script>
    <script>


        var geocoder;

        var mode = 'DRIVING';

        var destination = 'Smithsonian Institution, Jefferson Drive Southwest, Washington, D.C., DC';

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

            destination = address;
            pos = 'Smithsonian Institution, Jefferson Drive Southwest, Washington, D.C., DC';
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

    </script>
  </body>
</html>