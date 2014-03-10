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
            var message = Request.QueryString["Message"];

            if (message != null) // om det finns en querystring
            {
                if (bool.Parse(message)) //.. och om den har värdet true, så har en kund tagits bort
                {
                    Messages.Text = "Raderingen lyckades! Kunden har tagits bort";
                }
                else // om false har en session gått ut
                {
                    Messages.Text = "Sessionen har gått ut";
                }

                HomeRightMessage.Visible = true;
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
                Page.ModelState.AddModelError(String.Empty, "Det blev ett fel vid hämtning av kunder");
                return null;
            }
        }
    }
}