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
using System.Web.Configuration;
using Mdesign.App_Code;

namespace Mdesign.manage
{
    public partial class b_sampleList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            CheckLogin.checkAll();

            MyPage1.InitPagerControls(this.DGList);
            MyPage1.MyEvent += new EventHandler(this.showgrid);
            if (!IsPostBack)
            {
                showgrid(null, null);
                SHowCount();
            }
        }
        private void SHowCount()
        {
            string SaveCountList = ConfigurationManager.AppSettings.Get("CommonCount");
            if (SaveCountList != null || SaveCountList.Length > 0)
            {
                try
                {
                    this.txtSaveCountList.Text = SaveCountList;
                }
                catch (System.Exception ex)
                {

                }
            }

        }
        private void showgrid(object sender, System.EventArgs e)
        {

            DataTable mydt = null;

            mydt = AccessDb.Execute("select * from t_sample  order by id desc").Tables[0];

            DGList.DataSource = mydt;
            try
            {
                DGList.DataBind();
                MyPage1.init(mydt.Rows.Count);
            }
            catch
            {
                if ((DGList.CurrentPageIndex - 1) >= 0)
                    DGList.CurrentPageIndex = DGList.CurrentPageIndex - 1;
                DGList.DataBind();
                MyPage1.init(mydt.Rows.Count);
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
                //				if (e.Item.Cells[8].Text=="没有处理")
                //					e.Item.Cells[8].Text="<table bgcolor=green width=100%><tr><td><font color=white>没有处理</font></td></tr></table>";
                //				else 
                //					e.Item.Cells[8].Text="<table bgcolor=red width=100%><tr><td><font color=black>已经处理</font></td></tr></table>";

                //e.Item.Cells[4].Text = string.Format(System.Convert.ToDateTime(e.Item.Cells[4].Text).ToString(), "YYYY年M月d日");

            }
        }

        protected void DGList_DeleteCommand(object source, DataGridCommandEventArgs e)
        {
            int nowRow = int.Parse(e.Item.Cells[0].Text);
            try
            {
                string sql = "delete from t_sample where id=" + nowRow.ToString();
                AccessDb.ExecuteNonQuery(sql);
                JS.Alert("删除成功");
            }
            catch (Exception ex)
            {
                JS.Alert("删除失败:" + ex);
            }

            showgrid(source, e);
        }
        protected void btnSaveCountList_Click(object sender, EventArgs e)
        {
            try
            {

                Configuration config = WebConfigurationManager.OpenWebConfiguration("~");

                AppSettingsSection appSetting = config.AppSettings;

                //如果不存在则添加

                if (appSetting.Settings["CommonCount"] == null)
                {

                    appSetting.Settings.Add("CommonCount", this.txtSaveCountList.Text.ToString().Trim());

                }

                else//否则修改
                {

                    appSetting.Settings["CommonCount"].Value = this.txtSaveCountList.Text.ToString().Trim();

                }

                config.Save(ConfigurationSaveMode.Full);
                JS.Alert("修改成功！");

            }
            catch (System.Exception ex)
            {
                JS.Alert("修改失败！错误信息:" + ex);
            }
        }
    }
}