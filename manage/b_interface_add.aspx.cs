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
    public partial class b_interface_add : System.Web.UI.Page
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

            string sql = "select * from t_interface where id=" + UID;
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
            string title = this.txt_title.Text;
            string content = content2.Value;
            string sql = "insert into t_interface (ptitle,pcontent) values(@ptitle,@pcontent)";
            ArrayList insertValue = new ArrayList();
            OleDbParameter ptitle = new OleDbParameter("@ptitle", OleDbType.VarChar);
            ptitle.Value = title;
            insertValue.Add(ptitle);
            OleDbParameter pcontent = new OleDbParameter("@pcontent", OleDbType.LongVarWChar);
            pcontent.Value = content;
            insertValue.Add(pcontent);
            int p = AccessDb.ExecuteNon(sql, ref insertValue);
            JS.Alert("添加成功！");
        }
        private void edit()
        {
            string title = this.txt_title.Text;

            string content = content2.Value;

            //string sql = "insert into t_news (ptitle,pcontent,puser,pdate,ptype) values(@ptitle,@pcontent,@puser,@pdate,@ptype)";
            string sqlEdit = "update t_interface set ptitle=@ptitle,pcontent=@pcontent  where id=" + UID;
            ArrayList insertValue = new ArrayList();
            OleDbParameter ptitle = new OleDbParameter("@ptitle", OleDbType.VarChar);
            ptitle.Value = title;
            insertValue.Add(ptitle);
            OleDbParameter pcontent = new OleDbParameter("@pcontent", OleDbType.LongVarWChar);
            pcontent.Value = content;
            insertValue.Add(pcontent);

            int p = AccessDb.ExecuteNon(sqlEdit, ref insertValue);
            JS.Alert("修改成功！");

        }
    }
}