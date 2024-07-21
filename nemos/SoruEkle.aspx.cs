using System;
using System.Configuration;
using System.Data.SqlClient;
using nemos.classes;

namespace nemos
{
    public partial class SoruEkle : System.Web.UI.Page
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

        protected void btnSaveQuestion_Click(object sender, EventArgs e)
        {
            string question = txtQuestion.Text;

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand("INSERT INTO tbl_sorular (guvenlik_sorusu) VALUES (@Question)", con);
                cmd.Parameters.AddWithValue("@Question", question);

                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();

                lblMessage.Text = "Yeni güvenlik sorusu başarıyla kaydedildi.";
                lblMessage.CssClass = "text-success";
            }
        }
    }
}
