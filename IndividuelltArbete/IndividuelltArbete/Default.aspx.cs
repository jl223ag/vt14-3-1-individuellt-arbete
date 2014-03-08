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

        }

        public IEnumerable<Kund> FirstPageListView_GetData()
        {
            try
            {
                Service service = new Service();
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