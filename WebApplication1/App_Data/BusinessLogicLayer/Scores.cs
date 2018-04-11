using System;
using System.Data;
using System.Collections;
using System.Data.SqlClient;
using MyOnLineExam.DataAccessLayer;
using MyOnLineExam.DataAccessHelper;


namespace MyOnLineExam.BusinessLogicLayer
{
    //用户类
    public class Scores
    {
        #region 私有成员
        private int _ID;                                                //成绩编号
        private string _userID;                                         //用户ID
        private int _paperID;                                           //试卷ID
        private int _score;                                             //用户成绩
        private DateTime _examtime;                                     //考试结束时间
       
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
        public string UserID
        {
            set
            {
                this._userID = value;
            }
            get
            {
                return this._userID;
            }
        }
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
        public int Score
        {
            set
            {
                this._score = value;
            }
            get
            {
                return this._score;
            }
        }
        public DateTime ExamTime
        {
            set
            {
                this._examtime = value;
            }
            get
            {
                return this._examtime;
            }
        }    
       
        
        #endregion 属性

        #region 方法

        //向Score表中添加成绩
        //输出：
        //      插入成功：返回True；
        //      插入失败：返回False；
        public bool InsertByProc()
        {
            SqlParameter[] Params = new SqlParameter[4];

            DataBase DB = new DataBase();

            Params[0] = DB.MakeInParam("@UserID", SqlDbType.VarChar, 20, UserID);               //用户编号
            Params[1] = DB.MakeInParam("@PaperID", SqlDbType.Int,4, PaperID);                   //用户密码
            Params[2] = DB.MakeInParam("@Score", SqlDbType.Int,4, Score);                       //用户权限
            Params[3] = DB.MakeInParam("@ExamTime", SqlDbType.DateTime, 8, ExamTime);     

            int Count = -1;
            Count = DB.RunProc("Proc_ScoreAdd", Params);
            if (Count > 0)
                return true;
            else return false;
        }
        
        //删除成绩
        //输入：
        //      XUserID - 用户编号；
        //输出：
        //      删除成功：返回True；
        //      删除失败：返回False；
        public bool DeleteByProc(int SID)
        {
            SqlParameter[] Params = new SqlParameter[1];

            DataBase DB = new DataBase();

            Params[0] = DB.MakeInParam("@ID", SqlDbType.Int,4, SID);               //成绩编号          
            
            int Count = -1;
            Count = DB.RunProc("Proc_ScoreDelete", Params);
            if (Count > 0)
                return true;
            else return false;
        }
        
        //查询所用成绩
        //不需要参数
        public DataSet QueryScore()
        {
            DataBase DB = new DataBase();           
            return DB.GetDataSet("Proc_ScoreList");
        }       

        #endregion 方法
    }
}