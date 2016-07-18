<!DOCTYPE html>
<html>
<head>
    <title>Museum Collections Page</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Bootstrap -->
    <link href="//netdna.bootstrapcdn.com/bootswatch/3.0.2/spacelab/bootstrap.min.css"
        rel="stylesheet">
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.0/jquery.min.js"></script>
    <script src="http://code.jquery.com/ui/1.10.0/jquery-ui.js"></script>
    <style>
        html, body
        {
            height: 100%;
        }
        #testHeight
        {
            height: 200px;
        }
    </style>
</head>
<body>
    <div class="jumbotron">
        <div class="container">
            <div class="page-header">
                <h1>
                    Brooklyn Museum Collections<small>New York</small></h1>
            </div>
            <ul class="nav nav-pills nav-justified">
                <li><a href="ProjectHomeBootstrap.aspx"><i class="icon-home icon-white"></i>Home</a></li>
                <li><a href="Maps_experiment1.aspx">Visit</a></li>
                <li><a href="ProjectSearchPage.aspx">Search</a></li>
                <li class="active"><a href="ProjectCollectionsPage.aspx">Collections</a></li>
                <li><a href="ProjectTickets.aspx">Tickets</a></li>
            </ul>
            <div class="row-fluid equalHeight4">
                <div class="col-lg-6">
                    <a href="#">
                        <img alt="" src="images/EuropenMuseum.jpg" />
                    </a>
                </div>
                <div class="col-lg-6">
                    <div class="thumbnail" id="testHeight">
                        <div class="caption">
                            <h3>
                                European Art</h3>
                        </div>
                    </div>
                </div>
            </div>
            </br>
            <div class="row-fluid equalHeight3">
                <div class="span6" style="margin: 0px; background-color: transparent; width: 50%;">
                    <a href="#">
                        <img alt="" src="images/asianMuseum1.jpg" />
                    </a>
                </div>
                <div class="span6" style="margin: 0px; background-color: transparent; width: 50%;">
                    <div class="thumbnail">
                        <div class="caption">
                            <h3>
                                Asian Art Brooklyn Museum</h3>
                            <p>
                                Asian Art</p>
                        </div>
                    </div>
                </div>
            </div>
            </br>
            <div class="row-fluid equalHeight5">
                <div class="span6" style="margin: 0px; background-color: transparent; width: 50%;">
                    <a href="#">
                        <img alt="" src="images/IslamMuseum.jpg" />
                    </a>
                </div>
                <div class="span6" style="margin: 0px; background-color: transparent; width: 50%;">
                    <div class="thumbnail">
                        <div class="caption">
                            <h3>
                                Islam Art Brooklyn Museum</h3>
                            <p>
                                Islam Art</p>
                        </div>
                    </div>
                </div>
            </div>
            </br>
            <div class="row-fluid equalHeight6">
                <div class="span6" style="margin: 0px; background-color: transparent; width: 50%;">
                    <a href="#">
                        <img alt="" src="images/modernArtMuseum.jpg" />
                    </a>
                </div>
                <div class="span6" style="margin: 0px; background-color: transparent; width: 50%;">
                    <div class="thumbnail">
                        <div class="caption">
                            <h3>
                                Modern Art Brooklyn Museum</h3>
                            <p>
                                Modern Art</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>