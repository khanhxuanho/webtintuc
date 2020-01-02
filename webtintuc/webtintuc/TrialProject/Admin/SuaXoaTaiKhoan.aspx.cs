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
    public partial class WebForm4 : System.Web.UI.Page
    {
        clsSuaTaiKhoan edit = new clsSuaTaiKhoan();
        protected void Page_Load(object sender, EventArgs e)
        {
            //load tất cả username lên gridview
            edit.Loadgrid(GridView1);
        }
        /// <summary>
        /// bấm nút select trên gridview
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            //GridView1.Rows[index].Cells[1].Text lấy ra tên user tại cột 1 trong gridview
            int index = int.Parse(e.CommandArgument.ToString());

            var ac = new clsDatabase();
            //lấy dữ liệu từ gridview xuống các điều khiển của chương trình tương ứng với username ở cột 1
            SqlDataReader reader = ac.ExecuteReader1(@"SELECT Acount.username, Acount.fullname, Acount.email, Acount.ADDRESS
                                                    FROM Acount where username='" + GridView1.Rows[index].Cells[1].Text + "'");
            while (reader.Read())
            {
                txtTendangnhap.Text = reader[0].ToString();
                txtHoten.Text = reader[1].ToString();
                txtEmail.Text = reader[2].ToString();
                txtDiaChi.Text = reader[3].ToString();

            }
            reader.Close();
           
            
        }
        /// <summary>
        /// bấm vào nút sửa
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnSua_Click(object sender, EventArgs e)
        {
            //gọi ra phương thức sửa của lớp clsSuaTaiKhoan
            edit.Sua(txtTendangnhap.Text, txtHoten.Text, txtEmail.Text, txtDiaChi.Text, int.Parse(ddlQuyen.SelectedValue.ToString()));
            //Response.Write("<script language='javascript'>alert('Sửa tài khoản thàng công')</script>");
           //load kết quả đã sửa lên gridview
            edit.Loadgrid(GridView1);
            txtTendangnhap.Text = txtHoten.Text = txtEmail.Text = txtDiaChi.Text = "";
        }

        protected void btnXoa_Click(object sender, EventArgs e)
        {//gọi phương thức xoa
            edit.xoa(txtTendangnhap.Text);
            edit.Loadgrid(GridView1);
        }
    }
}
