<%@ Page Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Noidung.aspx.cs" Inherits="TrialProject.WebForm5" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
    .style5
    {
        width: 100%;
    }
    .style6
    {
        width: 695px;
        border:solid 2px silver;
        -moz-border-radius:3px;
    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
    ConnectionString="<%$ ConnectionStrings:connect %>" 
    
    SelectCommand="SELECT [newsid],[cateid], [title], [DESCRIPTION], [content], [author],[username], [picture], [createdate] FROM [News] WHERE ([newsid] = @newsid)">
        <SelectParameters>
            <asp:QueryStringParameter Name="newsid" QueryStringField="mbv" Type="String" />   
        </SelectParameters>
</asp:SqlDataSource>
<table class="style5">
    <tr>
        <td class="style6">
            <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1" 
    Width="90%" Height="785px" style="margin-right: 0px;"
                onupdatecommand="DataList1_UpdateCommand" 
                onitemdatabound="DataList1_ItemDataBound" onload="DataList1_Load">
        <SeparatorStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" 
            Font-Strikeout="False" Font-Underline="False"  />
    <ItemTemplate>
        <asp:Label ID="lblnewsid" runat="server" Text='<%# Eval("newsid") %>' 
            Visible="False" ></asp:Label>
          
        <asp:Label ID="Label1" runat="server" Text='<%# Eval("title") %>'
            Font-Size="24px" ForeColor="Blue"></asp:Label>
        <br />
        <asp:Image ID="Image4" runat="server" ImageUrl="~/image/menu/date.gif" />
        <asp:Label ID="lblcreatedate" runat="server" Text='<%# Eval("createdate") %>'></asp:Label>
        <asp:Label ID="lblcateid" runat="server" Text='<%# Eval("cateid") %>' Visible="False"></asp:Label>
        &nbsp;|
        <asp:ImageButton ID="ImageButton1" runat="server" 
            ImageUrl="~/image/menu/user.gif" />
        <asp:HyperLink ID="HyperLink2" runat="server" 
            NavigateUrl='<%# Eval("username","baiviettheotacgia.aspx?author={0}") %>' 
            Text='<%# Eval("username") %>'></asp:HyperLink>
        &nbsp;|
        <asp:Image ID="Image5" runat="server" ImageUrl="~/image/menu/view.gif" 
            Width="16px" />
        <asp:Label ID="lblsonguoi" runat="server" Text="Label"></asp:Label>
        &nbsp;|
        <asp:Image ID="Image6" runat="server" ImageUrl="~/image/menu/comment.gif" />
        <asp:Label ID="lblsonguoicoment" runat="server" Text="Label"></asp:Label>
        <br />
        <br />
        <asp:Label ID="Label3" runat="server" Text='<%# Eval("DESCRIPTION") %>' 
            Font-Italic="True"></asp:Label>
        <br />
        <br />
        <asp:Image ID="Image7" runat="server" ImageUrl='<%# Eval("picture") %>' Width="500px" />
        <br />
        <br />
        <asp:Literal ID="Literal1" runat="server" Text='<%# Eval("content") %>'></asp:Literal>
        <br />
        <br />
        <div style="text-align:right; font-weight:bold; font-size:18px;">
        <asp:Label ID="Label4" runat="server" Text='<%# Eval("author") %>' 
            style="text-align: right"></asp:Label></div>
        <br />
    </ItemTemplate>
</asp:DataList>
        </td>
        <td style="vertical-align: top; border: solid 1px gray">
            <br />
            <asp:ImageButton ID="ImageButton4" runat="server" Height="250px" 
                ImageUrl="~/image/banner/banner-tt-vious2.gif" Width="100%" />
            <br />
            <br />
            <asp:ImageButton ID="ImageButton3" runat="server" 
                ImageUrl="~/image/banner/dantri-300x250_3.gif" />
        </td>
    </tr>
</table>
    <br />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        DataSourceID="SqlDataSource2" Width="599px">
        <Columns>
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:Image ID="Image3" runat="server" ImageUrl="~/image/menu/comment.gif" />
                    &nbsp;<asp:Label ID="Label8" runat="server" Text='<%# Eval("readername") %>' 
                        Font-Italic="True" Font-Names="Tahoma" Font-Size="13px" ForeColor="#CC0000"></asp:Label>
                    <br />
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Label ID="Label9" runat="server" Text='<%# Eval("email") %>' 
                        Font-Italic="True" Font-Names="Tahoma" Font-Size="13px"></asp:Label>
                    <br />
                    <asp:Literal ID="Literal2" runat="server" Text='<%# Eval("content") %>'></asp:Literal>
                </ItemTemplate>
                <HeaderTemplate>
                    Ý Kiến Bạn Đọc
                </HeaderTemplate>
                <ItemStyle BorderColor="Silver" BorderStyle="Solid" />
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
        ConnectionString="<%$ ConnectionStrings:connect %>" 
        
        SelectCommand="SELECT [newsid], [readername], [email], [content] FROM [FeedBack] WHERE ([newsid] = @newsid)">
        <SelectParameters>
            <asp:SessionParameter Name="newsid" SessionField="matin" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />
    <asp:Image ID="Image2" runat="server" Height="29px" 
        ImageUrl="~/image/menu/feedback.JPG" Width="100%" />
    <br />
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Label ID="Label5" runat="server" Text="Họ Và Tên:"></asp:Label>
    <asp:TextBox ID="txtHoTen" runat="server"></asp:TextBox>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Label ID="Label6" runat="server" Text="Địa Chỉ Email:"></asp:Label>
    <asp:TextBox ID="txdDiaChiMail" runat="server">
    </asp:TextBox><asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                ControlToValidate="txdDiaChiMail" ErrorMessage="RegularExpressionValidator" 
                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">Nhập sai 
            định dạng Email</asp:RegularExpressionValidator>
    <br style="text-align:left">
    <asp:Label ID="Label10" runat="server" Text="Nội Dung:"></asp:Label></br>
    <br />
    <asp:TextBox ID="txtNoidung" runat="server" Height="95px" TextMode="MultiLine" 
        Width="508px"></asp:TextBox>
&nbsp;<br />
    <br />
    <asp:Button ID="btnBinhLuan" runat="server" Text="Bình Luận" 
        onclick="btnBinhLuan_Click" />
    &nbsp;&nbsp;&nbsp;
    <asp:Button ID="Button1" runat="server" onclick="Button1_Click" 
        Text="Nhập Lại" />





    <!--toang-->
<html>
<head>
  <title>Your Website Title</title>
  
  <meta property="og:url"           content="https://www.your-domain.com/your-page.html" />
  <meta property="og:type"          content="website" />
  <meta property="og:title"         content="Your Website Title" />
  <meta property="og:description"   content="Your description" />
  <meta property="og:image"         content="https://www.your-domain.com/path/image.jpg" />
</head>
<body>

  <!-- Load Facebook SDK for JavaScript -->
 <div id="fb-root"></div>
<script async defer crossorigin="anonymous" src="https://connect.facebook.net/vi_VN/sdk.js#xfbml=1&version=v5.0"></script>
<br />
<div class="fb-share-button" data-href="https://developers.facebook.com/docs/plugins/" data-layout="button" data-size="small">

<a  style="width:120px; float:right; vertical-align: top;
                               margin-right:2px; margin-bottom:3px"
    target="_blank" href="https://www.facebook.com/sharer/sharer.php?u=https%3A%2F%2Fdevelopers.facebook.com%2Fdocs%2Fplugins%2F&amp;src=sdkpreparse" 
class="fb-xfbml-parse-ignore">Chia sẻ</a>

</div>
    <br />
</body>
</html>
    <br />
    <hr />
    <br />
    Các Tin Mới Nhất<br />
    <asp:DataList ID="DataList4" runat="server" DataSourceID="SqlDataSource4">
        <ItemTemplate>
            <asp:HyperLink ID="HyperLink1" runat="server" 
                NavigateUrl='<%# Eval("newsid","noidung.aspx?mbv={0}") %>' 
                Text='<%# Eval("title") %>' ForeColor="blue"></asp:HyperLink>
            <br />
        </ItemTemplate>
    </asp:DataList>
    <asp:SqlDataSource ID="SqlDataSource4" runat="server" 
        ConnectionString="<%$ ConnectionStrings:connect %>" 
        SelectCommand="SELECT [title], [newsid] FROM [News] WHERE ([cateID] = @cateID)">
        <SelectParameters>
            <asp:SessionParameter Name="cateID" SessionField="cateid" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
