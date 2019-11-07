using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.IO;
using Npgsql;


namespace Logistics
{
    class Device
    {
        private string serialnumber;
        string connString = "Host=localhost;Username=warehouse;Password=never4get;Database=logistics";
        int count = 1;

        public Device(string serialnumber, string macAddress, string model, string deskey, string wpakey)
        {
            {
                using (var conn = new NpgsqlConnection(connString))
                {
                    conn.Open(); // Avataan tietokantayhteys

                    //etsitään ensin primary keyn viimeinen indeksi ja tehdään siitä count muuttuja jotta sitä ei tarvitse kysellä käyttäjältä tietojen syöttämisen yhteydessä
                    using (var cmd = new NpgsqlCommand("SELECT iddevice FROM device ORDER BY iddevice DESC LIMIT 1", conn))
                    count += (int)cmd.ExecuteScalar();

                    //using (var cmd = new NpgsqlCommand("INSERT INTO device (iddevice, serialnumber, mac, model, deskey, wpakey) VALUES (" + "'" + count + "'," + "'" + serialnumber + "'," + "'" + macAddress + "'," + "'" + model + "'," + "'" + deskey + "'" + "'" + wpakey + "'" + ")", conn))
                    using (var cmd = new NpgsqlCommand($"INSERT INTO device (iddevice, serialnumber, mac, model, deskey, wpakey) VALUES('{count}', '{serialnumber}', '{macAddress}', '{model}', '{deskey}', '{wpakey}')",conn))
                    cmd.ExecuteNonQueryAsync();
                    conn.Close();
                }
            }
        }

        public string GetDeviceSerial(string serialnumber)
        {
            using (var conn = new NpgsqlConnection(connString))
            {
                conn.Open(); // Avataan tietokantayhteys
                //etsitään tietokannasta äsken luotu laitteen sarjanumeor ja tallennetaan se serialnumber muuttujaan
                using (var cmd = new NpgsqlCommand("SELECT serialnumber FROM device where serialnumber= " + "'" + serialnumber + "'", conn))
                this.serialnumber += (string)cmd.ExecuteScalar();
                conn.Close();
                return serialnumber;
            }
        }


        //laitelista taulukosta (pääohjelmassa)

        public string GetSerial()
        {
            return serialnumber;
        }


    }



}
