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
    public partial class b_newsEdit : System.Web.UI.Page
    {
        private string _uid;
        private DataRow _dr;
        public DataRow DR
        {
            get
            {
                return _dr;
            }
            set
            {
                _dr = value;
            }
        }

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

            string sql = "select * from t_news where id=" + UID;
            DataTable dt = AccessDb.Execute(sql).Tables[0];
            if (dt.Rows.Count == 0)
            {
                JS.Alert("读数据失败");
                Response.End();
            }
            else
            {
                _dr = dt.Rows[0];
            }
            this.txt_title.Text = DR["ptitle"].ToString();
            this.txt_DateTime.Value = DR["pdate"].ToString();
            this.txt_author.Text = DR["puser"].ToString();
            this.content2.Value = DR["pcontent"].ToString();
     
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
            string content = content2.Value;
            //string sql = "insert into t_news (ptitle,pcontent,puser,pdate,ptype) values(@ptitle,@pcontent,@puser,@pdate,@ptype)";
            string sqlEdit = "update t_news set ptitle=@ptitle,pcontent=@pcontent,puser=@puser,pdate=@pdate ,purl=@purl where id=" + UID;
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

            OleDbParameter purl = new OleDbParameter("@purl", OleDbType.LongVarWChar);
            purl.Value = FilePath;
            insertValue.Add(purl);

            int p = AccessDb.ExecuteNon(sqlEdit, ref insertValue);
            JS.Alert("修改成功！");
        }
    }
}