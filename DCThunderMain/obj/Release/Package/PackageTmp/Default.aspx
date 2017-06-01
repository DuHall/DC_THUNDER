<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Default.Master" CodeBehind="Default.aspx.vb" Inherits="DCThunderMain._Default1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <!-- Bootstrap Core CSS -->
    <link href="../vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="../vendor/metisMenu/metisMenu.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="../dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- Morris Charts CSS -->
    <link href="../vendor/morrisjs/morris.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="../vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

    <script src="Scripts/jquery-1.8.2.js"></script>
    <link href="content/redactor/redactor.css" rel="stylesheet" />
    <script src="Scripts/redactor/redactor.js"></script>
    
    		
    					

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
             <div id="wrapper">

        <!-- Navigation -->
        <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="index.html">DC Thunder - Parent Zone</a>
            </div>
            <!-- /.navbar-header -->

            <ul class="nav navbar-top-links navbar-right">
                
               
                <!-- /.dropdown -->
                <asp:Button ID="btnCoachMode" runat="server" Text="Turn ON Edit Mode" Visible="false" BorderColor="Red" />&nbsp;
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <i class="fa fa-user fa-fw"></i> <i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-user">
                        <li><a href="#"><i class="fa fa-user fa-fw"></i> <asp:Literal ID="litCurrentUser" runat="server"></asp:Literal> Profile</a>
                        </li>
                        <li class="divider"></li>
                        <li><a href="#" id="AnchorLogout" onserverclick="HtmlAnchorLogout_Click" runat="server"><i class="fa fa-sign-out fa-fw"></i> Logout</a>
                        </li>
                    </ul>
                    <!-- /.dropdown-user -->
                </li>
                <!-- /.dropdown -->
            </ul>
            <!-- /.navbar-top-links -->

            <div class="navbar-default sidebar" role="navigation">
                <div class="sidebar-nav navbar-collapse">
                    <ul class="nav" id="side-menu">
                        <li class="sidebar-search">
                            <div class="input-group custom-search-form">
                                <input type="text" class="form-control" placeholder="Search...">
                                <span class="input-group-btn">
                                <button class="btn btn-default" type="button">
                                    <i class="fa fa-search"></i>
                                </button>
                            </span>
                            </div>
                            <!-- /input-group -->
                        </li>
                        <li>
                            <a href="#" id="AnchorBtnZone" onserverclick="HtmlAnchorZone_Click" runat="server"><i class="fa fa-dashboard fa-fw"></i> Parent Zone</a>
                        </li>
                        
                        <li>
                            <a href="#" id="AnchorBtnSchedule" onserverclick="HtmlAnchorSched_Click" runat="server"><i class="fa fa-table fa-fw"></i> Schedule</a>
                        </li>
                        <li>
                            <a href="#" id="AnchorBtnStats" onserverclick="HtmlAnchorStats_Click" runat="server"><i class="fa fa-edit fa-fw"></i> Stats</a>
                        </li>
                         <li style="padding-left: 15px;">
                            
                        </li>
                       <asp:Literal ID="litAdminEdit" runat="server"></asp:Literal>
                    </ul>
                </div>
                <!-- /.sidebar-collapse -->
            </div>
            <!-- /.navbar-static-side -->
        </nav>

        
<div id="page-wrapper">
<asp:Panel ID="pnlParentMain" runat="server">
    
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Parent Zone</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>

                 <asp:Panel ID="pnlAdminAddScore" runat="server" Visible="false">

            <div style="background-color: #FFFEDF; padding: 3px 0px 3px 0px;"><strong>Add New Score</strong>
            <center><span style="font-size: 14px;"><asp:Label ID="lblThunder" runat="server" Text="Thunder Score: "></asp:Label><asp:TextBox ID="txtThunderScore" runat="server" Width="43px"></asp:TextBox> &nbsp;&nbsp;<asp:Label ID="lblOpponent" runat="server" Text="Opponent Name: "></asp:Label><asp:TextBox ID="txtOppName" runat="server"></asp:TextBox>  &nbsp;&nbsp;<asp:Label ID="lblOpponentScore" runat="server" Text="Opponent Score: "></asp:Label><asp:TextBox ID="txtOpponentScore" runat="server" Width="43px"></asp:TextBox> 
                &nbsp;&nbsp;<asp:Button ID="btnAddScore" runat="server" Text="Add Score" /><br /><asp:Label ID="lblScoreMsg" runat="server" Text=""></asp:Label></span></center>

              </div>
                     </asp:Panel>
            <div class="col-lg-12">
                    <h3 style="font-size: 20px;"><u>Recent Tournament results</u></h3>
                </div>
            <!-- /.row -->
            <div class="row">
                <asp:Literal ID="litScoreboard" runat="server"></asp:Literal>


                <hr />
                <asp:Panel ID="pnlAdminAddAnnouncement" runat="server" Visible="false">

               <div class="col-lg-12">
                   
             <div style="background-color: #FFFEDF; padding: 3px 0px 3px 0px;"><strong>
                 <br />
                 Add New Announcement</strong>
                <center><span style="font-size: 14px;"><asp:TextBox ID="txtAnnouncement" runat="server" Height="120px" TextMode="MultiLine" Width="600px"></asp:TextBox>
                    <br />
                    <br /><asp:Button ID="btnAddAnnouncement" runat="server" Text="Send Announcement" Height="42px" Width="155px"></asp:Button>
                    <br />
                    <asp:Label ID="lblAnnounceMsg" runat="server" Text=""></asp:Label>
                    </span></center>
              </div>
                   </asp:Panel>
                <br /><br />
                    <h3 style="font-size: 20px;"><u>Announcements</u></h3><br />
                <asp:Literal ID="litAnnouncement" runat="server"></asp:Literal><br />
                <h3 style="font-size: 20px;"><u>Tournament Uniforms</u></h3><br />

                </div>
            </div>
        </div>

