using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace IndividuelltArbete.Model
{
    public class Kund
    {
        public int Kundid { get; set; }

        [StringLength(30, ErrorMessage="För många tecken i förnamn. Max 30!")]
        [Required(ErrorMessage="Du måste skriva in ett förnamn!")]
        public string Fnamn { get; set; }

        [StringLength(30, ErrorMessage = "För många tecken i efternamn. Max 30!")]
        [Required(ErrorMessage = "Du måste skriva in ett efternamn!")]
        public string Enamn { get; set; }

        [StringLength(40, ErrorMessage = "För många tecken i adress. Max 40!")]
        [Required(ErrorMessage = "Du måste skriva in en adress!")]
        public string Adress { get; set; }

        [StringLength(5, ErrorMessage = "För många tecken i postnummer. Max 5!")]
        [Required(ErrorMessage = "Du måste skriva in ett postnummer!")]
        public string Postnr { get; set; }

        [StringLength(30, ErrorMessage = "För många tecken i ort. Max 30!")]
        [Required(ErrorMessage = "Du måste skriva in en ort!")]
        public string Ort { get; set; }
    }
}