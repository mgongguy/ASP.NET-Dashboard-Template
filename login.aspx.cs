using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient; //Used for DB Connection
using System.Security.Cryptography; //Used for password hashing
using System.Data;
using System.Configuration;
using System.Web.Security;

public partial class Views_user_signin : System.Web.UI.Page
{ 
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void ValidateUser(object sender, EventArgs e)
    {
        string connString = System.Configuration.ConfigurationManager.ConnectionStrings["mysqlConn"].ConnectionString;
        MySqlConnection conn = new MySqlConnection(connString);
        conn.Open();
        MySqlCommand comm = conn.CreateCommand();
        comm.CommandText = "SELECT userPassword from user where userEmail=@email";
        comm.Parameters.AddWithValue("@email", Login1.UserName);
        MySqlDataReader results = comm.ExecuteReader();
        if (results.HasRows)
        {
            while (results.Read())
            {
                // Password Hashing: https://stackoverflow.com/questions/4181198/how-to-hash-a-password
                string hashedPassword = results.GetString(0);
                byte[] hashBytes = Convert.FromBase64String(hashedPassword);
                byte[] salt = new byte[16];
                Array.Copy(hashBytes, 0, salt, 0, 16);
                var pbkdf2 = new Rfc2898DeriveBytes(Login1.Password, salt, 10000);
                byte[] hash = pbkdf2.GetBytes(20);
                for (int i = 0; i < 20; i++)
                    if (hashBytes[i + 16] == hash[i])
                    {
                        FormsAuthentication.RedirectFromLoginPage(Login1.UserName, Login1.RememberMeSet);
                    }
                    else
                    {
                        BannerAlert.Text = "Error: Incorrect Email or Password";
                    }
            }
        }
        else
        {
            BannerAlert.Text = "Error: Incorrect Email or Password";
        }
    }
}