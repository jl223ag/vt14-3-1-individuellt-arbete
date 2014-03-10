using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace IndividuelltArbete.Model.DAL
{
    public class FilmDAL : DALBase
    {
        public IEnumerable<Film> GetFilmer()
        {
            using (var con = CS())
            {
                try
                {
                    var filmer = new List<Film>(20);

                    var cmd = new SqlCommand("AppSchema.usp_SelectAllFilmer", con);
                    cmd.CommandType = CommandType.StoredProcedure;

                    con.Open();

                    using (var reader = cmd.ExecuteReader())
                    {
                        var FilmidIndex = reader.GetOrdinal("Filmid");
                        var NamnIndex = reader.GetOrdinal("Namn");
                        var KategoriIndex = reader.GetOrdinal("Kategori");

                        while (reader.Read())
                        {
                            filmer.Add(new Film
                            {
                                Filmid = reader.GetInt32(FilmidIndex),
                                Namn = reader.GetString(NamnIndex),
                                Kategori = reader.GetString(KategoriIndex)
                            });
                        }

                        filmer.TrimExcess();
                        return filmer;
                    }
                }
                catch
                {
                    throw new ApplicationException("Det blev något fel vid hämtning av filmer");
                }
            }
        }
    }
}