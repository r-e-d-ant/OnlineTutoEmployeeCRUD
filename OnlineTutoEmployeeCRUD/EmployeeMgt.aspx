<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" EnableEventValidation="false" CodeBehind="EmployeeMgt.aspx.cs" Inherits="OnlineTutoEmployeeCRUD.EmployeeMgt" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">

        <h1 class="text-center">EMPLOYEES MANAGEMENT PANEL</h1>
        <p class="text-center">&nbsp;</p>
        <p class="text-center">&nbsp;</p>

        <div class="form-group text-center">
            <asp:Label ID="MessageLbl" runat="server" Text=""></asp:Label>
        </div>

        <%-- here --%>
        <div class="form-group row">
            <asp:Panel ID="Panel6" runat="server" CssClass="form-group col-md-2">
                <asp:Label ID="Label6" runat="server" Text="Employee Id"></asp:Label>
                <asp:TextBox ID="empIdBox" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
            </asp:Panel>

            <asp:Panel ID="Panel1" runat="server" CssClass="form-group col-md-4">
                <asp:Label ID="Label1" runat="server" Text="Fullname"></asp:Label>
                <asp:TextBox ID="fullnameBox" runat="server" CssClass="form-control"></asp:TextBox>
            </asp:Panel>

            <asp:Panel ID="Panel2" runat="server" CssClass="form-group col-md-4">
                <asp:Label ID="Label2" runat="server" Text="Email"></asp:Label>
                <asp:TextBox ID="emailBox" runat="server" CssClass="form-control"></asp:TextBox>
            </asp:Panel>

            <asp:Panel ID="Panel7" runat="server" CssClass="form-group col-md-2">
                <asp:Label ID="Label7" runat="server" Text="Salary"></asp:Label>
                <asp:TextBox ID="salaryBox" runat="server" CssClass="form-control"></asp:TextBox>
            </asp:Panel>
        </div>

        <div class="form-group row">
            <asp:Panel ID="Panel3" runat="server" CssClass="form-group col-md-4">
                <asp:Label ID="Label3" runat="server" Text="Phone"></asp:Label>
                <asp:TextBox ID="phoneBox" runat="server" CssClass="form-control"></asp:TextBox>
            </asp:Panel>

            <asp:Panel ID="Panel4" runat="server" CssClass="form-group col-md-4">
                <asp:Label ID="Label4" runat="server" Text="Level of education"></asp:Label>
                <asp:DropDownList ID="levelOfEducationList" runat="server" CssClass="form-control">
                    <asp:ListItem>Masters</asp:ListItem>
                    <asp:ListItem>University</asp:ListItem>
                    <asp:ListItem>High School</asp:ListItem>
                </asp:DropDownList>
            </asp:Panel>

            <asp:Panel ID="Panel5" runat="server" CssClass="form-group col-md-4">
                <asp:Label ID="Label5" runat="server" Text="Date of birth"></asp:Label>
                <asp:TextBox ID="dateOfBirthBox" runat="server" TextMode="Date" CssClass="form-control"></asp:TextBox>
            </asp:Panel>
            <br />
        </div>

        <div class="form-group">
            <asp:Button ID="UpdateBtn" runat="server" Text="Update" CssClass="btn btn-warning" OnClick="UpdateBtn_Click" />
            <asp:Button ID="DeleteBtn" runat="server" Text="Delete" CssClass="btn btn-danger" OnClick="DeleteBtn_Click" />
        </div>
        <%-- ---- --%>

        <br />

        <asp:GridView ID="GridViewList" runat="server" CssClass="table" AutoGenerateColumns="False" OnRowCommand="GridViewList_RowCommand">
            <Columns>
                <%-- This are columns --%>
                <asp:BoundField DataField="emp_id" HeaderText="Employee ID" />
                <asp:BoundField DataField="fullname" HeaderText="Employee Name" />
                <asp:BoundField DataField="email" HeaderText="Email" />
                <asp:BoundField DataField="phone" HeaderText="Phone" />
                <asp:BoundField DataField="date_of_birth" HeaderText="Birth Date" />
                <asp:BoundField DataField="level_of_education" HeaderText="Level of education" />
                <asp:BoundField DataField="salary" HeaderText="Salary" />
                <%-- view button with emp_id binding to it --%>
                <asp:TemplateField HeaderText="Action">
                    <ItemTemplate>
                        <asp:Button ID="btnView" runat="server" Text="View" CssClass="btn btn-primary" CommandName="ViewDetails" CommandArgument='<%# Bind("emp_id") %>' />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>
</asp:Content>
