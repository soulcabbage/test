using System;
using System.Linq;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Collections.Generic;
using System.Web.Security;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using MyOnLineExam.BusinessLogicLayer;
using MyOnLineExam.DataAccessLayer;


namespace WebApplication1.teacher
{
    public partial class testpaper_add : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request["PaperID"] != null)//如果是修改题目，初始化数据
                {

                }
                InitData();  //初始化考试科目        
            }
        }
        //初始化考试科目
        protected void InitData()
        {
            Course course = new Course();       //创建考试科目对象
            DataSet ds = course.QueryCourse();  //查询考试科目信息
            ddlCourse.DataSource = ds;          //指名考试科目列表框数据源
            ddlCourse.DataTextField = "Name";   //DataTextField显示Name字段值
            ddlCourse.DataValueField = "ID";    //DataValueField显示ID字段值
            ddlCourse.DataBind();               //绑定数据
        }
        //根据设置自动生成试卷
        protected void sure_Click(object sender, EventArgs e)
        {
            Panel1.Visible = true;
            DataBase db = new DataBase();//创建DataBase类对象
            string GridView1Str = "select top " + int.Parse(txtSingleNum.Text.Trim()) + " * from SingleProblem where CourseID=" + int.Parse(ddlCourse.SelectedValue) + " order by newid()";//根据参数设置查询单选题Sql语句
            DataSet ds1 = db.GetDataSetSql(GridView1Str);//调用DataBase类方法GetDataSetSql方法查询数据
            GridView1.DataSource = ds1.Tables[0].DefaultView;//为单选题GridView控件指名数据源
            GridView1.DataBind();//绑定数据
            string GridView2Str = "select top " + int.Parse(txtMultiNum.Text.Trim()) + " * from MultiProblem where CourseID=" + int.Parse(ddlCourse.SelectedValue) + " order by newid()";//根据参数设置查询多选题Sql语句
            DataSet ds2 = db.GetDataSetSql(GridView2Str);//调用DataBase类方法GetDataSetSql方法查询数据
            GridView2.DataSource = ds2.Tables[0].DefaultView;//为多选题GridView控件指名数据源
            GridView2.DataBind();//绑定数据
            string GridView3Str = "select top " + int.Parse(txtJudgeNum.Text.Trim()) + " * from JudgeProblem  where CourseID=" + int.Parse(ddlCourse.SelectedValue) + " order by newid()";//根据参数设置查询判断题Sql语句
            DataSet ds3 = db.GetDataSetSql(GridView3Str);//调用DataBase类方法GetDataSetSql方法查询数据
            GridView3.DataSource = ds3.Tables[0].DefaultView;//为判断题GridView控件指名数据源
            GridView3.DataBind();//绑定数据
            string GridView4Str = "select top " + int.Parse(txtFillNum.Text.Trim()) + " * from FillBlankProblem where CourseID=" + int.Parse(ddlCourse.SelectedValue) + " order by newid()";//根据参数设置查询填空题Sql语句
            DataSet ds4 = db.GetDataSetSql(GridView4Str);//调用DataBase类方法GetDataSetSql方法查询数据
            GridView4.DataSource = ds4.Tables[0].DefaultView;//为填空题GridView控件指名数据源
            GridView4.DataBind();//绑定数据
        }
        //清空所有text中的内容
        protected void clear_Click(object sender, EventArgs e)
        {
            txtPaperName.Text = null;
            d241.Value = null;
            longth.Text = null;
            txtSingleNum.Text = null;
            txtSingleFen.Text = null;
            txtMultiNum.Text = null;
            txtMultiFen.Text = null;
            txtJudgeNum.Text = null;
            txtJudgeFen.Text = null;
            txtFillNum.Text = null;
            txtFillFen.Text = null;
        }

        protected void save_Click(object sender, EventArgs e)
        {
            DataBase db = new DataBase();
            int SumMark = int.Parse(txtMultiNum.Text) * int.Parse(txtMultiFen.Text) + int.Parse(txtSingleNum.Text) * int.Parse(txtSingleFen.Text) + int.Parse(txtJudgeNum.Text) * int.Parse(txtJudgeFen.Text) + int.Parse(txtFillNum.Text) * int.Parse(txtFillFen.Text);
            string insertpaper = "insert into Paper(CourseID,PaperName,PaperState,Time,Longth,SumMark) values(" + int.Parse(ddlCourse.SelectedValue) + ",'" + txtPaperName.Text + "',1" + ",'" + d241.Value + "'," + int.Parse(longth.Text) + "," + SumMark + ");select @@identity";

            int afterID = db.GetIDInsert(insertpaper);//保存试卷，并返回自动生成的试卷编号
            if (afterID > 0)
            {
                foreach (GridViewRow dr in GridView1.Rows)//保存试卷单选题信息
                {
                    string single = "insert into PaperDetail(PaperID,Type,TitleID,Mark) values(" + afterID + ",'单选题'," + int.Parse(((Label)dr.FindControl("Label3")).Text) + "," + int.Parse(txtSingleFen.Text) + ")";
                    db.Insert(single);
                }
                foreach (GridViewRow dr in GridView2.Rows)//保存试卷多选题信息
                {
                    string multi = "insert into PaperDetail(PaperID,Type,TitleID,Mark) values(" + afterID + ",'多选题'," + int.Parse(((Label)dr.FindControl("Label6")).Text) + "," + int.Parse(txtMultiFen.Text) + ")";
                    db.Insert(multi);
                }
                foreach (GridViewRow dr in GridView3.Rows)//保存试卷判断题信息
                {
                    string judge = "insert into PaperDetail(PaperID,Type,TitleID,Mark) values(" + afterID + ",'判断题'," + int.Parse(((Label)dr.FindControl("Label7")).Text) + "," + int.Parse(txtJudgeFen.Text) + ")";
                    db.Insert(judge);
                }
                foreach (GridViewRow dr in GridView4.Rows)//保存试卷填空题信息
                {
                    string fill = "insert into PaperDetail(PaperID,Type,TitleID,Mark) values(" + afterID + ",'填空题'," + int.Parse(((Label)dr.FindControl("Label8")).Text) + "," + int.Parse(txtFillFen.Text) + ")";
                    db.Insert(fill);
                }
                Response.Write("<script language=javascript>alert('添加成功!')</script>");
            }
            else
            {
                Response.Write("<script language=javascript>alert('添加失败!')</script>");
            }
        }
    }
}