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

        protected int Kundid { get; set; } // egenskap för querystringvärdet

        protected void Page_Load(object sender, EventArgs e)
        {
            var id = Request.QueryString["Kundid"]; // hämtar querystringen

            if (id != null)
            {
                try
                {
                    Kundid = int.Parse(id); // gör om querystringen till int
                }
                catch
                {
                    throw new Exception("Kunden finns inte i databasen!");
                }
            }
        }

        public Kund EditKunderListView_GetData()
        {
            return Service.GetKundById(Kundid); // Hämtar kunden ur databasen
        }

        public void EditKunderListView_DeleteItem(int kundid)
        {
            try
            {
                Service.DeleteKund(kundid);
            }
            catch
            {
                ModelState.AddModelError(String.Empty, "Något blev fel vid borttagning av kunden");
            }
        }

        public void EditKunderListView_UpdateItem(int kundid) // denna kan förbättras som fan med querystringen istället.. gör senare
        {
            if (ModelState.IsValid)
            {
                try
                {
                    var kund = Service.GetKundById(kundid);
                    if (kund != null)
                    {
                        if (TryUpdateModel(kund)) // sköter valideringen också
                        {
                            Service.SaveKund(kund);
                        }
                    }
                    else
                    {
                        ModelState.AddModelError(String.Empty, String.Format("Kunden {0} hittades inte", kundid));
                    }                    
                }
                catch(Exception)
                {
                    ModelState.AddModelError(String.Empty, "Något blev fel vid uppdatering av kunden");
                }
            }
        }
    
    
    
    //------------------------------------- uthyrning -----------------------------

        public IEnumerable<Uthyrning> KundensUthyrningar_GetData()
        {
            return Service.GetUthyrningarByKundid(Kundid);
        }

        //protected void KundensUthyrningar_InsertItem(Uthyrning uthyrning)
        //{
        //    if (Page.ModelState.IsValid)
        //    {
        //        try
        //        {
        //            uthyrning.Kundid = Kundid;
        //            Service.SaveUthyrning(uthyrning); 
        //        }
        //        catch(Exception)
        //        {
        //            ModelState.AddModelError(String.Empty, "Det gick inte att spara uthyrningen");
        //        }
        //    }
        //}

        public void KundensUthyrningar_UpdateItem(int uthyrningsid)
        {
            try
            {
                var uthyrning = Service.GetUthyrningById(uthyrningsid);
                if (uthyrning != null)
                {
                    if (TryUpdateModel(uthyrning))
                    {
                        Service.SaveUthyrning(uthyrning);
                    }                     
                }
                else
                {
                    ModelState.AddModelError(String.Empty, "Uthyrningstillfället hittades inte!");
                    return;   
                }
            }
            catch(Exception)
            {
                ModelState.AddModelError(String.Empty, "Det gick inte att uppdatera uthyrningen");
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