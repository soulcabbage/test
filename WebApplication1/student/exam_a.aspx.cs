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
    public partial class exam_a : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Session["PaperID"] = Request.QueryString["PaperID"];
                DataBase db = new DataBase();//创建DataBase类对象
                string GridView1Str = "select PaperName from Paper where PaperID='" + Session["PaperID"] + "'";
                string PaperName = db.GetString(GridView1Str);
                lblPaperName.Text = PaperName;
                Session["PaperName"] = PaperName;
                InitData();
            }
        }
        //初始化试卷，从数据库中将试题取出
        protected void InitData()
        {
            //Response.Write(Session["PaperID"].ToString());
            //Response.End();

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
        //提交试卷，生成成绩
        protected void Submit_Click(object sender, EventArgs e)
        {
            SubmitBind();
            
        }

        protected void SubmitBind()
        {
            int score = 0;
            int singlemark = int.Parse(((Label)GridView1.Rows[0].FindControl("Label4")).Text);//取出单选题的每题分值
            foreach (GridViewRow dr in GridView1.Rows)//对单选题每题进行判断用户选择答案
            {
                string str = "";
                if (((RadioButton)dr.FindControl("RadioButton1")).Checked)
                {
                    str = "A";
                }
                else if (((RadioButton)dr.FindControl("RadioButton2")).Checked)
                {
                    str = "B";
                }
                else if (((RadioButton)dr.FindControl("RadioButton3")).Checked)
                {
                    str = "C";
                }
                else if (((RadioButton)dr.FindControl("RadioButton4")).Checked)
                {
                    str = "D";
                }
                if (((Label)dr.FindControl("Label3")).Text.Trim() == str)//将用户选择结果和答案进行比较
                {
                    score = score + singlemark;
                }
            }
            int multimark = int.Parse(((Label)GridView2.Rows[0].FindControl("Label8")).Text);//取出多选题每题分值
            foreach (GridViewRow dr in GridView2.Rows)//对多选题每题进行判断用户选择答案
            {
                string str = "";
                if (((CheckBox)dr.FindControl("CheckBox1")).Checked)
                {
                    str += "A";
                }
                if (((CheckBox)dr.FindControl("CheckBox2")).Checked)
                {
                    str += "B";
                }
                if (((CheckBox)dr.FindControl("CheckBox3")).Checked)
                {
                    str += "C";
                }
                if (((CheckBox)dr.FindControl("CheckBox4")).Checked)
                {
                    str += "D";
                }
                if (((Label)dr.FindControl("Label7")).Text.Trim() == str)//将用户选择结果和答案进行比较
                {
                    score = score + multimark;
                }
            }
            int judgemark = int.Parse(((Label)GridView3.Rows[0].FindControl("Label12")).Text);//取出判断题每题分值
            foreach (GridViewRow dr in GridView3.Rows)//对判断题每题进行判断用户选择答案
            {
                bool j = false;
                if (((CheckBox)dr.FindControl("CheckBox5")).Checked)
                {
                    j = true;
                }
                if (j == bool.Parse(((Label)dr.FindControl("Label11")).Text.Trim()))
                {
                    score = score + judgemark;
                }
            }
            int fillmark = int.Parse(((Label)GridView4.Rows[0].FindControl("Label17")).Text);//取出填空题每题分值
            foreach (GridViewRow dr in GridView4.Rows)
            {
                string str = "";
                str = ((TextBox)dr.FindControl("TextBox1")).Text.Trim();
                if (str == ((Label)dr.FindControl("Label16")).Text.Trim())
                {
                    score = score + fillmark;
                }
            }
            Scores insertScore = new Scores();  //创建Scores类对象
            insertScore.UserID = Session["userID"].ToString();//设置Scores对象的属性
            insertScore.PaperID = int.Parse(Session["PaperID"].ToString());
            insertScore.Score = score;
            insertScore.ExamTime = DateTime.Now;
            if (insertScore.InsertByProc())//调用InsertByProc方法向数据库中插入成绩
            {
                if (score >= 80)//根据成绩给出相应提示
                {
                    Response.Write("<script language=javascript>alert('您太棒了！您的成绩为：" + score + "分！')</script>");
                }
                else if (score >= 60)
                {
                    Response.Write("<script language=javascript>alert('合格！您的成绩为：" + score + "分！')</script>");
                }
                else
                {
                    Response.Write("<script language=javascript>alert('需要努力了！您的成绩为：" + score + "分！')</script>");
                }
                Panel1.Visible = true;
                Submit.Visible = false;
            }
        }

        protected void Answer_Click(object sender, EventArgs e)
        {
            Response.Redirect("answer.aspx");
        }

        
        protected void Timer2_Tick(object sender, EventArgs e)
        {
            DataBase db = new DataBase();//创建DataBase类对象
            string GridView1Str = "select Longth from Paper where PaperID='" + Session["PaperID"] + "'";//查询该账号数据库是否存在
            int count = (db.GetRecordCount(GridView1Str)) * 60;
            if (ViewState["count"] != null)
            {
                count = (int)ViewState["count"];
            }
            count--;
            ViewState["count"] = count;
            Label31.Text = count.ToString();
            if (count == 0)
            {
                SubmitBind();
            }
        }

    }
}