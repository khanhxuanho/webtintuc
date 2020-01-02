<%@ Page Language="C#" MasterPageFile="~/Admin/adminchinhsua.Master" AutoEventWireup="true" CodeBehind="QuanLyTaiKhoan.aspx.cs" Inherits="TrialProject.Admin.QuanLyTaiKhoan" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .canphai
    {
    	text-align:right;
    	}
    .button
    {
    	width:120px;
    	height:30px;
    }
    .khung
    {
    	border:solid 1px black;
    	width:610px;
    	height:auto;
    	margin-left:100px;
    	margin-top:40px;
    }
    .texbox
    {
    	width:220px;
    	height:18px;
    	border:solid 1px silver;
    }
        .style4
        {
            text-align: right;
            width: 150px;
            height: 28px;
        font-weight: bold;
    }
        .style5
        {
            height: 28px;
             font-weight:bold;
            
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="khung">
<div style="margin-top:15px; font-weight:bold; height:30px; color:Blue; text-align:center; font-size:20px;">
    THÊM TÀI KHOẢN</div>
<hr />
    <table class="style3">
        <tr>
            <td class="style4">
                Tên Đăng Nhập: </td>
                                        <td class="style5">
    <asp:TextBox ID="txtTenDangNhap" runat="server" 
        ontextchanged="TextBox1_TextChanged" AutoPostBack="True" Height="18px" Width="220px" CssClass="texbox"></asp:TextBox>
        <asp:Label ID="lblThongBao" runat="server" Text="Label" Visible="False" ForeColor="Red"></asp:Label>
            </td>
                                    </tr>
                                    <tr>
                                        <td class="canphai" style="text-align: right; font-weight:bold ">
                                            Mật Khẩu: </td>
                                        <td>
    <asp:TextBox ID="txtMatKhau" runat="server" 
        ontextchanged="txtMatKhau_TextChanged" CssClass="texbox" TextMode="Password"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="canphai" style =" font-weight:bold">
                                            Nhập Lại Mật Khẩu: </td>
                                        <td>
    <asp:TextBox ID="txtNhapLaiPass" runat="server" CssClass="texbox" TextMode="Password"></asp:TextBox>
    <asp:CompareValidator ID="CompareValidator1" runat="server" 
                ControlToCompare="txtMatKhau" ControlToValidate="txtNhapLaiPass" 
                ErrorMessage="CompareValidator">Mật khẩu nhập sai</asp:CompareValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="canphai" style =" font-weight:bold">
                                            Quyền: </td>
                                        <td>
    <asp:DropDownList ID="ddlQuyen" runat="server" DataSourceID="SqlDataSource1" 
        DataTextField="rolename" DataValueField="roleID" CssClass="texbox">
    </asp:DropDownList>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:connect %>" 
        SelectCommand="SELECT [roleID], [rolename] FROM [tblRole]">
    </asp:SqlDataSource>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="canphai"style =" font-weight:bold">
                                            Họ Và Tên: </td>
                                        <td>
    <asp:TextBox ID="txtHoTen" runat="server" Height="18px" Width="220px" CssClass="texbox"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="canphai"style =" font-weight:bold">
                                            Địa Chỉ: </td>
                                        <td>
    <asp:TextBox ID="txtDiaChi" runat="server" CssClass="texbox"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="canphai"style =" font-weight:bold">
                                            Email: </td>
                                        <td>
    <asp:TextBox ID="txtDiaChiMail" runat="server" CssClass="texbox"></asp:TextBox>
    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                ControlToValidate="txtDiaChiMail" ErrorMessage="RegularExpressionValidator" 
                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"> Sai 
            định dạng Email</asp:RegularExpressionValidator>
                                        </td>
                                    </tr>
                                    </table>
<p>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Button ID="btnThem" runat="server" Text="Thêm Tài Khoản" 
        onclick="btnThem_Click" EnableTheming="True" CssClass="button" 
        Font-Bold="True" />
    &nbsp;&nbsp;&nbsp;
    <asp:Button ID="btnLamLai" runat="server" Text="Làm Lại" 
        onclick="btnLamLai_Click" CssClass="button" Font-Bold="True" />
                                        </p>
        <p>
            &nbsp;</p>
    </div>
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    </asp:Content>
