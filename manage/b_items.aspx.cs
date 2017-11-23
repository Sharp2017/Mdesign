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
    public partial class b_items : System.Web.UI.Page
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
            this.but_save.Attributes.Add("onclick", "return conf();");


            this.but_save.Attributes.Add("onclick", "return conf();");
            // Page1.InitPagerControls(this.DGList);
            // Page1.MyEvent += new EventHandler(this.showgrid);
            if (!IsPostBack)
            {

                showgrid(null, null);
            }

        }


        private void showgrid(object sender, System.EventArgs e)
        {

            DataTable mydt = null;

            mydt = AccessDb.Execute("select * from t_programs order by psort").Tables[0];

            DGList.DataSource = mydt;
            try
            {
                DGList.DataBind();
                // Page1.init(mydt.Rows.Count);
            }
            catch
            {
                if ((DGList.CurrentPageIndex - 1) >= 0)
                    DGList.CurrentPageIndex = DGList.CurrentPageIndex - 1;
                DGList.DataBind();
                // Page1.init(mydt.Rows.Count);
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

                e.Item.Cells[8].Attributes.Add("onclick", "return confirm('你确定要删除吗？');");

                if (e.Item.Cells[5].Text.ToLower() == "true")
                    e.Item.Cells[5].Text = "<table bgcolor=red width=100%><tr><td><font color=white>是</font></td></tr></table>";
                else
                    e.Item.Cells[5].Text = "<table bgcolor=green width=100%><tr><td><font color=white>否</font></td></tr></table>";
                //e.Item.Cells[3].Text = string.Format(System.Convert.ToDateTime(e.Item.Cells[3].Text).ToString(), "YYYY年M月d日");

            }
        }
        protected void but_save_Click(object sender, EventArgs e)
        {
            int sort = 0;

            try
            {
                sort = int.Parse(this.txt_sort.Text);
            }
            catch
            {
                JS.Alert("请输入整数！");
                return;
            }
            if (this.txt_title.Text.Length >= 255)
            {
                JS.Alert("栏目名称过长，请重新输入！");
                return;
            }

            if (ViewState["pk"] != null)
            {
                //edit
                string sql = "update t_programs set ptitle='{0}' ,purl='{1}',pstate={2}, picurl='{3}',psort={4} where id=" + ViewState["pk"].ToString();

                sql = string.Format(sql, this.txt_title.Text, this.txt_url.Text, this.drp_isUse.SelectedValue == "是" ? "True" : "False", "", sort.ToString());
                AccessDb.ExecuteNonQuery(sql);
                JS.Alert("修改成功");
                ViewState["pk"] = null;
                //this.txt_title.Enabled = true;
            }
            else
            {
                //tianjia
                string sql = "insert into t_programs(ptitle,purl,pstate,picurl,psort) values('{0}','{1}',{2},'{3}',{4})";
                sql = string.Format(sql, this.txt_title.Text, this.txt_url.Text, this.drp_isUse.SelectedValue == "是" ? "True" : "False", "", sort);
                AccessDb.ExecuteNonQuery(sql);
                JS.Alert("添加成功");
            }

            this.txt_title.Text = "";
            this.txt_url.Text = "";
            txt_sort.Text = "";
            this.drp_isUse.SelectedIndex = 0;
            showgrid(null, null);
        }
        protected void DGList_DeleteCommand(object source, DataGridCommandEventArgs e)
        {
            int nowRow = int.Parse(e.Item.Cells[0].Text);
            string sql = "delete from t_programs where id=" + nowRow.ToString();
            AccessDb.ExecuteNonQuery(sql);

            JS.Alert("删除成功");


            showgrid(source, e);
        }
        protected void DGList_EditCommand(object source, DataGridCommandEventArgs e)
        {
            ViewState["pk"] = e.Item.Cells[0].Text;
            string sql = "select * from t_programs where id=" + ViewState["pk"].ToString();
            DataTable dt = AccessDb.Execute(sql).Tables[0];


            this.txt_title.Text = dt.Rows[0]["ptitle"].ToString();
            this.txt_url.Text = dt.Rows[0]["purl"].ToString();
            string isShow = dt.Rows[0]["pstate"].ToString();
            string sort = dt.Rows[0]["psort"].ToString();
            this.txt_sort.Text = sort;

            if (isShow.ToLower() == "false")
            {
                this.drp_isUse.SelectedIndex = 1;
            }
            else
            {
                this.drp_isUse.SelectedIndex = 0;
            }
            //this.txt_title.Enabled = false;

        }
        protected void DGList_UpdateCommand(object source, DataGridCommandEventArgs e)
        {

        }
    }
}