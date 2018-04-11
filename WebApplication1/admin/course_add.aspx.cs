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
    public partial class course_add : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void clear_Click(object sender, EventArgs e)
        {
            txtName.Text = null;
        }

        protected void save_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                Course course = new Course();               //创建考试科目对象
                course.Name = txtName.Text;                 //设置考试科目对象属性
                if (course.InsertByProc())                  //调用添加考试科目方法添加考试科目
                {
                    lblMessage.Text = "成功添加该考试科目！";
                }
                else
                {
                    lblMessage.Text = "添加该考试科目失败！";
                }

            }
        }
    }
}