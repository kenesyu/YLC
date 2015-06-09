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
    public partial class ZWXX : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) {
                if (Request.QueryString["id"] != null && Request.QueryString["id"].ToString() != "")
                {
                    DataBaseHelper dbHelper = new DataBaseHelper(ConfigurationManager.ConnectionStrings["DB"].ToString());
                    DataTable dt = dbHelper.ExecuteDataTable("", "select * from T_ZWXX where id= @id", new SqlParameter[] { new SqlParameter("@id", this.Request.QueryString["id"].ToString()) });
                    if (dt.Rows.Count > 0)
                    {
                        this.selType.SelectedValue = dt.Rows[0]["Type"].ToString();
                        this.txtID.Text = dt.Rows[0]["id"].ToString();
                        this.txtTitle.Text = dt.Rows[0]["Title"].ToString();
                        this.editor1.Value = dt.Rows[0]["demo"].ToString();
                    }
                    dbHelper.Dispose();
                }
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            DataBaseHelper dbHelper = new DataBaseHelper(ConfigurationManager.ConnectionStrings["DB"].ToString());
            if (this.txtID.Text == "")
            {
                dbHelper.ExecuteNonQuery("insert into T_ZWXX ([Title],[Type],[demo],[createtime]) values (@title,@type,@demo,GETDATE())", new SqlParameter[]{
                    new SqlParameter("@title",this.txtTitle.Text), new SqlParameter("@type",this.selType.SelectedValue),new SqlParameter("@demo",this.editor1.Value)
                });
                this.Response.Redirect("ZWXX_List.aspx");
            }
            else
            {
                dbHelper.ExecuteNonQuery("update T_ZWXX set [Title] = @title,[Type] = @type,[demo] = @demo where id = @id", new SqlParameter[]{
                    new SqlParameter("@title",this.txtTitle.Text), new SqlParameter("@type",this.selType.SelectedValue),new SqlParameter("@demo",this.editor1.Value),
                    new SqlParameter("@id", this.txtID.Text)
                });
                this.Response.Redirect("ZWXX_List.aspx");
            }
            dbHelper.Dispose();
        }
    }
}