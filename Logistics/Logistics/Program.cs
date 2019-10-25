using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.IO;
using Npgsql;


namespace Logistics
{
    class Program
    {
        static void Main(string[] args)
        {


            Console.OutputEncoding = System.Text.Encoding.UTF8;

            /*
            string filePath = @"C:\Users\jari\Documents\Koulu SEAMK 2019-2020\Olio-ohjelmointi\ooprojekti\";
            string fileNameSerialnumbers = "serialnumber.txt";

            System.IO.StreamReader file = new System.IO.StreamReader(filePath+fileNameSerialnumbers);
            //System.IO.StreamWriter file2 = new System.IO.StreamReader(filePath + fileNameSerialnumbers);
            */

            Console.WriteLine("Anna etsittävän asiakkaan nimi");
            string customerName = Console.ReadLine();

            var connString = "Host=localhost;Username=warehouse;Password=never4get;Database=logistics";
            using (var conn = new NpgsqlConnection(connString))
            {
                conn.Open(); // Here we open connection
                             // Here we define our SQL query
                using (var cmd = new NpgsqlCommand("SELECT * FROM customer where custname=" + "'"+customerName+"'", conn))
                using (var reader = cmd.ExecuteReader())
                    // Let's loop through all fetched rows
                    while (reader.Read())
                        // Let's get the string value in the field 1
                        Console.WriteLine($" {reader.GetString(1)} {reader.GetString(2)} {reader.GetString(3)} {reader.GetInt32(4)}");
            }


        }
    }
}
