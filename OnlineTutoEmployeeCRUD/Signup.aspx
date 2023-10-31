<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Signup.aspx.cs" Inherits="OnlineTutoEmployeeCRUD.Signup" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <%-- Let's add bootstrap link, because its not in master page. --%>
    <link rel="stylesheet" href="~/Content/bootstrap.min.css" />
    <title>Signup</title>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">

            <h1 class="text-center">Signup</h1>
            <p class="text-center">&nbsp;</p>
            <p class="text-center">&nbsp;</p>

            <%-- Will help us in communicating messages. --%>
            <div class="form-group text-center">
                <asp:Label ID="MessageLbl" runat="server" Text=""></asp:Label>
            </div>

            <div class="form-group row">
                <asp:Panel ID="Panel1" runat="server" CssClass="form-group col-md-6">
                    <asp:Label ID="Label1" runat="server" Text="Fullname"></asp:Label>
                    <asp:TextBox ID="fullnameBox" runat="server" CssClass="form-control" required="true"></asp:TextBox>
                </asp:Panel>

                <asp:Panel ID="Panel2" runat="server" CssClass="form-group col-md-6">
                    <asp:Label ID="Label2" runat="server" Text="Email"></asp:Label>
                    <asp:TextBox ID="emailBox" runat="server" CssClass="form-control" required="true"></asp:TextBox>
                </asp:Panel>
            </div>

            <div class="form-group row">
                <asp:Panel ID="Panel3" runat="server" CssClass="form-group col-md-6">
                    <asp:Label ID="Label3" runat="server" Text="Phone"></asp:Label>
                    <asp:TextBox ID="phoneBox" runat="server" CssClass="form-control" required="true"></asp:TextBox>
                </asp:Panel>

                <asp:Panel ID="Panel4" runat="server" CssClass="form-group col-md-6">
                    <asp:Label ID="Label4" runat="server" Text="Level of education"></asp:Label>
                    <asp:DropDownList ID="levelOfEducationList" runat="server" CssClass="form-control" required="true">
                        <asp:ListItem>Masters</asp:ListItem>
                        <asp:ListItem>University</asp:ListItem>
                        <asp:ListItem>High School</asp:ListItem>
                    </asp:DropDownList>
                </asp:Panel>
            </div>

            <div class="form-group row">
                <asp:Panel ID="Panel5" runat="server" CssClass="form-group col-md-6">
                    <asp:Label ID="Label5" runat="server" Text="Date of birth"></asp:Label>
                    <asp:TextBox ID="dateOfBirthBox" runat="server" TextMode="Date" CssClass="form-control" required="true"></asp:TextBox>
                </asp:Panel>

                <asp:Panel ID="Panel6" runat="server" CssClass="form-group col-md-6">
                    <asp:Label ID="Label6" runat="server" Text="Username"></asp:Label>
                    <asp:TextBox ID="usernameBox" runat="server" CssClass="form-control" required="true"></asp:TextBox>
                </asp:Panel>
            </div>

            <div class="form-group row">
                <asp:Panel ID="Panel7" runat="server" CssClass="form-group col-md-6">
                    <asp:Label ID="Label7" runat="server" Text="Password"></asp:Label>
                    <asp:TextBox ID="passwordBox" runat="server" TextMode="Password" CssClass="form-control" required="true"></asp:TextBox>
                </asp:Panel>

                <asp:Panel ID="Panel8" runat="server" CssClass="form-group col-md-6">
                    <asp:Label ID="Label8" runat="server" Text="Confirm password"></asp:Label>
                    <asp:TextBox ID="passwordConfirmBox" runat="server" TextMode="Password" CssClass="form-control" required="true"></asp:TextBox>
                </asp:Panel>
            </div>

            <div class="form-group">
                <asp:Button ID="SignupBtn" runat="server" Text="Signup" CssClass="btn btn-primary" OnClick="SignupBtn_Click" />
                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Login.aspx">Already have an account? Login</asp:HyperLink>
            </div>
        </div>
    </form>
</body>
</html>
