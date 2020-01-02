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
using System.Data.SqlClient;

namespace TrialProject.Admin
{
    public partial class QuanLiBaiViet : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            LoadGridView();
           
        }
        clsDatabase db = new clsDatabase();
        public void LoadGridView()
        {
            
            DataTable dt = db.GetTable("SELECT newsid AS [Mã Bài Viết],title AS[Tiêu Đề],author[Tác Giả],createdate[Ngày Đăng] FROM dbo.News ORDER BY createdate DESC");
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int index = int.Parse(e.CommandArgument.ToString());
            if (e.CommandName == "Select")//Load dữ liệu lên các control
            {
                var ac = new clsDatabase();
                SqlDataReader reader = ac.ExecuteReader1(@"SELECT cateID, title, DESCRIPTION, [content],picture,createdate,active
                                    from News
                                    Where newsid=" + int.Parse(GridView1.Rows[index].Cells[2].Text) + "");
                while (reader.Read())
                {
                    
                    txtTieuDe.Text = reader[1].ToString();
                    txtTomTat.Text = reader[2].ToString();
                    fckNoiDung.Value = reader[3].ToString();
                    txtDuongDan.Text = reader[4].ToString();

                    lblcreatedate.Text = reader[5].ToString();
                    Label2.Text = reader[6].ToString();
                }
                reader.Close();
                ViewState["newsid"] = int.Parse(GridView1.Rows[index].Cells[2].Text);
                LoadDROP();
            }
            else if (e.CommandName == "xoa")
            {
                baiviet bv = new baiviet();
                bv.Newsid = int.Parse(GridView1.Rows[index].Cells[2].Text);

                bv.xoabv(bv);
                //hien thi ra hop thoai da xoa thanh cong.
                LoadGridView();
            }
        }
        public void LoadDROP()
        {
            db.LoadDropDownList("select cateid,catename from category", "catename", "cateid", ddlMenu);
        }
        protected void btnSua_Click(object sender, EventArgs e)
        {
            
            baiviet bv = new baiviet();
            bv.Newsid = int.Parse(ViewState["newsid"].ToString());
            bv.Cateid = int.Parse(ddlMenu.SelectedValue.ToString());
            bv.Title = txtTieuDe.Text;
            bv.description = txtTomTat.Text;
            bv.content = fckNoiDung.Value;
            bv.author = lblusername.Text;
            bv.picture = txtDuongDan.Text;
            bv.createdate =(lblcreatedate.Text);
            bv.suabaiviet(bv);
            LoadGridView();
        }

        protected void txtDuongDan_TextChanged(object sender, EventArgs e)
        {

        }
    }
}
