using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

namespace TrialProject
{
    public partial class MasterPage : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect("DangNhap.aspx");
        }

        protected void btnTimKiem_Click(object sender, EventArgs e)
        {
            clsTimKiem tim = new clsTimKiem();
            //lưu từ khóa cần tìm vào biế session["timkiem"]
            Session["timkiem"] = tim.timkiem(txtTimKiem.Text);
            //gọi đến form timkiem.aspx để xem kết quả
            Response.Redirect("TimKiem.aspx");
        }
    }
}
