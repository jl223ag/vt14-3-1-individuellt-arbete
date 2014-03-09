using IndividuelltArbete.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IndividuelltArbete.Pages
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        private Service _service;

        private Service Service
        {
            get { return _service ?? (_service = new Service()); }
        }

        protected int? Kundid // sparar querystringvärdet i en sessionsvariabel
        {
            get
            {
                return Session["VilkenKund"] as int?; // nullable för att undvika att det krashar
            }
            set
            {
                Session["VilkenKund"] = value;
            }
        }


        protected void Page_Load(object sender, EventArgs e)
        {
            var id = Request.QueryString["Kundid"]; // hämtar querystrings
            var edited = Request.QueryString["Edited"];

            if (id != null) // en querystring för kundid finns
            {
                try
                {
                    if (int.Parse(id) != Kundid) // om det inte är samma kund
                    {
                        Kundid = int.Parse(id); // gör om querystringen till int
                    }
                }
                catch
                {
                    Page.ModelState.AddModelError(String.Empty, String.Format("Ett fel inträffade vid läsning av kundid nr: {0}", id));
                }
            }
            else // om det inte finns en querystring för kundid
            {
                if (Session["VilkenKund"] == null) //.. och sessionen är null så har den löpt ut
                {
                    Response.Redirect(String.Format("~/Default.aspx?Message=false"));
                }
            }

            if (edited != null) // om något har redigerats
            {
                edited = edited.Replace("%", " "); // för att undvika mellanslag mellan för och efternamn i urlen
                SuccessText.Text = String.Format("{0} har uppdaterats", edited);
                SuccessText.Visible = true;
            }
        }

        public Kund EditKunderListView_GetData()
        {
            return Service.GetKundById((int)Kundid); // Hämtar kunden ur databasen
        }

        public void EditKunderListView_DeleteItem(int kundid)
        {
            try
            {
                Service.DeleteKund(kundid);
                Response.Redirect("~/Default.aspx?Message=true");
            }
            catch
            {
                Page.ModelState.AddModelError(String.Empty, "Något blev fel vid borttagning av kunden");
            }
        }

        public void EditKunderListView_UpdateItem(int kundid) // denna kan förbättras som fan med querystringen istället.. gör senare
        {
            if (Page.ModelState.IsValid)
            {
                try
                {
                    var kund = Service.GetKundById(kundid);
                    if (kund != null)
                    {
                        if (TryUpdateModel(kund)) // sköter valideringen också
                        {
                            Service.SaveKund(kund);
                            Response.Redirect(String.Format("~/Pages/Edit.aspx?Edited={0}%{1}", kund.Fnamn, kund.Enamn));
                        }
                    }
                    else
                    {
                        Page.ModelState.AddModelError(String.Empty, String.Format("Kunden {0} hittades inte", kundid));
                    }                    
                }
                catch(Exception)
                {
                    Page.ModelState.AddModelError(String.Empty, "Något blev fel vid uppdatering av kunden");
                }
            }
        }
    
    //------------------------------------- uthyrning -----------------------------

        public IEnumerable<Uthyrning> KundensUthyrningar_GetData()
        {
            return Service.GetUthyrningarByKundid((int)Kundid);
        }

        public void KundensUthyrningar_UpdateItem(int uthyrningsid)
        {
            if (Page.ModelState.IsValid)
            {
                try
                {
                    var uthyrning = Service.GetUthyrningById(uthyrningsid);
                    if (uthyrning != null)
                    {
                        if (TryUpdateModel(uthyrning))
                        {
                            Service.SaveUthyrning(uthyrning);
                            Response.Redirect(String.Format("~/Pages/Edit.aspx?Edited=Uthyrningsuppgifter"));
                        }
                    }
                    else
                    {
                        Page.ModelState.AddModelError(String.Empty, "Uthyrningstillfället hittades inte!");
                        return;
                    }
                }
                catch (Exception)
                {
                    Page.ModelState.AddModelError(String.Empty, "Det gick inte att uppdatera uthyrningen");
                }
            }
        }

        public void KundensUthyrningar_DeleteItem(int uthyrningsid)
        {
            Service.DeleteUthyrning(uthyrningsid);
        }

        //----------------- kontakttyperna -------------------------------------------------------------

        public IEnumerable<Film> FilmDDList_GetData()
        {
            return Service.GetFilmer();
        }
    }
}