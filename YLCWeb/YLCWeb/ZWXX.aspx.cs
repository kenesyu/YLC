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
    public partial class ZWXX : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) {
                if (Request.QueryString["t"] != null && Request.QueryString["t"].ToString() != "") {
                    BindData(Request.QueryString["t"].ToString());
                }
            }
        }

        private void BindData(string t) {
            this.lblTitle.Text = t;
            DataBaseHelper dbHelper = new DataBaseHelper(ConfigurationManager.ConnectionStrings["DB"].ToString());
            DataTable dt = dbHelper.ExecuteDataTable("select * from T_ZWXX where type='" + Request.QueryString["t"].ToString() + "' order by id desc");
            this.repList.DataSource = dt;
            this.repList.DataBind();
            dbHelper.Dispose();
        }

        public string URLConvert(string key)
        {
            return System.Web.HttpUtility.UrlEncode(key);
        }
    }
}