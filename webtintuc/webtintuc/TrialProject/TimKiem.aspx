<%@ Page Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="TimKiem.aspx.cs" Inherits="TrialProject.WebForm7" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style5
        {
            width: 100%;
        }
        .style6
        {
            width: 87px;
        }
        .dongkhung
        {
        	border:solid 1px gray;}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:DataList ID="DataList1" runat="server" CssClass="dongkhung">
        <ItemTemplate>
            <table class="style5">
                <tr>
                    <td class="style6">
                        <asp:ImageButton ID="ImageButton5" runat="server" Height="100px" Width="100px" ImageUrl='<%#Eval("picture") %>' />
                    </td>
                    <td>
                        <asp:HyperLink ID="HyperLink1" runat="server" 
                                            NavigateUrl='<%# Eval("newsid", "noidung.aspx?mbv={0}") %>' 
                                            Text='<%# Eval("title") %>'></asp:HyperLink>
                        <br />
                        <asp:Literal ID="Literal1" runat="server" Text='<%#Eval("description") %>'></asp:Literal>
                    </td>
                </tr>
            </table>
        </ItemTemplate>
    
    </asp:DataList>
    </asp:Content>
