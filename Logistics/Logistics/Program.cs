using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.IO;
//using Npgsql;

namespace Logistics
{
    class Program
    {
        static void Main(string[] args)
        {

            int rmanumber;
            int response;
            string serialnumber;
            List<Customer> customerList = new List<Customer>();
            List<Device> deviceList = new List<Device>();

            do
            {

                Console.WriteLine("1 - Syötä uuden asiakkaan tiedot");
                Console.WriteLine("2 - Syötä uuden laitteen tiedot");
                Console.WriteLine("3 - Tulosta vikakuvaus olemassa olevasta RMA huoltolaitteesta");
                Console.WriteLine("4 - Luo uusi RMA");
                Console.WriteLine("5 - Tee uusi huoltoraportti");
                Console.WriteLine("0 - Lopeta");

                response = int.Parse(Console.ReadLine());


                switch (response)
                {
                    case 1:
                        Console.Clear();
                        Console.WriteLine("Asiakkaan nimi?");
                        string nimi = Console.ReadLine();
                        Console.WriteLine("Osoite?");
                        string osoite = Console.ReadLine();
                        Console.WriteLine("Kaupunki?");
                        string kaupunki = Console.ReadLine();
                        Console.WriteLine("Postinumero?");
                        int postcode = int.Parse(Console.ReadLine());
                        Customer newCustomer = new Customer(nimi, osoite, kaupunki, postcode);
                        customerList.Add(newCustomer);
                        //Haetaan asiakkaan tiedot tietokannasta niin saadaan vahvistus, että tiedot tosiaan tallentui tietokantaan
                        Console.WriteLine($"Asiakas {newCustomer.GetCustomerInfo(nimi)} lisätty tietokantaan");
                        break;

                       
                    case 2:
                        Console.Clear();
                        Console.WriteLine("Anna laitteen sarjanumero");
                        serialnumber = Console.ReadLine();
                        Console.WriteLine("Anna laitteen MAC");
                        string macAddress = Console.ReadLine();
                        Console.WriteLine("Anna laitteen malli");
                        string model = Console.ReadLine();
                        Console.WriteLine("Anna laitteen 3DES-avain");
                        string deskey = Console.ReadLine();
                        Console.WriteLine("Anna laitteen WPA-avain");
                        string wpakey = Console.ReadLine();
                        Device newDevice = new Device(serialnumber, macAddress, model, deskey, wpakey);
                        deviceList.Add(newDevice);
                        Console.WriteLine($"Laite {newDevice.GetDeviceSerial(serialnumber)} lisätty tietokantaan");
                        break;

                    case 3:
                        Console.Clear();
                        Console.WriteLine("Syötä RMA numero");
                        rmanumber = int.Parse(Console.ReadLine());
                        Rma newRMA = new Rma(rmanumber);
                        Console.WriteLine("\n\n");
                        //Haetaan vikaselostus
                        Console.WriteLine(newRMA.GetRmaDescription(rmanumber));
                        Console.WriteLine("\n\n");
                        break;

                    case 4:
                        Console.Clear();
                        Console.WriteLine("Syötä laitteen sarjanumero");
                        serialnumber =Console.ReadLine();
                        Console.WriteLine("Syötä vikakuvaus");
                        string description = Console.ReadLine();
                        CreateRma newIncident = new CreateRma(description, serialnumber);
                        //jatkohifistelyihin tässä pitää vielä hakea tietokannasta tuo äsken generoitu 
                        Console.WriteLine("RMA ID " + newIncident.GetRMANumber() + " luotu");
                        Console.WriteLine("\n\n");
                        break;



                    case 5:
                        Console.Clear();
                        Console.WriteLine("Anna RMA numero");
                        rmanumber = int.Parse(Console.ReadLine());
                        Rma newRMADesc = new Rma(rmanumber);
                        Console.WriteLine("Vikakuvaus: " +  newRMADesc.GetRmaDescription(rmanumber));
                        Console.WriteLine("Kirjoita huoltotoimenpiteet");
                        string report = Console.ReadLine();
                        Maintenance newFix = new Maintenance(rmanumber, report);
                        break;

                    

                    default:
                        break;
                }
            } while (response > 0);


            //Lopuksi tulostetaan kaikki luodut asiakkaat, jos niitä on luotu.
            foreach (var item in customerList)
            {
                Console.WriteLine($"Luotu asiakas { item.GetCustomerName()}");
            }

           //Tulostetaan lisätyt laitteet, koska voidaan tulostaa ne.
            foreach (var item in deviceList)
            {
                Console.WriteLine($"Laite {item.GetSerial()} lisätty tietokantaan");
            }

        }
    }
}
