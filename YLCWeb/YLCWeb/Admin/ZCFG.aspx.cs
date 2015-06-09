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
    public partial class ZCFG : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["id"] != null && Request.QueryString["id"].ToString() != "")
                {
                    try
                    {
                        int idx = int.Parse(Request.QueryString["id"].ToString());
                        DataBaseHelper dbHelper = new DataBaseHelper(ConfigurationManager.ConnectionStrings["DB"].ToString());
                        DataTable dt = dbHelper.ExecuteDataTable("", "select * from T_ZCFG where id = @id", new SqlParameter[]{
                            new SqlParameter("@id",idx) });
                        if (dt.Rows.Count > 0)
                        {
                            this.lblTitle.Text = dt.Rows[0]["Title"].ToString();
                            this.editor1.Value = dt.Rows[0]["demo"].ToString();
                            this.txtID.Text = dt.Rows[0]["id"].ToString();
                        }
                        dbHelper.Dispose();
                    }
                    catch
                    {


                    }
                }
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            DataBaseHelper dbHelper = new DataBaseHelper(ConfigurationManager.ConnectionStrings["DB"].ToString());
            dbHelper.ExecuteNonQuery("update T_ZCFG set demo = @demo where id=@id", new SqlParameter[]{
                new SqlParameter("@demo", this.editor1.Value),
                new SqlParameter("@id",this.txtID.Text)
            });
            Response.Write("<script>alert('保存成功')</script>");
        }
    }
}