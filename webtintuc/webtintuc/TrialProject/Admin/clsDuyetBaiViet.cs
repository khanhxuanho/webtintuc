using System;
using System.Data;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Data.SqlClient;

namespace TrialProject.Admin
{
    public class clsDuyetBaiViet
    {
       
        clsDatabase db = new clsDatabase();
        public void duyetbaiviet(baiviet viet)
        {
            SqlConnection con = db.Getconnect();
            con.Open();
            SqlCommand cmd = new SqlCommand("duyetbaiviet", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@newsid", SqlDbType.Int).Value = viet.Newsid;
            cmd.Parameters.Add("@content", SqlDbType.NVarChar).Value = viet.content;
            cmd.ExecuteNonQuery();
            cmd.Dispose();
            con.Close();
        }
    }
}
