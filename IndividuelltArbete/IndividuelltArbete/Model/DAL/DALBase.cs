using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;

namespace IndividuelltArbete.Model.DAL
{
    public class DALBase
    {
        private static string _connectionString; // statisk sträng innehållande connectionsträngen till databasen

        static DALBase()
        {
            _connectionString = WebConfigurationManager.ConnectionStrings["IndividuellaArbetsConnectionen"].ConnectionString;
        }

        protected SqlConnection CS()
        {
            return new SqlConnection(_connectionString);
        }
    }
}