<%@ Page Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="BaiVietNho.aspx.cs" Inherits="TrialProject.WebForm6" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1">
        <ItemTemplate>
            cateID:
            <asp:Label ID="cateIDLabel" runat="server" Text='<%# Eval("cateID") %>' />
            <br />
            title:
            <asp:Label ID="titleLabel" runat="server" Text='<%# Eval("title") %>' />
            <br />
            DESCRIPTION:
            <asp:Label ID="DESCRIPTIONLabel" runat="server" 
                Text='<%# Eval("DESCRIPTION") %>' />
            <br />
            picture:
            <asp:Label ID="pictureLabel" runat="server" Text='<%# Eval("picture") %>' />
            <br />
            <br />
        </ItemTemplate>
    </asp:DataList>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:connect %>" 
        SelectCommand="SELECT [cateID],[parentid] [title], [DESCRIPTION], [picture] FROM [News],[category] WHERE ([cateID] = @cateID) and [parentid] is not null">
        <SelectParameters>
            <asp:QueryStringParameter Name="cateID" QueryStringField="mid" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
