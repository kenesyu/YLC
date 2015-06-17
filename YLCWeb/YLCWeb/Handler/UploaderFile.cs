using System;
using System.Web;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using DBHelper;
using System.Text;

namespace YLCWeb.Handler
{
    public class UploaderFile : IHttpHandler
    {
        /// <summary>
        /// You will need to configure this handler in the web.config file of your 
        /// web and register it with IIS before being able to use it. For more information
        /// see the following link: http://go.microsoft.com/?linkid=8101007
        /// </summary>
        #region IHttpHandler Members

        public bool IsReusable
        {
            // Return false in case your Managed Handler cannot be reused for another request.
            // Usually this would be false in case you have some state information preserved per request.
            get { return true; }
        }

        public void ProcessRequest(HttpContext context)
        {
            try
            {
                string uploadPath = context.Server.MapPath(context.Request.ApplicationPath + "/upload/");
                string retID = string.Empty;
                for (int j = 0; j < context.Request.Files.Count; j++)
                {
                    HttpPostedFile uploadFile = context.Request.Files[j];
                    string extName = uploadFile.FileName.Substring(uploadFile.FileName.LastIndexOf('.'));
                    string newName = DateTime.Now.ToString("yyyy-MM-dd") + "_" + DateTime.Now.Ticks.ToString() + extName.ToString();
                    if (uploadFile.ContentLength > 0)
                    {
                        //string newName = DateTime.Now.ToString("yyyy-MM-dd") + "_" + DateTime.Now.Ticks.ToString() + extName.ToString();
                        uploadFile.SaveAs(Path.Combine(uploadPath, newName));
                    }
                    //HttpContext.Current.Response.Write("<script>alert(document.getElementsById('cke_114_textInput').value)</script>");

                    StringBuilder sb = new StringBuilder();
                    string callback = HttpContext.Current.Request.QueryString["CKEditorFuncNum"];
                    sb.AppendLine("<script type=\"text/javascript\">");  
                    sb.AppendLine("window.parent.CKEDITOR.tools.callFunction(" + callback + ",'/upload/" + newName + "','')");  
                    sb.AppendLine("</script>");
                    HttpContext.Current.Response.Write(sb.ToString());
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        #endregion
    }
}
