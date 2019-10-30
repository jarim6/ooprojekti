using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Npgsql;

namespace Logistics
{
    class Customer
    {
        private string customerName;
        private string address;
        private string city;
        private int pocode;
        int count=1;

        public Customer(string customerName, string address, string city, int pocode)
        {
                       
            var connString = "Host=localhost;Username=warehouse;Password=never4get;Database=logistics";

            
            using (var conn = new NpgsqlConnection(connString))
            {
                conn.Open(); // Here we open connection
                //etsitään ensin primary keyn viimeinen indeksi ja tehdään siitä count muuttuja jotta sitä ei tarvitse kysellä käyttäjältä tietojen syöttämisen yhteydessä
                using (var cmd = new NpgsqlCommand("SELECT idcustomer FROM customer ORDER BY idcustomer DESC LIMIT 1", conn))
                count += (int)cmd.ExecuteScalar();

                using (var cmd = new NpgsqlCommand("INSERT INTO customer (idcustomer, custname, address, city, postalcode) " +
                "VALUES (" + "'"+ count +"'," + "'" + customerName + "'," + "'" + address + "'," + "'" + city + "'," + "'" + pocode+"'" + ")", conn))
                cmd.ExecuteNonQueryAsync();
                conn.Close();
            }
 
        }

    }
}
