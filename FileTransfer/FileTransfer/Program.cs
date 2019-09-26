using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.IO;



namespace FileTransfer
{
    class Program
    {
        static void Main(string[] args)
        {

            string path = @"C:\Users\jari\AppData\Roaming\Dropbox\testi.txt";
            if (File.Exists(path))
            {
                //open the file for reading
                StreamReader sr = File.OpenText(path);
            }

            }
        }
}
