<%@ Page Language="C#" MasterPageFile="~/Admin/adminchinhsua.Master" AutoEventWireup="true" CodeBehind="DoiMatKhau.aspx.cs" Inherits="TrialProject.Admin.WebForm5" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style4
        {
            width: 600px;
        }
        .khung
        {
        	width:610px;
        	height:auto;
        	border:solid 1px black;
        	margin-top:100px;
        	margin-left:100px;
        }
        .style5
        {
            height: 23px;
            text-align: center;
        }
        .style6
        {
            text-align: right;
            width: 437px;
        }
        .style8
        {
            width: 417px;
        }
        .style9
        {
            height: 34px;
        }
        .style10
        {
            font-size: 25px;
        }
        .style11
        {
            text-align: right;
            width: 437px;
            height: 26px;
        }
        .style12
        {
            width: 417px;
            height: 26px;
        }
        .style13
        {
            width: 437px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="khung">
    <table class="style4">
        <tr>
            <td class="style5" colspan="2">
                <br />
                <span class="style10">ĐỔI MẬT KHẨU</span><hr style="margin-top: 0px; margin-left:5px; margin-bottom:10px;" /></td>
        </tr>
        <tr>
            <td class="style11">
                Mật Khẩu Cũ:&nbsp;
            </td>
            <td class="style12">
                <asp:TextBox ID="txtMatKhauCu" runat="server" AutoPostBack="false" 
                    ontextchanged="txtMatKhauCu_TextChanged"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtMatKhauCu" 
                    ErrorMessage="RequiredFieldValidator">*Cần nhập dữ liệu ở đây</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style6">
                Mật Khẩu Mới:&nbsp;
            </td>
            <td class="style8">
                <asp:TextBox ID="txtMatKhauMoi" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtMatKhauMoi" 
                    ErrorMessage="RequiredFieldValidator">*Cần nhập dữ liệu ở đây</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style6">
                Xác Nhận Mật Khẩu:&nbsp;
            </td>
            <td class="style8">
                <asp:TextBox ID="txtXacNhan" runat="server"></asp:TextBox>
                <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtMatKhauMoi" ControlToValidate="txtXacNhan" 
                    ErrorMessage="CompareValidator">*Mật Khẩu Xác Nhận Sai</asp:CompareValidator>
            </td>
        </tr>
        <tr>
            <td class="style13">
                &nbsp;</td>
            <td class="style8">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style9" colspan="2">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;
                <asp:Button ID="btnThayDoi" runat="server" Text="Thay Đổi" 
                    onclick="btnThayDoi_Click" />
                &nbsp;&nbsp;&nbsp;<asp:Button ID="btnHuyBo" runat="server" Text="Hủy Bỏ" 
                    onclick="btnHuyBo_Click" />
                <br />
                <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="lbl" runat="server"></asp:Label></td>
        </tr>
        <tr>
            <td class="style13">
                &nbsp;</td>
            <td class="style8">
                &nbsp;</td>
        </tr>
    </table>
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
