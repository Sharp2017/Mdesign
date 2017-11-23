using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Web.Configuration;
using Mdesign.App_Code;

namespace Mdesign.manage
{
    public partial class b_topnewsList : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            CheckLogin.checkAll();
            if (!IsPostBack)
            {
                this.lb_title.Text = "首页图片播放管理";
            }

            //  this.but_save.Attributes.Add("onclick", "return conf();");
            MyPage1.InitPagerControls(this.DGList);
            MyPage1.MyEvent += new EventHandler(this.showgrid);
            if (!IsPostBack)
            {

                showgrid(null, null);

                ShowCount();
            }
        }



        private void showgrid(object sender, System.EventArgs e)
        {

            DataTable mydt = null;

            mydt = AccessDb.Execute("select * from t_lunpic order by id desc").Tables[0];

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


        /// <summary>
        /// 显示图片数量
        /// </summary>
        private void ShowCount()
        {
            string SaveCountList = ConfigurationManager.AppSettings.Get("PicNewsCount");
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

                e.Item.Cells[4].Text = e.Item.Cells[4].Text.ToString();
            }
        }

        protected void DGList_DeleteCommand(object source, DataGridCommandEventArgs e)
        {
            int nowRow = int.Parse(e.Item.Cells[0].Text);
            try
            {
                string sql = "delete from t_lunpic where id=" + nowRow.ToString();
                AccessDb.ExecuteNonQuery(sql);
                JS.Alert("删除成功");
            }
            catch (Exception ex)
            {
                JS.Alert("删除失败:" + ex);
            }

            showgrid(source, e);
        }

        /// <summary>
        /// 显示图片数量修改
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnSaveCountList_Click(object sender, EventArgs e)
        {
            try
            {

                Configuration config = WebConfigurationManager.OpenWebConfiguration("~");

                AppSettingsSection appSetting = config.AppSettings;

                //如果不存在则添加

                if (appSetting.Settings["PicNewsCount"] == null)
                {

                    appSetting.Settings.Add("PicNewsCount", this.txtSaveCountList.Text.ToString().Trim());

                }

                else//否则修改
                {

                    appSetting.Settings["PicNewsCount"].Value = this.txtSaveCountList.Text.ToString().Trim();

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