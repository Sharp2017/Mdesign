using System;
using System.Data;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.IO;

namespace Mdesign.App_Code
{
    public class FileUp
    {
        public FileUp()
        {
            //
            //TODO: 在此处添加构造函数逻辑
            //
        }


        /// </summary>
        /// <param name="page"></param>
        /// <param name="fil"></param>
        /// <param name="strLujing"></param>
        /// <returns></returns>

        public static string meUpfile(System.Web.UI.HtmlControls.HtmlInputFile fil, string strLujing, bool isFile)
        {
            //返回 "" 失败
            //正常 返回 需要存入数据库的路径
            System.Web.UI.Page page;
            page = HttpContext.Current.Handler as System.Web.UI.Page;

            if (fil.PostedFile.FileName.Trim() != "")
            {
                try
                {

                    string filename;
                    string strReturn;
                    string nam1;
                    nam1 = fil.PostedFile.FileName;
                    string newext1;
                    newext1 = nam1.Substring(nam1.LastIndexOf(".")).ToLower();


                    //					if (newext1!=".jpg" && newext1!=".jpeg" && newext1!=".gif")			 
                    //						return "";

                    DateTime now1;
                    now1 = DateTime.Now;
                    string newname1;
                    //if (fil.PostedFile.ContentLength > 100000000)
                    //    strReturn = "0";
                    //else
                    //{
                    if (isFile)
                    {
                        string filePath = page.Server.MapPath(strLujing + fil.PostedFile.FileName);
                        if (File.Exists(filePath))
                        {
                            File.Delete(filePath);
                        }
                        fil.PostedFile.SaveAs(page.Server.MapPath(strLujing + fil.PostedFile.FileName));
                        strReturn = strLujing.Replace("///", "/") + fil.PostedFile.FileName;
                    }
                    else
                    {
                        newname1 = now1.DayOfYear.ToString() + fil.PostedFile.ContentLength.ToString() + System.DateTime.Now.Millisecond.ToString();
                        filename = newname1 + newext1;
                        fil.PostedFile.SaveAs(page.Server.MapPath(strLujing + filename));
                        strReturn = strLujing.Replace("///", "/") + filename;
                    }

                    //}
                    return strReturn;


                }
                catch (Exception ex)
                {

                    throw new Exception(ex.Message);
                }
            }
            else
            {
                return "";
            }
        }

    }
}