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

namespace TrialProject
{
    public class FeedBack
    {
        public string newid;
        public string readername;
        public string email;
        public string content;
        public int active;

    }
    public class clsfeedback
    {
        clsDatabase db = new clsDatabase();

        public void Them(FeedBack t)
        {
            SqlConnection con = db.Getconnect();
            con.Open();
            SqlCommand cmd = new SqlCommand("ThemFeedBack", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@newsid", SqlDbType.VarChar).Value = t.newid;
            cmd.Parameters.Add("@readername", SqlDbType.NVarChar).Value = t.readername;
            cmd.Parameters.Add("@email", SqlDbType.VarChar).Value = t.email;
            cmd.Parameters.Add("@content", SqlDbType.NVarChar).Value = t.content;
            cmd.Parameters.Add("@active", SqlDbType.Int).Value = t.active;

            cmd.ExecuteNonQuery();
            cmd.Dispose();
            con.Close();
        }
    }
}
