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
using System.Text;
using System.Data.SqlClient;
using System.IO;

namespace TrialProject.Admin
{
    public partial class WebForm8 : System.Web.UI.Page
    {
        clsDatabase ac = new clsDatabase();
        public void WriteSiteMap()
        {
            StringBuilder sb = new StringBuilder();//Đầu tiên tạo 1 stringbuilder
            //Nối dữ liệ trong sitemap vào sb này
            sb.Append("<?xml version=" + "'1.0'" + " encoding=" + "'utf-8'" + " ?>");
            sb.Append("\n<siteMap xmlns='" + "http://schemas.microsoft.com/AspNet/SiteMap-File-1.0" + "'>");
            sb.Append("\n<siteMapNode url=" + "''" + " title=" + "''" + "  description=" + "''" + ">");
            SqlDataReader reader = ac.ExecuteReader1("select * from Category");//đầu tiên, chúng ta sẽ đọc toàn bộ bảng tbl_Menu
            while (reader.Read())//trong khi đọc
            {
                //Cứ mỗi lần lướt qua 1 menu, ta tìm xem menu đó có menu con không
                DataTable dt = ac.GetTable("select cateName,link from Category where parentID=" + int.Parse(reader[0].ToString()) + "");
                if (dt.Rows.Count > 0)//Chèn menu có menu con
                {
                    //THẻ mở
                    sb.Append("\n<siteMapNode url='" + reader[2].ToString() + "' title='" + reader[1].ToString() + "'  description='" + "" + "'>");
                    for (int i = 0; i < dt.Rows.Count; i++)
                    {
                        //Các menu con
                        sb.Append("\n<siteMapNode url='" + dt.Rows[i][1].ToString() + "' title='" + dt.Rows[i][0].ToString() + "'  description='" + "" + "'/>");
                    }
                    sb.Append("\n</siteMapNode>");//Thẻ đóng của menu cha đây
                }
                else //Chèn những menu không có menu con
                {
                    if (int.Parse(reader[0].ToString()) != 0 && reader[3].ToString() == "")
                        sb.Append("\n<siteMapNode url='" + reader[2].ToString() + "' title='" + reader[1].ToString() + "'  description='" + "" + "' />");//đóngl uôn
                }
            }
            sb.Append("\n</siteMapNode>");
            sb.Append("\n</siteMap>");
            //Và cuối cùng chúng ta ghi vào file sitemap đó thôi
            File.WriteAllText(Server.MapPath("~\\Menu.sitemap").ToString(), sb.ToString());
        }
        protected void Page_Load(object sender, EventArgs e)
        {
           
        }
        public int MaxMenuID()
        {
            int kq = 0;
            string sql = "Select Max(cateid) from category";
            try
            {
                kq = int.Parse(ac.ExcuteScalar(sql));
            }
            catch
            {
                kq = 0;
            }
            return kq;
        }
        protected void btnThem_Click(object sender, EventArgs e)
        {
            if (int.Parse(ddMenuCha.SelectedValue.ToString()) == 0)
            {
                
                int cateid1 = MaxMenuID() + 1;
                string link = "BaiViet.aspx?mid=" + cateid1;
                string sql = "insert into category(cateid,catename,link) values(" + cateid1 + ",N'" + txtTenMenu.Text + "','"+link+"')";
                ac.ExcuteNonquery(sql);
                WriteSiteMap();
                Response.Redirect("quanlymenu.aspx");
            }
            else
            {
                int cateid = MaxMenuID() + 1;
                string link="BaiViet.aspx?mid="+cateid;
                string sql = "insert into category values('" + cateid + "',N'" + txtTenMenu.Text + "','" + link + "','" + ddMenuCha.SelectedValue.ToString() + "')";
                ac.ExcuteNonquery(sql);
                WriteSiteMap();
                Response.Redirect("quanlymenu.aspx");
            }
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int index = int.Parse(e.CommandArgument.ToString());
            string sql = "delete from category where cateid='" + int.Parse(GridView1.Rows[index].Cells[1].Text) + "'";
            ac.ExcuteNonquery(sql);
            WriteSiteMap();
            Response.Redirect("quanlymenu.aspx");
        }
    }
}
