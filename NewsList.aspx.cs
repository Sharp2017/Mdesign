using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using Mdesign.App_Code;
namespace Mdesign
{
    public partial class NewsList : System.Web.UI.Page
    {
        private int count = 15;//每页记录数
        private string _SelfPageName;

        /// <summary>
        /// 本页名称
        /// </summary>
        public string SelfPageName
        {
            get { return _SelfPageName; }
            set { _SelfPageName = value; }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
               
                showleft2();
                
            }
        }
 

        private void showleft2()
        {
            string strCount = ConfigurationManager.AppSettings.Get("NewsCount");
            if (strCount != null || strCount.Length > 0)
            {
                try
                {
                    this.count = Convert.ToInt32(strCount);
                }
                catch (System.Exception ex)
                {

                }
            }
            string _TemSelfName = Request.Url.AbsolutePath;
           
            _SelfPageName = Server.UrlEncode(_TemSelfName);

            DataTable mydt = null;
            mydt = AccessDb.Execute("select    * from t_news     order by id desc").Tables[0];
            
            //   数据源
            PagedDataSource Pgds = new PagedDataSource();
            Pgds.DataSource = mydt.DefaultView;

            //        设置允许分页
            Pgds.AllowPaging = true;
            //        每页显示为6行
            Pgds.PageSize = count;
            //        显示总共页数
            //
            lblTotalPage.Text = Pgds.PageCount.ToString();
            //        当前页
            int CurrentPage;
            //        请求页码为不为null设置当前页，否则为第一页
            if (Request.QueryString["Page"] != null)
            {
                CurrentPage = Convert.ToInt32(Request.QueryString["Page"]);
            }
            else
            {
                CurrentPage = 1;
            }
            //   当前页所引为页码-1
            Pgds.CurrentPageIndex = CurrentPage - 1;
            //   显示当前页码
            lblCurrentPage.Text = CurrentPage.ToString();
            //   如果不是第一页，通过参数Page设置上一页为当前页-1，否则不显示连接
            lnkFirst.NavigateUrl = Request.CurrentExecutionFilePath + "?Page=1";
            lnkLast.NavigateUrl = Request.CurrentExecutionFilePath + "?Page=" + Pgds.PageCount;
            if (!Pgds.IsFirstPage)
            {
                //  Request.CurrentExecutionFilePath为当前请求虚拟路径
                lnkPrev.NavigateUrl = Request.CurrentExecutionFilePath + "?Page=" + Convert.ToString(CurrentPage - 1);
            }
            //        End If
            //   如果不是最后一页，通过参数Page设置下一页为当前页+1，否则不显示连接
            if (!Pgds.IsLastPage)
            {
                //    Request.CurrentExecutionFilePath为当前请求虚拟路径
                lnkNext.NavigateUrl = Request.CurrentExecutionFilePath + "?Page=" + Convert.ToString(CurrentPage + 1);
            }
            //   模板绑定数据源  
            rpleft2.DataSource = Pgds;
            rpleft2.DataBind();

        }
         
    }
}