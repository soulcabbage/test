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

namespace WebApplication1.admin
{
    public partial class user_add : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

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

                if (user.InsertByProc())
                {
                    lblMessage.Text = "成功插入该用户信息！";
                }
                else
                {
                    lblMessage.Text = "添加用户失败！";
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