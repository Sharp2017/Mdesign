using System;
using System.Collections;
using System.Collections.Specialized;
using System.Data;
using System.Data.OleDb;
using System.Configuration;

namespace Mdesign.App_Code
{
    public class AccessDb
    {

        //改善过的DB类 把connection 独立到内部来open 解决了connect过多没有释放的问题

        #region Global Variables
        protected static string connectionString = @" PROVIDER=Microsoft.Jet.OLEDB.4.0;DATA Source=" +
            System.Web.HttpContext.Current.Server.MapPath("~/Data/#data.mdb");
        #endregion

        #region Global Methods
        public static DataSet Execute(string Sql)
        {
            using (OleDbConnection connection = new OleDbConnection(connectionString))
            {
                DataSet ds = new DataSet();
                try
                {
                    connection.Open();
                    OleDbDataAdapter command = new OleDbDataAdapter(Sql, connection);
                    command.Fill(ds, "ds");
                }
                catch (System.Data.OleDb.OleDbException ex)
                {
                    throw new Exception(ex.Message);
                }
                return ds;
            }

        }
        public static DataSet Execute(OleDbCommand Command)
        {
            using (OleDbConnection connection = new OleDbConnection(connectionString))
            {
                DataSet ds = new DataSet();
                try
                {
                    connection.Open();
                    Command.Connection = connection;
                    OleDbDataAdapter command = new OleDbDataAdapter(Command);

                    command.Fill(ds, "ds");
                }
                catch (System.Data.OleDb.OleDbException ex)
                {
                    throw new Exception(ex.Message);
                }
                return ds;
            }
        }
        public static OleDbDataReader ExecuteReader(string Sql)
        {
            OleDbConnection connection = new OleDbConnection(connectionString);
            OleDbCommand cmd = new OleDbCommand(Sql, connection);
            try
            {
                connection.Open();
                OleDbDataReader myReader = cmd.ExecuteReader();
                return myReader;
            }
            catch (System.Data.OleDb.OleDbException e)
            {
                throw new Exception(e.Message);
            }

        }
        public static OleDbDataReader ExecuteReader(OleDbCommand Command)
        {
            OleDbConnection connection = new OleDbConnection(connectionString);
            connection.Open();
            Command.Connection = connection;
            Command.Connection.Open();
            return Command.ExecuteReader(CommandBehavior.CloseConnection);
        }
        public static object ExecuteScalar(string Sql)
        {
            object result = null;
            OleDbConnection connection = new OleDbConnection(connectionString);
            OleDbCommand Command = new OleDbCommand(Sql, connection);
            try
            {
                connection.Open();
                result = Command.ExecuteScalar();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                connection.Close();
            }

            return result;
        }
        public static int ExecuteNonQuery(string Sql)
        {
            int result = -1;

            OleDbConnection connection = new OleDbConnection(connectionString);
            OleDbCommand Command = new OleDbCommand(Sql, connection);

            try
            {
                connection.Open();
                result = Command.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                connection.Close();
            }

            return result;
        }
        public static int ExecuteNonQuery(OleDbCommand Command)
        {
            int result = -1;
            using (OleDbConnection connection = new OleDbConnection(connectionString))
            {
                try
                {
                    Command.Connection = connection;
                    Command.Connection.Open();
                    result = Command.ExecuteNonQuery();
                }
                catch (Exception ex)
                {
                    throw ex;
                }
                finally
                {
                    Command.Connection.Close();
                }

                return result;
            }
        }
        public static DataSet ExecuteStoredProcedure(string SPName, ref ArrayList Parameters)
        {
            DataSet dsResult = new DataSet();
            OleDbConnection connection = new OleDbConnection(connectionString);
            OleDbCommand Command = new OleDbCommand(SPName, connection);
            Command.CommandType = CommandType.StoredProcedure;

            if (Parameters != null)
            {
                for (int i = 0; i < Parameters.Count; i++)
                {
                    Command.Parameters.Add(Parameters[i]);
                }
            }

            try
            {
                OleDbDataAdapter adapter = new OleDbDataAdapter(Command);
                adapter.Fill(dsResult);
            }
            catch (Exception ex)
            {
                throw ex;
            }

            return dsResult;
        }

        public static OleDbDataReader ExecuteStoredProcedureReader(string SPName, ref ArrayList Parameters)
        {
            OleDbCommand cmd = new OleDbCommand();
            OleDbConnection connection = new OleDbConnection(connectionString);
            cmd.Connection = connection;
            cmd.CommandText = SPName;
            cmd.CommandType = CommandType.StoredProcedure;

            if (Parameters != null)
            {
                for (int i = 0; i < Parameters.Count; i++)
                {
                    cmd.Parameters.Add(Parameters[i]);
                }
            }
            connection.Open();

            return cmd.ExecuteReader(CommandBehavior.CloseConnection);
        }

        public static int ExecuteNon(string SPName, ref ArrayList Parameters)
        {
            OleDbConnection Connection = new OleDbConnection(connectionString);
            try
            {

                Connection.Open();
            }
            catch
            {
            }

            OleDbCommand Command = new OleDbCommand(SPName, Connection);
            Command.CommandType = CommandType.Text;

            if (Parameters != null)
            {
                for (int i = 0; i < Parameters.Count; i++)
                {
                    Command.Parameters.Add(Parameters[i]);

                }
            }

            int returnInt;
            try
            {

                returnInt = Command.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return returnInt;
        }

        public static bool ExecuteTransaction(string[] Sql)
        {

            ArrayList CommandList = new ArrayList(0);
            OleDbConnection connection = new OleDbConnection(connectionString);
            connection.Open();
            OleDbTransaction Transaction = connection.BeginTransaction(IsolationLevel.Serializable);

            for (int i = 0; i < Sql.Length; i++)
            {
                OleDbCommand TransactionCommand = new OleDbCommand(Sql[i], connection, Transaction);
                try
                {
                    TransactionCommand.ExecuteNonQuery();
                    CommandList.Add(TransactionCommand);
                }
                catch (Exception ex)
                {
                    connection.Close();
                    throw ex;
                }


                Transaction.Commit();
                connection.Close();
            }
            return true;
        }
        #endregion
    }
}