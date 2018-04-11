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
    public partial class score_query : System.Web.UI.Page
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
            string GridView1Str = "select a.*,b.PaperName,b.SumMark from Score a left join Paper b on a.PaperID=b.PaperID  where a.PaperID in (select PaperID from Paper where CourseID='" + int.Parse(ddlCourse.SelectedValue) + "')  and UserID='" + Session["userID"] + "'";
            DataSet ds = db.GetDataSetSql(GridView1Str);

            GridView1.DataSource = ds.Tables[0].DefaultView;    //为GridView控件指名数据源,显示学生已考科目
            GridView1.DataBind();                               //绑定数据
        }
    }
}