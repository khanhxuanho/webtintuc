<%@ Page Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="DangNhap.aspx.cs" Inherits="TrialProject.WebForm1" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style3
        {
            text-align: center;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p class="style3">
        UserName:<asp:TextBox ID="TextBox1" runat="server" BorderStyle="Solid" 
            Height="22px" Width="169px"></asp:TextBox>
    </p>
    <p class="style3">
        Password:<asp:TextBox ID="TextBox2" runat="server" BorderStyle="Solid" 
            Height="20px" TextMode="Password" Width="165px"></asp:TextBox>
    </p>
    <p class="style3">
        <asp:Button ID="Button1" runat="server" onclick="Button1_Click" 
            Text="Đăng Nhập" />
    </p>
    <p class="style3">
        <asp:Label ID="Label8" runat="server" ForeColor="Red" Text="Label"></asp:Label>
    </p>
    <p class="style3">
        &nbsp;</p>
    <p class="style3">
        &nbsp;</p>
    <p class="style3">
        &nbsp;</p>
    <p class="style3">
        &nbsp;</p>
    <p class="style3">
        &nbsp;</p>
    <p class="style3">
        &nbsp;</p>
    <p class="style3">
        &nbsp;</p>
    <p class="style3">
        &nbsp;</p>
    <p class="style3">
        &nbsp;</p>
    <p class="style3">
        &nbsp;</p>
</asp:Content>
