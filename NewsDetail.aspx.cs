using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using Mdesign.App_Code;

namespace Mdesign
{
    public partial class NewsDetail :System.Web.UI.Page
    {
        private string _uid;
        public DataRow dr;
      
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
            if (!IsPostBack)
            {
                show();
            }
        }
        
        private void show()
        {
            string sql = "select * from t_news where id=" + UID;
            DataTable dt = AccessDb.Execute(sql).Tables[0];
            dr = dt.Rows[0];

            if (dr["purl"] != null && dr["purl"].ToString().Length>0)
            {
              string FilePath=  dr["purl"].ToString();
                FilePath=FilePath.Substring(FilePath.LastIndexOf('\\')+1);
                this.SpFile.InnerHtml = "附件:  <a href=\"" + dr["purl"].ToString() + "\" title=\"" + FilePath + "\">" + FilePath + " </a>";
                                                                
            }
            else
            {
                this.SpFile.InnerHtml = "";
            }

        }
    }
}