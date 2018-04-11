using System;
using System.Data;
using System.Collections;
using System.Data.SqlClient;
using System.Configuration;

namespace MyOnLineExam.DataAccessLayer
{
  // ���ݿ�ӿ���
	public class DataBase
	{
		//˽�б��������ݿ�����
		protected SqlConnection Connection;
        protected string ConnectionString;

		//���캯��
		public DataBase()
		{
            ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        }
		
		//���������������ݿ�����
		private void Open()
		{
		  //�ж����ݿ������Ƿ����
			if (Connection == null)
			{
			  //�����ڣ��½�����
				Connection = new SqlConnection(ConnectionString);
				Connection.Open();
			}
			else
			{
			  //���ڣ��ж��Ƿ��ڹر�״̬
			  if (Connection.State.Equals(ConnectionState.Closed))
				  Connection.Open();    //���Ӵ��ڹر�״̬�����´�
			}
		}

		//���з������ر����ݿ�����
		public void Close() 
		{
			if (Connection.State.Equals(ConnectionState.Open))
			{
				Connection.Close();     //���Ӵ��ڴ�״̬���ر�����
			}
		}

        /// <summary>
		/// �����������ͷŷ��й���Դ
		/// </summary>
		~DataBase()
		{
			try
			{
				if (Connection != null)
					Connection.Close();
			}
			catch{}
			try
			{
				Dispose();
			}
			catch{}
		}

		//���з������ͷ���Դ
		public void Dispose()
		{
			if (Connection != null)		// ȷ�����ӱ��ر�
			{
				Connection.Dispose();
				Connection = null;
			}
		}		

		//���з���������Sql��䣬�����Ƿ��ѯ����¼
		public bool GetRecord(string XSqlString)
		{
            Open();
            SqlDataAdapter adapter = new SqlDataAdapter(XSqlString, Connection);
            DataSet dataset = new DataSet();
            adapter.Fill(dataset);
            Close();

            if (dataset.Tables[0].Rows.Count > 0)
			{
				return true;
			}
			else
			{
				return false;
			}
		}

		//���з���������Sql����õ�����ֵ
		//SqlString�ĸ�ʽ��select count(*) from XXX where ...
		//                 select max(XXX) from YYY where ...
		public int GetRecordCount(string XSqlString)
		{
            string SCount;

			Open();
			SqlCommand Cmd = new SqlCommand(XSqlString,Connection);
            SCount = Cmd.ExecuteScalar().ToString().Trim();
            if (SCount=="")
            SCount="0";
			Close();
			return Convert.ToInt32(SCount);
		}

        //���з���������Sql����õ�����
        //SqlString�ĸ�ʽ��select string from XXX where ...
        public string GetString(string SqlString)
        {
            string SCount;

            Open();
            SqlCommand Cmd = new SqlCommand(SqlString, Connection);
            SCount = Cmd.ExecuteScalar().ToString().Trim();
            
            Close();
            return SCount;
        }	

		//���з���������XWhere�������ݱ�XTableName�е�ĳЩ��¼
		//XTableName--����
		//XHT--��ϣ����Ϊ�ֶ�����ֵΪ�ֶ�ֵ		
		public DataSet AdvancedSearch(string XTableName, Hashtable XHT)
		{
			int Count = 0;

			string Fields = "";
			foreach(DictionaryEntry Item in XHT)
			{
				if (Count != 0)
				{
					Fields += " and ";
				}
				Fields += Item.Key.ToString();
				Fields += " like '%";
				Fields += Item.Value.ToString();
                Fields += "%'";
				Count++;
			}
			Fields += " ";

			string SqlString = "select * from " + XTableName + " where " + Fields;
            Open();
            SqlDataAdapter Adapter = new SqlDataAdapter(SqlString, Connection);
            DataSet Ds = new DataSet();
            Adapter.Fill(Ds);
            Close();
            return Ds;
			
		}		

        //˽�з��������һ���������ô洢���̵�SqlCommand
        //���룺
        //      ProcName - �洢������
        //      Params   - �������ô洢���̵Ĳ�����
        private SqlCommand CreateCommand(string ProcName, SqlParameter[] Prams) 
        {
          Open();
          SqlCommand Cmd = new SqlCommand(ProcName, Connection);
          Cmd.CommandType = CommandType.StoredProcedure;

          if (Prams != null) 
          {
            foreach (SqlParameter Parameter in Prams)
              Cmd.Parameters.Add(Parameter);
          }

          return Cmd;
        }

        //���з�����ʵ����һ�����ڵ��ô洢���̵Ĳ���
        //���룺
        //      ParamName - ��������
        //      DbType		- ��������
        //      Size			- ������С
        //			Direction - ���ݷ���
        //			Value			- ֵ
        public SqlParameter MakeParam(string ParamName, SqlDbType DbType, Int32 Size, ParameterDirection Direction, object Value) 
        {
          SqlParameter Param;

          if(Size > 0)
            Param = new SqlParameter(ParamName, DbType, Size);
          else Param = new SqlParameter(ParamName, DbType);

          Param.Direction = Direction;

          if (Value != null)
            Param.Value = Value;

          return Param;
        }

