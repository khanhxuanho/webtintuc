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
    public partial class WebForm1 : System.Web.UI.Page
    {
        clsDatabase db = new clsDatabase();
        protected void Page_Load(object sender, EventArgs e)
        {
            db.loadGridView("select newsid as[Mã Tin],title as[Tiêu Đề],description as[Tóm Tắt],createdate as[Ngày Tạo], author as[Tác Giả] from news where active=0", grvDanhSachCanDuyet);
        }

        protected void grvDanhSachCanDuyet_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int index = int.Parse(e.CommandArgument.ToString());
            
                var ac = new clsDatabase();
                SqlDataReader reader = ac.ExecuteReader1(@"SELECT newsid,[content]
                                    from News
                                    Where newsid=" + int.Parse(grvDanhSachCanDuyet.Rows[index].Cells[1].Text) + "");
                while (reader.Read())
                {
                    Editor1.Content= reader[1].ToString();
                }
                reader.Close();
                ViewState["newsid"] = int.Parse(grvDanhSachCanDuyet.Rows[index].Cells[1].Text);
            
        }

        protected void btnDuyet_Click(object sender, EventArgs e)
        {
            try
            {
                clsDuyetBaiViet duyet = new clsDuyetBaiViet();
                baiviet bv = new baiviet();
               
                    bv.Newsid = int.Parse(ViewState["newsid"].ToString());
                    bv.content = Editor1.Content;
               
                
                duyet.duyetbaiviet(bv);
                Response.Redirect("~/Admin/duyetbaiviet.aspx");
            }
            catch(Exception ex)
            { throw; }
        }
    }
}
