using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Collections;
using System.Data.OleDb;
using Mdesign.App_Code;

namespace Mdesign.manage
{
    public partial class b_sourceadd : System.Web.UI.Page
    {
        private string _uid;
        private DataRow _dr;
        public DataRow DR
        {
            get
            {
                return _dr;
            }
            set
            {
                _dr = value;
            }
        }

        public string UID
        {
            get
            {
                object o = Request.QueryString["id"];
                if (o == null)
                {

                    return "";
                }
                try
                {
                    return o.ToString();
                }
                catch
                {

                }
                this._uid = o.ToString();
                return "";
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            CheckLogin.checkAll();
            if (!IsPostBack)
            {
                if (UID != "")
                {
                    editIni();
                }
                else
                {
                    this.txt_DateTime.Value = DateTime.Now.ToUniversalTime().ToString();
                }
            }
        }

        /// <summary>
        /// 记录初始化
        /// </summary>
        private void editIni()
        {

            string sql = "select * from t_service where id=" + UID;
            DataTable dt = AccessDb.Execute(sql).Tables[0];
            if (dt.Rows.Count == 0)
            {
                JS.Alert("读数据失败");
                Response.End();
            }
            else
            {
                _dr = dt.Rows[0];
            }

            if (DR["ptitle"] != null)
            {
                this.txt_title.Text = DR["ptitle"].ToString();
            }
            else
            {
                this.txt_title.Text = "";
            }

            if (DR["surl"] != null)
            {
                this.txt_url.Text = DR["surl"].ToString(); ;
            }
            else
            {
                this.txt_url.Text = "";
            }


            if (DR["unit"] != null)
            {
                this.txt_unit.Text = DR["unit"].ToString();
            }
            else
            {
                this.txt_title.Text = "";
            }
            if (DR["servicetype"] != null)
            {
                this.txt_servicetype.Text = DR["servicetype"].ToString();
            }
            else
            {
                this.txt_servicetype.Text = "";
            }

            if (DR["remark"] != null)
            {
                this.txt_remark.Text = DR["remark"].ToString();
            }
            else
            {
                this.txt_remark.Text = "";
            }
            if (DR["redu"] != null)
            {
                this.txt_redu.Text = DR["redu"].ToString();
            }
            else
            {
                this.txt_redu.Text = "";
            }
            if (DR["setdate"] != null)
            {
                this.txt_DateTime.Value = DR["setdate"].ToString();
            }
            else
            {
                this.txt_DateTime.Value = DateTime.Now.ToUniversalTime().ToString();
            }

        }


        /// <summary>
        /// 添加记录
        /// </summary>
        private void add()
        {

            try
            {

                string title = this.txt_title.Text;

                if (title == null || title.Length <= 0)
                {
                    JS.Alert("资源标题不能为空！");
                    return;
                }
                if (title.Length >= 255)
                {
                    JS.Alert("资源标题过长！");
                    return;
                }
                string unit = this.txt_unit.Text;

                if (unit.Length >= 255)
                {
                    JS.Alert("资源单位过长！");
                    return;
                }
                string url = this.txt_url.Text;
                if (unit.Length >= 255)
                {
                    JS.Alert("资源地址过长！");
                    return;
                }

                string servicetype = this.txt_servicetype.Text;
                if (unit.Length >= 255)
                {
                    JS.Alert("资源服务类型过长！");
                    return;
                }
                string remark = this.txt_remark.Text;
                if (unit.Length >= 255)
                {
                    JS.Alert("资源服务简介过长！");
                    return;
                }

                string redu = this.txt_redu.Text;
                try
                {
                    int intredu = Convert.ToInt32(redu);
                }
                catch (System.Exception ex)
                {
                    JS.Alert("热度值应为数字！");
                    return;
                }

                string strDateTime = this.txt_DateTime.Value;

                string sql = "insert into t_service (ptitle,unit,surl,servicetype,remark,setdate,redu) values(@stitle,@sunit,@surl,@sservicetype,@sremark,@ssetdate,@sredu)";

                ArrayList insertValue = new ArrayList();

                OleDbParameter stitle = new OleDbParameter("@stitle", OleDbType.VarChar);
                stitle.Value = title;
                insertValue.Add(stitle);

                OleDbParameter sunit = new OleDbParameter("@sunit", OleDbType.VarChar);
                sunit.Value = unit;
                insertValue.Add(sunit);

                OleDbParameter surl = new OleDbParameter("@surl", OleDbType.VarChar);
                surl.Value = url;
                insertValue.Add(surl);

                OleDbParameter sservicetype = new OleDbParameter("@sservicetype", OleDbType.VarChar);
                sservicetype.Value = servicetype;
                insertValue.Add(sservicetype);


                OleDbParameter sremark = new OleDbParameter("@sremark", OleDbType.VarChar);
                sremark.Value = remark;
                insertValue.Add(sremark);

                OleDbParameter ssetdate = new OleDbParameter("@ssetdate", OleDbType.VarChar);
                ssetdate.Value = strDateTime;
                insertValue.Add(ssetdate);

                OleDbParameter sredu = new OleDbParameter("@sredu", OleDbType.Integer);
                sredu.Value = redu;
                insertValue.Add(sredu);

                int p = AccessDb.ExecuteNon(sql, ref insertValue);
                JS.Alert("添加成功！");
            }
            catch (System.Exception ex)
            {
                JS.Alert("添加失败！错误信息：" + ex.Message);
            }
        }

        protected void btn_Save_Click(object sender, EventArgs e)
        {
            if (UID == "")
                add();
            else
                edit();
        }

        private void edit()
        {
            try
            {
                string title = this.txt_title.Text;

                if (title == null || title.Length <= 0)
                {
                    JS.Alert("资源标题不能为空！");
                    return;
                }
                if (title.Length >= 255)
                {
                    JS.Alert("资源标题过长！");
                    return;
                }
                string unit = this.txt_unit.Text;

                if (unit.Length >= 255)
                {
                    JS.Alert("资源单位过长！");
                    return;
                }
                string url = this.txt_url.Text;
                if (unit.Length >= 255)
                {
                    JS.Alert("资源地址过长！");
                    return;
                }

                string servicetype = this.txt_servicetype.Text;
                if (unit.Length >= 255)
                {
                    JS.Alert("资源服务类型过长！");
                    return;
                }
                string remark = this.txt_remark.Text;
                if (unit.Length >= 255)
                {
                    JS.Alert("资源服务简介过长！");
                    return;
                }

                string redu = this.txt_redu.Text;
                try
                {
                    int intredu = Convert.ToInt32(redu);
                }
                catch (System.Exception ex)
                {
                    JS.Alert("热度值应为数字！");
                    return;
                }
                string strDateTime = this.txt_DateTime.Value;

                string sqlEdit = "update t_service set ptitle=@stitle, unit=@sunit, surl=@surl, servicetype=@sservicetype, remark=@sremark ,setdate=@ssetdate, redu=@sredu where ID=" + UID;

                ArrayList insertValue = new ArrayList();

                OleDbParameter stitle = new OleDbParameter("@stitle", OleDbType.VarChar);
                stitle.Value = title;
                insertValue.Add(stitle);

                OleDbParameter sunit = new OleDbParameter("@sunit", OleDbType.VarChar);
                sunit.Value = unit;
                insertValue.Add(sunit);

                OleDbParameter surl = new OleDbParameter("@surl", OleDbType.VarChar);
                surl.Value = url;
                insertValue.Add(surl);

                OleDbParameter sservicetype = new OleDbParameter("@sservicetype", OleDbType.VarChar);
                sservicetype.Value = servicetype;
                insertValue.Add(sservicetype);

                OleDbParameter sremark = new OleDbParameter("@sremark", OleDbType.VarChar);
                sremark.Value = remark;
                insertValue.Add(sremark);


                OleDbParameter ssetdate = new OleDbParameter("@ssetdate", OleDbType.VarChar);
                ssetdate.Value = strDateTime;
                insertValue.Add(ssetdate);

                OleDbParameter sredu = new OleDbParameter("@sredu", OleDbType.Integer);
                sredu.Value = redu;
                insertValue.Add(sredu);



                int p = AccessDb.ExecuteNon(sqlEdit, ref insertValue);
                JS.Alert("修改成功！");
            }
            catch (System.Exception ex)
            {
                JS.Alert("修改失败！错误信息:" + ex.Message);
            }

        }
    }
}