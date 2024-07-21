using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using nemos.classes;
using System.Data.SqlClient;



namespace nemos
{
    public partial class etikethaber : Page
    {
        private string connectionString = sql.connectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string etiket = Request.QueryString["etiket"];
                List<Haber> haberListesi = GetHaberListesi(etiket);
                
                rpthaberler.DataSource = haberListesi;
                rpthaberler.DataBind();

            }
        }

        private List<Haber> GetHaberListesi(String etiket)
        {
            List<Haber> haberListesi = new List<Haber>();

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "SELECT * FROM tbl_haberler where etiket=@par";
                SqlCommand command = new SqlCommand(query, connection);
                command.Parameters.AddWithValue("@par", etiket);

                connection.Open();
                SqlDataReader reader = command.ExecuteReader();

                while (reader.Read())
                {
                    Haber haber = new Haber()
                    {
                        Id = reader.GetInt32(0),
                        Baslik = reader.GetString(1),
                        Icerik = reader.GetString(2),
                        ResimUrl = reader.GetString(3),
                        Tarih = reader.GetDateTime(4)
                    };

                    haberListesi.Add(haber);
                }
            }

            return haberListesi;
        }
    }


}
