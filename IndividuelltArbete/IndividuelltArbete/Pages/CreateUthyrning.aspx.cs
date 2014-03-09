using IndividuelltArbete.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IndividuelltArbete.Pages
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        private Service _service;

        private Service Service
        {
            get { return _service ?? (_service = new Service()); }
        }

        protected int? Kundid // sessionsvariabel för kundid
        {
            get
            {
                return Session["VilkenKund"] as int?;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {            
            if (Session["VilkenKund"] == null) // om sessionen har löpt ut
            {
                Response.Redirect("~/Default.aspx?Message=false");
            }

            var created = Request.QueryString["Created"];
            if (created != null)
            {
                CreatedText.Text = String.Format("Uthyrning tillagd den {0}", created);
                CreatedText.Visible = true;
            }

            GetKundByID();            
        }

        protected void SendButton_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                try
                {
                    var uthyrning = new Uthyrning();
                    
                    uthyrning.Filmid = int.Parse(FilmBox.SelectedValue);
                    uthyrning.Pris = Decimal.Parse(PrisBox.Text);
                    uthyrning.Dagar = Byte.Parse(DagarBox.Text);
                    uthyrning.Kundid = (int)Kundid;

                    if (!String.IsNullOrEmpty(StartdatumBox.Text)) // denna är frivillig, om lämnad tom körs GETDATE() i lagrade proceduren
                    {
                        uthyrning.Startdatum = DateTime.Parse(StartdatumBox.Text);
                    }

                    Service.SaveUthyrning(uthyrning);
                    Response.Redirect(String.Format("~/Pages/CreateUthyrning.aspx?Created={0}", uthyrning.Startdatum)); // PRG med kundens namn i en querystring
                }
                catch (Exception)
                {
                    Page.ModelState.AddModelError(String.Empty, "Något gick åt skogen vid sparning av kunden");
                }
            }
        }

        public IEnumerable<Film> FilmDDList_GetData()
        {
            return Service.GetFilmer();
        }

        protected void GetKundByID() // hämta kundens för och efternamn och presentera i formuläret
        {
            var kund = Service.GetKundById((int)Kundid);
            KundNamn.Text = String.Format("Lägg till uthyrning för: {0} {1}", kund.Fnamn, kund.Enamn);
        }
    }
}