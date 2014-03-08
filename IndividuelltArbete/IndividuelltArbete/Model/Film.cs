using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace IndividuelltArbete.Model
{
    public class Film
    {
        public int Filmid { get; set; }

        [Required(ErrorMessage="Du måste skriva in ett namn")]
        [StringLength(50, ErrorMessage="Max 50 tecken för film")]
        public string Namn { get; set; }

        [Required(ErrorMessage = "Du måste skriva in en kategori")]
        [StringLength(30, ErrorMessage="Max 30 tecken för kategori")]
        public string Kategori { get; set; }
    }
}