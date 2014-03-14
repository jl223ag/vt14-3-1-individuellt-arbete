using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace IndividuelltArbete.Model
{
    public class Uthyrning
    {
        public int Uthyrningsid { get; set; }
        
        [Required(ErrorMessage="Ange pris!")]
        public decimal Pris { get; set; }
                
        [Required(ErrorMessage = "Ange antal dagar!")]
        public byte Dagar { get; set; }

        [Required(ErrorMessage = "Ange kundid!")]
        public int Kundid { get; set; }

        [Required(ErrorMessage = "Ange filmid!")]
        public int Filmid { get; set; }

        public DateTime? Startdatum { get; set; } // GETDATE() i databasen om datum inte anges, nullable

        public DateTime Slutdatum { get; set; } // beräknande fält

    
    }
}