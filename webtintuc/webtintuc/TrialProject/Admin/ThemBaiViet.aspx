<%@ Page Language="C#" MasterPageFile="~/Admin/adminchinhsua.Master" AutoEventWireup="true" CodeBehind="ThemBaiViet.aspx.cs" Inherits="TrialProject.Admin.WebForm3" Title="Thêm Bài Viết
" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc2" %>
<%@ Register assembly="FredCK.FCKeditorV2" namespace="FredCK.FCKeditorV2" tagprefix="FCKeditorV2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style3
        {
            text-align: center;
       
        }
        .noidung
        {
        	margin-left:90px;        
      	}
       
        .style5
        {
            font-weight:bold;
           
        }
       
        .style6
        {
            font-size: xx-large;
            font-weight: bold;
        }
       
        .style7
        {
            font-weight: normal;
        }
        .style8
        {
            text-align: right;
            font-weight: normal;
        }
        .style9
        {
            text-align: right;
        }
       
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <br />
         <center class="style6"> THÊM BÀI VIẾT </center>
         <br />
         <br />
     <table class="style5">
         <tr>
             <td class="style8">
                 Chọn Menu :</td>
             <td style="text-align: left">
                 <asp:DropDownList ID="DropDownList1" runat="server" 
            DataSourceID="SqlDataSource1" DataTextField="cateName" DataValueField="cateID">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:connect %>" 
            SelectCommand="SELECT [cateID], [cateName] FROM [Category] WHERE (([parentID] IS NULL) AND ([cateID] &lt;&gt; @cateID)) order by [cateName]  asc ">
            <SelectParameters>
                <asp:Parameter DefaultValue="0" Name="cateID" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
             </td>
             
         </tr>
         <tr>
             <td class="style8">
                 Tiêu Đề Bài Viết :</td>
             <td>
        <asp:TextBox ID="txtTieuDe" runat="server" Height="36px" Width="516px"></asp:TextBox>
             </td>
         </tr>
         <tr>
             <td class="style8">
                 Tóm Tắt Bài Viết :</td>
             <td>
        <asp:TextBox ID="txtMoTa" runat="server" Height="97px" TextMode="MultiLine" 
            Width="532px"></asp:TextBox>
             </td>
         </tr>
         <tr>
             <td class="style8">
                 Nội Dung
             </td>
             <td>
    <FCKeditorV2:FCKeditor ID="fckNoidung" runat="server" Height="600px" 
        Width="800px">
    </FCKeditorV2:FCKeditor>
             </td>
         </tr>
         <tr>
             <td class="style8">
                 Hình Ảnh
             </td>
             <td>
                 <asp:FileUpload ID="fileHinhAnh" runat="server" Height="22px" 
        Width="228px" />
    <asp:Button ID="btnTaiLen" runat="server" Text="Tải Ảnh Lên" 
        onclick="btnTaiLen_Click" />
    <asp:Label ID="Label2" runat="server" Text="Label" Visible="False"></asp:Label>
             </td>
         </tr>
         <tr>
             <td class="style8">
                 Tên Tác Giả</td>
             <td>
                 <asp:TextBox ID="txtTacGia" runat="server" Height="22px" 
        Width="233px"></asp:TextBox>
             </td>
         </tr>
         <tr>
             <td class="style8">
                 Ngày Đăng</td>
             <td>
                 <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
             </td>
         </tr>
     </table>
     <p class="style3" title="Thêm Bài Viết">
    <asp:Button ID="btnThemBai" runat="server" Height="32px" Text="THÊM BÀI VIẾT" 
        Width="149px" onclick="btnThemBai_Click" Font-Bold="True" />
        <asp:Button ID="btnNhapLai" runat="server" Height="32px" 
            onclick="btnNhapLai_Click" Text="NHẬP LẠI" Width="149px" Font-Bold="True" />
     </p>
    <p>
    
        &nbsp;</p>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
    <br />
    <div class="noidung">
    <p>
        &nbsp;</p>
    <br />
    <br />
    <p>
        &nbsp;&nbsp;
        </p>
    </div>
</asp:Content>
