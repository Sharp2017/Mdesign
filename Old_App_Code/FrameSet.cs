using System;
using System.Collections.Generic;
using System.Web;
using System.Data;
namespace Mdesign.App_Code
{
    public class FrameSet
    {
        public int Height { get; set; }
        public int Width { get; set; }
        public string Src { get; set; }

        public FrameSet()
        {

        }

        public static FrameSet GetOne(string which)
        {
            string sql = "select * from t_frameset where theType='" + which + "'";
            DataTable dt = AccessDb.Execute(sql).Tables[0];
            if (dt == null)
                return null;
            FrameSet one = new FrameSet();
            one.Height = int.Parse(dt.Rows[0]["theHeight"].ToString());
            one.Width = int.Parse(dt.Rows[0]["theWidth"].ToString());
            one.Src = dt.Rows[0]["theSrc"].ToString();
            return one;
        }
        public static void Save(FrameSet one, string which)
        {
            string sql = "insert into t_frameset(theHeight,theWidth,theSrc,theType) values({0},{1},'{2}','{3}')";
            sql = string.Format(sql, one.Height.ToString(), one.Width.ToString(), one.Src, which);
            AccessDb.ExecuteNonQuery(sql);
        }

        public static void Edit(FrameSet one, string which)
        {
            string sql = "update t_frameset set theHeight={0},theWidth={1},theSrc='{2}' where theType='{3}'";
            sql = string.Format(sql, one.Height.ToString(), one.Width.ToString(), one.Src, which);
            AccessDb.ExecuteNonQuery(sql);
        }
    }
}