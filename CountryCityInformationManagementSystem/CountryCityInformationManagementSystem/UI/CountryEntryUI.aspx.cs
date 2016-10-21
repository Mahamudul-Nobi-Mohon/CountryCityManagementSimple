using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CountryCityInformationManagementSystem.Classes;
using CountryCityInformationManagementSystem.Database_Link;
using System.Data;

namespace CountryCityInformationManagementSystem.UI
{
    public partial class CountryEntryUI : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
              //  ShowAllData();
                BindGridview();
            }
        }


        protected void cancelButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("IndexUI.aspx");
        }

        protected void saveButton_Click(object sender, EventArgs e)
        {
            using (SqlConnection connection = new SqlConnection(DatabaseConnectionLink.databaseLink))
            {
                connection.Open();
                Country country = new Country(nameTextBox.Text, aboutTextBox.Text);
                string query = "insert into country values ('" + country.Name + "','" + country.About + "');";

                SqlCommand sql = new SqlCommand(query,connection);
                try
                {
                     sql.ExecuteNonQuery();
                    messageLable.Text = "Save Successfully.";
                    //ShowAllData();
                    BindGridview();
                }
                catch (Exception)
                {
                    messageLable.ForeColor = Color.Red;
                    messageLable.Text = "Data not saved.";
                }
               
            }
            
        }

        //public void ShowAllData()
        //{
        //    List<Country> countryList = new List<Country>();

        //    SqlConnection connection = new SqlConnection(DatabaseConnectionLink.databaseLink);
        //    string query = "SELECT * FROM country";
        //    SqlCommand command = new SqlCommand(query, connection);
        //    connection.Open();

        //    SqlDataReader reader = command.ExecuteReader();
        //    if (reader.HasRows)
        //    {
        //        while (reader.Read())
        //        {
        //            Country country = new Country();
        //            country.Name = reader["countryName"].ToString();
        //            country.About = reader["about"].ToString();
        //            countryList.Add(country);
                   
        //        }
        //        reader.Close();
        //    }
        //    connection.Close();
        //    countryListGridView.DataSource = countryList;
        //    countryListGridView.DataBind();
        //}



        protected void BindGridview()
        {
            DataSet ds = new DataSet();
            using (SqlConnection con = new SqlConnection(DatabaseConnectionLink.databaseLink))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("select * from country", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(ds);
                con.Close();
                countryListGridView.DataSource = ds;
                countryListGridView.DataBind();
            }
        }
        protected void gvDetails_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            countryListGridView.PageIndex = e.NewPageIndex;
            BindGridview();
        }


    }
}