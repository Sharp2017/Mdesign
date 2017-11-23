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

namespace Mdesign.manage.classPage
{
    public partial class MyPage : System.Web.UI.UserControl
    {

        public DataGrid usersGrid;
        public event EventHandler MyEvent;
        private string _str;


        public string Name
        {
            get
            {
                return _str;
            }
            set
            {
                _str = value;
            }
        }

        protected void OnMyEvent(EventArgs e)
        {
            MyEvent(this, e);
        }


        public void init(int count)
        {
            initDrop();
            ViewState["count"] = count.ToString();//共有多少个
            initSelf(ViewState["count"].ToString());


        }
        private void initDrop()
        {
            //'构建选页下拉列表lstPageSelector，并选中显示其当前页值
            int i;

            this.DrpPageList.Items.Clear();

            for (i = 1; i <= usersGrid.PageCount; i++)
            {
                this.DrpPageList.Items.Add(i.ToString());
                if (i == (usersGrid.CurrentPageIndex + 1))
                {
                    this.DrpPageList.Items[i - 1].Selected = true;
                }


            }

        }
        private void iniDropState()
        {
            this.DrpPageList.SelectedIndex = -1;
            this.DrpPageList.Items.FindByText(((int)(usersGrid.CurrentPageIndex + 1)).ToString()).Selected = true;

        }
        private void initSelf(string count)
        {//根据当前页值判断linkbutton上页/下页的enabled与否
            if (usersGrid.PageCount == 1)
            {
                Hfirst.Enabled = false;
                Hpre.Enabled = false;
                Hnext.Enabled = false;
                Hend.Enabled = false;

            }
            else if (usersGrid.PageCount == 0)
            {
                Hfirst.Enabled = false;
                Hpre.Enabled = false;
                Hnext.Enabled = false;
                Hend.Enabled = false;
            }
            else
            {
                int abc;
                abc = usersGrid.PageCount - 1;
                int temp;
                temp = usersGrid.CurrentPageIndex;
                if (temp == 0)
                {
                    Hfirst.Enabled = false;
                    Hpre.Enabled = false;
                    Hnext.Enabled = true;
                    Hend.Enabled = true;
                }
                else if (temp == abc)
                {
                    Hfirst.Enabled = true;
                    Hpre.Enabled = true;
                    Hnext.Enabled = false;
                    Hend.Enabled = false;
                }
                else
                {
                    Hfirst.Enabled = true;
                    Hpre.Enabled = true;
                    Hnext.Enabled = true;
                    Hend.Enabled = true;
                }
            }
            this.Label1.Text = "共" + count.ToString() + "个 当前 [" + (usersGrid.CurrentPageIndex + 1).ToString() + "/" + usersGrid.PageCount.ToString() + "] 页  每页 [" + usersGrid.PageSize.ToString() + "] 条记录 ";
            //this.Label1.Text ="All:<font color=#0000ff><b>"+ count.ToString() +"</b></font>&nbsp;&nbsp;<font color=#0000ff><b>" + (usersGrid.CurrentPageIndex + 1).ToString() + "</b></font>/<font color=#0000ff><b>" + usersGrid.PageCount.ToString() + "</b></font> ";//<font color=#0000ff><b>" + usersGrid.PageSize.ToString() + "</b></font>";




        }
        public void InitPagerControls(DataGrid grid)
        {
            this.usersGrid = grid;

        }

        protected void Page_Load(object sender, EventArgs e)
        {

        }


        protected void Hfirst_Click(object sender, EventArgs e)
        {
            usersGrid.CurrentPageIndex = 0;
            usersGrid.EditItemIndex = -1;
            MyEvents();
        }
        protected void Hpre_Click(object sender, EventArgs e)
        {
            usersGrid.EditItemIndex = -1;
            if (usersGrid.CurrentPageIndex > 0)
                usersGrid.CurrentPageIndex = usersGrid.CurrentPageIndex - 1;
            MyEvents();
        }
        protected void Hnext_Click(object sender, EventArgs e)
        {
            usersGrid.EditItemIndex = -1;
            if (usersGrid.CurrentPageIndex < (usersGrid.PageCount - 1))
                usersGrid.CurrentPageIndex = usersGrid.CurrentPageIndex + 1;
            MyEvents();
        }
        protected void Hend_Click(object sender, EventArgs e)
        {
            usersGrid.EditItemIndex = -1;
            usersGrid.CurrentPageIndex = usersGrid.PageCount - 1;
            MyEvents();

        }
        protected void DrpPageList_SelectedIndexChanged(object sender, EventArgs e)
        {
            usersGrid.CurrentPageIndex = int.Parse(this.DrpPageList.SelectedValue) - 1;
            // Cancel edit mode
            usersGrid.EditItemIndex = -1;
            MyEvents();

        }
        private void MyEvents()
        {
            OnMyEvent(EventArgs.Empty);
            initSelf(ViewState["count"].ToString());

            iniDropState();

        }
        
    }
}