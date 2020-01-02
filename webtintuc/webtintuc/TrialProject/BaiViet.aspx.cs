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
    public partial class WebForm4 : System.Web.UI.Page
    {
        clsDatabase db = new clsDatabase();
        protected void Page_Load(object sender, EventArgs e)
        {
            int a = int.Parse(Request.QueryString["mid"].ToString());
            int b = 1;
            {
                string chuoi = "Select cateID,newsid,title,DESCRIPTION,content,picture,createdate FROM News WHERE cateID = '" + a + "' AND active ='" + b + "'";
                DataList3.DataSource = db.GetTable(chuoi);
                DataList3.DataBind();
            }
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}
