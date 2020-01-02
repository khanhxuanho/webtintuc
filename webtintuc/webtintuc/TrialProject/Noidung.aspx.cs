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
using System.Drawing;
using System.IO;
using System.Text;


namespace TrialProject
{
    public partial class WebForm5 : System.Web.UI.Page
    {
        clsDatabase db = new clsDatabase();
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }
        /// <summary>
        /// Tao chuoi radom
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>

        //public string createKeyCode()
        //{
        //    string _allowedChars = "abcdefghijkmnopqrstuvwxyz0123456789";
        //    Random randNum = new Random();
        //    char[] chars = new char[6];
        //    int allowedCharCount = _allowedChars.Length;

        //    for (int i = 0; i < 6; i++)
        //    {
        //        chars[i] = _allowedChars[(int)((_allowedChars.Length) * randNum.NextDouble())];
        //    }
        //    return new string(chars);
        //} 

        protected void btnBinhLuan_Click(object sender, EventArgs e)
        {
            if ((txtHoTen.Text != "")&&(txdDiaChiMail.Text!="")&&(txtNoidung.Text!=""))
            {
                
                    FeedBack fb = new FeedBack();
                    clsfeedback clsfb = new clsfeedback();

                    fb.newid = Session["matin"].ToString();
                    fb.readername = txtHoTen.Text;
                    fb.email = txdDiaChiMail.Text;
                    fb.content = txtNoidung.Text;
                    fb.active = int.Parse("0");

               
                    clsfb.Them(fb);
               
            }
            else
                Response.Write("<script language='javascript'> alert('Bạn nhập chưa đủ thông tin vui lòng kiểm tra lại')</script>");
        }

        protected void DataList1_UpdateCommand(object source, DataListCommandEventArgs e)
        {
            string layCuaLabel = ((Label)e.Item.FindControl("lblnewsid")).Text;

            Session["matin"] = layCuaLabel;
        }

        protected void DataList1_Load(object sender, EventArgs e)
        {
            
        }
        public int Songuoitruycap()
        {
            string sql = "select views from news where newsid='" + Session["matin"].ToString() + "'";
            return int.Parse(db.ExcuteScalar(sql))+1;
        }
        string s = "";
        string cate = "";
        public void loaddatalist()
        {
            string sql = "SELECT [newsid], [title], [cateID] FROM [News] WHERE (([cateID] ='"+cate+"') AND day([createdate])=day("+s+")";
         
        }
        protected void DataList1_ItemDataBound(object sender, DataListItemEventArgs e)
        {
            string layCuaLabel = ((Label)e.Item.FindControl("lblnewsid")).Text;

            Session["matin"] = layCuaLabel;
            Session["cateid"] = ((Label)e.Item.FindControl("lblcateid")).Text;
            cate = Session["cateid"].ToString();
            s = ((Label)e.Item.FindControl("lblcreatedate")).Text;
            string[]mang=s.Split(' ');
            Session["createdate"] = mang[0].ToString();

            string sql = "update news set views='" + Songuoitruycap() + "'";
            db.ExcuteNonquery(sql);
            ((Label)e.Item.FindControl("lblsonguoi")).Text = Songuoitruycap().ToString()+" lượt xem";

            ((Label)e.Item.FindControl("lblsonguoicoment")).Text = db.ExcuteScalar("select count(readername) from feedback where newsid='" + Session["matin"].ToString() + "'")+" bình luận";
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            txtNoidung.Text = "";
            
        }
   }
}
