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
    public partial class b_sampleAdd : System.Web.UI.Page
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
                {
                    editIni();
                }
                else
                {
                    this.txt_DateTime.Value = DateTime.Now.ToUniversalTime().ToString();
                }
            }


        }
        private void editIni()
        {

            string sql = "select * from t_sample where id=" + UID;
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
            this.txt_Url.Text = DR["purl"].ToString();
            this.content2.Value = DR["pcontent"].ToString();
            this.HyperLink1.NavigateUrl = DR["ppic"].ToString();
            this.HyperLink1.Target = "_blank";
            this.txt_DateTime.Value = DR["pdate"].ToString();

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



            string title = this.txt_title.Text;
            if (title == null | title.Length <= 0)
            {
                JS.Alert("题目不能为空！");
                return;
            }
            if (title.Length >= 255)
            {
                JS.Alert("题目过长！");
                return;
            }

            string url = this.txt_Url.Text;
            if (url == null | url.Length <= 0)
            {
                JS.Alert("地址不能为空！");
                return;
            }
            if (url.Length >= 255)
            {
                JS.Alert("地址过长！");
                return;
            }

            string content = content2.Value;

            string strDateTime = this.txt_DateTime.Value;

            string sql = "insert into t_sample (ptitle,pcontent,purl,ppic,pdate) values(@ptitle,@pcontent,@url,@ppic,@pdate)";
            ArrayList insertValue = new ArrayList();
            OleDbParameter ptitle = new OleDbParameter("@ptitle", OleDbType.VarChar);
            ptitle.Value = title;
            insertValue.Add(ptitle);

            OleDbParameter pcontent = new OleDbParameter("@pcontent", OleDbType.LongVarWChar);
            pcontent.Value = content;
            insertValue.Add(pcontent);

            OleDbParameter purl = new OleDbParameter("@purl", OleDbType.VarChar);
            purl.Value = url;
            insertValue.Add(purl);

            OleDbParameter ppic = new OleDbParameter("@ppic", OleDbType.LongVarWChar);
            ppic.Value = Pic1;
            insertValue.Add(ppic);

            OleDbParameter pdate = new OleDbParameter("@pdate", OleDbType.Date);
            pdate.Value = strDateTime;
            insertValue.Add(pdate);


            int p = AccessDb.ExecuteNon(sql, ref insertValue);
            JS.Alert("添加成功！");

            this.txt_title.Text = "";
            this.txt_Url.Text = "";
            this.content2.Value = "";

        }

        private void edit()
        {

            string Pic1 = "";
            Pic1 = File1.Value;


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
            if (title == null | title.Length <= 0)
            {
                JS.Alert("题目不能为空！");
                return;
            }
            if (title.Length >= 255)
            {
                JS.Alert("题目过长！");
                return;
            }

            string url = this.txt_Url.Text;
            if (url == null | url.Length <= 0)
            {
                JS.Alert("地址不能为空！");
                return;
            }
            if (url.Length >= 255)
            {
                JS.Alert("地址过长！");
                return;
            }
            string content = content2.Value;

            string strDateTime = this.txt_DateTime.Value;
            string sqlEdit = "update t_sample set ptitle=@ptitle,pcontent=@pcontent , purl=@url, pdate=@pdate  where id=" + UID;
            ArrayList insertValue = new ArrayList();
            OleDbParameter ptitle = new OleDbParameter("@ptitle", OleDbType.VarChar);
            ptitle.Value = title;
            insertValue.Add(ptitle);



            OleDbParameter pcontent = new OleDbParameter("@pcontent", OleDbType.LongVarWChar);
            pcontent.Value = content;
            insertValue.Add(pcontent);

            OleDbParameter purl = new OleDbParameter("@purl", OleDbType.VarChar);
            purl.Value = url;
            insertValue.Add(purl);

            OleDbParameter pdate = new OleDbParameter("@pdate", OleDbType.Date);
            pdate.Value = strDateTime;
            insertValue.Add(pdate);

            int p = AccessDb.ExecuteNon(sqlEdit, ref insertValue);
            JS.Alert("修改成功！");
        }

        private void editPic(string pic)
        {
            try
            {
                string title = this.txt_title.Text;
                if (title == null | title.Length <= 0)
                {
                    JS.Alert("题目不能为空！");
                    return;
                }
                if (title.Length >= 255)
                {
                    JS.Alert("题目过长！");
                    return;
                }

                string url = this.txt_Url.Text;
                if (url == null | url.Length <= 0)
                {
                    JS.Alert("地址不能为空！");
                    return;
                }
                if (url.Length >= 255)
                {
                    JS.Alert("地址过长！");
                    return;
                }
                string content = content2.Value;

                string strDateTime = this.txt_DateTime.Value;

                string sqlEdit = "update t_sample set ptitle=@ptitle , pcontent=@pcontent ,  purl=@purl , ppic=@ppic, pdate=@pdate where id=" + UID;

                ArrayList insertValue = new ArrayList();

                OleDbParameter _ptitle = new OleDbParameter("@ptitle", OleDbType.VarChar);
                _ptitle.Value = title;
                insertValue.Add(_ptitle);


                OleDbParameter pcontent = new OleDbParameter("@pcontent", OleDbType.LongVarWChar);
                pcontent.Value = content;
                insertValue.Add(pcontent);

                OleDbParameter _purl = new OleDbParameter("@purl", OleDbType.VarChar);
                _purl.Value = url;
                insertValue.Add(_purl);

                OleDbParameter _ppic = new OleDbParameter("@ppic", OleDbType.LongVarWChar);
                _ppic.Value = pic;
                insertValue.Add(_ppic);

                OleDbParameter pdate = new OleDbParameter("@pdate", OleDbType.Date);
                pdate.Value = strDateTime;
                insertValue.Add(pdate);

                int p = AccessDb.ExecuteNon(sqlEdit, ref insertValue);
                JS.Alert("修改成功！");
            }
            catch (System.Exception ex)
            {
                JS.Alert("修改错误！错误信息:" + ex.Message);
            }


        }
    }
}