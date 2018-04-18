using System;
using System.Data;
using System.Collections;
using System.Data.SqlClient;
using MyOnLineExam.DataAccessLayer;
using MyOnLineExam.DataAccessHelper;


namespace MyOnLineExam.BusinessLogicLayer
{
    //填空题类
    public class FillBlankProblem
    {
        #region 私有成员
        private int _ID;                                               //题目编号
        private int _CourseID;                                         //所属科目        
        private string _FrontTitle;                                    //题目前部分    
        private string _BackTitle;                                     //题目后部分
        private string _Answer;                                        //答案
        private int _zhang;
        private int _jie;
        private int _nandu;

        #endregion 私有成员

        #region 属性

        public int ID
        {
            set
            {
                this._ID = value;
            }
            get
            {
                return this._ID;
            }
        }
        public int CourseID
        {
            set
            {
                this._CourseID = value;
            }
            get
            {
                return this._CourseID;
            }
        }
        public string FrontTitle
        {
            set
            {
                this._FrontTitle = value;
            }
            get
            {
                return this._FrontTitle;
            }
        }
        public string BackTitle
        {
            set
            {
                this._BackTitle = value;
            }
            get
            {
                return this._BackTitle;
            }
        }
        public string Answer
        {
            set
            {
                this._Answer = value;
            }
            get
            {
                return this._Answer;
            }
        }
        public int Zhang
        {
            set
            {
                this._zhang = value;
            }
            get
            {
                return this._zhang;
            }
        }
        public int jie
        {
            set
            {
                this._jie = value;
            }
            get
            {
                return this._jie;
            }
        }
        public int Nandu
        {
            set
            {
                this._nandu = value;
            }
            get
            {
                return this._nandu;
            }
        }

        #endregion 属性

            #region 方法

            //根据题目ID 初始化题目
            //输入：
            //      TID - 题目编号；
            //输出：
            //      题目存在：返回True；
            //      题目不在：返回False；
        public bool LoadData(int TID)
        {
            SqlParameter[] Params = new SqlParameter[1];
            DataBase DB = new DataBase();

            Params[0] = DB.MakeInParam("@ID", SqlDbType.Int, 4, TID);                  //用户编号            

            DataSet ds = DB.GetDataSet("Proc_FillBlankProblemDetail", Params);
            ds.CaseSensitive = false;
            DataRow DR;
            if (ds.Tables[0].Rows.Count > 0)
            {
                DR = ds.Tables[0].Rows[0];
                this._CourseID = GetSafeData.ValidateDataRow_N(DR, "CourseID");                   //科目编号                
                this._FrontTitle = GetSafeData.ValidateDataRow_S(DR, "FrontTitle");               //题目前部分
                this._BackTitle = GetSafeData.ValidateDataRow_S(DR, "BackTitle");                 //题目后部分                
                this._Answer = GetSafeData.ValidateDataRow_S(DR, "Answer");                       //答案
                this._zhang = GetSafeData.ValidateDataRow_N(DR, "Zhang");//章
                this._jie = GetSafeData.ValidateDataRow_N(DR, "Jie");//节
                return true;
            }
            else
            {
                return false;
            }
        }


        //向FillBlankProblem表中添加题目信息(采用存储过程)
        //输出：
        //      插入成功：返回True；
        //      插入失败：返回False；
        public bool InsertByProc()
        {
            SqlParameter[] Params = new SqlParameter[4];

            DataBase DB = new DataBase();

            Params[0] = DB.MakeInParam("@CourseID", SqlDbType.Int, 4, CourseID);                //科目编号
            Params[1] = DB.MakeInParam("@FrontTitle", SqlDbType.VarChar, 500, FrontTitle);      //题目前部分      
            Params[2] = DB.MakeInParam("@BackTitle", SqlDbType.VarChar, 500, BackTitle);        //题名后部分            
            Params[3] = DB.MakeInParam("@Answer", SqlDbType.VarChar, 200, Answer);              //答案

            int Count = -1;
            Count = DB.RunProc("Proc_FillBlankProblemAdd", Params);
            if (Count > 0)
                return true;
            else return false;
        }

        //更新填空题的信息
        public bool UpdateByProc(int TID)
        {
            SqlParameter[] Params = new SqlParameter[5];

            DataBase DB = new DataBase();

            Params[0] = DB.MakeInParam("@ID", SqlDbType.Int, 4, TID);                           //题目编号
            Params[1] = DB.MakeInParam("@CourseID", SqlDbType.Int, 4, CourseID);                //科目编号
            Params[2] = DB.MakeInParam("@FrontTitle", SqlDbType.VarChar, 500, FrontTitle);      //题目前部分      
            Params[3] = DB.MakeInParam("@BackTitle", SqlDbType.VarChar, 500, BackTitle);        //题名后部分            
            Params[4] = DB.MakeInParam("@Answer", SqlDbType.VarChar, 200, Answer);              //答案

            int Count = -1;
            Count = DB.RunProc("Proc_FillBlankProblemModify", Params);
            if (Count > 0)
                return true;
            else return false;
        }


        //删除题目
        //输入：
        //      TID - 题目编号；
        //输出：
        //      删除成功：返回True；
        //      删除失败：返回False；
        public bool DeleteByProc(int TID)
        {
            SqlParameter[] Params = new SqlParameter[1];

            DataBase DB = new DataBase();

            Params[0] = DB.MakeInParam("@ID", SqlDbType.Int, 4, TID);               //题目编号          

            int Count = -1;
            Count = DB.RunProc("Proc_FillBlankProblemDelete", Params);
            if (Count > 0)
                return true;
            else return false;
        }

        //查询单选题
        //课程编号
        public DataSet QueryFillBlankProblem(int TCourseID)
        {
            SqlParameter[] Params = new SqlParameter[1];

            DataBase DB = new DataBase();

            Params[0] = DB.MakeInParam("@CourseID", SqlDbType.Int, 4, TCourseID);               //题目编号           
            return DB.GetDataSet("Proc_FillBlankProblemList", Params);
        }

        #endregion 方法
    }
}