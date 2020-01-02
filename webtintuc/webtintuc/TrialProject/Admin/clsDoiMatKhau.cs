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
    public class clsDoiMatKhau
    {
        clsDatabase db = new clsDatabase();
        public void suataikhoan(string usename,string matkhau)
        {
            SqlConnection con = db.Getconnect();
            con.Open();
            SqlCommand cmd = new SqlCommand("doimatkhau", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@usename", System.Data.SqlDbType.VarChar).Value = usename;
            cmd.Parameters.Add("@password", System.Data.SqlDbType.VarChar).Value = matkhau;
            cmd.ExecuteNonQuery();
            cmd.Dispose();
            con.Close();
        }
    }
}
