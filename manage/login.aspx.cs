using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using Mdesign.App_Code;
namespace Mdesign.manage
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void but_login_Click(object sender, EventArgs e)
        {
            if (this.txt_pass.Text == "" || this.txt_user.Text == "")
            {
                JS.Alert("请输入用户，密码");
                return;
            }
            string user = this.txt_user.Text.Replace("'", "");
            string pass = this.txt_pass.Text.Replace("'", "");
            string sql = "select * from t_user where uname='{0}' and pass='{1}'";
            sql = string.Format(sql, user, pass);
            if (AccessDb.Execute(sql).Tables[0].Rows.Count == 0)
            {
                JS.Alert("用户，密码错误.");
                return;
            }
            else
            {
                Session["user"] = user;
                Response.Redirect("main.htm");
            }
        }
        protected void btnTest_onclick(object sender, EventArgs e)
        {
            this.txt_pass.Text = "";
            this.txt_user.Text = "";
        }
    }
}