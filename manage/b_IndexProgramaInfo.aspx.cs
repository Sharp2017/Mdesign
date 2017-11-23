using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Web.Configuration;
using Mdesign.App_Code;

namespace Mdesign.manage
{
    public partial class b_IndexProgramaInfo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ShowInfo();
            }
        }

        /// <summary>
        /// 说明信息加载
        /// </summary>
        private void ShowInfo()
        {
            //服务资源
            string strSourceInfo = ConfigurationManager.AppSettings.Get("SourceInfo");
            if (strSourceInfo != null || strSourceInfo.Length > 0)
            {
                try
                {
                    string[] str = strSourceInfo.Split('|');
                    this.txtSourceURL.Text = str[0];
                    this.txtAreaSource.Value = str[1];
                }
                catch (System.Exception ex)
                {

                }

            }

            //数据成果
            string strDataInfo = ConfigurationManager.AppSettings.Get("DataInfo");
            if (strDataInfo != null || strDataInfo.Length > 0)
            {
                try
                {
                    string[] str = strDataInfo.Split('|');
                    this.txtDataURL.Text = str[0];
                    this.txtAreaData.Value = str[1];
                }
                catch (System.Exception ex)
                {

                }

            }

            //共享成效
            string strCommonInfo = ConfigurationManager.AppSettings.Get("CommonInfo");
            if (strCommonInfo != null || strCommonInfo.Length > 0)
            {
                try
                {
                    string[] str = strCommonInfo.Split('|');
                    this.txtCommonURL.Text = str[0];
                    this.txtAreaCommon.Value = str[1];
                }
                catch (System.Exception ex)
                {

                }

            }


            //平台指南
            string strPlantInfo = ConfigurationManager.AppSettings.Get("PlantInfo");
            if (strPlantInfo != null || strPlantInfo.Length > 0)
            {
                try
                {
                    string[] str = strPlantInfo.Split('|');
                    this.txtPlantURL.Text = str[0];
                    this.txtAreaPlant.Value = str[1];
                }
                catch (System.Exception ex)
                {

                }

            }

            //开发园地
            string strDesignInfo = ConfigurationManager.AppSettings.Get("DesignInfo");
            if (strDesignInfo != null || strDesignInfo.Length > 0)
            {
                try
                {
                    string[] str = strDesignInfo.Split('|');
                    this.txtDesignURL.Text = str[0];
                    this.txtAreaDesign.Value = str[1];
                }
                catch (System.Exception ex)
                {

                }

            }

            //常见问题
            string strQuestionInfo = ConfigurationManager.AppSettings.Get("QuestionInfo");
            if (strQuestionInfo != null || strQuestionInfo.Length > 0)
            {
                try
                {
                    string[] str = strQuestionInfo.Split('|');
                    this.txtQuestionURL.Text = str[0];
                    this.txtAreaQuestion.Value = str[1];
                }
                catch (System.Exception ex)
                {

                }

            }
        }
        /// <summary>
        /// 服务资源修改
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnSourceSave_Click(object sender, EventArgs e)
        {
            try
            {
                string strURL = this.txtSourceURL.Text;
                string strInfo = this.txtAreaSource.Value;

                if (strURL.Trim().Equals(String.Empty))
                {
                    JS.Alert("链接输入不正确！");
                    return;
                }
                if (strInfo.Trim().Equals(String.Empty))
                {
                    JS.Alert("简介输入不正确！");
                    return;
                }

                Configuration config = WebConfigurationManager.OpenWebConfiguration("~");

                AppSettingsSection appSetting = config.AppSettings;

                //如果不存在则添加

                if (appSetting.Settings["SourceInfo"] == null)
                {

                    appSetting.Settings.Add("SourceInfo", strURL + "|" + strInfo);

                }

                else//否则修改
                {

                    appSetting.Settings["SourceInfo"].Value = strURL + "|" + strInfo;

                }

                config.Save(ConfigurationSaveMode.Full);
                JS.Alert("修改成功！");

            }
            catch (System.Exception ex)
            {
                JS.Alert("修改失败！错误信息:" + ex);
            }
        }
        /// <summary>
        /// 数据成果修改
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnDataSave_Click(object sender, EventArgs e)
        {
            try
            {
                string strURL = this.txtDataURL.Text;
                string strInfo = this.txtAreaData.Value;
                if (strURL.Trim().Equals(String.Empty))
                {
                    JS.Alert("链接输入不正确！");
                    return;
                }
                if (strInfo.Trim().Equals(String.Empty))
                {
                    JS.Alert("简介输入不正确！");
                    return;
                }

                Configuration config = WebConfigurationManager.OpenWebConfiguration("~");

                AppSettingsSection appSetting = config.AppSettings;

                //如果不存在则添加

                if (appSetting.Settings["DataInfo"] == null)
                {

                    appSetting.Settings.Add("DataInfo", strURL + "|" + strInfo);

                }

                else//否则修改
                {

                    appSetting.Settings["DataInfo"].Value = strURL + "|" + strInfo;

                }
                config.Save(ConfigurationSaveMode.Full);

                JS.Alert("修改成功！");

            }
            catch (System.Exception ex)
            {
                JS.Alert("修改失败！错误信息:" + ex);
            }
        }

        /// <summary>
        /// 共享成效修改
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnCommonSave_Click(object sender, EventArgs e)
        {
            try
            {
                string strURL = this.txtCommonURL.Text;
                string strInfo = this.txtAreaCommon.Value;
                if (strURL.Trim().Equals(String.Empty))
                {
                    JS.Alert("链接输入不正确！");
                    return;
                }
                if (strInfo.Trim().Equals(String.Empty))
                {
                    JS.Alert("简介输入不正确！");
                    return;
                }

                Configuration config = WebConfigurationManager.OpenWebConfiguration("~");

                AppSettingsSection appSetting = config.AppSettings;

                //如果不存在则添加

                if (appSetting.Settings["CommonInfo"] == null)
                {

                    appSetting.Settings.Add("CommonInfo", strURL + "|" + strInfo);

                }

                else//否则修改
                {

                    appSetting.Settings["CommonInfo"].Value = strURL + "|" + strInfo;

                }

                config.Save(ConfigurationSaveMode.Full);

                JS.Alert("修改成功！");

            }
            catch (System.Exception ex)
            {
                JS.Alert("修改失败！错误信息:" + ex);
            }
        }


        /// <summary>
        /// 平台指南修改
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnPlantSave_Click(object sender, EventArgs e)
        {
            try
            {
                string strURL = this.txtPlantURL.Text;
                string strInfo = this.txtAreaPlant.Value;
                if (strURL.Trim().Equals(String.Empty))
                {
                    JS.Alert("链接输入不正确！");
                    return;
                }
                if (strInfo.Trim().Equals(String.Empty))
                {
                    JS.Alert("简介输入不正确！");
                    return;
                }


                Configuration config = WebConfigurationManager.OpenWebConfiguration("~");

                AppSettingsSection appSetting = config.AppSettings;

                //如果不存在则添加

                if (appSetting.Settings["PlantInfo"] == null)
                {

                    appSetting.Settings.Add("PlantInfo", strURL + "|" + strInfo);

                }

                else//否则修改
                {

                    appSetting.Settings["PlantInfo"].Value = strURL + "|" + strInfo;

                }
                config.Save(ConfigurationSaveMode.Full);

                JS.Alert("修改成功！");

            }
            catch (System.Exception ex)
            {
                JS.Alert("修改失败！错误信息:" + ex);
            }
        }

        /// <summary>
        /// 开发园地修改
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnDesignSave_Click(object sender, EventArgs e)
        {
            try
            {
                string strURL = this.txtDesignURL.Text;
                string strInfo = this.txtAreaDesign.Value;
                if (strURL.Trim().Equals(String.Empty))
                {
                    JS.Alert("链接输入不正确！");
                    return;
                }
                if (strInfo.Trim().Equals(String.Empty))
                {
                    JS.Alert("简介输入不正确！");
                    return;
                }

                Configuration config = WebConfigurationManager.OpenWebConfiguration("~");

                AppSettingsSection appSetting = config.AppSettings;

                //如果不存在则添加

                if (appSetting.Settings["DesignInfo"] == null)
                {
                    appSetting.Settings.Add("DesignInfo", strURL + "|" + strInfo);

                }
                else//否则修改
                {
                    appSetting.Settings["DesignInfo"].Value = strURL + "|" + strInfo;
                }

                config.Save(ConfigurationSaveMode.Full);

                JS.Alert("修改成功！");

            }
            catch (System.Exception ex)
            {
                JS.Alert("修改失败！错误信息:" + ex);
            }
        }

        /// <summary>
        /// 常见问题修改
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnQuestionSave_Click(object sender, EventArgs e)
        {
            try
            {
                string strURL = this.txtQuestionURL.Text;
                string strInfo = this.txtAreaQuestion.Value;
                if (strURL.Trim().Equals(String.Empty))
                {
                    JS.Alert("链接输入不正确！");
                    return;
                }
                if (strInfo.Trim().Equals(String.Empty))
                {
                    JS.Alert("简介输入不正确！");
                    return;
                }

                Configuration config = WebConfigurationManager.OpenWebConfiguration("~");

                AppSettingsSection appSetting = config.AppSettings;

                //如果不存在则添加

                if (appSetting.Settings["QuestionInfo"] == null)
                {

                    appSetting.Settings.Add("QuestionInfo", strURL + "|" + strInfo);

                }

                else//否则修改
                {

                    appSetting.Settings["QuestionInfo"].Value = strURL + "|" + strInfo;

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