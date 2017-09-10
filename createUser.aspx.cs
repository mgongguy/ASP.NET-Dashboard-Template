using System;
using System.Configuration;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography; //Used for password hashing
using MySql.Data.MySqlClient; //Used for DB Connection
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

public partial class Views_user_create : System.Web.UI.Page
{
    private string email;
    private string password;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!this.Page.User.Identity.IsAuthenticated)
        {
            FormsAuthentication.RedirectToLoginPage();
        }
    }

    protected void Email_TextChanged(object sender, EventArgs e)
    { 
        email = Email.Text;
    }

    protected void Password_TextChanged(object sender, EventArgs e)
    {
       password = HashPassword(Password.Text);
       CreateUser();
    }

    protected string HashPassword(string OriginalPassword)
    {
        byte[] salt;
        new RNGCryptoServiceProvider().GetBytes(salt = new byte[16]);
        var pbkdf2 = new Rfc2898DeriveBytes(OriginalPassword, salt, 10000);
        byte[] hash = pbkdf2.GetBytes(20);
        byte[] hashBytes = new byte[36];
        Array.Copy(salt, 0, hashBytes, 0, 16);
        Array.Copy(hash, 0, hashBytes, 16, 20);

        return Convert.ToBase64String(hashBytes);
    }

    protected int CreateUser()
    {
        if (email != null && password != null)
        {
            string connString = ConfigurationManager.ConnectionStrings["mysqlConn"].ConnectionString;
            MySqlConnection conn = new MySqlConnection(connString);
            conn.Open();
            MySqlCommand comm = conn.CreateCommand();
            comm.CommandText = "INSERT INTO user(userEmail, userPassword) VALUES (@email, @password)";
            comm.Parameters.AddWithValue("@email", email);
            comm.Parameters.AddWithValue("@password", password);
            comm.ExecuteNonQuery();
            conn.Close();
            BannerAlert.Text = "Added";
            return 1;
        }
        else
        {
            BannerAlert.Text = "Error: No Password or Email";
            return 2;
        }
    }
}