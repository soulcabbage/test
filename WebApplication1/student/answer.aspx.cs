using System;
using System.Data;
using System.Linq;
using System.Configuration;
using System.Collections;
using System.Collections.Generic;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using MyOnLineExam.DataAccessLayer;
using System.Data.SqlClient;
using MyOnLineExam.BusinessLogicLayer;

namespace WebApplication1.student
{
    public partial class answer : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["PaperID"] != null)
                {
                    Session["PaperID"] = Request.QueryString["PaperID"];
                    DataBase db = new DataBase();//创建DataBase类对象
                    string GridView1Str = "select PaperName from Paper where PaperID='" + Session["PaperID"] + "'";
                    string PaperName = db.GetString(GridView1Str);
                    lblPaperName.Text = PaperName;
                    Session["PaperName"] = PaperName;
                }
                else
                {
                    lblPaperName.Text = Session["PaperName"].ToString();
                }
                InitData();
            }
        }
        //初始化试卷，从数据库中将试题取出
        protected void InitData()
        {
            SqlParameter[] Params1 = new SqlParameter[2];
            DataBase DB = new DataBase();
            int paperID = int.Parse(Session["PaperID"].ToString());
            Params1[0] = DB.MakeInParam("@PaperID", SqlDbType.Int, 4, paperID);               //试卷编号
            Params1[1] = DB.MakeInParam("@Type", SqlDbType.VarChar, 10, "单选题");            //题目类型        
            DataSet ds1 = DB.GetDataSet("Proc_PaperDetail", Params1);
            GridView1.DataSource = ds1;
            GridView1.DataBind();
            ((Label)GridView1.HeaderRow.FindControl("Label27")).Text = ((Label)GridView1.Rows[0].FindControl("Label4")).Text;

            SqlParameter[] Params2 = new SqlParameter[2];
            Params2[0] = DB.MakeInParam("@PaperID", SqlDbType.Int, 4, paperID);               //试卷编号
            Params2[1] = DB.MakeInParam("@Type", SqlDbType.VarChar, 10, "多选题");            //题目类型        
            DataSet ds2 = DB.GetDataSet("Proc_PaperDetail", Params2);
            GridView2.DataSource = ds2;
            GridView2.DataBind();
            ((Label)GridView2.HeaderRow.FindControl("Label28")).Text = ((Label)GridView2.Rows[0].FindControl("Label8")).Text;

            SqlParameter[] Params3 = new SqlParameter[2];
            Params3[0] = DB.MakeInParam("@PaperID", SqlDbType.Int, 4, paperID);               //试卷编号
            Params3[1] = DB.MakeInParam("@Type", SqlDbType.VarChar, 10, "判断题");            //题目类型        
            DataSet ds3 = DB.GetDataSet("Proc_PaperDetail", Params3);
            GridView3.DataSource = ds3;
            GridView3.DataBind();
            ((Label)GridView3.HeaderRow.FindControl("Label29")).Text = ((Label)GridView3.Rows[0].FindControl("Label12")).Text;

            SqlParameter[] Params4 = new SqlParameter[2];
            Params4[0] = DB.MakeInParam("@PaperID", SqlDbType.Int, 4, paperID);               //试卷编号
            Params4[1] = DB.MakeInParam("@Type", SqlDbType.VarChar, 10, "填空题");            //题目类型        
            DataSet ds4 = DB.GetDataSet("Proc_PaperDetail", Params4);
            GridView4.DataSource = ds4;
            GridView4.DataBind();
            ((Label)GridView4.HeaderRow.FindControl("Label30")).Text = ((Label)GridView4.Rows[0].FindControl("Label17")).Text;
        }
    }
}