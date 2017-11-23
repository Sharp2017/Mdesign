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
using System.Data.OleDb;
using Mdesign.App_Code;
namespace Mdesign.manage
{
    public partial class b_topnews : System.Web.UI.Page
    {
        private string _uid;
        public string UID
        {
            get
            {
                object o = Request.QueryString["id"];
                if (o == null)
                {
                    this._uid = "";
                    return "";
                }
                else
                {
                    try
                    {
                        this._uid = o.ToString();
                        return o.ToString();
                    }
                    catch
                    {
                    }
                }

                this._uid = o.ToString();
                return o.ToString();
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            // CheckLogin.checkAll();
            this.but_save.Attributes.Add("onclick", "return conf();");
            if (!IsPostBack)
            {
                ini();
            }

            this.but_save.Attributes.Add("onclick", "return conf();");


        }

        private void ini()
        {
            if (UID != null && !UID.Equals(String.Empty))
            {
                string sql = "select * from t_lunpic where id=" + UID;
                DataTable dt = AccessDb.Execute(sql).Tables[0];
                if (dt != null)
                {
                    this.link1.NavigateUrl = dt.Rows[0]["ppic"].ToString();
                    this.link1.Target = "_blank";
                    this.txt_title.Text = dt.Rows[0]["ptitle"].ToString();
                    this.txt_url.Text = dt.Rows[0]["purl"].ToString();
                    this.txt_sort.Text = dt.Rows[0]["psort"].ToString();
                    string isShow = dt.Rows[0]["PIsShow"].ToString();
                    if (isShow.ToLower() == "false")
                    {
                        this.drp_isUse.SelectedIndex = 1;
                    }
                    else
                    {
                        this.drp_isUse.SelectedIndex = 0;
                    }
                }
            }



        }

        protected void but_save_Click(object sender, EventArgs e)
        {

            string Pic1;
            Pic1 = this.File1.Value;
            string title = this.txt_title.Text;
            string url = this.txt_url.Text;
            string strSort = txt_sort.Text;
            int intsort = 0;
            try
            {
                intsort = int.Parse(this.txt_sort.Text);
            }
            catch
            {
                JS.Alert("序号必须为数字类型！");
                return;
            }
            string strIsShow = this.drp_isUse.SelectedValue.ToString();
            bool IsShow = (this.drp_isUse.SelectedValue == "是" ? true : false);

            if (UID != null && !UID.Equals(String.Empty))
            {

                if (Pic1.Length > 0)
                {
                    Pic1 = FileUp.meUpfile(this.File1, @"~\pic\", false);
                }
                if (Pic1 == "")
                {
                    bool flag = updatSqlNoPic(title, url, intsort, IsShow, UID);
                    if (flag)
                    {
                        JS.Alert("更新成功");
                        //Response.Redirect("b_topnewsList.aspx?id=news", false);
                    }
                    else
                    {
                        JS.Alert("更新失败");
                    }

                }
                else
                {

                    bool flag = updatSql(Pic1, title, url, intsort, IsShow, UID);
                    if (flag)
                    {
                        JS.Alert("成功");
                    }
                    else
                    {
                        JS.Alert("失败");
                    }
                }
            }
            else
            {
                if (Pic1.Length > 0)
                {
                    Pic1 = FileUp.meUpfile(this.File1, @"~\pic\", false);
                    if (Pic1 == "")
                    {
                        JS.Alert("图片选择错误！");
                    }
                    else
                    {
                        bool flag = AddSqlPic(Pic1, title, url, intsort, IsShow);
                        if (flag)
                        {
                            JS.Alert("添加成功！");
                        }
                        else
                        {
                            JS.Alert("添加失败！");
                        }
                    }
                }
                else
                {
                    JS.Alert("图片选择错误！");
                }
            }

        }

        private bool updatSql(string pic, string title, string url, int sort, bool IsShow, string id)
        {
            string sql = "update t_lunpic set  ppic=@ppic,ptitle=@ptitle , purl=@purl ,psort=@psort,PIsShow=@PIsShow where ID=@pid";

            ArrayList insertValue = new ArrayList();

            OleDbParameter ppic = new OleDbParameter("@ppic", OleDbType.VarChar);
            ppic.Value = pic;
            insertValue.Add(ppic);

            OleDbParameter ptitle = new OleDbParameter("@ptitle", OleDbType.VarChar);
            ptitle.Value = title;
            insertValue.Add(ptitle);

            OleDbParameter purl = new OleDbParameter("@purl", OleDbType.VarChar);
            purl.Value = url;
            insertValue.Add(purl);

            OleDbParameter psort = new OleDbParameter("@psort", OleDbType.Integer);
            psort.Value = sort;
            insertValue.Add(psort);

            OleDbParameter PIsShow = new OleDbParameter("@PIsShow", OleDbType.Boolean);
            PIsShow.Value = IsShow;
            insertValue.Add(PIsShow);

            OleDbParameter pid = new OleDbParameter("@pid", OleDbType.VarChar);
            pid.Value = id;
            insertValue.Add(pid);

            int p = AccessDb.ExecuteNon(sql, ref insertValue);
            if (p == 1)
                return true;
            else
                return false;
        }


        private bool updatSqlNoPic(string title, string url, int sort, bool IsShow, string id)
        {

            string sql = "update t_lunpic set  ptitle=@ptitle , purl=@purl ,psort=@psort,PIsShow=@PIsShow where ID=@pid";
            ArrayList insertValue = new ArrayList();

            OleDbParameter ptitle = new OleDbParameter("@ptitle", OleDbType.VarChar);
            ptitle.Value = title;
            insertValue.Add(ptitle);

            OleDbParameter purl = new OleDbParameter("@purl", OleDbType.VarChar);
            purl.Value = url;
            insertValue.Add(purl);

            OleDbParameter psort = new OleDbParameter("@psort", OleDbType.Integer);
            psort.Value = sort;
            insertValue.Add(psort);

            OleDbParameter PIsShow = new OleDbParameter("@PIsShow", OleDbType.Boolean);
            PIsShow.Value = IsShow;
            insertValue.Add(PIsShow);

            OleDbParameter pid = new OleDbParameter("@pid", OleDbType.VarChar);
            pid.Value = id;
            insertValue.Add(pid);


            int p = AccessDb.ExecuteNon(sql, ref insertValue);
            if (p == 1)
                return true;
            else
                return false;
        }

        /// <summary>
        /// 添加
        /// </summary>
        /// <param name="title"></param>
        /// <param name="url"></param>
        /// <param name="sort"></param>
        /// <param name="IsShow"></param>
        /// <returns></returns>
        private bool AddSqlPic(string pic, string title, string url, int sort, bool IsShow)
        {

            string sql = "insert into t_lunpic (ppic,ptitle,purl,psort,PIsShow) values(@ppic,@ptitle,@purl,@psort,@PIsShow)";
            ArrayList insertValue = new ArrayList();

            OleDbParameter ppic = new OleDbParameter("@ppic", OleDbType.VarChar);
            ppic.Value = pic;
            insertValue.Add(ppic);

            OleDbParameter ptitle = new OleDbParameter("@ptitle", OleDbType.VarChar);
            ptitle.Value = title;
            insertValue.Add(ptitle);

            OleDbParameter purl = new OleDbParameter("@purl", OleDbType.VarChar);
            purl.Value = url;
            insertValue.Add(purl);

            OleDbParameter psort = new OleDbParameter("@psort", OleDbType.Integer);
            psort.Value = sort;
            insertValue.Add(psort);

            OleDbParameter PIsShow = new OleDbParameter("@PIsShow", OleDbType.Boolean);
            PIsShow.Value = IsShow;
            insertValue.Add(PIsShow);

            int p = AccessDb.ExecuteNon(sql, ref insertValue);
            if (p == 1)
                return true;
            else
                return false;
        }

    }
}