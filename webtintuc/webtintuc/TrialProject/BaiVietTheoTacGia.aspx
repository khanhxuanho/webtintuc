<%@ Page Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="BaiVietTheoTacGia.aspx.cs" Inherits="TrialProject.WebForm2" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style5
        {
            width: 90%;
            border:solid 1px silver;
            -moz-border-radius:3px;
        }
        .style6
        {
            width: 93px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:DataList ID="DataList3" runat="server" DataSourceID="SqlDataSource1" 
        Width="90%">
        <ItemTemplate>
            <table class="style5">
                <tr>
                    <td class="style6">
                        <asp:Image ID="Image2" runat="server" Height="120px" 
                            ImageUrl='<%# Eval("picture") %>' Width="120px" ToolTip='<%# Eval("title") %>'/>
                    </td>
                    <td>
                        <asp:HyperLink ID="HyperLink1" runat="server" 
                            NavigateUrl='<%# Eval("newsid","noidung.aspx?mbv={0}") %>' 
                            style="text-align: left" Text='<%# Eval("title") %>'></asp:HyperLink>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:Label ID="Label8" runat="server" style="text-align: left" 
                            Text='<%# Eval("DESCRIPTION") %>'></asp:Label>
                    </td>
                </tr>
            </table>
        </ItemTemplate>
    </asp:DataList>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:connect %>" 
        SelectCommand="SELECT * FROM [News] WHERE ([username] = @username)">
        <SelectParameters>
            <asp:QueryStringParameter Name="username" QueryStringField="author" 
                Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>

</asp:Content>
