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
    public partial class JQFG_List : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DataBaseHelper dbHelper = new DataBaseHelper(ConfigurationManager.ConnectionStrings["DB"].ToString());
                DataTable dt = dbHelper.ExecuteDataTable("select * from T_JQFG order by id desc");
                this.replist.DataSource = dt;
                this.replist.DataBind();
                dbHelper.Dispose();
            }
        }

        protected void replist_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            String str = e.CommandName.ToString();//.toString（）；
            if (str == "Delete")
            {
                DataBaseHelper dbHelper = new DataBaseHelper(ConfigurationManager.ConnectionStrings["DB"].ToString());
                dbHelper.ExecuteNonQuery("delete from T_JQFG where id = " + e.CommandArgument.ToString());
                dbHelper.Dispose();
                Response.Redirect("JQFG_List.aspx");
            }
            else if (str == "Update")
            {
                Response.Redirect("JQFG.aspx?id=" + e.CommandArgument.ToString());
            }
        }
    }
}