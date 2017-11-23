using System;
using System.Data;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

namespace Mdesign.App_Code
{


    public class CheckLogin
    {
        public static string Userinfo = "";
        public CheckLogin()
        {
            //
            //TODO: 在此处添加构造函数逻辑
            //
        }

        public static bool checkSession()
        {
            if (System.Web.HttpContext.Current.Session["user"] != null)

                return true;

            else
                return false;
        }

        public static void checkError()
        {
            string sq = "<div style='font-size:12px;width=200px;border:1px solid red;margin:10px;padding:10px;padding-left:10px;padding-top:10px;' >请先登录...<br><br><a href=login.aspx target=_top>点击登录</a></div>";
            System.Web.HttpContext.Current.Response.Write(sq);
            System.Web.HttpContext.Current.Response.End();

        }

        public static void checkAll()
        {
            if (checkSession() == false)
            {
                checkError();
            }
        }
    }
}
