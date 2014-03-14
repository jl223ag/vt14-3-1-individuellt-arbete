using IndividuelltArbete.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IndividuelltArbete.Pages
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        private Service _service;

        private Service Service
        {
            get { return _service ?? (_service = new Service()); }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            var created = Request.QueryString["Created"];

            if (created != null) // om det finns en querystring
            {
                created = created.Replace("%", " "); // snabbvariant av url decoding för att ta bort mellanslag
                CreatedText.Text = String.Format("Kunden {0} har sparats!", created);
                RightMessage.Visible = true;
            }
        }

        public void SendButton_Click(object sender, EventArgs e)
        {
            if (Page.IsValid) // om sidan klarade valideringen är det lugnt att gå vidare och försöka lägga till ny kund
            {
                try
                {
                    var kund = new Kund();
                    kund.Fnamn = FnamnBox.Text;
                    kund.Enamn = EnamnBox.Text;
                    kund.Adress = AdressBox.Text;
                    kund.Postnr = PostnrBox.Text;
                    kund.Ort = OrtBox.Text;

                    Service.SaveKund(kund);
                    Response.Redirect(String.Format("~/Pages/CreateKund.aspx?Created={0}%{1}", kund.Fnamn, kund.Enamn)); // PRG med kundens namn i en querystring
                }
                catch (Exception)
                {
                    Page.ModelState.AddModelError(String.Empty, "Något gick åt skogen vid sparning av kunden");
                }
            }
        }
    }
}