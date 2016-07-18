<!DOCTYPE html>
<%@ Page Language="C#" EnableEventValidation="false" %>

<%@ Import Namespace="edu.neu.ccis.rasala" %>
<%@ Import Namespace="System.Collections.Generic" %>

<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Museum Feedback Login Page</title>
    <link href="css/boots.css" rel="stylesheet">
    <link href="css/new1.css" rel="stylesheet">
    <link href="//netdna.bootstrapcdn.com/bootswatch/3.0.2/spacelab/bootstrap.min.css" rel="stylesheet">
    <style>
        html, body
        {
            height: 100%;
        }
        #previous_link
        {
            border: solid 1px Black;
            padding: 4px;
            text-decoration: none;
            color: Black;
            background: #ececec;
        }
        
        #previous_link:hover
        {
            border: solid 1px black;
            color: Red;
        }
    </style>
</head>
<body>
<div class="jumbotron">
            <div class="container">
                <div class="page-header">
                    <h1>
                        Brooklyn Museum <small>New York</small></h1>
                </div>

<!-- Responsove nav bar -->
            <div class="navbar navbar-default" role="navigation">
                <div class="navbar-header">
                    <a class="navbar-brand" href="ProjectHomeBootstrap.aspx">
                        <img src="images/BMLogo1.png" /></a>
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span><span
                            class="icon-bar"></span><span class="icon-bar"></span>
                    </button>
                </div>
                <div class="navbar-collapse collapse">
                    <ul class="nav navbar-nav">
                        <li><a href="ProjectHomeBootstrap.aspx">Home</a></li>
                        <li><a href="ProjectMaps.aspx">Visit</a></li>
                        <li><a href="ProjectSearchPage.aspx">Search</a></li>
                        <li class="active"><a href="ProjectLogin.aspx">Feedback</a></li>
                        <li><a href="ProjectTickets.aspx">Tickets</a></li>
                    </ul>
                    </li> </ul>
                </div>
                <!--/.nav-collapse -->
            </div>
            <!-- Nav bar ends here -->

<h2>Feedback Login Page</h2>
<h3>Please Login to leave your feeback
<br />
Thank You!</h3>
<form id="form1" runat="server" enableviewstate="false">
<asp:login id="Login1" runat="server" destinationpageurl="ProjectCommentsPage.aspx"
    backcolor="#FFFBD6" bordercolor="#FFDFAD" borderpadding="4" borderstyle="Solid"
    borderwidth="1px" font-names="Verdana" font-size="0.8em" forecolor="#333333"
    textlayout="TextOnTop" Width="500px">
    <InstructionTextStyle Font-Italic="True" ForeColor="Black" />
    <LoginButtonStyle BackColor="White" BorderColor="#CC9966" BorderStyle="Solid" 
        BorderWidth="1px" Font-Names="Verdana" Font-Size="0.8em" ForeColor="#990000" />
    <TextBoxStyle Font-Size="0.8em" />
    <TitleTextStyle BackColor="#990000" Font-Bold="True" Font-Size="0.9em" 
        ForeColor="White" />
</asp:login>
</form>
</div>
</div>

    <script src="http://code.jquery.com/jquery.js"></script>
    <script src="js/bootstrap.js"></script>
</body>
</html>
