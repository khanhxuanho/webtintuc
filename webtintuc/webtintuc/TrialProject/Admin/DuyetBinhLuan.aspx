<%@ Page Language="C#" MasterPageFile="~/Admin/adminchinhsua.Master" AutoEventWireup="true" CodeBehind="DuyetBinhLuan.aspx.cs" Inherits="TrialProject.Admin.WebForm2" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="margin-left:10px">
    Chọn Bản Tin:
    <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" 
        DataSourceID="SqlDataSource1" DataTextField="newsid" DataValueField="newsid">
    </asp:DropDownList>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:connect %>" 
        SelectCommand="SELECT distinct [newsid], [active] FROM [FeedBack] WHERE ([active] = @active)">
        <SelectParameters>
            <asp:Parameter DefaultValue="0" Name="active" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />
    Nội Dung Bản Tin:<asp:GridView ID="GridView2" runat="server" 
        AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource3" 
        ForeColor="#333333" GridLines="None">
        <RowStyle BackColor="#EFF3FB" />
        <Columns>
            <asp:BoundField DataField="title" HeaderText="Tiêu Đề" SortExpression="title" />
            <asp:BoundField DataField="DESCRIPTION" HeaderText="Tóm Tắt" 
                SortExpression="DESCRIPTION" />
            <asp:BoundField DataField="author" HeaderText="Tác Giả" 
                SortExpression="author" />
            <asp:BoundField DataField="createdate" HeaderText="Ngày Đăng" 
                SortExpression="createdate" />
        </Columns>
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <EditRowStyle BackColor="#2461BF" />
        <AlternatingRowStyle BackColor="White" />
    </asp:GridView>
    <br />
    <br />
    Các Bình Luận:
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
        ConnectionString="<%$ ConnectionStrings:connect %>" 
        SelectCommand="SELECT [title], [DESCRIPTION], [author], [createdate] FROM [News] WHERE ([newsid] = @newsid)">
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownList1" Name="newsid" 
                PropertyName="SelectedValue" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        DataSourceID="SqlDataSource2" onrowcommand="GridView1_RowCommand">
        <Columns>
            <asp:ButtonField Text="Duyệt" />
            <asp:BoundField DataField="readername" HeaderText="Tên Độc Giả" 
                SortExpression="readername" />
            <asp:BoundField DataField="email" HeaderText="email" SortExpression="email" />
            <asp:BoundField DataField="content" HeaderText="Nội Dung Bình Luận" 
                SortExpression="content" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
        ConnectionString="<%$ ConnectionStrings:connect %>" 
        SelectCommand="SELECT [newsid], [readername], [email], [content] FROM [FeedBack] WHERE ([newsid] = @newsid)">
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownList1" Name="newsid" 
                PropertyName="SelectedValue" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />
    Nội Dung Bình Luận
    <br />
    <asp:TextBox ID="TextBox1" runat="server" Height="173px" TextMode="MultiLine" 
        Width="655px"></asp:TextBox>
    <br />
    <asp:Button ID="Button1" runat="server" Text="Duyệt Bình Luận" 
        Font-Bold="True" onclick="Button1_Click" />
    <asp:Button ID="Button2" runat="server" Text="Xóa Bình Luận" Font-Bold="True" />
    <br />
   </div>
</asp:Content>
