<!DOCTYPE html>
<%@ Page Title="Feed Back" Language="C#" %>

<%@ Import Namespace="System.Xml" %>

<html lang="en">
<head>
    
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Museum HomePage</title>
    <link href="css/boots.css" rel="stylesheet">
    <link href="css/new1.css" rel="stylesheet">
    <link href="//netdna.bootstrapcdn.com/bootswatch/3.0.2/spacelab/bootstrap.min.css" rel="stylesheet">

    <style>
        html, body
        {
            height: 100%;
        }
    </style>
</head>
<script runat="server">
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            loadComments();
        }
    }

    //Read the comments.xml  
    protected void loadComments()
    {
        XDocument xml = XDocument.Load(Server.MapPath("comments.xml"));
        var comments = from Comments in xml.Descendants("Entry")
                       select new
                       {
                           name = Comments.Element("Name").Value,
                           comment = Comments.Element("FeedBack").Value,
                           time = Comments.Element("Time").Value
                       };

        CommentsList.DataSource = comments.Reverse().ToList();
        CommentsList.DataBind();
    }

    //Save the Comments into Comments.xml
    protected void addComment(object sender, EventArgs e)
    {
        XDocument xml = XDocument.Load(Server.MapPath("comments.xml"));
        xml.Element("Comments").Add
            (new XElement("Entry",
                new XElement("Name", txtName.Text),
                new XElement("Time", DateTime.Now.ToString()),
                new XElement("FeedBack", txtComment.Text)));
        xml.Save(Server.MapPath("comments.xml"));
        resetFields(sender, e);
    }

    protected void resetFields(object sender, EventArgs e)
    {
        txtName.Text = "";
        txtComment.Text = "";
    }

    protected void paginationBinder(object sender, EventArgs e)
    {
        loadComments();
    }
    
</script>
<body>
    <div class="jumbotron">
    <!-- Wrapper -->
    <div class="container">
        <!-- Header -->
        <div id="page-header">
        <h1>Brooklyn Museum <small> Feedback</small></h1>
        </div> <!-- End Header -->
                        
            <nav class="navbar navbar-default" role="navigation">
  <!-- Brand and toggle get grouped for better mobile display -->
 
        <form name="form1" runat="server">
  <div class="navbar-header">
    <a class="navbar-brand" href="ProjectHomeBootstrap.aspx"><img src="images/BMLogo1.png"/></a>
  </div>

  <!-- Collect the nav links, forms, and other content for toggling -->
  <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
    <ul class="nav navbar-nav">
      <li><a href="ProjectHomeBootstrap.aspx">Home</a></li>
  <li><a href="ProjectMaps.aspx">Visit</a></li>
  <li><a href="ProjectSearchPage.aspx">Search</a></li>
   <li class="active"><a href="ProjectLogin.aspx">Feedback</a></li>
  <li><a href="ProjectTickets.aspx">Tickets</a></li>
 </ul>
  <ul class="nav navbar-nav navbar-right">
  <li><asp:LoginStatus ID="LoginStatus1" runat="server" LogoutAction="Redirect" LogoutPageUrl="~/project/ProjectLogin.aspx" ForeColor="Red" /></li>
  </ul>
  </div>
</nav>
        <!-- Main -->
            <div class="panel panel-primary">
                  <div class="panel-heading">
                      <h3 class="panel-title">
                          Please leave your feedback</h3>
                  </div>
                  <div class="panel-body">
                      
                              <b>Name:</b>
                          
                      <div class="row">
                          <div class="col-lg-5">
                    <asp:RequiredFieldValidator ID="NameValidator" runat="server" ControlToValidate="txtName"
                        ErrorMessage="Please enter your Name" Display="dynamic" ForeColor="red">
                    </asp:RequiredFieldValidator>
                    <asp:TextBox ID="txtName" class="form-control" runat="server" />
                    </div>
                      </div>
                    <b>Message:</b>
                    <asp:RequiredFieldValidator ID="CommentValidator" runat="server" ControlToValidate="txtComment"
                        ErrorMessage="Please enter your Comments" Display="dynamic" ForeColor="red">
                    </asp:RequiredFieldValidator><br />
                    <asp:TextBox ID="txtComment" class="form-control" TextMode="Multiline" Columns="30" Rows="3" Wrap="true"
                        runat="server" />
                      <div class="row">
                          <div class="col-md-11">
                              <asp:Button ID="InsertFeedBack" class="btn btn-success" runat="server" Text="Submit"
                                  OnClick="addComment" />
                              <asp:Button ID="CancelFeedBack" class="btn btn-warning" runat="server" Text="Cancel"
                                  OnClick="resetFields" />
                          </div>
                      </div>
                </div>
                        </div>
                <br />
                <div class="panel panel-primary">
                  <div class="panel-heading">
                      <h3 class="panel-title">
                          Comments</h3>
                  </div>
                  <div class="panel-body">
                <asp:ListView ID="CommentsList" runat="server">
                    <LayoutTemplate>
                        <ul>
                            <asp:PlaceHolder ID="itemPlaceHolder" runat="server"></asp:PlaceHolder>
                        </ul>
                    </LayoutTemplate>
                    <ItemTemplate>
                        <div id="commentbox">
                            <i>
                                <%#Eval("comment") %></i><br />
                            <strong>
                                <%#Eval("name") %></strong>
                            <div id="timestamp">
                                <%#Eval("time") %></div>
                        </div>
                    </ItemTemplate>
                </asp:ListView>
                <asp:DataPager ID="CommentsListPager" runat="server" PagedControlID="CommentsList"
                    PageSize="4" OnPreRender="paginationBinder">
                    <Fields>
                        <asp:NextPreviousPagerField RenderNonBreakingSpacesBetweenControls="true" ButtonCssClass="pagerButton"
                            FirstPageText="&lt;&lt;" ShowFirstPageButton="True" ShowNextPageButton="False" />
                        <asp:NumericPagerField CurrentPageLabelCssClass="pagerButtonCurrentPage" RenderNonBreakingSpacesBetweenControls="true"
                            NextPreviousButtonCssClass="pagerButton" NumericButtonCssClass="pagerButton" />
                        <asp:NextPreviousPagerField RenderNonBreakingSpacesBetweenControls="true" ButtonCssClass="pagerButton"
                            LastPageText="&gt;&gt;" ShowLastPageButton="True" ShowPreviousPageButton="False" />
                    </Fields>
                </asp:DataPager>
                </div>
                </div>
            </div>
        </div>
        </form>
        <!-- Footer -->
        <!-- End Footer -->
    </div>
    </div>
    <!-- End Wrapper -->

    <!-- Javascript dependencies -->
    
    <script src="http://code.jquery.com/jquery.js"></script>
    <script src="js/bootstrap.js"></script>

</body>
</html>