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

using System.IO;
using System.Data.OleDb;

namespace WebApplication1.teacher
{
    public partial class stu_message_query : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                delete.Attributes.Add("OnClick", "javascript:return confirm('确实要删除这些用户吗？')");
                InitData();  //绑定用户信息        
            }
        }
        //初始化用户表格
        protected void InitData()
        {
            Users user = new Users();           //创建Users对象
            DataSet ds = user.QueryUsers();     //调用QueryUsers方法查询用户并将查询结果放到DataSet数据集中
            GridView1.DataSource = ds;          //为GridView控件指名数据源        
            GridView1.DataBind();               //绑定数据
        }

        //protected void InitData()
        //{
        //    Course course = new Course();       //创建考试科目对象
        //    DataSet ds = course.QueryCourse();  //查询考试科目信息
        //    ddlCourse.DataSource = ds;          //指名考试科目列表框数据源
        //    ddlCourse.DataTextField = "Name";   //DataTextField显示Name字段值
        //    ddlCourse.DataValueField = "ID";    //DataValueField显示ID字段值
        //    ddlCourse.DataBind();               //绑定数据
        //}

        //protected void ddlCourse_SelectedIndexChanged(object sender, EventArgs e)
        //{
        //    GridViewBind();//为GridView绑定数据
        //}

        //protected void GridViewBind()
        //{
        //    Users user = new Users();  //创建试卷对象
        //    DataSet ds = user.QueryUsers(int.Parse(ddlCourse.SelectedValue));//根据考试科目查询试卷信息
        //    GridView1.DataSource = ds.Tables[0].DefaultView;    //为GridView控件指名数据源
        //    GridView1.DataBind();                               //绑定数据
        //}

        //GridView控件RowDeleting事件
        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            Users user = new Users();           //创建Users对象
            int userID = int.Parse (GridView1.DataKeys[e.RowIndex].Values[0].ToString()); //取出要删除记录的主键值
            if (user.DeleteByProc(userID))
            {
                Response.Write("<script language=javascript>alert('成功删除该用户！')</script>");
            }
            else
            {
                Response.Write("<script language=javascript>alert('删除该用户失败！')</script>");
            }
            GridView1.EditIndex = -1;
            InitData();
        }
        //GridView控件RowUpdating事件
        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int ID = int.Parse (GridView1.DataKeys[e.RowIndex].Values[0].ToString()); //取出要删除记录的主键值
            Users user = new Users();               //创建Users对象
            user.UserName = ((TextBox)GridView1.Rows[e.RowIndex].FindControl("txtName")).Text;
            user.UserPower = int.Parse(((TextBox)GridView1.Rows[e.RowIndex].FindControl("txtPower")).Text);
            if (user.UpdateByProc(ID))//使用Users类UpdateByProc方法修改用户信息
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
        //批量删除事件
        protected void export_Click(object sender, EventArgs e)
        {
            Scores score = new Scores();        //创建Scores对象       
            DataSet ds = score.QueryScore();    //调用QueryScore方法查询成绩并将查询结果放到DataSet数据集中
            DataTable DT = ds.Tables[0];        //生成将要存放结果的Excel文件的名称
            string NewFileName = DateTime.Now.ToString("yyyyMMddHHmmss") + ".xls";    //转换为物理路径
            NewFileName = Server.MapPath("Temp/" + NewFileName);    //根据模板正式生成该Excel文件
            File.Copy(Server.MapPath("../../Module01.xls"), NewFileName, true);    //建立指向该Excel文件的数据库连接
            string strConn = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + NewFileName + ";Extended Properties='Excel 8.0;'";
            OleDbConnection Conn = new OleDbConnection(strConn);
            Conn.Open();    //打开连接，为操作该文件做准备
            OleDbCommand Cmd = new OleDbCommand("", Conn);

            foreach (DataRow DR in DT.Rows)
            {
                string XSqlString = "insert into [Sheet1$]";
                XSqlString += "([用户姓名],[试卷],[成绩],[考试时间]) values(";
                XSqlString += "'" + DR["UserName"] + "',";
                XSqlString += "'" + DR["PaperName"] + "',";
                XSqlString += "'" + DR["Score"] + "',";
                XSqlString += "'" + DR["ExamTime"] + "')";
                Cmd.CommandText = XSqlString;
                Cmd.ExecuteNonQuery();
            }

            Conn.Close();//操作结束，关闭连接
            System.IO.FileStream Reader = System.IO.File.OpenRead(NewFileName);//打开要下载的文件，并把该文件存放在FileStream中
            long Length = Reader.Length; //文件传送的剩余字节数：初始值为文件的总大小

            Response.Buffer = false;
            Response.AddHeader("Connection", "Keep-Alive");
            Response.ContentType = "application/octet-stream";
            Response.AddHeader("Content-Disposition", "attachment; filename=" + Server.UrlEncode("学生成绩.xls"));
            Response.AddHeader("Content-Length", Length.ToString());

            byte[] Buffer = new Byte[10000];		//存放欲发送数据的缓冲区
            int ByteToRead;			//每次实际读取的字节数

            while (Length > 0)
            {
                //剩余字节数不为零，继续传送
                if (Response.IsClientConnected)
                {
                    //客户端浏览器还打开着，继续传送
                    ByteToRead = Reader.Read(Buffer, 0, 10000);					//往缓冲区读入数据
                    Response.OutputStream.Write(Buffer, 0, ByteToRead);	//把缓冲区的数据写入客户端浏览器
                    Response.Flush();																		//立即写入客户端
                    Length -= ByteToRead;																//剩余字节数减少
                }
                else
                {
                    Length = -1; //客户端浏览器已经断开，阻止继续循环
                }
            }
            Reader.Close(); //关闭该文件
            File.Delete(NewFileName);//删除该Excel文件
        }

        protected void delete_Click(object sender, EventArgs e)
        {
            Users user = new Users(); //创建Users对象      
            foreach (GridViewRow dr in GridView1.Rows)//对GridView中每行进行判断
            {
                if (((CheckBox)dr.FindControl("xuanze")).Checked)//如果该行复选按钮选择则删除
                {
                    int ID = int.Parse (((Label)dr.FindControl("Label1")).Text);//取出主键
                    user.UserID = ID;
                    user.DeleteByProc(ID);//调用Users类DeleteByProc方法删除用户
                }
            }
        }
    }
}