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
    public partial class WebForm6 : System.Web.UI.Page
    {
        Banner banner = new Banner();
        clsDatabase db = new clsDatabase();
        clsBanner bnner = new clsBanner();
        string layma = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void ImageButton2_Click1(object sender, ImageClickEventArgs e)
        {
            // xoa logo
            //banner.bannerid = int.Parse(layma);
            Response.Write(layma);
        }
        
        public int mabanner()
        {
            int kq = 0;
            string sql = "Select max(bannerid) from banner";
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
        string path = "";
        string s = "";
        public void SetValue()
        {
            banner.bannerid = (mabanner() + 1);
           
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
                        if (DropDownList2.SelectedValue.ToString() == "1")
                        {
                           path = Server.MapPath("~/image/banner/" + fileHinhAnh.FileName);
                            fileHinhAnh.SaveAs(path);
                            s = "~/image/banner/" + fileHinhAnh.FileName;
                        }
                        else
                        {
                            path = Server.MapPath("~/image/advertise/" + fileHinhAnh.FileName);
                            fileHinhAnh.SaveAs(path);
                            s = "~/image/advertise/" + fileHinhAnh.FileName.ToString();
                        }
                        
                      
                    }
                    catch (Exception ex)
                    {
                        Response.Write("<script language='javascript'> alert('Upload Thất Bại. Vui lòng thử lại.')</script>");
                    }
                }
                banner.image = s;
                banner.urlbanner = txtDuongDan.Text;
                banner.locationid = int.Parse(DropDownList2.SelectedValue);
                banner.order = int.Parse(txtThuTu.Text);
                banner.category = "";
                banner.status = bool.Parse(ddlHienThi.SelectedValue.ToString());
                banner.note = txxtGhiChu.Text;
            
        }
        protected void btnTaiLen_Click1(object sender, EventArgs e)
        {
           SetValue();
           bnner.ThemBanner(banner);
        }

        protected void DataList1_UpdateCommand(object source, DataListCommandEventArgs e)
        {
             layma = ((Label)e.Item.FindControl("Label2")).Text;
        }

       
    }
}
