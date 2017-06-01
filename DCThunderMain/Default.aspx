<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Default.Master" CodeBehind="Default.aspx.vb" ValidateRequest="false" Inherits="DCThunderMain._Default1" %>
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
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js?apiKey=mx5prpy14cb7tp7wc8ee52h4sn5tjsjibz28nref4icyu2vx"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

    <script src="https://cloud.tinymce.com/stable/tinymce.min.js?apiKey=mx5prpy14cb7tp7wc8ee52h4sn5tjsjibz28nref4icyu2vx"></script>
  <script>tinymce.init({ selector: 'textarea' });</script>

    <script src="Scripts/jquery-1.8.2.js"></script>
    <link href="content/redactor/redactor.css" rel="stylesheet" />
    <script src="Scripts/redactor/redactor.js"></script>
    
    <style>

        table#t1 {
  border-collapse: separate;
  border-spacing: 0;
  width: 780px;
  
}
th#th1 ,
td#td1 {
  padding: 7px 3px;
}
th#th1 {
  background: #42444e;
  color: #fff;
  text-align: left;
}
tr#tr1:first-child th:first-child {
  border-top-left-radius: 6px;
}
tr#tr1:first-child th:last-child {
  border-top-right-radius: 6px;
}
td#td1 {
  border-right: 1px solid #c6c9cc;
  border-bottom: 1px solid #c6c9cc;
}
td#td1:first-child {
  border-left: 1px solid #c6c9cc;
}
tr#tr1:nth-child(even) td {
  background: #eaeaed;
}
tr#tr1:last-child td:first-child {
  border-bottom-left-radius: 6px;
}
tr#tr1:last-child td:last-child {
  border-bottom-right-radius: 6px;
}

    </style>		
    					

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
                <a class="navbar-brand" href="index.html">DC Thunder - Team Dugout</a>
            </div>
            <!-- /.navbar-header -->

            <ul class="nav navbar-top-links navbar-right">
                
               
                <!-- /.dropdown -->
                <asp:Button ID="btnCoachMode" runat="server" Text="Turn ON Edit Mode" Visible="false" BorderColor="Red" />&nbsp;<asp:Button ID="btnRosterEditor" runat="server" Text="Edit Roster" Visible="false" BorderColor="#337AB7" />&nbsp;
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <i class="fa fa-user fa-fw"></i> <i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-user">
                        <li><a href="#" id="AnchorUserProfile" onserverclick="HtmlAnchorUserProfile_Click" runat="server"><i class="fa fa-user fa-fw"></i> <asp:Literal ID="litCurrentUser" runat="server"></asp:Literal> Profile</a>
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
                            <a href="#" id="AnchorBtnZone" onserverclick="HtmlAnchorZone_Click" runat="server"><i class="fa fa-dashboard fa-fw"></i> Dugout</a>
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

        
<div id="page-wrapper" style="height: auto;">
<asp:Panel ID="pnlParentMain" runat="server">
    
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Team Dugout</h1>
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
                    <h3 style="font-size: 20px;"><u>Thunder Scoreboard</u></h3>
                </div>
            <!-- /.row -->
            <div class="row">
                <asp:Literal ID="litScoreboard" runat="server"></asp:Literal>


                <asp:Panel ID="pnlAdminAddAnnouncement" runat="server" Visible="false">

               <div class="col-lg-12">
                   
             <div style="background-color: #FFFEDF; padding: 3px 0px 3px 0px;"><strong>
                 <br />
                 Add New Announcement</strong>
                <center><span style="font-size: 14px;"><textarea id="txtAnnounce" runat="server"></textarea>
                    <br />
                    <br /><asp:Button ID="btnAddAnnouncement" runat="server" Text="Send Announcement" Height="42px" Width="155px"></asp:Button>
                    <br />
                    <asp:Label ID="lblAnnounceMsg" runat="server" Text=""></asp:Label>
                    </span></center>
              </div>
                   </asp:Panel>
                <hr /><br /> <br /><br /> <br /><br /><br /><br /><br /><br />
                    <h3 style="font-size: 20px;"><u>Announcements</u></h3><br />
                <asp:Literal ID="litAnnouncement" runat="server"></asp:Literal><br /> 

                </div>
            </div>
        </div>

</asp:Panel>
 
<%-- Scheduling panel --%>
<asp:Panel ID="pnlSchedule" runat="server" Visible="false">
    <div class="col-lg-12">
        <h1 class="page-header">Schedule</h1> <br />
    
    </div>


    <asp:Panel ID="pnlTournSchedule" runat="server" Visible="false">
        <hr />

    </asp:Panel>

    <div class="col-lg-12" style="text-align: center;">
                <center><iframe src="https://calendar.google.com/calendar/embed?src=som5eu32j2sqkgacetti208lgs%40group.calendar.google.com&ctz=America/New_York" style="border: thin" width="800" height="600" frameborder="0" scrolling="no"></iframe></center>

    </div>
</asp:Panel>


<%-- Stats panel --%>
<asp:Panel ID="pnlStats" runat="server" Visible="false">
    <div class="col-lg-12">
        <h1 class="page-header">Team Statistics</h1>
    </div>

    <div class="col-lg-12" style="text-align: center;">
        <h3><u>Batting Stats</u></h3>
        <asp:Literal ID="litHittingStats" runat="server"></asp:Literal> <hr />
        <h3><u>Pitching Stats</u></h3>
        <asp:Literal ID="litPitchingStats" runat="server"></asp:Literal>


    </div>
</asp:Panel>



<%-- Payment System panel --%>
<asp:Panel ID="pnlEditRoster" runat="server" Visible="false">
    <div class="col-lg-12">
        <h1 class="page-header">Roster Editor</h1>
    </div>

    <div class="col-lg-12" style="text-align: center;">
        <asp:Literal ID="litRosterInfo" runat="server"></asp:Literal>
    </div>

</asp:Panel>

    <asp:Panel ID="pnlUserProfile" runat="server" Visible="false">
    <div class="col-lg-12">
        <h1 class="page-header">
            <asp:Literal ID="litUserProfileTitle" runat="server"></asp:Literal></h1>
    </div>

    <div class="col-lg-12" style="text-align: center; border: solid thin #E5E5E5;"> <br /> <br />
        <asp:Label ID="lblPassConf" runat="server" Text=""></asp:Label>
        <p style="color: red;">
            <asp:Literal ID="litPasswordError" runat="server" Visible="false"></asp:Literal></p>
        <u>Change Password</u> <br /><br />
        Old Password:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:TextBox ID="txtOldPassword" runat="server" TextMode="Password"></asp:TextBox> <br /><br />
        New Password:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:TextBox ID="txtNewPassword" runat="server" TextMode="Password"></asp:TextBox><br /><br />
        Confirm Password: <asp:TextBox ID="txtConfirmPassword" runat="server" TextMode="Password"></asp:TextBox><br /><br />
        <asp:Button ID="btnChangePassword" runat="server" Text="Change Password" Width="249px" />
        <br /> <br />
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
