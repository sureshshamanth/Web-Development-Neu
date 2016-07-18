<%@ Page Language="C#" EnableEventValidation="false" %>

<%@ Import Namespace="edu.neu.ccis.rasala" %>
<%@ Import Namespace="System.Collections.Generic" %>

<!--
   File: Login.aspx
    ... Login page for the website where visitors can leave there comments after logging in.
    Copyright 2013,
    Ramesh Nayak,
    College of Computer and Information Science
    Northeastern University, Boston, MA 02115
    nayak.ram@husky.neu.edu
-->
<script runat="server">
</script>
<html xmlns="http://www.w3.org/1999/xhtml">
<style>
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

#footer
{
    height: 51px;
    background: black;
    white-space: nowrap;
    line-height: 50px;
    padding: 0 15px;
    color: #7b7b7b;
    margin-top: 10px;
}
</style>
<head>
    <title>Movie Buzz</title>
    <link rel="stylesheet" href="css/style.css" type="text/css" media="all" />
    <link rel="stylesheet" href="css/feedback.css" type="text/css" media="all" />
</head>
<script runat="server">

    protected void Page_Load(object sender, EventArgs e)
    {
        string return_url =
            Request.QueryString["ReturnUrl"];

        if (StringTools.IsTrivial(return_url))
        {
            previous_link_wrap.Visible = false;
        }
        else
        {
            previous_link_wrap.Visible = true;
            previous_link.HRef =
                StringTools.Unescape(return_url);
        }
    }

</script>

<body>
    <!-- Wrapper -->
    <div class="wrapper">
        <!-- Header -->
        <div id="header">
            <h1 id="header-left">
                <a href="Default.aspx"></a>
            </h1>
            <div id="header-right">
            </div>
        </div>
        <!-- End Header -->
        <form id="form1" runat="server" enableviewstate="false">
        <div id="main">
            <div id="main_wrapper">
                    <h4>
                        Please login to leave your feedback</h4>
                    <hr width="660px" />
                    <br />
                    <asp:Login ID="Login1" runat="server" LoginButtonText="Login" DestinationPageUrl="ProjectCommentsPage.aspx"
                        DisplayRememberMe="False">
                    </asp:Login>
                    <div id="previous_link_wrap" runat="server">
                        <a href="" ID="previous_link" runat="server">Go Back</a><br /><br />
                    </div>       
                   
                    <div>
                    <p>
                    <h4>Temporary User Credentials:</h4>
                    <hr width="660px" />
                    User Name: usr02 <br />
                    Password: webdevusr*$
                    </p><br />
                    </div>
            </div>
            <div id="footer"></div>
        </div>
        </form>
    </div>
    <!-- End Wrapper -->
</body>
</html>