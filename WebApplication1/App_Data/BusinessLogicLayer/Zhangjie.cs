using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using MyOnLineExam.DataAccessLayer;

namespace WebApplication1.App_Code.App_Data.BusinessLogicLayer
{
    public class Zhangjie
    {
        #region 私有成员
        private int _Zhang;
        private int _Jie;
        private int _CourseID;
        #endregion
        #region 属性
        public int Zhang
        {
            set
            {
                this._Zhang = value;
            }
            get
            {
                return this._Zhang;
            }
        }
        public int Jie
        {
            set
            {
                this._Jie = value;
            }
            get
            {
                return this._Jie;
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
        #endregion
        #region 方法
        public DataSet QueryZhangJie(SqlParameter[] sqlParameters)
        {
            DataBase DB = new DataBase();
            SqlDataReader sqlDataReader = DB.RunProcGetReader("Proc_ZhangJieList",sqlParameters);
            DataSet dataSet = DataBase.ConvertDataReaderToDataSet(sqlDataReader);
            return dataSet;
            
        }
        #endregion
    }
}