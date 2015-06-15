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
    public partial class Index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) {
                BindData();
            }
        }

        private void BindData() {
            DataBaseHelper dbHelper = new DataBaseHelper(ConfigurationManager.ConnectionStrings["DB"].ToString());
            this.repZhaobiaogonggao.DataSource = dbHelper.ExecuteDataTable("select top 5 * from T_ZWXX where type = '招标公告' order by id desc");
            this.repZhaobiaogonggao.DataBind();

            this.repjingquyaowen.DataSource = dbHelper.ExecuteDataTable("select top 5 * from T_ZWXX where type = '景区要闻' order by id desc");
            this.repjingquyaowen.DataBind();

            this.repJQTP.DataSource = dbHelper.ExecuteDataTable("select * from T_JQFG_IMG where id in(select max(id) from T_JQFG_IMG group by refid)");
            this.repJQTP.DataBind();

            dbHelper.Dispose();
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            DataBaseHelper dbhelper = new DataBaseHelper(ConfigurationManager.ConnectionStrings["DB"].ToString());
            DataTable dt = dbhelper.ExecuteDataTable("", "select * from T_AdminUser where username = @username and password = @password", new SqlParameter[]{
                new SqlParameter("@username", this.username.Value.Trim().ToString()),
                new SqlParameter("@password", this.password.Value.ToString())
            });
            if (dt.Rows.Count != 0)
            {
                Session.Add("Login", true);
                Response.Redirect("/Admin/Main.aspx");
            }
            else
            {
                Response.Write("<script language=javascript>alert('用户名密码不正确请重新输入');</script>");
                Response.Redirect("index.aspx");
            }
        }

        public string URLConvert(string key)
        {
            return System.Web.HttpUtility.UrlEncode(key);
        }
    }
}