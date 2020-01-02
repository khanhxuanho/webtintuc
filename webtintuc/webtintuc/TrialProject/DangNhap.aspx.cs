using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Xml.Linq;

namespace TrialProject
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Label8.Visible = false;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            DangNhap dn = new DangNhap();
            //so sánh giá trị nhận được ở Dangnhap.cs xem vào trường hợp nào
            
            int t=dn.CheckLogin(TextBox1.Text,TextBox2.Text);
            //nếu !=1 là user
            if(t!=1&&t>0)
            {
                Session["username"]=TextBox1.Text;
                Session["role"]=TextBox2.Text;
                Label8.Text="dang nhap thanh cong";
                Response.Redirect("~/User/ThemBaiVietuser.aspx");
            }
            if (t == 1)
            {
                Session["username"] = TextBox1.Text;
                Session["role"] = TextBox2.Text;
                Response.Redirect("~/Admin/ThemBaiViet.aspx");
            }
            else
            {
                Label8.Visible = true;
                Label8.Text = "Đăng Nhập Không Thành Công";
            }
        }
    }
}
