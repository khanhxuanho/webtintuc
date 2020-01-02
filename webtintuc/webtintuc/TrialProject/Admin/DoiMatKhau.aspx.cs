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

namespace TrialProject.Admin
{
    public partial class WebForm5 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }
        clsDoiMatKhau changepass = new clsDoiMatKhau();
        protected void btnThayDoi_Click(object sender, EventArgs e)
        {
            if (txtMatKhauCu.Text == Session["role"].ToString())
            {
                changepass.suataikhoan(Session["username"].ToString(), txtMatKhauMoi.Text);
                lbl.Text = "Đổi Mật Khẩu Thành Công";
                btnHuyBo_Click(sender, e);
            }
            else
            {
                lbl.Text = "Mật Khẩu Nhập Sai";
                txtMatKhauCu.Text = "";
                //Response.Write("<script language='javascript'></script>");
            }
           
        }

        protected void txtMatKhauCu_TextChanged(object sender, EventArgs e)
        {
           
        }

        protected void btnHuyBo_Click(object sender, EventArgs e)
        {
            txtMatKhauCu.Text = ""; 
            txtMatKhauMoi.Text = "";
            txtXacNhan.Text = "";
        }

      
    }
}
