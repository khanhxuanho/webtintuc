<%@ Page Language="C#" MasterPageFile="~/Admin/adminchinhsua.Master" AutoEventWireup="true" CodeBehind="QuanLyBanner.aspx.cs" Inherits="TrialProject.Admin.WebForm6" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style8
        {
            width: 100%;
            border-style: solid;
            border-width: 1px;
            font-weight: bold;
        }
        .khungthembanner
        {
        	border:solid 1px gray;
        	width:400px;
        	text-align:center;
        	
        }
        .style9
        {
            text-align: center;
        }
        .style10
        {
            width: 100%;
        }
        .style11
        {
            width: 120px;
            text-align: right;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="style8">
        <tr>
            <td>
               <center> QUẢN LÝ BANNER </center><br />
                <div class="khungthembanner">
                    <table class="style10">
                        <tr>
                            <td class="style11">
                                Logo:
                            </td>
                            <td>
                                <asp:FileUpload ID="fileHinhAnh" runat="server" Width="259px" />
                            </td>
                        </tr>
                        <tr>
                            <td class="style11">
                                Đường Dẫn: &nbsp;</td>
                            <td>
                                <asp:TextBox ID="txtDuongDan" runat="server" Width="260px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="style11">
                                Vị Trí:
                            </td>
                            <td style="text-align: left">
&nbsp;<asp:DropDownList ID="DropDownList2" runat="server" Height="22px" Width="115px" 
                                    DataSourceID="SqlDataSource3" DataTextField="locationname" 
                                    DataValueField="locationid">
                                </asp:DropDownList>
                                                        <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
                                    ConnectionString="<%$ ConnectionStrings:connect %>" 
                                    SelectCommand="SELECT [locationid], [locationname] FROM [Location]">
                                </asp:SqlDataSource>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="style11">
                                                            Thứ Tự:
                                                        </td>
                                                        <td style="text-align: left">
&nbsp;<asp:TextBox ID="txtThuTu" runat="server"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="style11">
                                                            Trạng Thái:
                                                        </td>
                                                        <td style="text-align: left">
                                                            <asp:DropDownList ID="ddlHienThi" runat="server">
                                                                <asp:ListItem Value="True">Hiển Thị</asp:ListItem>
                                                                <asp:ListItem Value="False">Không Hiển Thị</asp:ListItem>
                                                            </asp:DropDownList>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="style11">
                                                            Ghi Chú:
                                                        </td>
                                                        <td style="text-align: left">
                                                            <asp:TextBox ID="txxtGhiChu" runat="server"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                </table>
                <br />
                <asp:Button ID="btnTaiLen" runat="server" Text="Thêm Banner" 
                        onclick="btnTaiLen_Click1" Font-Bold="True" />
                </div>
            </td>
        </tr>
        <tr>
            <td class="style9">
                <div class="style9">
                <br />
                
                </div>
            </td>
        </tr>
        <tr>
            <td class="style9">
                <div class="style9">
                    Chọn Vị Trí:<asp:DropDownList ID="DropDownList1" runat="server" 
                        DataSourceID="SqlDataSource2" DataTextField="locationname" 
                        DataValueField="locationid" AutoPostBack="True" >
                        <asp:ListItem Selected="True">--Tất Cả Vị Trí--</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:connect %>" 
                    SelectCommand="SELECT [locationid], [locationname] FROM [Location]">
                </asp:SqlDataSource>
            
            <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1" 
                    onupdatecommand="DataList1_UpdateCommand">
                    <ItemTemplate>
                        <table cellpadding="0" cellspacing="0" border="1">
                            <tr>
                                 <td width="160px">
                                    <asp:Image ID="Image1" runat="server" Height="75px" 
                                        ImageUrl='<%# Eval("image") %>' Width="160px" />
                                </td>
                                <td>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("bannerid") %>' 
                                        Visible="False"></asp:Label>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("urlbanner") %>' 
                                        Width="300px"></asp:Label>
                                </td>
                                 <td>
                                     <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Eval("status") %>' />
                                 </td>
                                <td style="vertical-align: middle; text-align:center;" width="50">
                                    <asp:ImageButton ID="ImageButton1" runat="server" 
                                        ImageUrl="~/image/menu/Edit.gif" PostBackUrl='<%#Eval("bannerid","capnhatbanner.aspx?banner={0}") %>' />
                                </td>
                                <td style="vertical-align: middle; text-align:center;" width="50">
                                    <asp:ImageButton ID="ImageButton2" runat="server" 
                                        ImageUrl="~/image/menu/delete.gif" onclick="ImageButton2_Click1" 
                                        style="height: 19px" />
                                </td>
                            </tr>
                        </table>
                    </ItemTemplate>
                </asp:DataList>

                <br />
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:connect %>"  
                    SelectCommand="SELECT [image], [urlbanner], [status], [bannerid] FROM [Banner] WHERE ([locationid] = @locationid)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownList1" Name="locationid" 
                            PropertyName="SelectedValue" Type="Int32" />
                    </SelectParameters>
                    
                </asp:SqlDataSource>
            </td>
        </tr>
    </table>
</asp:Content>
