using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Npgsql;

namespace Logistics
{
    class Maintenance : Connection
    {
        private string report;
        int count;
        int rmaid;
        public Maintenance(int rmanumber, string report)
        {

            using (var conn = new NpgsqlConnection(connString))
            {
                conn.Open(); // Avataan tietokantayhteys

                //etsitään ensin primary keyn viimeinen indeksi, kun unohtui tässäkin taulussa "serialize"
                using (var cmd = new NpgsqlCommand("SELECT idmaintenance FROM maintenance ORDER BY idmaintenance DESC LIMIT 1", conn))
                count = (int)cmd.ExecuteScalar();
                count++;
             
                using (var cmd = new NpgsqlCommand($"SELECT idrma FROM rma WHERE rmanumber = {rmanumber}", conn))
                rmaid = (int)cmd.ExecuteScalar();
                rmaid++;
            
                using (var cmd = new NpgsqlCommand($"INSERT INTO maintenance (idmaintenance, report, rmaid) VALUES('{count}', '{report}', '{rmaid}')", conn))
               cmd.ExecuteNonQuery();
               // cmd.ExecuteNonQueryAsync();
                conn.Close();

            }

            }   

    }
}
