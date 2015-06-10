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
    public partial class ZCFG : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) {
                if (Request.QueryString["id"] != null && Request.QueryString["id"].ToString() != "") {
                    BindData(Request.QueryString["id"].ToString());
                }
            }
        }

        private void BindData(string id ) {
            try
            {
                DataBaseHelper dbHelper = new DataBaseHelper(ConfigurationManager.ConnectionStrings["DB"].ToString());
                DataTable dt = dbHelper.ExecuteDataTable("select * from T_ZCFG where id=" + id);
                if (dt.Rows.Count > 0)
                {
                    //this.lbl
                    this.lblTitle.Text = dt.Rows[0]["Title"].ToString();
                    this.lblDetails.Text = dt.Rows[0]["Demo"].ToString();
                }
                else {
                    Response.Redirect("index.aspx");
                }
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