using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace IndividuelltArbete.Model.DAL
{
    public class KundDAL : DALBase
    {
        public IEnumerable<Kund> GetKunder()
        {
            using (var con = CS())
            {
                try
                {
                    var kunder = new List<Kund>(100);

                    var cmd = new SqlCommand("AppSchema.usp_SelectAllKunder", con);
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.Add("@Secret", SqlDbType.Int, 4).Value = 77; // ta bort denna senare

                    con.Open();

                    using (var reader = cmd.ExecuteReader())
                    {
                        var kundIdIndex = reader.GetOrdinal("Kundid");
                        var FnamnIndex = reader.GetOrdinal("Fnamn");
                        var EnamnIndex = reader.GetOrdinal("Enamn");
                        var AdressIndex = reader.GetOrdinal("Adress");
                        var PostnrIndex = reader.GetOrdinal("Postnr");
                        var OrtIndex = reader.GetOrdinal("Ort");

                        while (reader.Read())
                        {
                            kunder.Add(new Kund
                            {
                                Kundid = reader.GetInt32(kundIdIndex),
                                Fnamn = reader.GetString(FnamnIndex),
                                Enamn = reader.GetString(EnamnIndex),
                                Adress = reader.GetString(AdressIndex),
                                Postnr = reader.GetString(PostnrIndex),
                                Ort = reader.GetString(OrtIndex)
                            });
                        }

                        kunder.TrimExcess();
                        return kunder;                        
                    }
                }
                catch
                {
                    throw new ApplicationException("Det blev något fel vid hämtningen av kunder!");
                }
            }
        }

        public Kund GetKundById(int kundid)
        {
            using (var con = CS())
            {
                try
                {

                    var cmd = new SqlCommand("AppSchema.usp_SelectKundById", con);
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.Add("@Kundid", SqlDbType.Int, 4).Value = kundid;

                    con.Open();

                    using (var reader = cmd.ExecuteReader())
                    {
                        var kundIdIndex = reader.GetOrdinal("Kundid");
                        var FnamnIndex = reader.GetOrdinal("Fnamn");
                        var EnamnIndex = reader.GetOrdinal("Enamn");
                        var AdressIndex = reader.GetOrdinal("Adress");
                        var PostnrIndex = reader.GetOrdinal("Postnr");
                        var OrtIndex = reader.GetOrdinal("Ort");

                        if (reader.Read())
                        {
                            return new Kund
                            {
                                Kundid = reader.GetInt32(kundIdIndex),
                                Fnamn = reader.GetString(FnamnIndex),
                                Enamn = reader.GetString(EnamnIndex),
                                Adress = reader.GetString(AdressIndex),
                                Postnr = reader.GetString(PostnrIndex),
                                Ort = reader.GetString(OrtIndex)
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
                    throw new ApplicationException("Det blev något fel vid hämtningen av kunden!");
                }
            }
        }

        public void InsertKund(Kund kund)
        {
            using (var con = CS())
            {
                try
                {
                    var cmd = new SqlCommand("AppSchema.usp_addKund", con);
                    cmd.CommandType = CommandType.StoredProcedure;

                    // kundparametrarna
                    cmd.Parameters.Add("@Fnamn", SqlDbType.VarChar, 30).Value = kund.Fnamn;
                    cmd.Parameters.Add("@Enamn", SqlDbType.VarChar, 30).Value = kund.Enamn;
                    cmd.Parameters.Add("@Adress", SqlDbType.VarChar, 40).Value = kund.Adress;
                    cmd.Parameters.Add("@Postnr", SqlDbType.VarChar, 5).Value = kund.Postnr;
                    cmd.Parameters.Add("@Ort", SqlDbType.VarChar, 30).Value = kund.Ort;
                    
                    cmd.Parameters.Add("@Kundid", SqlDbType.Int, 4).Direction = ParameterDirection.Output;

                    con.Open();
                    cmd.ExecuteNonQuery();

                    kund.Kundid = (int)cmd.Parameters["@Kundid"].Value;
                }
                catch
                {
                    throw new ApplicationException("Det blev något fel vid tillägg av ny kund");
                }
            }
        }

        public void UpdateKund(Kund kund)
        {
            using (var con = CS())
            {
                try
                {
                    var cmd = new SqlCommand("AppSchema.usp_UpdateKund", con);
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.Add("@Kundid", SqlDbType.Int, 4).Value = kund.Kundid;
                    cmd.Parameters.Add("@Fnamn", SqlDbType.VarChar, 30).Value = kund.Fnamn;
                    cmd.Parameters.Add("@Enamn", SqlDbType.VarChar, 30).Value = kund.Enamn;
                    cmd.Parameters.Add("@Adress", SqlDbType.VarChar, 40).Value = kund.Adress;
                    cmd.Parameters.Add("@Postnr", SqlDbType.VarChar, 5).Value = kund.Postnr;
                    cmd.Parameters.Add("@Ort", SqlDbType.VarChar, 30).Value = kund.Ort;
                    
                    con.Open();
                    cmd.ExecuteNonQuery();
                }
                catch
                {
                    throw new ApplicationException("Det blev något fel vid uppdatering av ny kund");
                }
            }
        }

        public void DeleteKund(int kundid)
        {
            using (var con = CS())
            {
                try
                {
                    var cmd = new SqlCommand("AppSchema.usp_DeleteKund", con);
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.Add("@Kundid", SqlDbType.Int, 4).Value = kundid;

                    con.Open();
                    cmd.ExecuteNonQuery();
                }
                catch
                {
                    throw new ApplicationException("Det blev något fel vid borttagning av kund");
                }
            }
        }
    }
}