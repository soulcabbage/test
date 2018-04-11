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
using MyOnLineExam.DataAccessLayer;

namespace WebApplication1.Account
{
    public partial class register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            RegisterHyperLink.NavigateUrl = "log_in.aspx?ReturnUrl=" + HttpUtility.UrlEncode(Request.QueryString["ReturnUrl"]);
        }
        protected void save_Click(object sender, EventArgs e)
        {

            if (Page.IsValid)
            {
                Users user = new Users();       //创建Users对象
                user.UserNum = txtUserNum.Text;
                user.UserName = txtUserName.Text;
                user.UserPwd = txtUserPwd.Text;
                user.UserPower = int.Parse(ddlUserPower.SelectedValue);
                user.UserEmail = txtUserEmail.Text;

                DataBase db = new DataBase();//创建DataBase类对象
                string GridView1Str = "select count(*) from Users where UserNum='" + txtUserNum.Text + "'";//查询该账号数据库是否存在
                int count = db.GetRecordCount(GridView1Str);
                if (count > 0)//判断该账号是否存在
                {
                    Response.Write("<script language=javascript>alert('该账号已存在!')</script>");
                    txtUserNum.Text = string.Empty;
                }
                else
                {
                    if (user.InsertByProc())
                    {
                        lblMessage.Text = "成功插入该用户信息！";
                        Response.Write("<script language=javascript>alert('注册成功!');location.href='log_in.aspx'</script>");
                    }
                    else
                    {
                        lblMessage.Text = "添加用户失败！";
                    }
                }
            }
        }

        protected void clear_Click(object sender, EventArgs e)
        {
            txtUserNum.Text = null;
            txtUserName.Text = null;
            txtUserPwd.Text = null;
            txtUserEmail.Text = null;
        }
    }
}