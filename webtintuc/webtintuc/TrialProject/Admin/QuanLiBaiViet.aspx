<%@ Page Language="C#" MasterPageFile="~/Admin/adminchinhsua.Master" AutoEventWireup="true" CodeBehind="QuanLiBaiViet.aspx.cs" Inherits="TrialProject.Admin.QuanLiBaiViet" %>
<%@ Register Assembly="FredCK.FCKeditorV2" Namespace="FredCK.FCKeditorV2" TagPrefix="FCKeditorV2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style5
        {
            width: 100%;
            font-weight:bold;
            
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
        <asp:GridView ID="GridView1" runat="server" CellPadding="4" ForeColor="#333333" 
            GridLines="None" onrowcommand="GridView1_RowCommand" AllowPaging="True">
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <Columns>
                <asp:ButtonField Text="Sửa" CommandName="Select" />
                <asp:ButtonField Text="Xóa" CommandName="xoa" />
            </Columns>
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <EditRowStyle BackColor="#999999" />
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        </asp:GridView>
        <asp:DropDownList ID="ddlMenu" runat="server">
        </asp:DropDownList>
        <br />
        <table class="style5">
            <tr>
                <td>
                    Nhập Tiêu Đề :</td>
                <td>
                    <asp:TextBox ID="txtTieuDe" runat="server" Height="21px" 
        Width="334px" ></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    Tóm Tắt :</td>
                <td>
    <asp:TextBox ID="txtTomTat" runat="server" Height="90px" 
    TextMode="MultiLine" Width="360px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    Nội Dung</td>
                <td>
                    <FCKeditorV2:FCKeditor ID="fckNoiDung" runat="server" Width="80%" height = "80%">
                    
                    
        </FCKeditorV2:FCKeditor>
   
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    Username:<asp:Label ID="lblusername" runat="server" Text="Tenuser"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    Hình Ảnh</td>
                <td>
    <asp:FileUpload ID="upload" runat="server" />
                    <br />
    <asp:TextBox ID="txtDuongDan" runat="server" Height="35px" Width="341px"></asp:TextBox>
&nbsp;<asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
    <p>
        
        &nbsp;</p>
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td>
        
        <asp:Label ID="lblcreatedate" runat="server" Text="Label"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    Trạng Thái</td>
                <td>
                    <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
                </td>
            </tr>
        </table>
        <br />
        <br />
        
            <asp:Button ID="btnSua" runat="server" onclick="btnSua_Click" 
                Text="SỬA BÀI VIẾT" style="text-align: center" Font-Bold="True" />
<br />
<br />
&nbsp;<br />
        <p>
        
            &nbsp;</p>
        <p>
        
            &nbsp;</p>
        <p>
        
            &nbsp;</p>
  
 </asp:Content>