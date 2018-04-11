using System;

namespace MyOnLineExam.DataAccessHelper
{
	//对传递过来的字符串进行处理的类
	public class SQLString
	{
		//公有静态方法，将SQL字符串里面的(')转换成('')
		public static String GetSafeSqlString(String XStr)
		{
			return XStr.Replace("'","''"); 
		}

		//公有静态方法，将SQL字符串里面的(')转换成('')，再在字符串的两边加上(')
		public static String GetQuotedString(String XStr)
		{
			return ("'" + GetSafeSqlString(XStr) + "'");
		}
	}
}
