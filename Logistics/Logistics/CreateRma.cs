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
        private int rmanumber;
        private string description;
        private string serialnumber;
       int idserial;

        public CreateRma(int rmanumber, string description, string serialnumber)
        {
            this.rmanumber = rmanumber;
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
                    //description = (string)cmd.ExecuteScalar();
                    //close da connection
                    conn.Close();
                    //No need to care about rmaid since table is autoincrent for primary key in rma table
                    using (var cmd = new NpgsqlCommand($"insert into rma (issuedescription, rmanumber, serialnumberid) values ('{rmanumber}', '{description}', {idserial}", conn))
                    cmd.ExecuteNonQueryAsync();

                    conn.Close();

                }
            }

        }

    }
}