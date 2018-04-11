using System;
using System.Data;
using System.Collections;
using System.Data.SqlClient;
using MyOnLineExam.DataAccessLayer;
using MyOnLineExam.DataAccessHelper;


namespace MyOnLineExam.BusinessLogicLayer
{
    //用户类
    public class Users
    {
        #region 私有成员
        private int _userID;                                               //用户编号
        private string _userPwd;                                         //用户密码
        private int _userPower;                                               //用户权限
        private string _userName;                                             //用户姓名        
        private string _userEmail;
        private string _userNum;

        #endregion 私有成员

        #region 属性

        public int UserID
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
        public string UserPwd
        {
            set
            {
                this._userPwd = value;
            }
            get
            {
                return this._userPwd;
            }
        }
        public int UserPower
        {
            set
            {
                this._userPower = value;
            }
            get
            {
                return this._userPower;
            }
        }
        public string UserName
        {
            set
            {
                this._userName = value;
            }
            get
            {
                return this._userName;
            }
        }
        public string UserEmail
        {
            set
            {
                this._userEmail = value;
            }
            get
            {
                return this._userEmail;
            }
        }
        public string UserNum
        {
            set
            {
                this._userNum = value;
            }
            get
            {
                return this._userNum;
            }
        }

        #endregion 属性

        #region 方法

        //根据用户 UserID 初始化该用户
        //输入：
        //      XUserID - 用户编号；
        //输出：
        //      用户存在：返回True；
        //      用户不在：返回False；
        public bool LoadData(int XUserID)
        {
            SqlParameter[] Params = new SqlParameter[1];
            DataBase DB = new DataBase();

            Params[0] = DB.MakeInParam("@UserID", SqlDbType.VarChar, 50, XUserID);                  //用户编号            

            DataSet ds = DB.GetDataSet("Proc_UsersDetail", Params);
            ds.CaseSensitive = false;
            DataRow DR;
            if (ds.Tables[0].Rows.Count > 0)
            {
                DR = ds.Tables[0].Rows[0];
                this._userID = GetSafeData.ValidateDataRow_N(DR, "UserID");                         //用户编号
                this._userPower = GetSafeData.ValidateDataRow_N(DR, "UserPower");	                //用户权限
                this._userName = GetSafeData.ValidateDataRow_S(DR, "UserName");                     //用户姓名  
                this._userEmail = GetSafeData.ValidateDataRow_S(DR, "UserEmail");                   //用户邮箱
                this._userNum = GetSafeData.ValidateDataRow_S(DR, "UserNum");                       //用户学号
                return true;
            }
            else
            {
                return false;
            }
        }

        //根据UserID判断该用户是否存在
        //输入：
        //      XUserID - 用户编号；        
        //输出：
        //      用户存在：返回True；
        //      用户不在：返回False；
        public bool CheckUser(int XUserID)
        {
            SqlParameter[] Params = new SqlParameter[1];
            DataBase DB = new DataBase();

            Params[0] = DB.MakeInParam("@UserID", SqlDbType.Int, 4, XUserID);                  //教工姓名            

            SqlDataReader DR = DB.RunProcGetReader("Proc_UsersDetail", Params);
            if (!DR.Read())
            {
                return false;
            }
            else
            {
                return true;
            }
        }

        //根据UserNum和UserPassword判断密码是否正确
        //输入：
        //      XUserNum - 用户编号；        
        //输出：
        //      用户存在：返回True；
        //      用户不在：返回False；
        public bool CheckPassword(string XUserNum)
        {
            SqlParameter[] Params = new SqlParameter[1];
            DataBase DB = new DataBase();
            Params[0] = DB.MakeInParam("@UserNum", SqlDbType.Char, 10, XUserNum);                  //编号            

            SqlDataReader DR = DB.RunProcGetReader("Proc_UsersDetail", Params);
            if (!DR.Read())
            {
                return false;
            }
            else
            {
                this._userPwd = DR["UserPwd"].ToString();
                this._userPower = int.Parse(DR["UserPower"].ToString());
                return true;
            }
        }

