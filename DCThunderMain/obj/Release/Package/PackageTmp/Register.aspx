<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Register.aspx.vb" Inherits="DCThunderMain.Register" %>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>DC Thunder Parent Portal Login</title>

    <!-- Bootstrap Core CSS -->
    <link href="../vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="../vendor/metisMenu/metisMenu.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="../dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="../vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body style="background:url('img/lightning.jpg')no-repeat center center fixed; -webkit-background-size: cover; -moz-background-size: cover; -o-background-size: cover; background-size: cover;">

    <div class="container">
        <div class="row">
            <div class="col-md-4 col-md-offset-4" style="width: 400px;">
                <div class="login-panel panel panel-default" style="margin-top: 250px; min-width: 300px; box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);">
                    <div class="panel-heading">
                        <h4><center><strong>DC Thunder Parent Registration</strong></center></h4>
                    </div>
                    <div class="panel-body">
                        <form id="form1" runat="server">
                            <fieldset>
                                <div class="form-group">
                                    <asp:TextBox ID="txtUserName" runat="server" Width="331px" placeholder="User Name"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <asp:TextBox ID="txtEmailAddress" runat="server" Width="331px" placeholder="E-Mail"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                <asp:TextBox ID="tbPassword" runat="server" TextMode="Password" Width="331px" placeholder="Password"></asp:TextBox>
                                </div>
                                <asp:TextBox ID="ConfirmPass" runat="server" TextMode="Password" Width="331px" placeholder="Confirm Password"></asp:TextBox>

                                    <asp:CompareValidator ID="CompareValidator1" runat="server" 
                                     ControlToValidate="ConfirmPass"
                                     CssClass="ValidationError"
                                     ControlToCompare="tbPassword"
                                     ErrorMessage="Passwords Do Not Match" 
                                     ForeColor="Red"                                
                                     ToolTip="Password must be the same" />

                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                     ErrorMessage="&laquo; (Required)" 
                                     ControlToValidate="ConfirmPass"
                                     CssClass="ValidationError"
                                     ToolTip="Compare Password is a REQUIRED field">
                                    </asp:RequiredFieldValidator>                            
                                <!-- Change this to a button or input when using this as a form -->
                                <asp:Button ID="btnRegister" runat="server" Text="Register" Height="34px" Width="330px" />
                                    <br />
                                    <center><asp:Literal ID="litMessage" runat="server"></asp:Literal></center>
                            </fieldset>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- jQuery -->
    <script src="../vendor/jquery/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="../vendor/bootstrap/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="../vendor/metisMenu/metisMenu.min.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="../dist/js/sb-admin-2.js"></script>

</body>

</html>
