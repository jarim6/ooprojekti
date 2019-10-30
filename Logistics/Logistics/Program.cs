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

                Console.WriteLine("5 - Saapunut RMA");
                Console.WriteLine("0 - Lopeta");

                switch_on = int.Parse(Console.ReadLine());

                switch (switch_on)
                {
                    //kysytään asiakastiedot
                    case 1:
                        Console.WriteLine("Asiakkaan nimi?");
                        string nimi = Console.ReadLine();
                        Console.WriteLine("Osoite?");
                        string osoite=Console.ReadLine();
                        Console.WriteLine("Kaupunki?");
                        string kaupunki = Console.ReadLine();
                        Console.WriteLine("Postinumero?");
                        int postcode = int.Parse(Console.ReadLine());
                        //Lisätään syötetyt asiakastiedot tietokantaan hyväksynnän jälkeen
                        Customer newCustomer=new Customer(nimi, osoite, kaupunki, postcode);                        
                        break;

                    case 2:
                       General asiakaslista = new General("customer");
                        break;

                    case 3:
                        General laitelista = new General("device");
                        break;

                    default:
                        break;
                }




            } while (switch_on > 0);
        }
    }
}
