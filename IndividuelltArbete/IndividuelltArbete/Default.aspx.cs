using IndividuelltArbete.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IndividuelltArbete
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var deletedKund = Request.QueryString["Deleted"];

            // om det finns en querystring och den har värdet true, så har en kund tagits bort
            if (deletedKund != null && bool.Parse(deletedKund)) 
            {
                DeletedText.Visible = true;
            }
        }

        public IEnumerable<Kund> FirstPageListView_GetData() // hämta kunderna och visa dem i listviewen
        {
            try
            {                
                var service = new Service();
                return service.GetKunder();
            }
            catch(Exception)
            {
                ModelState.AddModelError(String.Empty, "Det blev ett fel vid hämtning av kunder");
                return null;
            }
        }
    }
}