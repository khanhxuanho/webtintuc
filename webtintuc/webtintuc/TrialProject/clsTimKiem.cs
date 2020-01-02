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
    public class clsTimKiem
    {
        clsDatabase db=new clsDatabase();
        public DataTable timkiem(string tukhoa)
        {
            //lấy ra các dữ liệu có từ khóa trùng từ nhập vào và lưu lại một bảng các kết quả
           return db.GetTable(@"SELECT newsid, cateID, title, DESCRIPTION, author, picture
                                FROM            News
                                WHERE        title LIKE N'%"+tukhoa+"%'");
        }
    }
}
