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


            int switch_on;

            Console.OutputEncoding = System.Text.Encoding.UTF8;

            do
            {

                Console.WriteLine("1 - Syötä uuden asiakkaan tiedot");
                Console.WriteLine("2 - Listaa viimeiset 10 asiakasta");
                Console.WriteLine("3 - Listaa viimeiset 10 laitetta");
                Console.WriteLine("4 - Etsi asiakkaan tiedot");
                Console.WriteLine("5 - Lisää uusi laite"); 
                Console.WriteLine("6 - Etsi laitteen tiedot");
                Console.WriteLine("7 - RMA");
                Console.WriteLine("0 - Lopeta");

                switch_on = int.Parse(Console.ReadLine());

                switch (switch_on)
                {
                    //kysytään asiakastiedot
                    case 1:
                        string taulu = "customer";
                        Console.WriteLine("Asiakkaan nimi?");
                        string nimi = Console.ReadLine();
                        Console.WriteLine("Osoite?");
                        string osoite=Console.ReadLine();
                        Console.WriteLine("Kaupunki?");
                        string kaupunki = Console.ReadLine();
                        Console.WriteLine("Postinumero?");
                        int postcode = int.Parse(Console.ReadLine());
                        //Lisätään syötetyt asiakastiedot tietokantaan hyväksynnän jälkeen
                        //Insert newCustomer=new Insert(nimi, osoite, kaupunki, postcode);                        
                        new Insert(taulu, nimi, osoite, kaupunki, postcode);
                        break;

                    case 2:
                        //Haetaan ja tulostetaan asiakaslista
                        new Search("read", "customer");
                        break;

                    case 3:
                        //Haetaan ja tulostetaan laitelista
                        new Search("read", "device");
                        break;

                    case 4:
                        Console.WriteLine("Anna asiakkaan nimi");
                        string etsinimi = Console.ReadLine();
                        //TODO loputkin
                        break;
                    case 5:
                        Console.WriteLine("Anna laitteen sarjanumero");
                        string serialnumber= Console.ReadLine();
                        Console.WriteLine("Anna laitteen MAC");
                        string macAddress= Console.ReadLine();
                        Console.WriteLine("Anna laitteen malli");
                        string model= Console.ReadLine();
                        Console.WriteLine("Anna laitteen 3DES-avain");
                        string deskey= Console.ReadLine();
                        Console.WriteLine("Anna laitteen WPA-avain");
                        string wpakey= Console.ReadLine();
                        //TODO
                        break;

                    case 6:
                        //TODO
                        break;

                    default:
                        break;
                }




            } while (switch_on > 0);
        }
    }
}
