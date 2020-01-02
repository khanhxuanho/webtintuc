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
   public class Banner
    {
        public int bannerid;
        public string image;
        public string urlbanner;
        public int locationid;
        public int order;
        public string category;
        public bool status;
        public string note;
    }
    public class clsBanner
    {
        clsDatabase db = new clsDatabase();
        SqlCommand cmd;
        SqlConnection con;
        public void ThemBanner(Banner banner)
        {
            con = db.Getconnect();
            con.Open();
            cmd = new SqlCommand("thembanner", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@bannerid", banner.bannerid));
            cmd.Parameters.Add(new SqlParameter("@image", banner.image));
            cmd.Parameters.Add(new SqlParameter("@urlbanner", banner.urlbanner));
            cmd.Parameters.Add(new SqlParameter("@locationid", banner.locationid));
            cmd.Parameters.Add(new SqlParameter("@order", banner.order));
            cmd.Parameters.Add(new SqlParameter("@category", banner.category));
            cmd.Parameters.Add(new SqlParameter("@status", banner.status));
            cmd.Parameters.Add(new SqlParameter("@note", banner.note));
            cmd.ExecuteNonQuery();
            cmd.Dispose();
            con.Close();
        }
    }
}
