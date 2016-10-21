using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using CountryCityInformationManagementSystem.Classes;
using CountryCityInformationManagementSystem.Database_Link;
using System.Drawing;


namespace CountryCityInformationManagementSystem.UI
{
    public partial class CountryViewUI : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void searchButton_Click(object sender, EventArgs e)
        {
           
            //List<Country> countryList = new List<Country>();

            //SqlConnection connection = new SqlConnection(DatabaseConnectionLink.databaseLink);
            //string query = "SELECT * FROM country";
            //SqlCommand command = new SqlCommand(query, connection);
            //connection.Open();

            //SqlDataReader reader = command.ExecuteReader();
            //if (reader.HasRows)
            //{
            //    while (reader.Read())
            //    {
            //        Country country = new Country();
            //        country.Name = reader["countryName"].ToString();
            //        country.About = reader["about"].ToString();
            //        countryList.Add(country);
                   
            //    }
            //    reader.Close();
            //}
            //connection.Close();
            //countryListGridView.DataSource = countryList;
            //countryListGridView.DataBind();

            BindGridview();
        }


        protected void BindGridview()
        {
            DataSet ds = new DataSet();
            using (SqlConnection con = new SqlConnection(DatabaseConnectionLink.databaseLink))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("select * from country where countryName = '" + countryNameTextBox.Text+ "'", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(ds);
                con.Close();
                countryListGridView.DataSource = ds;
                countryListGridView.DataBind();
                if (countryListGridView.Rows.Count < 1)
                {
                    messageLabel.Text = "Please select a valid Country Name";
                  //  messageLabel.ForeColor = ConsoleColor.Red;
                    messageLabel.ForeColor = Color.Red;
                }
                else
                {
                    messageLabel.Text = string.Empty;
                }
            }
        }
        protected void gvDetails_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            countryListGridView.PageIndex = e.NewPageIndex;
            BindGridview();
        }

    }
}