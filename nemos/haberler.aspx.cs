using System;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using nemos.classes;
namespace nemos
{
    public partial class haberler : System.Web.UI.Page
    {
        private string connectionString = sql.connectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["id"] != null)
                {
                    string haberId = Request.QueryString["id"];
                    FillHaber(haberId);
                }
                else
                {
                    // Handle case when id is not provided
                    Response.Redirect("mainmenu.aspx"); // or any other default page
                }
            }
        }

        private void FillHaber(string haberId)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "SELECT baslik, resimurl, tarih, icerik FROM tbl_haberler WHERE id = @HaberId";
                SqlCommand command = new SqlCommand(query, connection);
                command.Parameters.AddWithValue("@HaberId", haberId);

                connection.Open();
                SqlDataReader reader = command.ExecuteReader();

                if (reader.Read())
                {
                    lblBaslik.InnerText = reader["baslik"].ToString();
                    lblTarih.InnerText = Convert.ToDateTime(reader["tarih"]).ToString("dd MMMM yyyy HH:mm");
                    imgHaber.Attributes["src"] = reader["resimurl"].ToString();
                    lblIcerik.InnerHtml = reader["icerik"].ToString();
                }
                else
                {
                    // Handle case when no data is found for the provided id
                    Response.Redirect("mainmenu.aspx"); // or any other default page
                }
            }
        }
    }
}
