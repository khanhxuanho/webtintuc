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
    public class baiviet
    {
        public Int32 Newsid { get; set; }
        public Int32 Cateid { get; set; }
        public string username { get; set; }
        public string Title { get; set; }
        public string description { get; set; }
        public string content { get; set; }
        public string author { get; set; }
        public string picture { get; set; }
        public string createdate { get; set; }
        public string link { get; set; }
        public Int32 active { get; set; }
        public Int32 views { get; set; }

        clsDatabase db = new clsDatabase();
        public void insert(baiviet bv)   
        {
            SqlConnection con = db.Getconnect();
            con.Open();
            SqlCommand cmd = new SqlCommand("thembaiviet", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@newsid", System.Data.SqlDbType.Int).Value = bv.Newsid;
            cmd.Parameters.Add("@cateID", System.Data.SqlDbType.Int).Value = bv.Cateid;
            cmd.Parameters.Add("@title", System.Data.SqlDbType.NText).Value = bv.Title;
            cmd.Parameters.Add("@username", System.Data.SqlDbType.NText).Value = bv.username;
            cmd.Parameters.Add("@description", System.Data.SqlDbType.NText).Value = bv.description;
            cmd.Parameters.Add("@content", System.Data.SqlDbType.NText).Value = bv.content;
            cmd.Parameters.Add("@author", System.Data.SqlDbType.NText).Value = bv.author;
            cmd.Parameters.Add("@picture", System.Data.SqlDbType.NText).Value = bv.picture;
            cmd.Parameters.Add("@createdate", System.Data.SqlDbType.DateTime).Value = bv.createdate;
            cmd.Parameters.Add("@link", System.Data.SqlDbType.NText).Value = bv.link;
            cmd.Parameters.Add("@active", System.Data.SqlDbType.Int).Value = bv.active;
            cmd.Parameters.Add("@views", System.Data.SqlDbType.Int).Value = bv.views;
            cmd.ExecuteNonQuery();
            cmd.Dispose();
            con.Close();
        }
       
        public void suabaiviet(baiviet bv)
        {
            SqlConnection con = db.Getconnect();
            con.Open();
            SqlCommand cmd = new SqlCommand("Suabaiviet", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@newsid", System.Data.SqlDbType.Int).Value = bv.Newsid;
            cmd.Parameters.Add("@cateID", System.Data.SqlDbType.Int).Value = bv.Cateid;
            cmd.Parameters.Add("@title", System.Data.SqlDbType.NText).Value = bv.Title;
            cmd.Parameters.Add("@username", System.Data.SqlDbType.NText).Value = bv.username;
            cmd.Parameters.Add("@description", System.Data.SqlDbType.NText).Value = bv.description;
            cmd.Parameters.Add("@content", System.Data.SqlDbType.NText).Value = bv.content;
            cmd.Parameters.Add("@author", System.Data.SqlDbType.NText).Value = bv.author;
            cmd.Parameters.Add("@picture", System.Data.SqlDbType.NText).Value = bv.picture;
            cmd.Parameters.Add("@createdate", System.Data.SqlDbType.DateTime).Value = bv.createdate;
            cmd.Parameters.Add("@link", System.Data.SqlDbType.NText).Value = bv.link;
            cmd.Parameters.Add("@active", System.Data.SqlDbType.Int).Value = bv.active;

            cmd.ExecuteNonQuery();
            cmd.Dispose();
            con.Close();
        }
        public void xoabv(baiviet bv)
        {
            SqlConnection con = db.Getconnect();
            con.Open();
            SqlCommand cmd = new SqlCommand("Xoabaiviet", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@newsid", System.Data.SqlDbType.Int).Value = bv.Newsid;
           
            cmd.ExecuteNonQuery();
            cmd.Dispose();
            con.Close();
        }
    }
}
