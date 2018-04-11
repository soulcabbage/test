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
    public partial class student : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Users user = new Users();           //创建Users对象
                DataSet ds = user.QueryUserName(Session["userNum"].ToString());     //调用QueryUsers方法查询用户并将查询结果放到DataSet数据集中
                lbl_adminId.Text = ds.Tables[0].DefaultView[0].Row[0].ToString();
            }

        }
    }
}