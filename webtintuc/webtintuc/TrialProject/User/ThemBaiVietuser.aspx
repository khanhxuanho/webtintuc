<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ThemBaiVietuser.aspx.cs" Inherits="TrialProject.User.ThemBaiVietuser" %>

<%@ Register assembly="FredCK.FCKeditorV2" namespace="FredCK.FCKeditorV2" tagprefix="FCKeditorV2"  %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit.HTMLEditor" tagprefix="cc1" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
</head>
<body>
    <form id="form1" runat="server">
    Chọn Chuyên Mục<asp:DropDownList ID="ddlChuyenMuc" runat="server" 
        DataSourceID="SqlDataSource1" DataTextField="cateName" DataValueField="cateID">
    </asp:DropDownList>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:connect %>" 
        SelectCommand="SELECT [cateID], [cateName] FROM [Category] WHERE (([parentID] IS NULL) AND ([cateID] &lt;&gt; @cateID))">
        <SelectParameters>
            <asp:Parameter DefaultValue="0" Name="cateID" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />
    Nhập Tiêu Đề:<asp:TextBox ID="txtTieuDe" runat="server" Height="24px" 
        Width="287px"></asp:TextBox>
    <br />
    Tóm Tắt:<asp:TextBox ID="txtTomTat" runat="server" Height="115px" 
        TextMode="MultiLine" Width="321px"></asp:TextBox>
    <br />
    Nội Dung<br />
    <cc2:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
    </cc2:ToolkitScriptManager>
    <FCKeditorV2:FCKeditor ID="fckNoiDung1" runat="server">
    </FCKeditorV2:FCKeditor>
    <br />
    Tác Giả:<asp:TextBox ID="txtTacGia" runat="server" Height="22px" Width="232px"></asp:TextBox>
    <br />
    Hình Ảnh:<asp:FileUpload ID="fileHinhAnh" runat="server" />
    <asp:Button ID="btnTaiLen" runat="server" Text="Tải Lên" 
        onclick="btnTaiLen_Click" />
    <asp:Label ID="lblKetQua" runat="server" Text="Label"></asp:Label>
    <br />
    Ngày Đăng:<asp:Label ID="lblNgayDang" runat="server" Text="Label"></asp:Label>
    <br />
    <br />
    <asp:Button ID="btnThemBaiViet" runat="server" Text="Thêm Bài Viết" 
        onclick="btnThemBaiViet_Click" />
</form>
</body>
</html>