</asp:Panel>
 
<%-- Scheduling panel --%>
<asp:Panel ID="pnlSchedule" runat="server" Visible="false">
    <div class="col-lg-12">
        <h1 class="page-header">Schedule</h1>
    </div>

    <asp:Panel ID="pnlAddLocation" runat="server" Visible="false">

            <div style="background-color: #FFFEDF; padding: 3px 0px 3px 0px;"><strong><center>Add Upcoming Tournament</center></strong><center>This will update upcoming tournament on landing page</center><br />
            <center><span style="font-size: 14px;">
                <asp:Label ID="lblGoogleMap" runat="server" Text="Update Location Name and Field: "></asp:Label>
                <asp:TextBox ID="txtLocationName" runat="server" Width="210px"></asp:TextBox> &nbsp;&nbsp;
                <asp:Label ID="lblLocFirstGame" runat="server" Text="Enter First Game Time: "></asp:Label>
                <asp:TextBox ID="txtFirstGame" runat="server"></asp:TextBox>  &nbsp;<br />
                <br />
                &nbsp;
                <asp:Label ID="lblUpdateAddress" runat="server" Text="Enter New Address: "></asp:Label>
                <asp:TextBox ID="txtNewAddress" runat="server" Width="205px"></asp:TextBox>&nbsp;&nbsp;
                <asp:Label ID="lblUpdateAddressLink" runat="server" Text="Enter Google Address Link: "></asp:Label><asp:TextBox ID="txtAddressLink" runat="server" Width="204px"></asp:TextBox>
                <br />
                <br />
                &nbsp;&nbsp;<asp:Label ID="lblUpdateMap" runat="server" Text="Enter Google Map Link: "></asp:Label><asp:TextBox ID="txtUpdateMap" runat="server" Width="499px"></asp:TextBox>   
                <br />
                <br />
                &nbsp;&nbsp;<asp:Button ID="btnUpdateLocation" runat="server" Text="Update" /></span></center>
            </div>
    </asp:Panel>

    <asp:Panel ID="pnlTournSchedule" runat="server" Visible="false">
        <hr />
        <div style="background-color: #FFFEDF; padding: 3px 0px 3px 0px;"><strong><center>Add Schedule</center></strong><br />
            <center><span style="font-size: 14px;">
                <asp:Label ID="lblSchedule" runat="server" Text="Enter in each tournament and date "></asp:Label><br />
                <asp:TextBox ID="txtSchedule" runat="server" Width="409px" Height="16px"></asp:TextBox> &nbsp;&nbsp;
                
                <br />
                
                <br />
                &nbsp;&nbsp;<asp:Button ID="btnSchedule" runat="server" Text="Add Tournament" /></span></center>
            </div>

    </asp:Panel>

    <div class="col-lg-12" style="text-align: center;">
        <u><asp:Label ID="lblPracticeSched" runat="server" Text="Tournament Schedule: "></asp:Label></u><br /><asp:Literal ID="litTournSchedule" runat="server"></asp:Literal>
    </div>
</asp:Panel>


<%-- Stats panel --%>
<asp:Panel ID="pnlStats" runat="server" Visible="false">
    <div class="col-lg-12">
        <h1 class="page-header">Team Statistics</h1>
    </div>
</asp:Panel>



<%-- Payment System panel --%>
<asp:Panel ID="pnlMakePayment" runat="server" Visible="false">
    <div class="col-lg-12">
        <h1 class="page-header">Pay for upcoming event</h1>
    </div>
</asp:Panel>


</div>







    <!-- jQuery -->
    <script src="../vendor/jquery/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="../vendor/bootstrap/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="../vendor/metisMenu/metisMenu.min.js"></script>

    <!-- Morris Charts JavaScript -->
    <script src="../vendor/raphael/raphael.min.js"></script>
    <script src="../vendor/morrisjs/morris.min.js"></script>
    <script src="../data/morris-data.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="../dist/js/sb-admin-2.js"></script>
</asp:Content>
