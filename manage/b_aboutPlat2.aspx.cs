﻿using System;
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
    public partial class b_aboutPlat2 : System.Web.UI.Page
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
            string sql = "select * from t_about where pname='padv'";
            DataTable dt = AccessDb.Execute(sql).Tables[0];
            if (dt.Rows.Count == 0)
            {
                 JS.Alert("发生错误");
                Response.End();
            }
            this.content2.Value = dt.Rows[0]["pcontent"].ToString();
        }
        protected void Button1_Click(object sender, EventArgs e)
        {

            string content = content2.Value;

            string sql = "update t_about set pcontent=@pcontent where pname='padv'";
            ArrayList insertValue = new ArrayList();

            OleDbParameter pcontent = new OleDbParameter("@pcontent", OleDbType.LongVarWChar);
            pcontent.Value = content;
            insertValue.Add(pcontent);


            int p = AccessDb.ExecuteNon(sql, ref insertValue);
            JS.Alert("成功！");
        }
    }
}