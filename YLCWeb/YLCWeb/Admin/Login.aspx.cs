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
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            DataBaseHelper dbhelper = new DataBaseHelper(ConfigurationManager.ConnectionStrings["DB"].ToString());
            DataTable dt = dbhelper.ExecuteDataTable("","select * from T_AdminUser where username = @username and password = @password" ,  new SqlParameter[]{
                new SqlParameter("@username", this.username.Value.Trim().ToString()),
                new SqlParameter("@password", this.password.Value.ToString())
            });
            if (dt.Rows.Count != 0)
            {
                Session.Add("Login", true);
                Response.Redirect("Main.aspx");
            }
            else {
                Response.Write("<script language=javascript>alert('用户名密码不正确请重新输入');</script>");
            }
        }
    }
}