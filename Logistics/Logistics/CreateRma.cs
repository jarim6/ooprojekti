using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Npgsql;


namespace Logistics
{
    internal class CreateRma : Connection
    {
        private string description;
        private string serialnumber;
        int idserial;
        int rmanumber;

        public CreateRma(string description, string serialnumber)
        {
           
            this.description = description;
            this.serialnumber = serialnumber;
            

            using (var conn = new NpgsqlConnection(connString))
            {
               try
                {
                    conn.Open();
                }
              finally
              {
                    //Here's where the cool magic happens. Since user inputs serialnumber of the device when asked but table accepts only the id of that serialnumber we need to first find the serialid from device list..
                    using (var cmd = new NpgsqlCommand($"select iddevice from device where serialnumber='{serialnumber}'", conn))
                    idserial = (int)cmd.ExecuteScalar();

                    //Pointless to have user manually inserting incremental value of rmanumber so let's just look it up and plus one on last
                    using (var cmd = new NpgsqlCommand("SELECT rmanumber FROM rma ORDER BY rmanumber DESC LIMIT 1", conn))
                    rmanumber = (int)cmd.ExecuteScalar();
                    rmanumber++;
                    //No need to care about rmaid since table is autoincrement for primary key in rma table
                    using (var cmd = new NpgsqlCommand($"insert into rma (issuedescription, rmanumber, serialnumberid) values ('{description}', '{rmanumber}', '{idserial}')", conn))
                        //Tietokannan kanssa tuli joku error, Npgsql.PostgresException: '42501: permission denied for sequence
                        //jonka takia piti tietokannassa tehdä GRANT USAGE, SELECT ON ALL SEQUENCES IN SCHEMA public to warehouse;
                        cmd.ExecuteNonQuery();
                    //cmd.ExecuteNonQueryAsync();

                    conn.Close();

               }
            }

        }


        public int GetRMANumber()
        {
            return rmanumber;
        }


    }
}