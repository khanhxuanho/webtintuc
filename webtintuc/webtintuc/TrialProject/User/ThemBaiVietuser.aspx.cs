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

namespace TrialProject.User
{
    public partial class ThemBaiVietuser : System.Web.UI.Page
    {
        clsDatabase db = new clsDatabase();
        protected void Page_Load(object sender, EventArgs e)
        {
            txtTacGia.Text = db.ExcuteScalar("select fullname from acount where username='" + Session["username"].ToString() + "'");
            lblNgayDang.Text = DateTime.Now.ToString();
        }

        protected void btnTaiLen_Click(object sender, EventArgs e)
        {
            HttpPostedFile file = fileHinhAnh.PostedFile;
            if (fileHinhAnh.HasFile == false || file.ContentLength > 5000000)
            {
                lblKetQua.Text = "khong thanh cong file khong co";
            }
            else
            {
                try
                {
                    string path = Server.MapPath("~/image/" + fileHinhAnh.FileName);
                    fileHinhAnh.SaveAs(path);
                    //txtDuongDan.Text = "~/image/" + upload.FileName.ToString();
                    lblKetQua.Text = "upload thành công";
                }
                catch (Exception ex)
                {
                    lblKetQua.Text = "Thất bại không tải được ảnh lên.";
                }
            }
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

        protected void btnThemBaiViet_Click(object sender, EventArgs e)
        {

            int mbv = mabaiviet() + 1;
            try
            {
                bviet.Newsid = mbv;
                bviet.Cateid = int.Parse(ddlChuyenMuc.SelectedValue.ToString());
                bviet.Title = txtTieuDe.Text;
                bviet.description = txtTomTat.Text;
                bviet.content = fckNoiDung1.Value;
                bviet.username = Session["username"].ToString();
                bviet.author = txtTacGia.Text;

                bviet.picture = fileHinhAnh.FileName.ToString();
                bviet.createdate = lblNgayDang.Text;
                bviet.link = "";
                bviet.active = 0;
                bviet.insert(bviet);
            }
            catch (Exception ex)
            {
                lblKetQua.Text = ex.Message.ToString();
            }
        
        }


    }
}
