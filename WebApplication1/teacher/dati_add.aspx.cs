using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Threading;
using MyOnLineExam.BusinessLogicLayer;
using System.Data;
using System.IO;

namespace WebApplication1.teacher
{
    public partial class dati_add : System.Web.UI.Page
    {
        public static string filename = string.Empty;
        public static string path = string.Empty;
        
        protected void Page_Load(object sender,EventArgs e)
        {
            if (!IsPostBack)
            {
                InitDDLData();              //初始化考试科目下拉列表框          
                if (Request["ID"] != null)  //如果是修改题目，初始化数据
                {
                    int test;
                    char s;
                    //InitData();
                }
            }

        }
        /// <summary>
        /// 保存大题，生成实例对象
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void save_Click(object sender, EventArgs e)
        {

            try
            {
                if (txtFrontTitle.Text == "" && FileUpload1.HasFile)
                {
                    lblMessage.Text = "文字和图片至少选择一个";
                }
                else
                {
                    string Imgfile = Server.MapPath(@"~\teacher\DatiImg\") + filename;
                   
                    if (File.Exists(path))
                    {
                        File.Move(path, Imgfile);
                        btmimg.Visible = false;
                        File.Delete(path);
                    }
                    Dati dati = new Dati();
                    dati.Title = txtFrontTitle.Text;
                    dati.ImgFile = Imgfile;
                    dati.CourseID = 2;
                    dati.Zhang = 2;
                    dati.jie = 2;
                    dati.Nandu = nadu.SelectedIndex;
                    dati.InsertByProc();


                }
            }
            catch (Exception ex)
            {

            }
        

        }

        protected void clear_Click(object sender, EventArgs e)
        {
            txtFrontTitle.Text = null;
            btmimg.ImageUrl = null;
        }

        protected void Img_btn_Click(object sender, EventArgs e)
        {
            if (FileUpload1.HasFile)
            {
                filename = FileUpload1.FileName;
                path = Server.MapPath(@"~\teacher\Temp\") + filename;
                this.FileUpload1.PostedFile.SaveAs(path);
                lblMessage.Text = "";
                btmimg.ImageUrl = "Temp\\" + filename + "";
                btmimg.Visible = true;


            }
            else
            {
                lblMessage.Text = "请选择文件路径！";
            }
        }
        protected void InitDDLData()
        {
            Course course = new Course();       //创建考试科目对象
            DataSet ds = course.QueryCourse();  //查询考试科目信息
            ddlCourse.DataSource = ds;          //指名考试科目列表框数据源
            zhang.DataSource = ds;
            ddlCourse.DataTextField = "Name";   //DataTextField显示Name字段值
            ddlCourse.DataValueField = "ID";    //DataValueField显示ID字段值

          //  zhang.DataValueField = "Zhang";

            zhang.DataBind();
            ddlCourse.DataBind();               //绑定数据
        }


    }
}