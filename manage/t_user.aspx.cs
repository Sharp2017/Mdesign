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
    public partial class t_user : System.Web.UI.Page
    {
        protected void Page_Load(object sender, System.EventArgs e)
        {
            CheckLogin.checkAll();
            this.but_save.Attributes.Add("onclick", "return conf();");

            if (!IsPostBack)
            {

                showgrid(null, null);
            }
        }
        private void showgrid(object sender, System.EventArgs e)
        {

            DataTable mydt = null;

            mydt = AccessDb.Execute("select * from t_user").Tables[0];

            DGList.DataSource = mydt;
            try
            {
                DGList.DataBind();

            }
            catch
            {
                if ((DGList.CurrentPageIndex - 1) >= 0)
                    DGList.CurrentPageIndex = DGList.CurrentPageIndex - 1;
                DGList.DataBind();

            }
        }

        private int getYe()
        {
            int cou = this.DGList.CurrentPageIndex;
            return cou * this.DGList.PageSize;
        }


        #region Web 窗体设计器生成的代码
        override protected void OnInit(EventArgs e)
        {
            //
            // CODEGEN: 该调用是 ASP.NET Web 窗体设计器所必需的。
            //
            InitializeComponent();
            base.OnInit(e);
        }

        /// <summary>
        /// 设计器支持所需的方法 - 不要使用代码编辑器修改
        /// 此方法的内容。
        /// </summary>
        private void InitializeComponent()
        {
            this.but_save.Click += new System.EventHandler(this.but_save_Click);
            this.DGList.EditCommand += new System.Web.UI.WebControls.DataGridCommandEventHandler(this.DGList_EditCommand);
            this.DGList.DeleteCommand += new System.Web.UI.WebControls.DataGridCommandEventHandler(this.DGList_DeleteCommand);
            this.DGList.ItemDataBound += new System.Web.UI.WebControls.DataGridItemEventHandler(this.DGList_ItemDataBound);
            this.Load += new System.EventHandler(this.Page_Load);

        }
        #endregion

        private void DGList_ItemDataBound(object sender, System.Web.UI.WebControls.DataGridItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                e.Item.Cells[1].Text = Convert.ToString(int.Parse(e.Item.ItemIndex.ToString()) + 1 + getYe());

                e.Item.Cells[4].Attributes.Add("onclick", "return confirm('你确定要删除吗？');");
                //				if (e.Item.Cells[8].Text=="没有处理")
                //					e.Item.Cells[8].Text="<table bgcolor=green width=100%><tr><td><font color=white>没有处理</font></td></tr></table>";
                //				else 
                //					e.Item.Cells[8].Text="<table bgcolor=red width=100%><tr><td><font color=black>已经处理</font></td></tr></table>";
                //e.Item.Cells[3].Text = string.Format(System.Convert.ToDateTime(e.Item.Cells[3].Text).ToString(), "YYYY年M月d日");

            }
        }

        private void DGList_DeleteCommand(object source, System.Web.UI.WebControls.DataGridCommandEventArgs e)
        {

            try
            {
                AccessDb.ExecuteNonQuery("delete from t_user where id=" + int.Parse(e.Item.Cells[0].Text));
                JS.Alert("删除成功");
            }
            catch (Exception ex)
            {
                JS.Alert("删除失败:" + ex);
            }

            showgrid(source, e);
        }

        private void DGList_EditCommand(object source, System.Web.UI.WebControls.DataGridCommandEventArgs e)
        {
            ViewState["pk"] = e.Item.Cells[0].Text;
            this.txt_user.Text = e.Item.Cells[2].Text;
            txt_user.Enabled = false;


        }

        private void but_save_Click(object sender, System.EventArgs e)
        {
            //add
            if (ViewState["pk"] != null)
            {//edit
                txt_user.Enabled = true;
                try
                {
                    string pass = this.txt_pass.Text;
                    AccessDb.ExecuteNonQuery("update  t_user set pass='" + pass + "' where id=" + ViewState["pk"].ToString());
                    JS.Alert("修改成功");
                    ViewState["pk"] = null;
                }
                catch (Exception ex)
                {
                    JS.Alert("修改失败:" + ex);
                }


            }
            else
            {
                if (AccessDb.Execute("select * from t_user where Uname='" + this.txt_user.Text.Trim().Replace("'", "''") + "'").Tables[0].Rows.Count != 0)
                {
                    JS.Alert("存在同名用户");
                    return;
                }
                try
                {
                    string pass = this.txt_pass.Text;
                    string uname = this.txt_user.Text;
                    string sql = "insert into t_user (uname,pass) values('{0}','{1}')";
                    sql = string.Format(sql, uname, pass);
                    AccessDb.ExecuteNonQuery(sql);
                    JS.Alert("添加成功");
                    ViewState["pk"] = null;
                }
                catch (Exception ex)
                {
                    JS.Alert("添加失败:" + ex);
                }

            }
            showgrid(null, null);
            this.txt_user.Text = "";
            this.txt_pass.Text = "";
        }
    }
}