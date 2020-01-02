using System;
using System.Data;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Data.SqlClient;

namespace TrialProject
{
    public class DangNhap
    {
        public int CheckLogin(string username, string password)
        {
            clsDatabase db = new clsDatabase();
            //lấy ra username,pass từ bảng acount để so sánh với username,pass người dùng nhap vào
            SqlDataReader reader = db.ExecuteReader1("SELECT ac.username,ac.PASSWORD,r.roleid FROM dbo.Acount ac,dbo.tblRole r WHERE r.roleID=ac.roleid");
            while (reader.Read())
            {
                //so sánh username,pass để tra ra quyền tương ứng vd: trả ra 1 là admin....
                if (reader[0].ToString() == username && reader[1].ToString() == password)
                {
                    return int.Parse(reader[2].ToString());
                }
            }
            return 0;
        }
    }
}
