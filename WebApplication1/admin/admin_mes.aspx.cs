using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MyOnLineExam.BusinessLogicLayer;
using System.Data;

namespace WebApplication1.admin
{
    public partial class admin_mes : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Users user = new Users();           //创建Users对象
                DataSet ds = user.QueryUserMessage(Session["userNum"].ToString());
                UserNum.Text = ds.Tables[0].DefaultView[0].Row[5].ToString();
                UserName.Text = ds.Tables[0].DefaultView[0].Row[1].ToString();
                UserPwd.Text = ds.Tables[0].DefaultView[0].Row[2].ToString();
                UserEmail.Text = ds.Tables[0].DefaultView[0].Row[4].ToString();
            }
        }

        protected void Change_Click(object sender, EventArgs e)
        {
            Response.Redirect("admin_mes_mod.aspx");
        }
    }
}