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
    public partial class JQFG : System.Web.UI.Page
    {

        public string strID = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) {
                strID = "";
                if (Request.QueryString["id"] != null && Request.QueryString["id"].ToString() != "") {
                    strID = Request.QueryString["id"].ToString();
                    try
                    {
                        DataBaseHelper dbHelper = new DataBaseHelper(ConfigurationManager.ConnectionStrings["DB"].ToString());
                        DataTable dtInfo = dbHelper.ExecuteDataTable("select * from T_JQFG where id = " + Request.QueryString["id"].ToString());
                        if (dtInfo.Rows.Count > 0)
                        {
                            this.txtTitle.Text = dtInfo.Rows[0]["Title"].ToString();
                            this.editor1.Value = dtInfo.Rows[0]["Demo"].ToString();
                            this.txtID.Text = dtInfo.Rows[0]["id"].ToString();
                            DataTable dtimg = dbHelper.ExecuteDataTable("select * from T_JQFG_IMG where refid = " + Request.QueryString["id"].ToString());
                            if (dtimg.Rows.Count > 0) {
                                string v = "0";
                                foreach (DataRow dr in dtimg.Rows)
                                {
                                    v += "," + dr["id"].ToString();
                                }
                                this.txtImg.Text = v;
                            }
                        }
                        dbHelper.Dispose();
                    }
                    catch { }
                }
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            DataBaseHelper dbHelper = new DataBaseHelper(ConfigurationManager.ConnectionStrings["DB"].ToString());
            if (this.txtID.Text != "" && this.txtID.Text != "0")
            {
                //Update
                string sql = "update T_JQFG set Title = @title, demo = @demo where id= @id ; update T_JQFG_IMG set refid = @id where id in (" + this.txtImg.Text + ")";
                dbHelper.ExecuteNonQuery(sql, new SqlParameter[]{
                    new SqlParameter("@title", this.txtTitle.Text),
                    new SqlParameter("@demo",this.editor1.Value),
                    new SqlParameter("@id",this.txtID.Text)
                });
                dbHelper.Dispose();
                Response.Write("<script>alert('保存成功');location.href='JQFG_List.aspx'</script>");
            }
            else
            {
                string sql = "insert into  T_JQFG (title,demo,createtime) values (@title,@demo,GETDATE());select @@identity";
                string retid = dbHelper.ExecuteScalar(sql, new SqlParameter[]{
                    new SqlParameter("@title",this.txtTitle.Text), new SqlParameter("@demo",this.editor1.Value)
                }).ToString();

                dbHelper.ExecuteNonQuery("update T_JQFG_IMG set refid = @refid where id in (" + this.txtImg.Text + ")", new SqlParameter[]{
                    new SqlParameter("@refid",retid)
                }); 

                dbHelper.Dispose();
                Response.Write("<script>alert('保存成功');location.href='JQFG_List.aspx'</script>");
                //insert
            }
        }
    }
}