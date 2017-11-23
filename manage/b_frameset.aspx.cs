using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Mdesign.App_Code;

namespace Mdesign.manage
{
    public partial class b_frameset : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                inin();
        }
        private void inin()
        {
            FrameSet one = FrameSet.GetOne("资源中心");
            this.txt_height.Text = one.Height.ToString();
            this.txt_width.Text = one.Width.ToString();
            this.txt_src.Text = one.Src;


        }

        protected void but_default_Click(object sender, EventArgs e)
        {
            FrameSet one = new FrameSet();
            one.Height = int.Parse(this.txt_height.Text);
            one.Width = int.Parse(this.txt_width.Text);
            one.Src = this.txt_src.Text;

            FrameSet.Edit(one, "资源中心");
            JS.Alert("保存成功");

        }
    }
}