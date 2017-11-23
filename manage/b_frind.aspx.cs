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
using Mdesign.App_Code;

namespace Mdesign.manage
{
    public partial class b_frind : System.Web.UI.Page
    {
        #region 获取编号 页面启动
        private string _uid;

        public string UID
        {
            get
            {
                object o = Request.QueryString["id"];
                if (o == null)
                {
                    JS.Alert("请选择用户");
                    this.but_save.Enabled = false;
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



        #endregion


        protected void Page_Load(object sender, EventArgs e)
        {
            CheckLogin.checkAll();
            if (!IsPostBack)
            {
                //if (UID != "")
                //    ini();
            }

            this.but_save.Attributes.Add("onclick", "return conf();");

            this.MyPage1.InitPagerControls(this.DGList);
            this.MyPage1.MyEvent += new EventHandler(this.showgrid);
            if (!IsPostBack)
            {

                showgrid(null, null);
            }

        }

        private void ini()
        {

            try
            {

            }
            catch
            {
                JS.Alert("编码错误！没找到用户信息");
                this.but_save.Enabled = false;
                return;
            }

        }
        private void showgrid(object sender, System.EventArgs e)
        {

            DataTable mydt = null;

            mydt = AccessDb.Execute("select * from t_frind").Tables[0];

            DGList.DataSource = mydt;
            try
            {
                DGList.DataBind();
                this.MyPage1.init(mydt.Rows.Count);
            }
            catch
            {
                if ((DGList.CurrentPageIndex - 1) >= 0)
                    DGList.CurrentPageIndex = DGList.CurrentPageIndex - 1;
                DGList.DataBind();
                this.MyPage1.init(mydt.Rows.Count);
            }
        }

        private int getYe()
        {
            int cou = this.DGList.CurrentPageIndex;
            return cou * this.DGList.PageSize;
        }

        protected void DGList_ItemDataBound(object sender, DataGridItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                e.Item.Cells[1].Text = Convert.ToString(int.Parse(e.Item.ItemIndex.ToString()) + 1 + getYe());

                e.Item.Cells[5].Attributes.Add("onclick", "return confirm('你确定要删除吗？');");
                //				if (e.Item.Cells[8].Text=="没有处理")
                //					e.Item.Cells[8].Text="<table bgcolor=green width=100%><tr><td><font color=white>没有处理</font></td></tr></table>";
                //				else 
                //					e.Item.Cells[8].Text="<table bgcolor=red width=100%><tr><td><font color=black>已经处理</font></td></tr></table>";
                //e.Item.Cells[3].Text = string.Format(System.Convert.ToDateTime(e.Item.Cells[3].Text).ToString(), "YYYY年M月d日");

            }
        }
        protected void but_save_Click(object sender, EventArgs e)
        {
            string sql = "insert into t_frind(ptitle,purl,ptype) values('{0}','{1}','{2}')";
            string title = this.txt_title.Text;
            string type = this.DropDownList1.SelectedValue;
            string url = this.txt_url.Text;
            sql = string.Format(sql, title, url, type);
            AccessDb.ExecuteNonQuery(sql);
            JS.Alert("添加成功");

            this.txt_title.Text = "";
            this.txt_url.Text = "";


            showgrid(null, null);
        }
        protected void DGList_DeleteCommand(object source, DataGridCommandEventArgs e)
        {
            int nowRow = int.Parse(e.Item.Cells[0].Text);
            string sql = "delete from t_frind where id=" + nowRow.ToString();
            AccessDb.ExecuteNonQuery(sql);
            try
            {

                JS.Alert("删除成功");
            }
            catch (Exception ex)
            {
                JS.Alert("删除失败:" + ex);
            }

            showgrid(source, e);
        }
    }
}