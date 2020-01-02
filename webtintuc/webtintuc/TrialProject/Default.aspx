<%@ Page Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true"
    CodeBehind="Default.aspx.cs" Inherits="TrialProject.WebForm3" Title="Trang Chủ" %>

<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="TrialProject" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
    .style3
    {
        width: 100%;
    }
        .style4
        {
        width: 450px;
    }
        .style8
        {
            width: 100%;
            height:auto;
            
        }
        .style10
        {
            width: 155px;
            border: 1px solid transparent;
            margin: 0px;
        }
        .style14
        {
            width: 200px;
            height: 26px;
        }
        .style15
        {
            width: 230px;
            height: 274px;
        }
        .style16
        {
        	text-align:center;
        	background-color:Silver;
        }
        .can
        {text-align:center;
        <%-- margin-left:16px;--%>
        }
        .style17
        {
            width: 96px;
        }
        .style18
        {
            border-left:solid 1px silver;
            border-top:solid 1px silver;
            border-bottom:solid 1px silver;
            width:200px;
            margin-bottom:2px;
            margin-left:2px;
            margin-right:3px;
        }
        .style19
        {
            border-left: solid 1px silver;
            border-top: solid 1px silver;
            border-bottom: solid 1px silver;
            width: 290px;
            height: 396px;
        }
        .phancachtrang
        {
        	
        	background-image:url('../image/menu/phancach_muc.gif');
        	background-repeat:no-repeat;
        	height:30px;
        	-moz-border-radius:5px;
        	-border-radius:5px;
        	 -webkit-border-radius: 5px; 
            width:200px;
       }
       .dinhdangchohr
       {
       	margin-top:0px;
        }
       .anh
       {
    	}
    	.khungdulieu
    	{
            border-bottom:solid 1px green;
            border-left:solid 1px green;
            border-right:solid 1px green;
            border-top:solid 2px blue;
            width:100%;
            height:auto;
            margin-top:0px;
            margin-bottom:3px;
           -moz-border-radius:5px;
          
           margin-right:4px;
            
    	}	
       a
       {text-decoration:none;}
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="style3" style="vertical-align: top;" cellpadding="0" cellspacing="0">
        <tr>
            <td class="style10" style="vertical-align: top" rowspan="5">
                <asp:DataList ID="DataList3" runat="server" DataSourceID="SqlDataSource3" BorderColor="#00CC00"
                    BorderStyle="Double" BorderWidth="1px" DataKeyField="newsid">
                    <ItemTemplate>
                        <table class="style8">
                            <tr>
                                <td class="style16">
                                    <asp:ImageButton ID="ImageButton6" runat="server" Height="100%" ImageUrl='<%# Eval("picture") %>'
                                        Width="100%" ImageAlign="Middle" ToolTip='<%# Eval("title") %>' BorderColor="#00CC00"
                                        PostBackUrl='<%# Eval("newsid","noidung.aspx?mbv={0}") %>' />
                                    <br />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl='<%# Eval("newsid","noidung.aspx?mbv={0}") %>'
                                        Text='<%# Eval("title") %>'></asp:HyperLink>
                                    <br />
                                    <asp:Literal ID="Literal1" runat="server" Text='<%# Eval("DESCRIPTION") %>'></asp:Literal>
                                </td>
                            </tr>
                        </table>
                        <br />
                    </ItemTemplate>
                </asp:DataList>
                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:connect %>"
                    SelectCommand="SELECT Top(1) newsid, title, DESCRIPTION, picture, createdate FROM News WHERE (active = '1') ORDER BY createdate DESC">
                </asp:SqlDataSource>
                <br />
                <div style="margin-left: 16px">
                    <asp:Label ID="Label3" Font-Bold="true" ForeColor="Blue" runat="server" Text="Tin Chính Khác"></asp:Label></div>
                <asp:DataList ID="DataList2" runat="server" DataSourceID="SqlDataSource2" RepeatDirection="Horizontal"
                    DataKeyField="newsid" BorderColor="#00CC00" BorderStyle="Double" BorderWidth="1px">
                    <ItemTemplate>
                        <table class="style8">
                            <tr>
                                <td class="style17">
                                    <asp:ImageButton ID="ImageButton8" runat="server" Height="170px" ImageUrl='<%# Eval("picture") %>'
                                        Width="120px" BorderColor="#3333FF" ToolTip='<%# Eval("title") %>' BorderStyle="Double"
                                        PostBackUrl='<%# Eval("newsid","noidung.aspx?mbv={0}") %>' />
                                </td>
                                <td style="width: 90px;">
                                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# Eval("newsid","noidung.aspx?mbv={0}") %>'
                                        Text='<%# Eval("title") %>'></asp:HyperLink>
                                </td>
                            </tr>
                        </table>
                        <br />
                    </ItemTemplate>
                </asp:DataList>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:connect %>"
                    SelectCommand="SELECT top 3 [title], [picture], [DESCRIPTION], [newsid] FROM [News]">
                </asp:SqlDataSource>
                <div style="margin-right: 2px;">
                    <asp:DataList ID="DataList4" runat="server" Width="100%" DataSourceID="SqlDataSource4">
                        <ItemTemplate>
                            <div class="phancachtrang">
                                <asp:Label ID="cateNameLabel" runat="server" Text='<%# Eval("cateName") %>' Width="200px" ForeColor="White" />
                                
                            </div>
                            <div class="khungdulieu">
                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("cateID") %>' Visible="False"></asp:Label>
                                <br />
                              <%--  <div>--%>
                                <asp:DataList ID="DataList5" runat="server" DataKeyField="newsid" DataSourceID="SqlDataSource1"
                                    Width="100%" style="width:320px;float:left">
                                    <ItemTemplate>
                                        <table class="style8">
                                            <tr>
                                                <td>
                                                    <asp:ImageButton ID="ImageButton9" runat="server" Height="90px" ImageUrl='<%# Eval("picture") %>'
                                                        Width="90px" PostBackUrl='<%# Eval("newsid", "noidung.aspx?mbv={0}") %>' ToolTip='<%# Eval("title") %>' />
                                                </td>
                                                <td>
                                                    <asp:HyperLink ID="HyperLink4" runat="server" NavigateUrl='<%# Eval("newsid", "noidung.aspx?mbv={0}") %>'
                                                        Text='<%# Eval("title") %>'  ></asp:HyperLink>
                                                    <br />
                                                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("DESCRIPTION") %>' style="text-align:justify" ></asp:Label>
                                                </td>
                                            </tr>
                                        </table>
                                        <br />
                                    </ItemTemplate>
                                </asp:DataList>
                              <%--  </div>
                                <div style="float:">--%>
                                <asp:DataList ID="DataList6" runat="server" DataSourceID="SqlDataSource2" style="width:240px;float:left">
                                    <ItemTemplate>
                                        <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/image/menu/icon_title.gif" />
                                        <asp:HyperLink ID="HyperLink5" runat="server" NavigateUrl='<%# Eval("newsid","noidung.aspx?mbv={0}") %>'
                                            Text='<%# Eval("title") %>'></asp:HyperLink>
                                          <%--    <asp:ImageButton ID="ImageButton10" runat="server" ImageUrl="~/image/menu/icon_title.gif" style="float:right" />--%>
                                    </ItemTemplate>
                                </asp:DataList>
                               <%-- </div>--%>
                            </div>
                            <br />
                            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:connect %>"
                                SelectCommand="SELECT top 3 [newsid], [title] FROM [News] WHERE ([cateID] = @cateID and active='1' )order by createdate desc">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="Label1" Name="cateID" PropertyName="Text" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:connect %>"
                                SelectCommand="SELECT top 1 [newsid], [cateID], [title], [DESCRIPTION], [picture] FROM [News] WHERE ([cateID] = @cateID)">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="Label1" Name="cateID" PropertyName="Text" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </ItemTemplate>
                    </asp:DataList>
                </div>
                <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                    SelectCommand="SELECT [cateName], [cateID] FROM [Category] WHERE (([parentID] IS NULL) AND ([cateID] &lt;&gt; @cateID) AND ([cateID] &lt;&gt; @cateID2)and [cateid]!='0')">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="1" Name="cateID" Type="Int32" />
                        <asp:Parameter DefaultValue="2" Name="cateID2" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <br />
            </td>
            <td style="vertical-align: top; text-align: left" class="style19">
                <%--  <asp:Label ID="Label4" runat="server" Text="TIN TỨC MỚI NHẤT" 
                BorderStyle="Ridge" Width="250px" CssClass="can"  ForeColor="White" 
                BackColor="Blue" Font-Bold="True"></asp:Label>  --%>
                <p style="text-align: center; background: blue; color: White; font-weight: bold;
                    border-style: Ridge; margin: 0px; padding: 0px">
                    TIN TỨC MỚI NHẤT</p>
                <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1" Font-Bold="False"
                    Font-Italic="False" Font-Overline="False" Font-Strikeout="False">
                    <ItemTemplate>
                        <asp:ImageButton ID="ImageButton5" runat="server" Height="10px" ImageUrl="~/image/menu/see_detail.gif"
                            Width="10px" />
                        <a href='<%# Eval("newsid","noidung.aspx?mbv={0}")%>'>
                            <%# Eval("title") %></a>
                    </ItemTemplate>
                </asp:DataList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:connect %>"
                    SelectCommand="SELECT top 10 [newsid], [title] FROM [News] where active='1' ORDER BY [createdate] DESC">
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td style="vertical-align: top;" class="style18">
                <asp:DataList ID="DataList7" runat="server" DataSourceID="SqlDataSource5" CssClass="anh">
                    <ItemTemplate>
                        <asp:ImageButton ID="ImageButton11" runat="server" Height="270px" ImageUrl='<%# Eval("image") %>'
                            Width="100%" CssClass="anh" BorderWidth="1px" BorderColor="Silver" />
                    </ItemTemplate>
                </asp:DataList>
                <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:connect %>"
                    SelectCommand="SELECT [image], [urlbanner] FROM [Banner] WHERE ([locationid] = @locationid) order by [order] desc">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="3" Name="locationid" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
    </table>
</asp:Content>
