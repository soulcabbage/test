using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.IO;
using System.Data.SqlClient;
using MyOnLineExam.DataAccessLayer;
using System.Data;

namespace WebApplication1
{
    public class Dati
    {
        #region 私有成员
        private int _ID;                                               //题目编号
        private int _CourseID;                                         //所属科目        
        private string _Title;
        private string _ImgFile;
        private int _zhang;
        private int _jie;
        private int _nandu;
        #endregion
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
        public string Title
        {
            set
            {
                this._Title = value;
            }
            get
            {
                return this._Title;
            }
        }
        public string ImgFile
        {
            set
            {
                this._ImgFile = value;
            }
            get
            {
                return this._ImgFile;

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

        #endregion
    #region 方法
        /// <summary>
        /// 调用存储过程添加大题信息，正确返回true,错误返回false
        /// </summary>
        /// <returns></returns>
        public bool InsertByProc()
        {
            SqlParameter[] Parameter = new SqlParameter[6];
            DataBase DB = new DataBase();
            Parameter[0] = DB.MakeInParam("@CourseID", SqlDbType.Int, 4, CourseID);
            Parameter[1] = DB.MakeInParam("@Title",SqlDbType.VarChar,1000,Title);
            Parameter[2] = DB.MakeInParam("@Zhang", SqlDbType.Int, 4, Zhang);
            Parameter[3] = DB.MakeInParam("@Jie", SqlDbType.Int, 4, jie);
            Parameter[4] = DB.MakeInParam("@Nandu", SqlDbType.Int, 4, Nandu);
            Parameter[5] = DB.MakeInParam("@Img", SqlDbType.VarChar, 70, ImgFile);
            int Count = -1;
            Count = DB.RunProc("Proc_Datiadd", Parameter);
            if (Count > 0)
                return true;
            else return false;
        }

    }
    #endregion
}
