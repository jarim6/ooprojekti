using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Npgsql;


namespace Logistics
{
    class Rma
    {

        string connString = "Host=localhost;Username=warehouse;Password=never4get;Database=logistics";
        string description;
        int rmanumber;

        public Rma(int rmanumber)
        {
            this.rmanumber = rmanumber;
        }

        public string GetRmaDescription(int rmanumber)
        {

            using (var conn = new NpgsqlConnection(connString))
            {

                conn.Open();
                using (var cmd = new NpgsqlCommand($"SELECT issuedescription FROM rma where rmanumber='{rmanumber}'", conn))
                description = (string)cmd.ExecuteScalar();
                conn.Close();
                return description;
            }
        }

    }
}
