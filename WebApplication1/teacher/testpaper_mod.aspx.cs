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

namespace WebApplication1.teacher
{
    public partial class testpaper_mod : System.Web.UI.Page
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
            Paper paper = new Paper(); //创建试卷对象
            DataSet ds = paper.QueryPaper(int.Parse(ddlCourse.SelectedValue));//根据考试科目查询试卷信息
            GridView1.DataSource = ds.Tables[0].DefaultView;    //为GridView控件指名数据源
            GridView1.DataBind();                               //绑定数据
        }

        //GridView控件RowCanceling事件
        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            InitDDLData();
        }
        //GridView控件RowDeleting事件
        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            Paper paper = new Paper();      //创建Paper对象
            int PaperID = int.Parse(GridView1.DataKeys[e.RowIndex].Values[0].ToString()); //取出要删除记录的主键值
            if (paper.DeleteByProc(PaperID))
            {
                Response.Write("<script language=javascript>alert('成功删除该试卷！')</script>");
            }
            else
            {
                Response.Write("<script language=javascript>alert('删除试卷失败！')</script>");
            }
            InitDDLData();
        }
        //GridView控件RowUpdating事件
        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int PaperID = int.Parse(GridView1.DataKeys[e.RowIndex].Values[0].ToString()); //取出要编辑的主键值
            Paper paper = new Paper();      //创建Paper对象
            //paper.PaperState = bool.Parse(((TextBox)GridView1.Rows[e.RowIndex].FindControl("txtPaperState")).Text);
            if (((TextBox)GridView1.Rows[e.RowIndex].FindControl("txtPaperState")).Text == "1") { paper.PaperState = true; }
            else { paper.PaperState = false; }
            if (paper.UpdateByProc(PaperID))//使用Paper类UpdateByProc方法修改试卷状态
            {
                GridView1.EditIndex = -1;
                //InitDDLData();
                GridViewBind();
                Response.Write("<script language=javascript>alert('修改成功!')</script>");
                
            }
            else
            {
                Response.Write("<script language=javascript>alert('修改失败!')</script>");
            }
            
            
        }
        //GridView控件RowEditing事件
        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;  //GridView编辑项索引等于单击行的索引
            InitDDLData();
        }

        protected string GetState(Object Value)
        {
            return Value.ToString() == "True" ? "未考" : "已考";
        }
    }
}