<%@ Page Language="C#" MasterPageFile="~/Admin/adminchinhsua.Master" AutoEventWireup="true" CodeBehind="DuyetBaiViet.aspx.cs" Inherits="TrialProject.Admin.WebForm1" Title="Untitled Page" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit.HTMLEditor"
    TagPrefix="cc1" %>

<%@ Register Assembly="FredCK.FCKeditorV2" Namespace="FredCK.FCKeditorV2" TagPrefix="FCKeditorV2" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <cc2:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
    </cc2:ToolkitScriptManager>
    <asp:GridView ID="grvDanhSachCanDuyet" runat="server" 
        onrowcommand="grvDanhSachCanDuyet_RowCommand">
        <Columns>
            <asp:ButtonField Text="Duyệt" CommandName=" Duyet " />    
        </Columns>
    </asp:GridView>
    <br />
    NỘI DUNG BÀI VIẾT.<br />
    <cc1:Editor ID="Editor1" runat="server" Height="500px" Width="750px" />
    <br />
    <asp:Button ID="btnDuyet" runat="server" Text="DUYỆT XONG" 
        onclick="btnDuyet_Click" Font-Bold="True" />
&nbsp;
    <asp:Button ID="Button1" runat="server" Text="BỎ QUA" Font-Bold="True" />
</asp:Content>
