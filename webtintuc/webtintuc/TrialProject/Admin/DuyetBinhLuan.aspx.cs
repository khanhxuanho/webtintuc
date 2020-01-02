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
using System.Data.SqlClient;

namespace TrialProject.Admin
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }
        clsDatabase db = new clsDatabase();
        SqlConnection con;
        SqlCommand cmd;
        protected void Button1_Click(object sender, EventArgs e)
        {
            con = db.Getconnect();
            con.Open();
            string sql = "update feedback where newsid='" + DropDownList1.SelectedValue.ToString() + "'";
            cmd = new SqlCommand(sql, con);
            cmd.ExecuteNonQuery();
            cmd.Dispose();
            Response.Write("<script language='javascript'>alert('Thêm Bình Luận Thành Công')</script>");
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {

        }
    }
}
