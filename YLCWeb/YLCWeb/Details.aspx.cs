using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DBHelper;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
namespace YLCWeb
{
    public partial class Details : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) {
                if (Request.QueryString["t"] != null && Request.QueryString["id"] != null)
                {
                    BindData(Request.QueryString["t"].ToString().ToLower(), Request.QueryString["id"].ToString().ToLower());
                }
            }
        }


        private void BindData(string t,string id) {
            try
            {
                DataBaseHelper dbHelper = new DataBaseHelper(ConfigurationManager.ConnectionStrings["DB"].ToString());
                DataTable dt = dbHelper.ExecuteDataTable("select * from T_" + t + " where id =" + id);
                if (dt.Rows.Count > 0)
                {
                    this.lblTitle.Text = dt.Rows[0]["title"].ToString();
                    this.lbldetails.Text = dt.Rows[0]["Demo"].ToString();
                    this.lblTime.Text = Convert.ToDateTime(dt.Rows[0]["CreateTime"].ToString()).ToString("yyyy-MM-dd hh:mm:ss");
                }
                else {
                    Response.Redirect("index.aspx");
                }
                dbHelper.Dispose();
            }
            catch {
                Response.Redirect("index.aspx");
            }
        }

        public string URLConvert(string key)
        {
            return System.Web.HttpUtility.UrlEncode(key);
        }
    }
}