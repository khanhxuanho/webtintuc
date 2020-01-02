<%@ Page Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="BaiViet.aspx.cs" Inherits="TrialProject.WebForm4" Title="Untitled Page" %>

<%@ Register Assembly="hmweb.PlayerVideo" Namespace="hmweb.PlayerVideo" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style5
        {
            width: 70%;
            border:solid 1px silver;
            -moz-border-radius:3px;
            margin-bottom:2px;
        }
        .style6
        {
        }
        .style7
        {
            width: 106px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:DataList ID="DataList3" runat="server" BorderColor="Blue" BorderStyle="Double">
        <ItemTemplate>
            <table class="style5">
                <tr>
                    <td class="style7">
                        <asp:ImageButton ID="ImageButton1" runat="server" Width="120px" Height="100px" PostBackUrl='<%# Eval("newsid","noidung.aspx?mbv={0}") %>' ToolTip='<%# Eval("title") %>' ImageUrl='<%# Eval("picture") %>' />
                    </td>
                    <td>
                        <asp:HyperLink ID="HyperLink1" runat="server" 
                            NavigateUrl='<%# Eval("newsid","noidung.aspx?mbv={0}") %>' 
                            Text='<%# Eval("title") %>'></asp:HyperLink>
                    </td>
                </tr>
                <tr>
                    <td class="style6" colspan="2">
                        <asp:Label ID="Label8" runat="server" Text='<%# Eval("description") %>'></asp:Label>
                    </td>
                </tr>
            </table>
        </ItemTemplate>
    </asp:DataList>
    </asp:Content>
