using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.IO;
using Npgsql;

namespace Logistics
{
    class Customer : Connection
    {

        private string customerName;
        int count = 1;

        public Customer(string customerName, string osoite, string kaupunki, int postcode)
        {
            using (var conn = new NpgsqlConnection(connString))
            {
                conn.Open(); // Avataan tietokantayhteys

                //etsitään ensin primary keyn viimeinen indeksi ja tehdään siitä count muuttuja jotta sitä ei tarvitse kysellä käyttäjältä tietojen syöttämisen yhteydessä
                using (var cmd = new NpgsqlCommand("SELECT idcustomer FROM customer ORDER BY idcustomer DESC LIMIT 1", conn))
                count += (int)cmd.ExecuteScalar();

                using (var cmd = new NpgsqlCommand("INSERT INTO customer (idcustomer, custname, address, city, postalcode) " +
                "VALUES (" + "'" + count + "'," + "'" + customerName + "'," + "'" + osoite + "'," + "'" + kaupunki + "'," + "'" + postcode + "'" + ")", conn))
                cmd.ExecuteNonQueryAsync();
                conn.Close();
            }
        }

        //asiakastieto tietokannasta
        public string GetCustomerInfo(string customerName)
        {
            using (var conn = new NpgsqlConnection(connString))
            {
                conn.Open(); // Avataan tietokantayhteys
                //etsitään tietokannasta äsken luotu asiakas ja tallennetaan se customerName muuttujaan
                using (var cmd = new NpgsqlCommand("SELECT custname, idcustomer FROM customer where custname= " + "'"+customerName+"'", conn))
                this.customerName += (string)cmd.ExecuteScalar();
                conn.Close();
                return customerName;
            }
        }

        //asiakaslista taulukosta (pääohjelmassa)
        public string GetCustomerName()
        {
            return customerName;
        }

       
    }
}
