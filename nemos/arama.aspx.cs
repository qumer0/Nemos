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
    public partial class arama : Page
    {
        private string connectionString = sql.connectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["sonuc"] != null)
                {
                    
                    string sonuc = Request.QueryString["sonuc"];
                    
                    List<Haber> haberListesi = GetHaberListesi(sonuc);

                    rpthaberler.DataSource = haberListesi;
                    rpthaberler.DataBind();
                }
                else
                {
                    
                }
                

            }
        }

        private List<Haber> GetHaberListesi(String sonuc)
        {
            List<Haber> haberListesi = new List<Haber>();

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "SELECT * FROM tbl_haberler where baslik like '%" +sonuc +  "%'";
                SqlCommand command = new SqlCommand(query, connection);
                

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
