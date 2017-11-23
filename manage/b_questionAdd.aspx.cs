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
    public partial class b_questionAdd : System.Web.UI.Page
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

            string sql = "select * from t_question where id=" + UID;
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
            this.HyperLink1.NavigateUrl = DR["ppic"].ToString();
            this.HyperLink1.Target = "_blank";
            if (DR["ppic"].ToString().Trim() != "")
                this.HyperLink1.Text = "点击查看";
            else
                this.HyperLink1.Text = "---";

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

            string Pic1 = "";
            Pic1 = File1.Value;

            if (Pic1.Length > 0)
            {
                Pic1 = FileUp.meUpfile(this.File1, @"~\pic\", false);
            }

            bool _pAnswered = false;

            string title = this.txt_title.Text;
            if (title == null || title.Length <= 0)
            {
                JS.Alert("问题题目不能为空！");
                return;
            }

            if (title.Length >= 255)
            {
                JS.Alert("问题题目过长！");
                return;
            }
            string content = content2.Value;
            if (content != null && content.Length > 0)
            {
                _pAnswered = true;
            }
            else
            {
                _pAnswered = false;
            }

            string sql = "insert into t_question (ptitle,pcontent,ppic,pdate,pAnswered) values(@ptitle,@pcontent,@ppic,@pdate,@pAnswered)";
            ArrayList insertValue = new ArrayList();
            OleDbParameter ptitle = new OleDbParameter("@ptitle", OleDbType.VarChar);
            ptitle.Value = title;
            insertValue.Add(ptitle);
            OleDbParameter pcontent = new OleDbParameter("@pcontent", OleDbType.LongVarWChar);
            pcontent.Value = content;
            insertValue.Add(pcontent);

            OleDbParameter ppic = new OleDbParameter("@ppic", OleDbType.LongVarWChar);
            ppic.Value = Pic1;
            insertValue.Add(ppic);

            OleDbParameter pdate = new OleDbParameter("@pdate", OleDbType.Date);
            pdate.Value = DateTime.Now;
            insertValue.Add(pdate);

            OleDbParameter pAnswered = new OleDbParameter("@pAnswered", OleDbType.Boolean);
            pAnswered.Value = _pAnswered;
            insertValue.Add(pAnswered);


            int p = AccessDb.ExecuteNon(sql, ref insertValue);
            JS.Alert("添加成功！");

            this.txt_title.Text = "";
            this.content2.Value = "";

        }
        private void edit()
        {
            string Pic1 = "";
            Pic1 = File1.Value;

            if (Pic1.Length > 0)
            {
                Pic1 = FileUp.meUpfile(this.File1, @"~\pic\", false);
            }
            if (Pic1 == "")
            {
                editNoPic();
            }
            else
            {
                editPic(Pic1);
            }
        }

        private void editNoPic()
        {
            string title = this.txt_title.Text;

            string content = content2.Value;

            bool _pAnswered = false;


            if (content != null && content.Length > 0)
            {
                _pAnswered = true;
            }
            else
            {
                _pAnswered = false;
            }

            string sqlEdit = "update t_question set ptitle=@ptitle,pcontent=@pcontent ,pAnswered=@pAnswered where id=" + UID;
            ArrayList insertValue = new ArrayList();
            OleDbParameter ptitle = new OleDbParameter("@ptitle", OleDbType.VarChar);
            ptitle.Value = title;
            insertValue.Add(ptitle);
            OleDbParameter pcontent = new OleDbParameter("@pcontent", OleDbType.LongVarWChar);
            pcontent.Value = content;
            insertValue.Add(pcontent);

            OleDbParameter pAnswered = new OleDbParameter("@pAnswered", OleDbType.Boolean);
            pAnswered.Value = _pAnswered;
            insertValue.Add(pAnswered);

            int p = AccessDb.ExecuteNon(sqlEdit, ref insertValue);
            JS.Alert("修改成功！");
        }

        private void editPic(string pic)
        {
            string title = this.txt_title.Text;

            string content = content2.Value;
            bool _pAnswered = false;


            if (content != null && content.Length > 0)
            {
                _pAnswered = true;
            }
            else
            {
                _pAnswered = false;
            }

            string sqlEdit = "update t_question set ptitle=@ptitle,pcontent=@pcontent ,ppic=@ppic ,pAnswered=@pAnswered where id=" + UID;
            ArrayList insertValue = new ArrayList();
            OleDbParameter ptitle = new OleDbParameter("@ptitle", OleDbType.VarChar);
            ptitle.Value = title;
            insertValue.Add(ptitle);


            OleDbParameter pcontent = new OleDbParameter("@pcontent", OleDbType.LongVarWChar);
            pcontent.Value = content;
            insertValue.Add(pcontent);

            OleDbParameter ppic = new OleDbParameter("@ppic", OleDbType.LongVarWChar);
            ppic.Value = pic;
            insertValue.Add(ppic);

            OleDbParameter pAnswered = new OleDbParameter("@pAnswered", OleDbType.Boolean);
            pAnswered.Value = _pAnswered;
            insertValue.Add(pAnswered);

            int p = AccessDb.ExecuteNon(sqlEdit, ref insertValue);
            JS.Alert("修改成功！");
        }
    }
}