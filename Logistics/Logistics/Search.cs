using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.IO;
using Npgsql;


namespace Logistics
{
   class Search
    {
        
        public Search(string type, string tablename)
        {

            var connString = "Host=localhost;Username=warehouse;Password=never4get;Database=logistics";
            using (var conn = new NpgsqlConnection(connString))
            {
                conn.Open(); // Here we open connection
                             // Here we define our SQL query

                if (type == "read") 
                { 
                using (var cmd = new NpgsqlCommand("SELECT * FROM " + tablename + " order by 1 asc LIMIT '10' ", conn))
                using (var reader = cmd.ExecuteReader())
                    // Let's loop through all fetched rows
                    while (reader.Read())

                        if (tablename == "customer")
                        {
                            // Print values in fields 1 to 4
                            Console.WriteLine($" {reader.GetString(1)} {reader.GetString(2)} {reader.GetString(3)} {reader.GetInt32(4)}");
                        }

                       else if (tablename=="device")
                        {
                            //If table name is device then we print only fields 1,2 and 6 
                            Console.WriteLine($"{reader.GetString(1)} {reader.GetString(2)} {reader.GetDate(6)}");
                        }
                }
            }

        }

        

    }
}
