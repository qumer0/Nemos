using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using nemos.classes;

namespace nemos
{
    public partial class AdminDuzenle : System.Web.UI.Page
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
                BindGridView();
            }
        }

        private void BindGridView()
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand("SELECT id, baslik, etiket, icerik, resimurl FROM tbl_haberler", con);
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                gvHaberler.DataSource = dr;
                gvHaberler.DataBind();
                con.Close();
            }
        }

        protected void gvHaberler_RowEditing(object sender, GridViewEditEventArgs e)
        {
            // Seçilen haberi getir ve form alanlarını doldur
            int id = Convert.ToInt32(gvHaberler.DataKeys[e.NewEditIndex].Value);

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand("SELECT baslik, etiket, icerik, resimurl FROM tbl_haberler WHERE id=@Id", con);
                cmd.Parameters.AddWithValue("@Id", id);
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();

                if (dr.Read())
                {
                    hfHaberId.Value = id.ToString();
                    txtTitle.Text = dr["baslik"].ToString();
                    txtContent.Text = dr["icerik"].ToString();
                    txtImageUrl.Text = dr["resimurl"].ToString();
                    ddlCategory.SelectedValue = dr["etiket"].ToString();
                }

                con.Close();
            }

            // Formu görünür yap
            editForm.Visible = true;

            // Sayfanın form alanına kaymasını sağla
            litScrollScript.Text = "<script type='text/javascript'>scrollToForm();</script>";
        }

        protected void btnUpdateHaber_Click(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(hfHaberId.Value);
            string title = txtTitle.Text;
            string content = txtContent.Text;
            string imageUrl = txtImageUrl.Text;
            string category = ddlCategory.SelectedValue;

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand("UPDATE tbl_haberler SET baslik=@Baslik, icerik=@Icerik, resimurl=@ResimUrl, etiket=@Kategori WHERE id=@Id", con);
                cmd.Parameters.AddWithValue("@Baslik", title);
                cmd.Parameters.AddWithValue("@Icerik", content);
                cmd.Parameters.AddWithValue("@ResimUrl", imageUrl);
                cmd.Parameters.AddWithValue("@Kategori", category);
                cmd.Parameters.AddWithValue("@Id", id);
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();

                lblMessage.Text = "Haber başarıyla güncellendi!";
                lblMessage.CssClass = "text-success";
                BindGridView();

                // Formu tekrar gizle
                editForm.Visible = false;
            }
        }
    }
}