        //向Users表中添加用户信息(采用存储过程)
        //输出：
        //      插入成功：返回True；
        //      插入失败：返回False；
        public bool InsertByProc()
        {
            SqlParameter[] Params = new SqlParameter[5];

            DataBase DB = new DataBase();

            //Params[0] = DB.MakeInParam("@UserID", SqlDbType.Int , 4, UserID);               //用户编号
            Params[0] = DB.MakeInParam("@UserName", SqlDbType.VarChar, 20, UserName);           //用户姓名
            Params[1] = DB.MakeInParam("@UserPwd", SqlDbType.VarChar, 20, UserPwd);    //用户密码
            Params[2] = DB.MakeInParam("@UserPower", SqlDbType.Int, 4, UserPower);         //用户权限
            Params[3] = DB.MakeInParam("@UserEmail", SqlDbType.VarChar, 50, UserEmail);
            Params[4] = DB.MakeInParam("@UserNum", SqlDbType.Char, 10, UserNum);

            int Count = -1;
            Count = DB.RunProc("Proc_UsersAdd", Params);
            if (Count > 0)
                return true;
            else return false;
        }
        //更新用户的信息
        public bool UpdateByProc(int XUserID)
        {
            SqlParameter[] Params = new SqlParameter[6];

            DataBase DB = new DataBase();

            Params[0] = DB.MakeInParam("@UserID", SqlDbType.Int, 4, XUserID);               //用户编号           
            Params[1] = DB.MakeInParam("@UserName", SqlDbType.VarChar, 20, UserName);           //用户姓名
            Params[2] = DB.MakeInParam("@UserPwd", SqlDbType.VarChar, 20, UserPwd);    //用户密码
            Params[3] = DB.MakeInParam("@UserPower", SqlDbType.SmallInt, 2, UserPower);      //用户权限
            Params[4] = DB.MakeInParam("@UserEmail", SqlDbType.VarChar, 50, UserEmail);
            Params[5] = DB.MakeInParam("@UserNum", SqlDbType.Char, 10, UserNum);

            int Count = -1;
            Count = DB.RunProc("Proc_UsersModify", Params);
            if (Count > 0)
                return true;
            else return false;
        }

        //更新个人信息
        public bool UpdateUserMes(string UserNum)
        {
            SqlParameter[] Params = new SqlParameter[4];

            DataBase DB = new DataBase();
            Params[0] = DB.MakeInParam("@UserName", SqlDbType.VarChar, 20, UserName);           //用户姓名
            Params[1] = DB.MakeInParam("@UserPwd", SqlDbType.VarChar, 20, UserPwd);    //用户密码
            Params[2] = DB.MakeInParam("@UserEmail", SqlDbType.VarChar, 50, UserEmail);
            Params[3] = DB.MakeInParam("@UserNum", SqlDbType.Char, 10, UserNum);

            int Count = -1;
            Count = DB.RunProc("Proc_UsersSinModify", Params);
            if (Count > 0)
                return true;
            else return false;
        }

        //删除用户
        //输入：
        //      XUserID - 用户编号；
        //输出：
        //      删除成功：返回True；
        //      删除失败：返回False；
        public bool DeleteByProc(int XUserID)
        {
            SqlParameter[] Params = new SqlParameter[1];

            DataBase DB = new DataBase();

            Params[0] = DB.MakeInParam("@UserID", SqlDbType.Int, 4, XUserID);               //用户编号          

            int Count = -1;
            Count = DB.RunProc("Proc_UsersDelete", Params);
            if (Count > 0)
                return true;
            else return false;
        }

        //查询用户
        //查询所用用户
        //不需要参数
        public DataSet QueryUsers()
        {
            DataBase DB = new DataBase();
            return DB.GetDataSet("Proc_UsersList");
        }

        public DataSet QueryStudents()
        {
            DataBase DB = new DataBase();
            return DB.GetDataSet("Proc_UserStuList");
        }

        //修改用户的密码
        //输入：
        //      XUserID - 用户编号；
        //输出：
        //      修改成功：返回True；
        //      修改失败：返回False；
        public bool ModifyPassword(string XUserID)
        {
            SqlParameter[] Params = new SqlParameter[2];

            DataBase DB = new DataBase();

            Params[0] = DB.MakeInParam("@UserID", SqlDbType.Int, 4, XUserID);               //用户编号 
            Params[1] = DB.MakeInParam("@UserPwd", SqlDbType.VarChar, 50, UserPwd);              //用户密码 

            int Count = -1;
            Count = DB.RunProc("Proc_UsersPasswordModify", Params);
            if (Count > 0)
                return true;
            else return false;
        }

        //查询UserName
        public DataSet QueryUserName(string UserNum)
        {
            SqlParameter[] Params = new SqlParameter[1];

            DataBase DB = new DataBase();

            Params[0] = DB.MakeInParam("@UserNum", SqlDbType.Char, 10, UserNum);               //题目编号           
            return DB.GetDataSet("Proc_UserName", Params);
        }

        //查询用户个人信息
        public DataSet QueryUserMessage(string UserNum)
        {
            SqlParameter[] Params = new SqlParameter[1];

            DataBase DB = new DataBase();
            
            Params[0] = DB.MakeInParam("@UserNum", SqlDbType.Char, 10, UserNum);

            return DB.GetDataSet("Proc_UsersDetail", Params);
        }

        #endregion 方法
    }
}