using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace YLCWeb
{
    public class Helper
    {
        public static string URLConvert(string key){
            return System.Web.HttpUtility.UrlEncode(key); 
        }
    }
}