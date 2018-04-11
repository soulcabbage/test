using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MyOnLineExam.BusinessLogicLayer;
using System.Data;

namespace WebApplication1.student
{
    public partial class student_mes_mod : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Users user = new Users();           //创建Users对象
                DataSet ds = user.QueryUserMessage(Session["userNum"].ToString());
                txtUserNum.Text = ds.Tables[0].DefaultView[0].Row[5].ToString();
                txtUserName.Text = ds.Tables[0].DefaultView[0].Row[1].ToString();
                txtUserEmail.Text = ds.Tables[0].DefaultView[0].Row[4].ToString();
            }
        }

        protected void Sure_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                string Num = Session["userNum"].ToString();//取出要删除记录的主键值
                Users user = new Users();               //创建Users对象
                user.UserName = txtUserName.Text;
                user.UserPwd = txtUserPwd.Text;
                user.UserEmail = txtUserEmail.Text;
                if (user.UpdateUserMes(Num))//使用Users类UpdateByProc方法修改用户信息
                {
                    Response.Write("<script language=javascript>alert('修改成功!');location.href='student_mes.aspx'</script>");
                }
                else
                {
                    Response.Write("<script language=javascript>alert('修改失败!')</script>");
                }
            }
        }
    }
}