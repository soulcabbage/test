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
        private static string filename = string.Empty;
        private static string path = string.Empty;
        private static string Imgfile = string.Empty;
        protected void Page_Load(object sender,EventArgs e)
        {
            if (!IsPostBack)
            {
                InitDDLData();              //初始化考试科目下拉列表框          
                if (Request["ID"] != null)  //如果是修改题目，初始化数据
                {
                    InitData();
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
                if (txtFrontTitle.Text.Length == 0 && FileUpload1.HasFile)
                {
                    lblMessage.Text = "文字和图片至少选择一个";
                }
                else
                {


                    if (File.Exists(path))
                    {
                        File.Move(path, Imgfile);
                        btmimg.ImageUrl = "none";
                        File.Delete(path);
                    }
                    Dati dati = new Dati();
                    dati.Title = txtFrontTitle.Text;
                    dati.ImgFile = Imgfile + filename;
                    dati.CourseID = int.Parse(ddlCourse.SelectedValue);
                    dati.Zhang = 2;
                    dati.jie = 2;
                    dati.Nandu = nadu.SelectedIndex;
                    if(Request["ID"]!=null)
                    {
                        dati.ID = int.Parse(Request["ID"].ToString()); //取出试题主键
                        if (dati.UpdateByProc(int.Parse(Request["ID"].ToString())))//调用修改试题方法修改试题
                        {
                            lblMessage.Text = "成功修改该填空题！";
                        }
                        else
                        {
                            lblMessage.Text = "修改该填空题失败！";
                        }
                    }
                    if (dati.InsertByProc())
                    {
                        lblMessage.Text = "成功添加该大题";
                    }
                    else
                    {
                        lblMessage.Text = "添加大题失败!";
                    }


                }
            }
            catch (Exception ex)
            {
                lblMessage.Text = ex.Message;
            }
            finally
            {
                path = string.Empty;
                filename = string.Empty;
                
                this.Dispose();
            }
        

        }

        protected void clear_Click(object sender, EventArgs e)
        {
            txtFrontTitle.Text = null;
            btmimg.ImageUrl = null;
            lblMessage = null;
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
                Imgfile = Server.MapPath(@"~\teacher\DatiImg\");

            }
            else
            {
                lblMessage.Text = "请选择文件路径！";
            }
        }
        //初始化考试科目
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
        //初始化数据
        protected void InitData()
        {
            int DatiID = int.Parse(Request["ID"].ToString());
            Dati dati = new Dati();
            if(dati.LoadData(DatiID))
            {
                ddlCourse.SelectedValue = dati.CourseID.ToString();
                txtFrontTitle.Text = dati.Title;
                btmimg.ImageUrl = dati.ImgFile;
            }
            else
            {
                lblMessage.Text = "加载数据出错！";
            }
        }

    }
}