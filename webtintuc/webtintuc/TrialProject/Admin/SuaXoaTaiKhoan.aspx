<%@ Page Language="C#" MasterPageFile="~/Admin/adminchinhsua.Master" AutoEventWireup="true" CodeBehind="SuaXoaTaiKhoan.aspx.cs" Inherits="TrialProject.Admin.WebForm4" Title="Sửa/ Xóa Tài Khoản" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style4
        {
            width: 294px;
        }
        .style5
        {
            text-align: right;
            width: 153px;
            margin-right: 20px;
        }
        .style6
        {
            width: auto;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        DataKeyNames="username"
        onrowcommand="GridView1_RowCommand" >
        <Columns>
            <asp:ButtonField Text="  Select  " />
            <asp:BoundField DataField="username" HeaderText="Tên Đăng Nhập" ReadOnly="True" 
                SortExpression="username" />
            <asp:BoundField DataField="fullname" HeaderText="Họ Và Tên" 
                SortExpression="fullname" />
            <asp:BoundField DataField="email" HeaderText="Địa Chỉ Mail" 
                SortExpression="email" />
            <asp:BoundField DataField="ADDRESS" HeaderText="Địa Chỉ" 
                SortExpression="ADDRESS" />
            <asp:BoundField DataField="rolename" HeaderText="Quyền" SortExpression="rolename" />
        </Columns>
    </asp:GridView>
    &nbsp;<table class="style4">
        <tr>
            <td class="style5"style =" font-weight:bold">
                Tên Đăng Nhập:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </td>
            <td class="style6">
                <asp:TextBox ID="txtTendangnhap" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style5"style =" font-weight:bold">
                Họ Và Tên:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </td>
            <td class="style6">
                <asp:TextBox ID="txtHoten" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style5"style =" font-weight:bold">
                Email:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </td>
            <td class="style6">
                <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style5"style =" font-weight:bold">
                Địa Chỉ Liên Hệ:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </td>
            <td class="style6">
                <asp:TextBox ID="txtDiaChi" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style5"style =" font-weight:bold">
                Quyền:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </td>
            <td class="style6">
                <asp:DropDownList ID="ddlQuyen" runat="server" Height="21px" Width="126px">
                    <asp:ListItem Value="1">Admin</asp:ListItem>
                    <asp:ListItem Value="2">User</asp:ListItem>
                    <asp:ListItem Value="0">Block</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
    </table>

    <br />
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Button ID="btnSua" runat="server" onclick="btnSua_Click" Text="SỬA" 
        Font-Bold="True" />
    <asp:Button ID="btnXoa" runat="server" Text="XÓA" onclick="btnXoa_Click" 
        Font-Bold="True" />
    
</asp:Content>
