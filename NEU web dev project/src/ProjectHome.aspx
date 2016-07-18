<!DOCTYPE html>
<html>
<head>

<title>Museum Home Page</title>
<meta name='viewport' content='width=device-width' />

<link rel="stylesheet" type="text/css" media="screen" href="css/ProjectHome.css" />
<link rel="stylesheet" type="text/css" media="screen" href="css/photoslide.css" />
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
<script src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
<script src="http://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<script type="text/javascript" src="javascript/jquery.cycle.all.js"></script>
</head>
<body>
<div id="wrapper">
<div id="header" style="background-color:#005B9A;">
<h1 style="margin-bottom:0;">Museum Home Page</h1>
</div>
<div id="left">
<div id="panel">
    <b style="text-decoration">Mode of Travel: </b>
    <select id="mode" style="background-color: #005B9A; color: #74C2E1"; onchange="calcRoute();">
      <option value="DRIVING">Driving</option>
      <option value="WALKING">Walking</option>
      <option value="BICYCLING">Bicycling</option>
      <option value="TRANSIT">Transit</option>
    </select>
    <h3>Click on any of our locations mentioned below to get directions from the Smithsonian center :</h3>
      <a onclick="codeAddress('1000 Jefferson Dr., SW Washington, DC')"  href="#">Smithsonian Castle</a>
      </br>
       <a onclick="codeAddress('950 Independence Ave., SW')" href="#">African Art Museum</a>
       </br>
       <a onclick="codeAddress('8th and F Streets, N.W. Washington, D.C. 20004')"  href="#">American Art Museum</a>
        </br>
        <a onclick="codeAddress('17th St. at Pennsylvania Ave., NW')"  href="#">Renwick Gallery</a>
</div>
<div id="panel">
    <b style="text-decoration">Mode of Travel: </b>
    <select id="mode" style="background-color: #005B9A; color: #74C2E1"; onchange="calcRoute();">
      <option value="DRIVING">Driving</option>
      <option value="WALKING">Walking</option>
      <option value="BICYCLING">Bicycling</option>
      <option value="TRANSIT">Transit</option>
    </select>
    <h3>Click on any of our locations mentioned below to get directions from the Smithsonian center :</h3>
      <a onclick="codeAddress('1000 Jefferson Dr., SW Washington, DC')"  href="#">Smithsonian Castle</a>
      </br>
       <a onclick="codeAddress('950 Independence Ave., SW')" href="#">African Art Museum</a>
       </br>
       <a onclick="codeAddress('8th and F Streets, N.W. Washington, D.C. 20004')"  href="#">American Art Museum</a>
        </br>
        <a onclick="codeAddress('17th St. at Pennsylvania Ave., NW')"  href="#">Renwick Gallery</a>
        </br>
        <a onclick="codeAddress('17th St. at Pennsylvania Ave., NW')"  href="#">Renwick Gallery</a>
        </br>
        <a onclick="codeAddress('17th St. at Pennsylvania Ave., NW')"  href="#">Renwick Gallery</a>
        </br>
        <a onclick="codeAddress('17th St. at Pennsylvania Ave., NW')"  href="#">Renwick Gallery</a>

</div>
</div>
<div id="right">
<div id ="ContactInfo">
<h3> Contact Information:</h3>
</div>
</div>
<div id="content">
<div id = "navigation">
<ul>
    <li><a href="ProjectHome.aspx" target="_blank">Home</a></li>
    <li><a href="Maps_experiment1.aspx" target="_blank">Visit</a></li>
    <li><a href="source/" target="_blank">Source</a></li>
    <li><a href="search/" target="_blank">Search</a></li>
    <li><a href="searchtree/" target="_blank">SearchTree</a></li>
</ul>
</div>
<div id="slideshow">
		<ul id="nav">
			<li id="prev"><a href="#">Previous</a></li>
			<li id="next"><a href="#">Next</a></li>
		</ul>
	    <ul id="slides">
			<li><img src="images/museum9.jpg"/></li>
			<li><img src="images/museum8.jpg"/></li>
			<li><img src="images/museum7.jpg"/></li>
			<li><img src="images/museum6.jpg"/></li>
			<li><img src="images/museum10.jpg "/></li>
		</ul>
</div>
<div id="ParkingPanel">
Parking Information:
</br>
Line 1
Line 2Line 1
Line 2Line 1
Line 2Line 1
Line 2Line 1
Line 2Line 1
Line 2Line 1
Line 2Line 1
Line 2Line 1
Line 2Line 1
Line 2Line 1
Line 2Line 1
Line 2Line 1
Line 2
</div>
<div id="MuseumTimings">
<h3>Museum timings from a JSON response:</h3>
</br>
</div>
</div>
<div id="footer">
Hello Footer
</div>
</div>
<script>
    $(document).ready(function () {
        $("#slideshow").css("overflow", "hidden");
        $("ul#slides").cycle({
            fx: 'fade',
            pause: 1,
            prev: '#prev',
            next: '#next'
        });
        $("#slideshow").hover(function () {
            $("ul#nav").fadeIn();
        },
		function () {
		    $("ul#nav").fadeOut();
		});
});

var ide = 0;
$.getJSON("http://query.yahooapis.com/v1/public/yql",
  {
      q: "select * from json where url=\"http://www.brooklynmuseum.org/opencollection/api/?version=1&format=json&include_html_style_block=true&method=visit.getHours&api_key=mS3nIn2Ltx\"",
      format: "json"
  },
  function (data) {
      if (data) {
          while (ide < 7) {
              if (data.query.results.response.hours[ide].status == 'open') {
                  $("#MuseumTimings").append('<h4>' + data.query.results.response.hours[ide].name + '</h4>');
                  $("#MuseumTimings").append(data.query.results.response.hours[ide].status + ' From: ');
                  $("#MuseumTimings").append(data.query.results.response.hours[ide].start + ':00 to ');
                  $("#MuseumTimings").append(data.query.results.response.hours[ide].end + ':00' + '\n');
                  ide = ide + 1;
              }
              else {
                  $("#MuseumTimings").append('<h4>' + data.query.results.response.hours[ide].name + '</h4>');
                  $("#MuseumTimings").append(data.query.results.response.hours[ide].status + '\n');
                  ide = ide + 1;
              }
          }
      }
      else {
          alert('Failed ');
      }
  }
);

  $.getJSON("http://query.yahooapis.com/v1/public/yql",
  {
      q: "select * from json where url=\"https://www.brooklynmuseum.org/opencollection/api/?version=1&format=json&include_html_style_block=true&method=visit.getContactInfo&api_key=mS3nIn2Ltx\"",
      format: "json"
  },
  function (data) {
      if (data) {
          $("#ContactInfo").append('<h4>' + 'Phone: ' + data.query.results.response.contactinfo.phone + '</h4>');
          $("#ContactInfo").append('<h4>' + 'tty: ' + data.query.results.response.contactinfo.tty + '</h4>');
          $("#ContactInfo").append('<h4>' + 'Address: ' + data.query.results.response.contactinfo.address + '</h4>');
              }
      else {
          alert('Failed ');
      }
  }
);

</script>
</body>
</html>
