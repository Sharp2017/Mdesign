using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using Mdesign.App_Code;

namespace Mdesign.UserControl
{
    public partial class NewsList : System.Web.UI.UserControl
    {
        private int Count;
        protected void Page_Load(object sender, EventArgs e)
        {
            #region//新闻2
            string strCount = ConfigurationManager.AppSettings.Get("NewsDetailCount");
            if (strCount != null || strCount.Length > 0)
            {
                try
                {
                    this.Count = Convert.ToInt32(strCount);
                }
                catch (System.Exception ex)
                {

                }
            }

            DataTable mydt = null;
            mydt = AccessDb.Execute("select top " + Count.ToString() + " * from t_news   order by id desc").Tables[0];
            this.rpleft2.DataSource = mydt;
            this.rpleft2.DataBind();
            #endregion
        }
    }
}