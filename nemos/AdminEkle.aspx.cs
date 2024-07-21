using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Security.Cryptography;
using System.Text;
using System.Web.UI.WebControls;
using nemos.classes;

namespace nemos
{
    public partial class AdminEkle : System.Web.UI.Page
    {
        private string connectionString = sql.connectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            // Admin giriş kontrolü
            if (Session["AdminID"] == null)
            {
                Response.Redirect("AdminLogin.aspx");
            }

            if (!IsPostBack)
            {
                LoadSecurityQuestions();
            }
        }

        private void LoadSecurityQuestions()
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand("SELECT id, guvenlik_sorusu FROM tbl_sorular", con);
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();

                ddlSecurityQuestion.DataSource = dr;
                ddlSecurityQuestion.DataTextField = "guvenlik_sorusu";
                ddlSecurityQuestion.DataValueField = "id";
                ddlSecurityQuestion.DataBind();

                con.Close();
            }

            ddlSecurityQuestion.Items.Insert(0, new ListItem("-- Güvenlik Sorusu Seçin --", "0"));
        }

        protected void btnSaveAdmin_Click(object sender, EventArgs e)
        {
            string username = txtUsername.Text;
            string password = Shacompute.ComputeSHA256Hash(txtPassword.Text);
            string email = txtEmail.Text;
            int securityQuestionId = Convert.ToInt32(ddlSecurityQuestion.SelectedValue);
            string securityAnswer = txtSecurityAnswer.Text;

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand("INSERT INTO tbl_admin (username, password, mail, guvenlik_sorusu_id, guvenlik_cevap) VALUES (@Username, @Password, @Email, @SecurityQuestionId, @SecurityAnswer)", con);
                cmd.Parameters.AddWithValue("@Username", username);
                cmd.Parameters.AddWithValue("@Password", password);
                cmd.Parameters.AddWithValue("@Email", email);
                cmd.Parameters.AddWithValue("@SecurityQuestionId", securityQuestionId);
                cmd.Parameters.AddWithValue("@SecurityAnswer", securityAnswer);

                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();

                lblMessage.Text = "Yeni admin başarıyla kaydedildi.";
                lblMessage.CssClass = "text-success";
            }
        }

      
    }
}
