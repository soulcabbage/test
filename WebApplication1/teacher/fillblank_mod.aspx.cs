using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using MyOnLineExam.BusinessLogicLayer;

namespace WebApplication1.teacher
{
    public partial class fillblank_mod : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                InitDDLData();  //初始化考试科目  
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
            FillBlankProblem fillblankproblem = new FillBlankProblem();  //创建填空题对象
            DataSet ds = fillblankproblem.QueryFillBlankProblem(int.Parse(ddlCourse.SelectedValue));//根据考试科目查询填空题信息
            GridView1.DataSource = ds.Tables[0].DefaultView;    //为GridView控件指名数据源
            GridView1.DataBind();                               //绑定数据
        }
        //删除试题事件
        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            FillBlankProblem fillblankproblem = new FillBlankProblem();  //创建填空题对象
            int ID = int.Parse(GridView1.DataKeys[e.RowIndex].Values[0].ToString()); //取出要删除记录的主键值
            if (fillblankproblem.DeleteByProc(ID))
            {
                Response.Write("<script language=javascript>alert('成功删除试题！')</script>");
            }
            else
            {
                Response.Write("<script language=javascript>alert('删除试题失败！')</script>");
            }
            GridViewBind();//为GridView重新绑定数据
            GridView1.EditIndex = -1;
        }
        //显示选择科目的填空题
        protected void ddlCourse_SelectedIndexChanged1(object sender, EventArgs e)
        {
            GridViewBind();//为GridView绑定数据
        }
        protected void GridViewBind()
        {
            FillBlankProblem fillblankproblem = new FillBlankProblem();  //创建填空题对象
            DataSet ds = fillblankproblem.QueryFillBlankProblem(int.Parse(ddlCourse.SelectedValue));//根据考试科目查询填空题信息
            GridView1.DataSource = ds.Tables[0].DefaultView;    //为GridView控件指名数据源
            GridView1.DataBind();                               //绑定数据
        }
       
    }
}