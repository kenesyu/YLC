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
    public partial class MsgBoard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        public string URLConvert(string key)
        {
            return System.Web.HttpUtility.UrlEncode(key);
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                DataBaseHelper dbHelper = new DataBaseHelper(ConfigurationManager.ConnectionStrings["DB"].ToString());
                dbHelper.ExecuteNonQuery("INSERT INTO [T_Message] ([Name],[email] ,[Tel] ,[demo],[createtime]) VALUES (@name,@email,@tel,@demo,GETDATE())",
                    new SqlParameter[]{
                        new SqlParameter("@name",this.txtName.Value),
                        new SqlParameter("@email",this.txtemail.Value),
                        new SqlParameter("@tel",this.txttel.Value),
                        new SqlParameter("@demo",this.txtMessage.Value)
                    }
                    );
                dbHelper.Dispose();
            }
            catch(SystemException ex)
            {
                throw ex;
            }
            Response.Write("<script>alert('您的留言已收到，谢谢！');location.href='index.aspx'</script>");
        }
    }
}