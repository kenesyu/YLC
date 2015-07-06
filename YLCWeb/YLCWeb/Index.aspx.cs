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
using System.Text.RegularExpressions;
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

            this.repJQTP.DataSource = dbHelper.ExecuteDataTable("select * from T_JQFG_IMG where id in(select max(a.id) from T_JQFG_IMG a inner join T_jqfg b on a.refid =b.id group by a.refid)");
            this.repJQTP.DataBind();

            DataTable dt = dbHelper.ExecuteDataTable("select top 5 * from T_ZWXX where type = '景区要闻' and demo like '%img%' order by id desc");

            DataTable dtImg = new DataTable();
            dtImg.Columns.Add("url");
            dtImg.Columns.Add("id");
            foreach (DataRow dr in dt.Rows) {
                DataRow drrow = dtImg.NewRow();
                drrow[0] = GetHtmlImageUrlList(dr["demo"].ToString())[0].ToString();
                drrow[1] = dr["id"].ToString();
                dtImg.Rows.Add(drrow);
            }

            this.imgList.DataSource = dtImg;
            this.imgList.DataBind();

            dbHelper.Dispose();
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            DataBaseHelper dbhelper = new DataBaseHelper(ConfigurationManager.ConnectionStrings["DB"].ToString());
            DataTable dt = dbhelper.ExecuteDataTable("", "select * from T_AdminUser where username = @username and password = @password", new SqlParameter[]{
                new SqlParameter("@username", this.username.Value.Trim().ToString()),
                new SqlParameter("@password", this.password.Value.ToString())
            });
            dbhelper.Dispose();
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

        /// <summary> 
        /// 取得HTML中所有图片的 URL。 
        /// </summary> 
        /// <param name="sHtmlText">HTML代码</param> 
        /// <returns>图片的URL列表</returns> 
        public static string[] GetHtmlImageUrlList(string sHtmlText)
        {
            // 定义正则表达式用来匹配 img 标签 
            Regex regImg = new Regex(@"<img\b[^<>]*?\bsrc[\s\t\r\n]*=[\s\t\r\n]*[""']?[\s\t\r\n]*(?<imgUrl>[^\s\t\r\n""'<>]*)[^<>]*?/?[\s\t\r\n]*>", RegexOptions.IgnoreCase);

            // 搜索匹配的字符串 
            MatchCollection matches = regImg.Matches(sHtmlText);
            int i = 0;
            string[] sUrlList = new string[matches.Count];

            // 取得匹配项列表 
            foreach (Match match in matches)
                sUrlList[i++] = match.Groups["imgUrl"].Value;
            return sUrlList;
        }

        public string URLConvert(string key)
        {
            return System.Web.HttpUtility.UrlEncode(key);
        }
    }
}