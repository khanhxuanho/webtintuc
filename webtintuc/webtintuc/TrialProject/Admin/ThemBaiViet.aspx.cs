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

namespace TrialProject.Admin
{
    public partial class WebForm3 : System.Web.UI.Page
    {  
        clsDatabase db = new clsDatabase();

        protected void Page_Load(object sender, EventArgs e)
        {
            txtTacGia.Text = db.ExcuteScalar("select fullname from acount where username='" + Session["username"].ToString() + "'");
            Label1.Text = DateTime.Now.ToString();
        }
        public void LamMoi()
        {
            txtTieuDe.Text = ""; txtTacGia.Text = ""; txtMoTa.Text = "";
            fckNoidung.Value = "";

        }
        public int mabaiviet()
        {
            int kq = 0;
            string sql = "Select max(newsid) from news";
            try
            {
                kq = int.Parse(db.ExcuteScalar(sql));
            }
            catch
            {
                kq = 0;
            }
            return kq;
        }

        baiviet bviet = new baiviet();

        protected void btnThemBai_Click(object sender, EventArgs e)
        {
            int mbv = mabaiviet() + 1;
            //Response.Write("<script language='javascript'>alert('" + mbv.ToString() + "')</script>");
            try
            {
                bviet.Newsid = mbv;
                bviet.Cateid = int.Parse(DropDownList1.SelectedValue.ToString());
                bviet.Title = txtTieuDe.Text;
                bviet.description = txtMoTa.Text;
                bviet.content = fckNoidung.Value;
                bviet.username = Session["username"].ToString();
                bviet.author = txtTacGia.Text;
                bviet.picture = Label2.Text;
                bviet.createdate = Label1.Text;
                bviet.link = "";
                bviet.active = 0;
                bviet.views = 0;
                bviet.insert(bviet);
                LamMoi();
            }
            catch (Exception ex)
            {
                Label1.Text = ex.Message.ToString();
            }
        }

        protected void btnTaiLen_Click(object sender, EventArgs e)
        {
            HttpPostedFile file = fileHinhAnh.PostedFile;
            if (fileHinhAnh.HasFile == false || file.ContentLength > 5000000)
            {
                //Label1.Text = "khong thanh cong file khong co";
                Response.Write("<script language='javascript'> alert('UpLoad không thành công. File Không Tồn Tại')</script>");
            }
            else
            {
                try
                {
                    string path = Server.MapPath("~/image/" + fileHinhAnh.FileName);
                    fileHinhAnh.SaveAs(path);
                    //txtDuongDan.Text = "~/image/" + upload.FileName.ToString();
                    // Response.Write("<script language='javascript'> alert('UpLoad Thành Công.')</script>");
                    Label2.Text = "~/image/" + fileHinhAnh.FileName.ToString();
                }
                catch (Exception ex)
                {
                    Response.Write("<script language='javascript'> alert('Upload Thất Bại. Vui lòng thử lại.')</script>");
                }
            }
        }

        protected void btnNhapLai_Click(object sender, EventArgs e)
        {
            LamMoi();
        }
      
    }
}
