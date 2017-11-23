using System;
using System.Collections;
using System.Collections.Generic;
using System.Data.OleDb;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.IO;
using Mdesign.App_Code;


namespace Mdesign.manage
{
    public partial class b_plat : System.Web.UI.Page
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

                    return "";
                }
                try
                {
                    return o.ToString();
                }
                catch
                {

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
                    editIni();
            }


        }
        private void editIni()
        {

            string sql = "select * from t_plat where id=" + UID;
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
            this.content2.Value = DR["pcontent"].ToString();
            //if (DR["purl"]!=null)
            //{
            //    this.File1.Value=DR["purl"].ToString();

            //}
        }

        protected void Button1_Click(object sender, EventArgs e)
        {

            if (UID == "")
                add();
            else
                edit();

        }

        private void add()
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
                JS.Alert("题目不能为空！");
                return;
            }
            if (title.Length >= 255)
            {
                JS.Alert("题目过长！");
                return;
            }
            string content = content2.Value;

            if (content == null || content.Length <= 0)
            {
                JS.Alert("内容不能为空！");
                return;
            }

            string sql = "insert into t_plat (ptitle,pcontent,purl) values(@ptitle,@pcontent,@purl)";
            ArrayList insertValue = new ArrayList();
            OleDbParameter ptitle = new OleDbParameter("@ptitle", OleDbType.VarChar);
            ptitle.Value = title;
            insertValue.Add(ptitle);
            OleDbParameter pcontent = new OleDbParameter("@pcontent", OleDbType.LongVarWChar);
            pcontent.Value = content;
            insertValue.Add(pcontent);

            OleDbParameter purl = new OleDbParameter("@purl", OleDbType.LongVarWChar);
            purl.Value = FilePath;
            insertValue.Add(purl);

            int p = AccessDb.ExecuteNon(sql, ref insertValue);
            JS.Alert("添加成功！");

            this.txt_title.Text = "";
            this.content2.Value = "";
        }

        private void edit()
        {
            string title = this.txt_title.Text;

            if (title == null || title.Length <= 0)
            {
                JS.Alert("题目不能为空！");
                return;
            }
            if (title.Length >= 255)
            {
                JS.Alert("题目过长！");
                return;
            }
            string content = content2.Value;

            if (content == null || content.Length <= 0)
            {
                JS.Alert("内容不能为空！");
                return;
            }



            string FilePath = "";

            FilePath = File1.Value;

            if (FilePath.Length > 0)
            {

                FilePath = FileUp.meUpfile(this.File1, @"~\file\", true);
                FilePath = FilePath.Substring(FilePath.IndexOf('\\') + 1);

            }


            string sqlEdit = "update t_plat set ptitle=@ptitle,pcontent=@pcontent  ,purl=@purl  where id=" + UID;
            ArrayList insertValue = new ArrayList();
            OleDbParameter ptitle = new OleDbParameter("@ptitle", OleDbType.VarChar);
            ptitle.Value = title;
            insertValue.Add(ptitle);
            OleDbParameter pcontent = new OleDbParameter("@pcontent", OleDbType.LongVarWChar);
            pcontent.Value = content;
            insertValue.Add(pcontent);

            OleDbParameter purl = new OleDbParameter("@purl", OleDbType.LongVarWChar);
            purl.Value = FilePath;
            insertValue.Add(purl);

            int p = AccessDb.ExecuteNon(sqlEdit, ref insertValue);
            JS.Alert("修改成功！");
        }
    }
}