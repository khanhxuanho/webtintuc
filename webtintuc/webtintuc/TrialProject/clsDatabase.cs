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
    
    public class clsDatabase
    {
        private string connectstring = ConfigurationManager.ConnectionStrings["connect"].ConnectionString;
        
        public SqlConnection Getconnect()
        {
            return new SqlConnection(connectstring);
        }
        public DataTable GetTable(string sql)
        {
            SqlConnection con = Getconnect();
            SqlDataAdapter da = new SqlDataAdapter(sql, con);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();
            return dt;
        }
        public void ExcuteNonquery(string sql)
        {
            SqlConnection con = Getconnect();
            con.Open();
            SqlCommand cmd = new SqlCommand(sql, con);
            cmd.ExecuteNonQuery();
            con.Close();
            cmd.Dispose();
        }
        public string ExcuteScalar(string sql)
        {
            SqlConnection con = Getconnect();
            con.Open();
            SqlCommand cmd = new SqlCommand(sql, con);
            string kq = cmd.ExecuteScalar().ToString();
            con.Close();
            cmd.Dispose();
            return kq;
        }
        public SqlDataReader ExecuteReader1(string sql)
        {
            SqlConnection con = Getconnect();
            con.Open();
            SqlCommand cmd = new SqlCommand(sql, con);
            SqlDataReader reader = cmd.ExecuteReader();
            
            return reader;
        }

        public void loadGridView(string sql,GridView grv)
        {
            SqlConnection con = Getconnect();
            SqlDataAdapter da = new SqlDataAdapter(sql, con);
            DataTable dt = new DataTable();
            da.Fill(dt);
            grv.DataSource = dt;
            grv.DataBind();
            con.Close();
        }
        public void LoadDropDownList(string sql,string header,string value,DropDownList ddl)
        {
            SqlConnection con = Getconnect();
            con.Open();
            SqlDataAdapter da = new SqlDataAdapter(sql, con);
            DataTable dt = new DataTable();
            da.Fill(dt);
            ddl.DataSource = dt;
            ddl.DataTextField = header;
            ddl.DataValueField = value;
            ddl.DataBind();
            con.Close();
        }
        public int kiemtra(string tenbang, string tentruong, string giatri)
        {
            int kq = 0;
            SqlConnection con = Getconnect();
            con.Open();
            string caulenh = "select count(*) from " + tenbang + " where " + tentruong + "='" + giatri + "' ";
            SqlCommand cmd = new SqlCommand(caulenh, con);
            kq = (int)cmd.ExecuteScalar();
            return kq;
        }
        
    }
}
