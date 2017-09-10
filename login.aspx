<%@ Page Language="C#" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="Views_user_signin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>Gong-Guy Dashboard</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <!-- Bootstrap 3.3.7 -->
  <link rel="stylesheet" href="bower_components/bootstrap/dist/css/bootstrap.min.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="bower_components/font-awesome/css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="bower_components/Ionicons/css/ionicons.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="dist/css/AdminLTE.min.css">
  <!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
  <link rel="stylesheet" href="dist/css/skins/_all-skins.min.css"/>

  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->

  <!-- Google Font -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic"/>
</head>
<body>
   
    <div class="col-md-4 col-md-offset-4" style="padding-top: 15em;">
         <asp:Label style="padding-left: 10em;" ID="BannerAlert" runat="server" />
          <!-- Horizontal Form -->
          <div class="box box-info">
            <div class="box-header with-border">
              <h3 class="box-title">Login</h3>
            </div>
            <!-- /.box-header -->
            <!-- form start -->
            <form class="form-horizontal" id="form1" runat="server">
                <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>
               <asp:Login ID = "Login1" runat = "server" OnAuthenticate= "ValidateUser">
                   <LayoutTemplate>
                        <div class="box-body">
                            <div class="form-group">
                                 <label for="inputEmail3" class="col-sm-2 control-label">Email</label>  
                                    <div class="col-sm-10">
                                        <asp:TextBox class="form-control" ID="UserName" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator class="form-control" ID="UserNameRequired" runat="server" ControlToValidate="UserName" ErrorMessage="User Name is required." ToolTip="User Name is required." ValidationGroup="Login1">*</asp:RequiredFieldValidator>
                                     </div>
                                </div>
                                <div class="form-group">
                                        <label for="inputPassword3" class="col-sm-2 control-label">Password</label>
                                        <div class="col-sm-10">
                                            <asp:TextBox style="padding-right:10em;" class="form-control" ID="Password" runat="server" TextMode="Password"></asp:TextBox>
                                            <asp:RequiredFieldValidator class="form-control" ID="PasswordRequired" runat="server" ControlToValidate="Password" ErrorMessage="Password is required." ToolTip="Password is required." ValidationGroup="Login1">*</asp:RequiredFieldValidator>
                                            <asp:CheckBox style="text-align: center;" ID="RememberMe" runat="server" Text="Remember me next time." /><br />
                                        </div>
                                  </div>
                                  <div class="box-footer">
                                      <asp:Button class="btn btn-info pull-right" ID="LoginButton" runat="server" CommandName="Login" Text="Log In" ValidationGroup="Login1" />
                                 </div>
                            </div>
                    </LayoutTemplate>
                </asp:Login>
            </form>
         </div>
     </div>
</body>
</html>
