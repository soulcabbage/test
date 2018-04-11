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
using MyOnLineExam.BusinessLogicLayer;

namespace WebApplication1.admin
{
    public partial class course_mod : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                InitData();  //初始化考试科目          
            }
        }
        protected void InitData()
        {
            Course course = new Course();       //创建考试科目对象
            DataSet ds = course.QueryCourse();  //查询考试科目信息
            GridView1.DataSource = ds;          //为GridView控件指名数据源        
            GridView1.DataBind();               //绑定数据
        }
        //删除考试科目事件
        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            Course course = new Course();           //创建Course对象
            int ID = int.Parse(GridView1.DataKeys[e.RowIndex].Values[0].ToString()); //取出要删除记录的主键值
            if (course.DeleteByProc(ID))
            {
                Response.Write("<script language=javascript>alert('成功删除考试科目！')</script>");
            }
            else
            {
                Response.Write("<script language=javascript>alert('删除考试科目失败！')</script>");
            }
            GridView1.EditIndex = -1;
            InitData();
        }
        //GridView控件RowUpdating事件
        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int ID = int.Parse(GridView1.DataKeys[e.RowIndex].Values[0].ToString()); //取出要删除记录的主键值
            Course course = new Course();           //创建Course对象
            course.Name = ((TextBox)GridView1.Rows[e.RowIndex].FindControl("txtName")).Text;
            if (course.UpdateByProc(ID))//使用Users类UpdateByProc方法修改用户信息
            {
                Response.Write("<script language=javascript>alert('修改成功!')</script>");
            }
            else
            {
                Response.Write("<script language=javascript>alert('修改失败!')</script>");
            }
            GridView1.EditIndex = -1;
            InitData();
        }
        //GridView控件RowCanceling事件
        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            InitData();
        }
        //GridView控件RowEditing事件
        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;  //GridView编辑项索引等于单击行的索引
            InitData();
        }
    }
}