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

namespace TrialProject.Admin
{
    public class clsSuaTaiKhoan
    {
        clsDatabase db = new clsDatabase();
        public void Sua(string username, string fullname, string email, string address, int role)
        {
            //câu lệnh update vào sql server
            string update = "update acount set fullname=N'" + fullname + "',email=N'" + email + "',address=N'" + address + "',roleid='" + role + "' where username='"+username+"'";
            db.ExcuteNonquery(update);
        }
        public void xoa(string username)
        {
            //cau lenh delete dữ liệu trong sql
            string delete = "delete from acount where username='" + username + "'";
            db.ExcuteNonquery(delete);
        }
        public void load(DropDownList t)
        {
            t.DataSource = db.GetTable("select roleid,rolename from tblrole");
            t.DataTextField = "rolename";
            t.DataValueField = "roleid";
            t.DataBind();
        }
        public void Loadgrid(GridView gv)
        {
            string sql = @" SELECT        Acount.username, Acount.fullname, Acount.email, Acount.ADDRESS, tblRole.rolename
FROM            Acount INNER JOIN
                         tblRole ON Acount.roleid = tblRole.roleID";
            db.loadGridView(sql, gv);
        }
    }
}
