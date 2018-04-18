using System;
using System.Data;
using System.Collections;
using System.Data.SqlClient;
using MyOnLineExam.DataAccessLayer;
using MyOnLineExam.DataAccessHelper;



namespace MyOnLineExam.BusinessLogicLayer
{
    //用户类
    public class Paper
    {
        #region 私有成员
        private int _paperID;                                               //试卷编号
        private int _courseID;                                              //科目编号 
        private string _paperName;                                          //试卷名称  
        private bool _paperState;                                           //试卷状态
        private DateTime _time;
        private int _longth;
        private int _sunmark;
        
        #endregion 私有成员

        #region 属性

        public int PaperID
        {
            set
            {
                this._paperID = value;
            }
            get
            {
                return this._paperID;
            }
        }
        public int CourseID
        {
            set
            {
                this._courseID = value;
            }
            get
            {
                return this._courseID;
            }
        }
        public string PaperName
        {
            set
            {
                this._paperName = value;
            }
            get
            {
                return this._paperName;
            }
        }        
        public bool PaperState
        {
            set
            {
                this._paperState = value;
            }
            get
            {
                return this._paperState;
            }
        }
        public DateTime Time
        {
            set
            {
                this._time = value;
            }
            get
            {
                return this._time;
            }
        }
        public int Longth
        {
            set
            {
                this._longth = value;
            }
            get
            {
                return this._longth;
            }
        }
        public int SumMark
        {
            set
            {
                this._sunmark = value;
            }
            get
            {
                return this._sunmark;
            }
        }
        
        
        #endregion 属性

        #region 方法

        //向Paper表中添加试卷信息(采用存储过程)
        //输出：
        //      插入成功：返回True；
        //      插入失败：返回False；
        public bool InsertByProc()
        {
            SqlParameter[] Params = new SqlParameter[6];
            DataBase DB = new DataBase();

            Params[0] = DB.MakeInParam("@CourseID", SqlDbType.Int, 4, CourseID);               //科目编号
            Params[1] = DB.MakeInParam("@PaperName", SqlDbType.VarChar, 200, PaperName);       //试卷名称            
            Params[2] = DB.MakeInParam("@PaperState", SqlDbType.Bit,1, PaperState);            //试卷状态            
            Params[3] = DB.MakeInParam("@Time", SqlDbType.DateTime, 8, Time);
            Params[4] = DB.MakeInParam("@Longth", SqlDbType.Int, 4, Longth);
            Params[5] = DB.MakeInParam("@SumMark", SqlDbType.Int, 4, Longth);


            int Count = -1;
            Count = DB.RunProc("Proc_PaperAdd", Params);
            if (Count > 0)
                return true;
            else return false;
        }

        //更新试卷信息
        public bool UpdateByProc(int PID)
        {
            SqlParameter[] Params = new SqlParameter[2];

            DataBase DB = new DataBase();

            Params[0] = DB.MakeInParam("@PaperID", SqlDbType.Int, 4, PID);                      //试卷编号                       
            Params[1] = DB.MakeInParam("@PaperState", SqlDbType.Bit, 1, PaperState);            //试卷状态

            int Count = -1;
            Count = DB.RunProc("Proc_PaperModify", Params);
            if (Count > 0)
                return true;
            else return false;
        }
        //删除试卷
        //输入：
        //      PID - 试卷编号；
        //输出：
        //      删除成功：返回True；
        //      删除失败：返回False；
        public bool DeleteByProc(int PID)
        {
            SqlParameter[] Params = new SqlParameter[1];

            DataBase DB = new DataBase();

            Params[0] = DB.MakeInParam("@PaperID", SqlDbType.Int, 4, PID);               //试卷编号          

            int Count = -1;
            Count = DB.RunProc("Proc_PaperDelete", Params);
            if (Count > 0)
                return true;
            else return false;
        }

        //查询所用可用试卷
        //不需要参数
        public DataSet QueryPaper(int TCourseID)
        {
            SqlParameter[] Params = new SqlParameter[1];

            DataBase DB = new DataBase();

            Params[0] = DB.MakeInParam("@CourseID", SqlDbType.Int, 4, TCourseID);               //试卷编号           
            return DB.GetDataSet("Proc_PaperList_2", Params);
        }
        ////学生查询所用未考试卷
        ////不需要参数
        //public DataSet StudentPaper(int TCourseID)
        //{
        //    SqlParameter[] Params = new SqlParameter[1];

        //    DataBase DB = new DataBase();

        //    Params[0] = DB.MakeInParam("@CourseID", SqlDbType.Int, 4, TCourseID);               //试卷编号           
        //    return DB.GetDataSet("Proc_PaperList_3", Params);
        //}

        #endregion 方法
    }
}