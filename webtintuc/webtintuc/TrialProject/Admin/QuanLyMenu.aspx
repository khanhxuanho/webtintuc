<%@ Page Language="C#" MasterPageFile="~/Admin/adminchinhsua.Master" AutoEventWireup="true" CodeBehind="QuanLyMenu.aspx.cs" Inherits="TrialProject.Admin.WebForm8" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style5
        {
            width: 100%;
        }
        .style6
        {
            text-align: right;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <table class="style5">
        <tr>
            <td class="style6">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style6"style =" font-weight:bold">
                Chọn Menu Cha:</td>
            <td>
                <asp:DropDownList ID="ddMenuCha" runat="server" DataSourceID="SqlDataSource1" 
                    DataTextField="cateName" DataValueField="cateID" Width="100">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:connect %>" 
                    SelectCommand="SELECT [cateID], [cateName] FROM [Category] WHERE ([parentID] IS NULL)">
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td class="style6"style =" font-weight:bold">
                Tên Menu:</td>
            <td>
                <asp:TextBox ID="txtTenMenu" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style6">
                &nbsp;</td>
            <td>
                <asp:Button ID="btnThem" runat="server" Text="Thêm Menu" Width="90" 
                    onclick="btnThem_Click" Font-Bold="True" />
&nbsp;<asp:Button ID="btnThoat" runat="server" Text="Thoát" Width="90" Font-Bold="True" />
            </td>
        </tr>
    </table>

    <br />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        DataKeyNames="cateID" DataSourceID="SqlDataSource2" 
        onrowcommand="GridView1_RowCommand">
        <Columns>
            <asp:ButtonField CommandName="xoa" Text="Xóa" />
            <asp:BoundField DataField="cateID" HeaderText="cateID" ReadOnly="True" 
                SortExpression="cateID" />
            <asp:BoundField DataField="link" HeaderText="link" SortExpression="link" />
            <asp:BoundField DataField="cateName" HeaderText="cateName" 
                SortExpression="cateName" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
        ConnectionString="<%$ ConnectionStrings:connect %>" 
        SelectCommand="SELECT [cateID], [link], [cateName] FROM [Category]">
    </asp:SqlDataSource>

</asp:Content>
