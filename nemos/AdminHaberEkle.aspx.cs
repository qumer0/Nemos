using System;
using System.Configuration;
using System.Data.SqlClient;
using nemos.classes;

namespace nemos
{
    public partial class AdminHaberEkle : System.Web.UI.Page
    {
        private string connectionString = sql.connectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            // Admin giriş kontrolü
            if (Session["AdminID"] == null)
            {
                Response.Redirect("AdminLogin.aspx");
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            string title = txtTitle.Text;
            string content = txtContent.Text
                .Replace(Environment.NewLine, "<br>"); // Satır sonlarını <br> etiketlerine çevir
                
            string imageUrl = txtImageUrl.Text;
            string category = ddlCategory.SelectedValue;
            
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand("INSERT INTO tbl_haberler (baslik, icerik, resimurl, tarih, etiket) VALUES (@Baslik, @Icerik, @ResimUrl, @Tarih, @Etiket)", con);
                cmd.Parameters.AddWithValue("@Baslik", title);
                cmd.Parameters.AddWithValue("@Icerik", content);
                cmd.Parameters.AddWithValue("@ResimUrl", imageUrl);
                cmd.Parameters.AddWithValue("@Etiket", category);
                cmd.Parameters.AddWithValue("@Tarih", DateTime.Now);

                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();

                lblMessage.Text = "Haber başarıyla eklendi!";
                lblMessage.CssClass = "text-success";
            }
        }
    }
}
