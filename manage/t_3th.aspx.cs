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
    public partial class t_3th : System.Web.UI.Page
    {
        private string _uid;

        public string UID
        {
            get
            {
                object o = Request.QueryString["id"];
                if (o == null)
                {
                    JS.Alert("请选择");

                    return "";
                }
                try
                {
                    return o.ToString();
                }
                catch
                {
                    JS.Alert("编码错误！");
                    Response.End();
                }
                this._uid = o.ToString();
                return "";
            }
        }



        protected void Page_Load(object sender, EventArgs e)
        {
            this.Button1.Attributes.Add("onclick", "return conf();");
            CheckLogin.checkAll();

            if (!IsPostBack)
            {
                string sql = "select * from t_3th where id=";
                string tit = "";
                switch (UID)
                {
                    case "interface":
                        tit = "地图API管理";
                        sql += "1";
                        break;
                    case "use":
                        tit = "应用管理";
                        sql += "2";
                        break;
                    case "source":
                        tit = "资源管理";
                        sql += "3";
                        break;
                }
                this.Label1.Text = tit;
                DataTable dt = AccessDb.Execute(sql).Tables[0];
                this.txt_url.Text = dt.Rows[0]["purl"].ToString();

            }
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            string sql = "update t_3th set purl='" + this.txt_url.Text.Trim() + "' where id=";
            switch (UID)
            {
                case "interface":
                    sql += "1";
                    break;
                case "use":
                    sql += "2";
                    break;
                case "source":
                    sql += "3";
                    break;
            }
            AccessDb.ExecuteNonQuery(sql);
             JS.Alert("成功.");
        }
    }
}