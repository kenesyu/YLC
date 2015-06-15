using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DBHelper;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace YLCWeb.Admin
{
    public partial class JQFG_IMG : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) {
                try
                {
                    string sql = "";
                    if (Request.QueryString["id"] != null && Request.QueryString["id"].ToString() != "0")
                    {
                        sql += "select * from T_JQFG_IMG where refid = " + Request.QueryString["id"].ToString();
                    }

                    if (Request.QueryString["id"] != null && Request.QueryString["id"].ToString() != "0" && Request.QueryString["id"] != null && Request.QueryString["id"].ToString() != "")
                    {
                        sql += " union ";
                    }

                    if (Request.QueryString["tempid"] != null && Request.QueryString["tempid"].ToString() != "")
                    {
                        sql += "select * from T_JQFG_IMG where id in (" + Request.QueryString["tempid"].ToString() + ")";
                    }
                    DataBaseHelper dbHelper = new DataBaseHelper(ConfigurationManager.ConnectionStrings["DB"].ToString());
                    DataTable dt = dbHelper.ExecuteDataTable(sql);
                    this.repList.DataSource = dt;
                    this.repList.DataBind();
                    dbHelper.Dispose();
                }
                catch { }
            }
        }

        protected void repList_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            String str = e.CommandName.ToString();//.toString（）；
            if (str == "Delete")
            {
                DataBaseHelper dbHelper = new DataBaseHelper(ConfigurationManager.ConnectionStrings["DB"].ToString());
                dbHelper.ExecuteNonQuery("delete from T_JQFG_IMG where id = " + e.CommandArgument.ToString());
                dbHelper.Dispose();
                Response.Redirect("JQFG_IMG.aspx?id=" + Request.QueryString["id"].ToString() + "&tempid=" + Request.QueryString["tempid"].ToString());
            }
            else if (str == "Update")
            {
                Response.Redirect("JQFG.aspx?id=" + e.CommandArgument.ToString());
            }
        }
    }
}