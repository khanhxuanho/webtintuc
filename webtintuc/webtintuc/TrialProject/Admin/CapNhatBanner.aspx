<%@ Page Language="C#" MasterPageFile="~/Admin/adminchinhsua.Master" AutoEventWireup="true" CodeBehind="CapNhatBanner.aspx.cs" Inherits="TrialProject.Admin.WebForm7" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style8
    {
        width: 100%;
    }
    .style9
    {
        text-align: right;
        width: 100px;
    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1">
    <ItemTemplate>
        <table class="style8">
            <tr>
                <td class="style9">
                    Logo:</td>
                <td>
                    <asp:Image ID="Image1" runat="server" Height="150px" 
                        ImageUrl='<%# Eval("image") %>' Width="200px" />
                    <br />
                    <asp:FileUpload ID="FileUpload1" runat="server" />
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("bannerid") %>'></asp:Label>
                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("image") %>'></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style9">
                    Đường Dẫn:</td>
                <td>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Eval("urlbanner") %>' 
                        Height="22px" Width="202px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style9">
                    Vị Trí:</td>
                <td>
                    <asp:DropDownList ID="DropDownList1" runat="server" 
                        DataSourceID="SqlDataSource1" DataTextField="locationname" 
                        DataValueField="locationid">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:connect %>" 
                        SelectCommand="SELECT [locationid], [locationname] FROM [Location]">
                    </asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td class="style9">
                    Thứ Tự:</td>
                <td>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Eval("order") %>'></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style9">
                    Hiển&nbsp; Thị:
                </td>
                <td>
                    <asp:DropDownList ID="DropDownList2" runat="server">
                        <asp:ListItem Value="True">Hiển Thị</asp:ListItem>
                        <asp:ListItem Value="False">Không Hiển Thị</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="style9">
                    &nbsp;</td>
                <td>
                    <asp:Button ID="btnsua" runat="server" Text="Cập Nhật" />
                </td>
            </tr>
        </table>
    </ItemTemplate>
</asp:DataList>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" 
    ConnectionString="<%$ ConnectionStrings:connect %>" 
    
        SelectCommand="SELECT [image], [urlbanner], [bannerid], [order] FROM [Banner] WHERE ([bannerid] = @bannerid)">
    <SelectParameters>
        <asp:QueryStringParameter Name="bannerid" QueryStringField="banner" 
            Type="Int32" />
    </SelectParameters>
</asp:SqlDataSource>

</asp:Content>
