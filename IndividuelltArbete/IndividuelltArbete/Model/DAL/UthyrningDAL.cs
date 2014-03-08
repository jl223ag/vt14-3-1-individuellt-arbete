using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace IndividuelltArbete.Model.DAL
{
    public class UthyrningDAL : DALBase
    {
        public IEnumerable<Uthyrning> GetUthyrningarByKundid(int kundid)
        {
            using (var con = CS())
            {
                try
                {
                    var cmd = new SqlCommand("AppSchema.usp_GetUthyrningarByKundid", con);
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.AddWithValue("@Kundid", kundid);

                    var uthyrningar = new List<Uthyrning>(10);

                    con.Open();

                    using (var reader = cmd.ExecuteReader())
                    {
                        var uthyrningsidIndex = reader.GetOrdinal("Uthyrningsid");
                        var filmidIndex = reader.GetOrdinal("Filmid");
                        var kundidIndex = reader.GetOrdinal("Kundid");
                        var prisIndex = reader.GetOrdinal("Pris");
                        var dagarIndex = reader.GetOrdinal("Dagar");
                        var startdatumIndex = reader.GetOrdinal("Startdatum");
                        var slutdatumIndex = reader.GetOrdinal("Slutdatum");

                        while (reader.Read())
                        {
                            uthyrningar.Add(new Uthyrning
                            {
                                Uthyrningsid = reader.GetInt32(uthyrningsidIndex),
                                Filmid = reader.GetInt32(filmidIndex),
                                Kundid = reader.GetInt32(kundidIndex),
                                Pris = reader.GetDecimal(prisIndex),
                                Dagar = reader.GetByte(dagarIndex),
                                Startdatum = reader.GetDateTime(startdatumIndex),
                                Slutdatum = reader.GetDateTime(slutdatumIndex)
                            });
                        }
                    }

                    uthyrningar.TrimExcess();
                    return uthyrningar;
                }

                catch
                {
                    throw new ApplicationException("Det blev något fel vid hämtning av kundens uthyrningar");
                }
            }
        }

        
        public Uthyrning GetUthyrningById(int uthyrningsid)
        {
            using (var con = CS())
            {
                try
                {
                    var cmd = new SqlCommand("AppSchema.usp_SelectUthyrning", con);
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.Add("@Uthyrningsid", SqlDbType.Int).Value = uthyrningsid;

                    var uthyrningar = new List<Uthyrning>(10);

                    con.Open();

                    using (var reader = cmd.ExecuteReader())
                    {
                        var uthyrningsidIndex = reader.GetOrdinal("Uthyrningsid");
                        var filmidIndex = reader.GetOrdinal("Filmid");
                        var kundidIndex = reader.GetOrdinal("Kundid");
                        var prisIndex = reader.GetOrdinal("Pris");
                        var dagar = reader.GetOrdinal("Dagar");
                        var startdatumIndex = reader.GetOrdinal("Startdatum");
                        var slutdatumIndex = reader.GetOrdinal("Slutdatum");

                        if (reader.Read())
                        {
                            return new Uthyrning
                            {
                                Uthyrningsid = reader.GetInt32(uthyrningsidIndex),
                                Filmid = reader.GetInt32(filmidIndex),
                                Kundid = reader.GetInt32(kundidIndex),
                                Pris = reader.GetDecimal(prisIndex),
                                Dagar = reader.GetByte(dagar),
                                Startdatum = reader.GetDateTime(startdatumIndex),
                                Slutdatum = reader.GetDateTime(slutdatumIndex)
                            };
                        }
                        else
                        {
                            return null;
                        }
                    }
                }
                catch
                {
                    throw new ApplicationException("Blev något vid hämtning av uthyrningen");
                }
            }
        }

        public void InsertUthyrning(Uthyrning uthyrning)
        {
            using (var con = CS())
            {
                try
                {
                    var cmd = new SqlCommand("AppSchema.usp_AddToUthyrning", con);
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.Add("@Pris", SqlDbType.Decimal).Value = uthyrning.Pris;
                    cmd.Parameters.Add("@Startdatum", SqlDbType.DateTime).Value = uthyrning.Startdatum;
                    cmd.Parameters.Add("@Dagar", SqlDbType.TinyInt).Value = uthyrning.Dagar;
                    cmd.Parameters.Add("@Filmid", SqlDbType.Int).Value = uthyrning.Filmid;
                    cmd.Parameters.Add("@Kundid", SqlDbType.Int).Value = uthyrning.Kundid;

                    cmd.Parameters.Add("@Uthyrningsid", SqlDbType.Int).Direction = ParameterDirection.Output;

                    con.Open();
                    cmd.ExecuteNonQuery();

                    uthyrning.Uthyrningsid = (int)cmd.Parameters["@Uthyrningsid"].Value;
                }
                catch
                {
                    throw new ApplicationException("Det blev något fel vid tillägg av uthyrning");
                }
            }
        }

        public void UpdateUthyrning(Uthyrning uthyrning)
        {
            using (var con = CS())
            {
                try
                {
                    var cmd = new SqlCommand("AppSchema.usp_UpdateUthyrning", con);
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.Add("@Uthyrningsid", SqlDbType.Int).Value = uthyrning.Uthyrningsid;
                    cmd.Parameters.Add("@Pris", SqlDbType.Decimal).Value = uthyrning.Pris;
                    cmd.Parameters.Add("@Startdatum", SqlDbType.DateTime).Value = uthyrning.Startdatum;
                    cmd.Parameters.Add("@Dagar", SqlDbType.TinyInt).Value = uthyrning.Dagar;
                    cmd.Parameters.Add("@Filmid", SqlDbType.Int).Value = uthyrning.Filmid;

                    con.Open();
                    cmd.ExecuteNonQuery();
                }
                catch
                {
                    throw new ApplicationException("Det blev något fel vid uppdatering av uthyrning");
                }
            }
        }

        public void DeleteUthyrning(int uthyrningsid)
        {
            using (var con = CS())
            {
                try
                {
                    var cmd = new SqlCommand("AppSchema.usp_DeleteUthyrning", con);
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.Add("@Uthyrningsid", SqlDbType.Int, 4).Value = uthyrningsid;

                    con.Open();
                    cmd.ExecuteNonQuery();
                }
                catch
                {
                    throw new ApplicationException("Det blev något fel vid borttagning av uthyrning");
                }
            }
        }
    }
}