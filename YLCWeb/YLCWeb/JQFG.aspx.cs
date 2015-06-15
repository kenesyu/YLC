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
    public partial class JQFG : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) { 
                //if(Request.QueryString[""])
                Bind();
            }
        }

        public string URLConvert(string key)
        {
            return System.Web.HttpUtility.UrlEncode(key);
        }

        private void Bind() {
            try
            {
                DataBaseHelper dbHelper = new DataBaseHelper(ConfigurationManager.ConnectionStrings["DB"].ToString());
                DataTable dtMenu = dbHelper.ExecuteDataTable("select * from T_JQFG");
                this.repMenu.DataSource = dtMenu;
                this.repMenu.DataBind();
                string id = dtMenu.Rows[0]["id"].ToString();
                if (Request.QueryString["id"] != null && Request.QueryString["id"].ToString() != "")
                {
                    DataTable dt = dbHelper.ExecuteDataTable("select * from T_JQFG where id =  " + Request.QueryString["id"].ToString());
                    if (dt.Rows.Count > 0)
                    {
                        this.lblTitle.Text = dt.Rows[0]["Title"].ToString();
                        this.lblDetails.Text = dt.Rows[0]["Demo"].ToString();
                        repImgList.DataSource = dbHelper.ExecuteDataTable("select * from T_JQFG_IMG where refid = " +Request.QueryString["id"].ToString());
                        repImgList.DataBind();
                    }
                }
                else
                {
                    DataTable dt = dbHelper.ExecuteDataTable("select * from T_JQFG where id =  " + id);
                    if (dt.Rows.Count > 0)
                    {
                        this.lblTitle.Text = dt.Rows[0]["Title"].ToString();
                        this.lblDetails.Text = dt.Rows[0]["Demo"].ToString();
                        repImgList.DataSource = dbHelper.ExecuteDataTable("select * from T_JQFG_IMG where refid = " + id);
                        repImgList.DataBind();
                    }
                }
                dbHelper.Dispose();
            }
            catch
            {

            }
        }
    }
}