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
using System.Text;
using System.Data.SqlClient;
using System.IO;

namespace TrialProject.Admin
{
    public partial class QuanLyTaiKhoan : System.Web.UI.Page
    {
        clsDatabase ac = new clsDatabase();
        //public void WriteSiteMap()
        //{
        //    StringBuilder sb = new StringBuilder();//Đầu tiên tạo 1 stringbuilder
        //    //Nối dữ liệ trong sitemap vào sb này
        //    sb.Append("<?xml version=" + "'1.0'" + " encoding=" + "'utf-8'" + " ?>");
        //    sb.Append("\n<siteMap xmlns='" + "http://schemas.microsoft.com/AspNet/SiteMap-File-1.0" + "'>");
        //    sb.Append("\n<siteMapNode url=" + "''" + " title=" + "''" + "  description=" + "''" + ">");
        //    SqlDataReader reader = ac.ExecuteReader1("select * from Category");//đầu tiên, chúng ta sẽ đọc toàn bộ bảng tbl_Menu
        //    while (reader.Read())//trong khi đọc
        //    {
        //        //Cứ mỗi lần lướt qua 1 menu, ta tìm xem menu đó có menu con không
        //        DataTable dt = ac.GetTable("select cateName,link from Category where parentID=" + int.Parse(reader[0].ToString()) + "");
        //        if (dt.Rows.Count > 0)//Chèn menu có menu con
        //        {
        //            //THẻ mở
        //            sb.Append("\n<siteMapNode url='" + reader[2].ToString() + "' title='" + reader[1].ToString() + "'  description='" + "" + "'>");
        //            for (int i = 0; i < dt.Rows.Count; i++)
        //            {
        //                //Các menu con
        //                sb.Append("\n<siteMapNode url='" + dt.Rows[i][1].ToString() + "' title='" + dt.Rows[i][0].ToString() + "'  description='" + "" + "'/>");
        //            }
        //            sb.Append("\n</siteMapNode>");//Thẻ đóng của menu cha đây
        //        }
        //        else //Chèn những menu không có menu con
        //        {
        //            if (int.Parse(reader[0].ToString()) != 0 && reader[3].ToString() == "")
        //                sb.Append("\n<siteMapNode url='" + reader[2].ToString() + "' title='" + reader[1].ToString() + "'  description='" + "" + "' />");//đóngl uôn
        //        }
        //    }
        //    sb.Append("\n</siteMapNode>");
        //    sb.Append("\n</siteMap>");
        //    //Và cuối cùng chúng ta ghi vào file sitemap đó thôi
        //    File.WriteAllText(Server.MapPath("~\\Menu.sitemap").ToString(), sb.ToString());
        //}
        protected void Page_Load(object sender, EventArgs e)
        {
            //WriteSiteMap();
        }
        clsDatabase dl = new clsDatabase();
        /// <summary>
        /// Quản Lý Thêm Tài Khoản
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {
            //kiểm tra username có trong csdl chưa
          string giatri = txtTenDangNhap.Text;
          if (dl.kiemtra("Acount", "username", giatri) > 0)
          {
              lblThongBao.Visible = true;
              lblThongBao.Text = "Tên Đã Tồn Tại";// đã tồn tại
              
          }
          else
          {
              lblThongBao.Visible = true;
              lblThongBao.Text = "Bạn có thể dùng tài khoản này";//chưa có thì hiện chỗ này
              
          }
        }
        /// <summary>
        /// click vào button Them
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnThem_Click(object sender, EventArgs e)
        {
            
            if (dl.kiemtra("Acount", "username", txtTenDangNhap.Text) <=0)
            {
                //câu lệnh thêm vào sql server
                string caulenh = "insert into Acount values(N'" + txtTenDangNhap.Text + "',N'" + txtMatKhau.Text + "',N'" + ddlQuyen.SelectedValue.ToString() + "',N'" + txtHoTen.Text + "',N'" + txtDiaChiMail.Text + "',N'" + txtDiaChi.Text + "',N'')";
                dl.ExcuteNonquery(caulenh);
                Response.Write("<script language='javascript'>alert('Thêm tài khoản thành công')</script>");
            }
            else
                Response.Write("<script language='javascript'>alert('Tài khoản đã tồn tại')</script>");
        }

        protected void txtMatKhau_TextChanged(object sender, EventArgs e)
        {
          
           
        }

        protected void btnLamLai_Click(object sender, EventArgs e)
        {
            txtTenDangNhap.Text = "";
            txtMatKhau.Text=txtNhapLaiPass.Text = "";
            txtHoTen.Text = "";
            txtDiaChi.Text = "";
            txtDiaChiMail.Text = "";
            lblThongBao.Text = "";
        }

     
    }
}
