<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="OnlineTutoEmployeeCRUD.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="~/Content/bootstrap.min.css" />
    <title>Login</title>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">

            <h1 class="text-center">Login</h1>
            <p class="text-center">&nbsp;</p>
            <p class="text-center">&nbsp;</p>

            <div class="form-group text-center">
                <asp:Label ID="MessageLbl" runat="server" Text=""></asp:Label>
            </div>

            <div class="form-group">
                <asp:Panel ID="Panel7" runat="server" CssClass="form-group">
                    <asp:Label ID="Label7" runat="server" Text="Username"></asp:Label>
                    <asp:TextBox ID="usernameBox" runat="server" CssClass="form-control"></asp:TextBox>
                </asp:Panel>

                <asp:Panel ID="Panel8" runat="server" CssClass="form-group">
                    <asp:Label ID="Label8" runat="server" Text="Password"></asp:Label>
                    <asp:TextBox ID="passwordBox" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox>
                </asp:Panel>
            </div>

            <div class="form-group">
                <asp:Button ID="LoginBtn" runat="server" Text="Login" CssClass="btn btn-primary" OnClick="LoginBtn_Click" />
                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Signup.aspx">Don't have an account? Create</asp:HyperLink>
            </div>
        </div>
    </form>
</body>
</html>
