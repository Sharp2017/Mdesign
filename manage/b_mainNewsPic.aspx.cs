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
    public partial class b_mainNewsPic : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            CheckLogin.checkAll();
            if (!IsPostBack)
            {
                ini();
            }
        }
        private void ini()
        {
            string sql = "select * from t_const where pname='newRight'";
            DataTable dt = AccessDb.Execute(sql).Tables[0];
            if (dt.Rows.Count == 0)
            {
                Response.Write("请先填写");
            }
            else
            {
                this.content2.Value = dt.Rows[0]["pcontent"].ToString();
            }

        }
        protected void Button1_Click(object sender, EventArgs e)
        {

            string content = content2.Value;
            string sql = "update t_const set pcontent=@pcontent where pname='newRight'";
            ArrayList insertValue = new ArrayList();

            OleDbParameter pcontent = new OleDbParameter("@pcontent", OleDbType.LongVarWChar);
            pcontent.Value = content;
            insertValue.Add(pcontent);


            int p = AccessDb.ExecuteNon(sql, ref insertValue);
            JS.Alert("修改成功！");
        }
    }
}