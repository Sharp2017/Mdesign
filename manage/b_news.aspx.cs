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
using System.Data.OleDb;
using Mdesign.App_Code;

namespace Mdesign.manage
{
    public partial class b_news : System.Web.UI.Page
    {
        private string _uid;
        public string UID
        {
            get
            {
                object o = Request.QueryString["id"];
                if (o == null)
                {
                    JS.Alert("类型传递错误");
                    // this.but_save.Enabled = false;
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
            CheckLogin.checkAll();
            if (!IsPostBack)
            {
                if (UID != "")
                    ini();
            }
        }


        private void ini()
        {

            if (UID == "news")
            {
                this.lb_title.Text = "平台动态";
            }
            if (UID == "police")
            {
                this.lb_title.Text = "标准规范";
            }
            this.txt_DateTime.Value = DateTime.Now.ToUniversalTime().ToString();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {

            string FilePath = "";
            FilePath = File1.Value;
            if (FilePath.Length > 0)
            {

                FilePath = FileUp.meUpfile(this.File1, @"~\file\", true);
                FilePath = FilePath.Substring(FilePath.IndexOf('\\') + 1);

            }

            string title = this.txt_title.Text;

            if (title == null || title.Length <= 0)
            {
                JS.Alert("标题不能为空！");
                return;
            }
            if (title.Length >= 255)
            {
                JS.Alert("标题过长！");
                return;
            }
            string author = this.txt_author.Text;
            if (author.Length >= 255)
            {
                JS.Alert("作者名称过长！");
                return;
            }

            string strDateTime = this.txt_DateTime.Value;
            string content = this.content2.Value;

            string type = UID == "news" ? "平台动态" : "标准规范";
            string sql = "insert into t_news (ptitle,pcontent,puser,pdate,ptype,purl) values(@ptitle,@pcontent,@puser,@pdate,@ptype,@purl)";
            ArrayList insertValue = new ArrayList();
            OleDbParameter ptitle = new OleDbParameter("@ptitle", OleDbType.VarChar);
            ptitle.Value = title;
            insertValue.Add(ptitle);
            OleDbParameter pcontent = new OleDbParameter("@pcontent", OleDbType.LongVarWChar);
            pcontent.Value = content;
            insertValue.Add(pcontent);
            OleDbParameter puser = new OleDbParameter("@puser", OleDbType.VarChar);
            puser.Value = author;
            insertValue.Add(puser);
            OleDbParameter pdate = new OleDbParameter("@pdate", OleDbType.VarChar);
            pdate.Value = strDateTime;
            insertValue.Add(pdate);

            OleDbParameter ptype = new OleDbParameter("@ptype", OleDbType.VarChar);
            ptype.Value = type;
            insertValue.Add(ptype);

            OleDbParameter purl = new OleDbParameter("@purl", OleDbType.LongVarWChar);
            purl.Value = FilePath;
            insertValue.Add(purl);

            int p = AccessDb.ExecuteNon(sql, ref insertValue);
            JS.Alert("添加成功！");
            this.txt_author.Text = "";
            this.txt_title.Text = "";
            this.content2.Value = "";
            this.txt_DateTime.Value = DateTime.Now.ToUniversalTime().ToString();
        }
    }
}