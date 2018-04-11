using System;
using System.Linq;
using System.Data;
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
using MyOnLineExam.BusinessLogicLayer;

namespace WebApplication1.student
{
    public partial class have_test : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                InitDDLData();
                GridViewBind();
            }
        }
        protected void InitDDLData()
        {
            Course course = new Course();       //创建考试科目对象
            DataSet ds = course.QueryCourse();  //查询考试科目信息
            ddlCourse.DataSource = ds;          //指名考试科目列表框数据源
            ddlCourse.DataTextField = "Name";   //DataTextField显示Name字段值
            ddlCourse.DataValueField = "ID";    //DataValueField显示ID字段值
            ddlCourse.DataBind();               //绑定数据
        }
        protected void ddlCourse_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewBind();//为GridView绑定数据
        }

        protected void GridViewBind()
        {

            DataBase db = new DataBase();//创建DataBase类对象
            string GridView1Str = " select * from [dbo].[Paper] where [Paper].CourseID='" + int.Parse(ddlCourse.SelectedValue) + "' and PaperState=0 and PaperID in(select PaperID from Score where UserID='" + Session["userID"] + "')";//查询该账号数据库是否存在
            DataSet ds = db.GetDataSetSql(GridView1Str);

            GridView1.DataSource = ds.Tables[0].DefaultView;    //为GridView控件指名数据源,显示学生未考科目
            GridView1.DataBind();                               //绑定数据
        }
    }
}