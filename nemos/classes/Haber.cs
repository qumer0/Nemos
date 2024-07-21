using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace nemos.classes
{
    public class Haber
    {
        public int Id { get; set; }
        public string Baslik { get; set; }
        public string Icerik { get; set; }
        public string ResimUrl { get; set; } // Resim URL'sini tutmak için
        public DateTime Tarih { get; set; }
    }

}