		//���з�����ʵ����һ�����ڵ��ô洢���̵��������
		//���룺
		//      ParamName - ��������
		//      DbType		- ��������
		//      Size			- ������С
		//			Value			- ֵ
        public SqlParameter MakeInParam(string ParamName, SqlDbType DbType, int Size, object Value) 
        {
          return MakeParam(ParamName, DbType, Size, ParameterDirection.Input, Value);
        }		

        //���з��������ô洢����(��������)
		    //���룺
		    //			ProcName�洢������
        //�����
		    //      ��Update��Insert��Delete��������Ӱ�쵽���������������Ϊ-1
        public int RunProc(string ProcName) 
        {
		    int Count = -1;
            SqlCommand Cmd = CreateCommand(ProcName, null);
            Count = Cmd.ExecuteNonQuery();
            Close();
			return Count;
        }

        //���з��������ô洢����(������)
        //���룺
        //      ProcName - �洢������
        //      Params   - �������ô洢���̵Ĳ�����
        //�����
        //      ��Update��Insert��Delete��������Ӱ�쵽���������������Ϊ-1
        public int RunProc(string ProcName, SqlParameter[] Params) 
        {
          int Count = -1;
          SqlCommand Cmd = CreateCommand(ProcName, Params);
          Count = Cmd.ExecuteNonQuery();
          Close();
          return Count;
        }

        //���з��������ô洢����(��������)
        //���룺
        //			ProcName�洢������
		    //�����
        //			��ִ�н����SqlDataReader����
		    //ע�⣺ʹ�ú��������SqlDataReader.Close()����
        public SqlDataReader RunProcGetReader(string ProcName) 
        {
          SqlCommand Cmd = CreateCommand(ProcName, null);
          return Cmd.ExecuteReader(System.Data.CommandBehavior.CloseConnection);
        }

		//���з��������ô洢����(������)
		//���룺
		//			ProcName - �洢������
		//      Params	 - �洢������Ҫ�Ĳ���
		//�����
		//			��ִ�н����SqlDataReader����
		//ע�⣺ʹ�ú��������SqlDataReader.Close()����
        public SqlDataReader RunProcGetReader(string ProcName, SqlParameter[] Params) 
        {
          SqlCommand Cmd = CreateCommand(ProcName, Params);
          return Cmd.ExecuteReader(System.Data.CommandBehavior.CloseConnection);
        }

        //���з��������ô洢����(������)
        //���룺
        //		ProcName - �洢������
        //      Params	 - �洢������Ҫ�Ĳ���
        //�����
        //			��ִ�н����SqlDataReader����
        //ע�⣺ʹ�ú��������SqlDataReader.Close()����
        public int RunProcGetCount(string ProcName, SqlParameter[] Params)
        {
            SqlCommand Cmd = CreateCommand(ProcName, Params);            
            string SCount;            
            SCount = Cmd.ExecuteScalar().ToString().Trim();
            if (SCount == "")
                SCount = "0";
            Close();
            return Convert.ToInt32(SCount);
        }

        //���з��������ô洢����(��������)
        //���룺
        //			ProcName�洢������
        //�����
        //			��ִ�н����DataSet����    
        public DataSet GetDataSet(string ProcName)
        {
            Open();
            SqlDataAdapter adapter = new SqlDataAdapter(ProcName, Connection);
            DataSet dataset = new DataSet();
            adapter.Fill(dataset);
            Close();
            return dataset;
        }

        //���з��������ô洢����(��������)
        //���룺
        //			ProcName�洢������
        //�����
        //			��ִ�н����DataSet����    
        public DataSet GetDataSet(string ProcName, SqlParameter[] Params)
        {
            //Open();
            SqlCommand Cmd = CreateCommand(ProcName, Params);
            SqlDataAdapter adapter = new SqlDataAdapter(Cmd);
            DataSet dataset = new DataSet();
            adapter.Fill(dataset);
            Close();
            return dataset;
        }
        //���з���������Sql��䣬����һ��������ݼ�
        public DataSet GetDataSetSql(string XSqlString)
        {
            Open();
            SqlDataAdapter Adapter = new SqlDataAdapter(XSqlString, Connection);
            DataSet Ds = new DataSet();
            Adapter.Fill(Ds);
            Close();
            return Ds;
        }
        //���з���������Sql��䣬�����¼
        public int Insert(string XSqlString)
        {
            int Count = -1;
            Open();
            SqlCommand cmd = new SqlCommand(XSqlString, Connection);
            Count = cmd.ExecuteNonQuery();
            Close();
            return Count;            
        }
        //���з���������Sql��䣬�����¼���������ɵ�ID��
        public int GetIDInsert(string XSqlString)
        {
            int Count = -1;
            Open();
            SqlCommand cmd = new SqlCommand(XSqlString, Connection);
            Count = int.Parse(cmd.ExecuteScalar().ToString().Trim());
            Close();
            return Count;

        }
	
	}
}
