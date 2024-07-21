using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Security.Cryptography;
using System.Text;
using nemos.classes;

namespace nemos
{
    public partial class AdminLogin : System.Web.UI.Page
    {
        private string connectionString = sql.connectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string username = txtUsername.Text;
            string password = Shacompute.ComputeSHA256Hash(txtPassword.Text);

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand("SELECT id FROM tbl_admin WHERE username=@Username AND password=@Password", con);
                cmd.Parameters.AddWithValue("@Username", username);
                cmd.Parameters.AddWithValue("@Password", password);
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();

                if (dr.Read())
                {
                    // Giriş başarılı
                    
                    Session["AdminID"] = dr[0];
                    Response.Redirect("AdminHaberEkle.aspx");
                }
                else
                {
                    lblMessage.Text = "Geçersiz kullanıcı adı veya şifre.";
                }
            }
        }

        protected void lnkForgotPassword_Click(object sender, EventArgs e)
        {
            loginPanel.Visible = false;
            forgotPasswordSection.Visible = true;
        }

        protected void txtForgotUsername_TextChanged(object sender, EventArgs e)
        {
            string username = txtForgotUsername.Text;

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand("SELECT guvenlik_sorusu FROM tbl_sorular, tbl_admin WHERE tbl_admin.guvenlik_sorusu_id=tbl_sorular.id AND tbl_admin.username=@Username", con);
                cmd.Parameters.AddWithValue("@Username", username);
                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();

                if (reader.Read())
                {
                    lblSecurityQuestion.Text = reader["guvenlik_sorusu"].ToString();
                }
                else
                {
                    lblForgotMessage.Text = "Kullanıcı adı bulunamadı.";
                }
            }
        }

        protected void btnSubmitAnswer_Click(object sender, EventArgs e)
        {
            string username = txtForgotUsername.Text;
            string securityAnswer = txtSecurityAnswer.Text;

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand("SELECT guvenlik_cevap FROM tbl_sorular, tbl_admin WHERE tbl_admin.guvenlik_sorusu_id=tbl_sorular.id AND tbl_admin.username=@Username", con);
                cmd.Parameters.AddWithValue("@Username", username);
                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();

                if (reader.Read())
                {
                    string correctAnswer = reader["guvenlik_cevap"].ToString();

                    if (securityAnswer.Equals(correctAnswer, StringComparison.OrdinalIgnoreCase))
                    {
                        forgotPasswordSection.Visible = false;
                        resetPasswordSection.Visible = true;
                    }
                    else
                    {
                        lblForgotMessage.Text = "Güvenlik sorusu cevabı yanlış.";
                    }
                }
                else
                {
                    lblForgotMessage.Text = "Kullanıcı adı bulunamadı.";
                }
            }
        }

        protected void btnResetPassword_Click(object sender, EventArgs e)
        {
            string username = txtForgotUsername.Text;
            string newPassword = txtNewPassword.Text;
            string confirmPassword = txtConfirmPassword.Text;

            if (newPassword == confirmPassword)
            {
                string hashedPassword = Shacompute.ComputeSHA256Hash(newPassword);

                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    SqlCommand cmd = new SqlCommand("UPDATE tbl_admin SET password=@Password WHERE username=@Username", con);
                    cmd.Parameters.AddWithValue("@Password", hashedPassword);
                    cmd.Parameters.AddWithValue("@Username", username);
                    con.Open();
                    cmd.ExecuteNonQuery();

                    lblResetMessage.Text = "Şifreniz başarıyla sıfırlandı.";
                    Response.Redirect("AdminLogin.aspx");
                }
            }
            else
            {
                lblResetMessage.Text = "Şifreler uyuşmuyor.";
            }
        }

        protected void btnSubmitGeri_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminLogin.aspx");
        }
    }
}
