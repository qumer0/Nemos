using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace nemos
{
    public partial class Layout : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            txt_box1.Attributes.Add("placeholder", "Arama...");
        }

        protected void btn_search_Click(object sender, EventArgs e)
        {
            string searchText = (txt_box1.Text).ToString();
            
            Response.Redirect("arama.aspx?sonuc=" + searchText);
        }
    }
    
}