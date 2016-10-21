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
    public partial class CItyEntryUI : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                BindGridview();
                DropdownListBind();
            }


           // ShowAllData();
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
                //string countryName = countryDropDownList.SelectedValue.ToString();
                //string countryQuery = "Select * from country where countryName ='" + countryName + "';";
                //SqlCommand sqlCountry = new SqlCommand(countryQuery, connection);
                //SqlDataReader sqlDataReader = sqlCountry.ExecuteReader();
                
                //Country country = new Country(sqlDataReader[0].ToString(), sqlDataReader[1].ToString());

                //CIty cIty = new CIty(nameTextBox.Text, aboutTextBox.Text,
                //    Convert.ToInt32(noOfDwellersTextBox.Text), locationTextBox.Text, weatherTextBox.Text,
                //    country);
                string query = "insert into city values ('" + nameTextBox.Text + "','" + aboutTextBox.Text + "','"
                    + noOfDwellersTextBox.Text+ "','" + locationTextBox.Text + "','" 
                    + weatherTextBox.Text + "','" +countryDropDownList.SelectedValue + "');";
                SqlCommand sql = new SqlCommand(query, connection);
                try
                {
                    sql.ExecuteNonQuery();
                    messageLable.Text = "Save Successfully.";
                    messageLable.ForeColor = Color.Green;
                    BindGridview();
                }
                catch (Exception)
                {
                    messageLable.ForeColor = Color.Red;
                    messageLable.Text = "Data not saved.";
                }

            }
        }


        public void ShowAllData()
        {
            //List<CIty> cityList = new List<CIty>();
            ////SqlConnection connection = new SqlConnection(DatabaseConnectionLink.databaseLink);
            ////string query = "SELECT * FROM city";
            ////SqlCommand command = new SqlCommand(query, connection);
            ////connection.Open();

            ////SqlDataReader reader = command.ExecuteReader();


            ////connection.Open();

            ////string query = "select cityName,noOfDwellers,countryName from city;";

            ////SqlCommand sql = new SqlCommand(query, connection);
            ////SqlCommand sqlCountry = new SqlCommand(query, connection);
            ////SqlDataReader sqlDataReader = sqlCountry.ExecuteReader();
            ////while (sqlDataReader.Read())
            ////{
            ////    countryDropDownList.Items.Add(sqlDataReader[0].ToString());
            ////}

            //using (SqlConnection connection = new SqlConnection(DatabaseConnectionLink.databaseLink))
            //{
            //    int serialNo =1;
            //    connection.Open();

            //    string query = "select cityName,noOfDwellers,countryName from city;";

            //    SqlCommand sql = new SqlCommand(query, connection);
            //    SqlCommand sqlCountry = new SqlCommand(query, connection);
            //    SqlDataReader sqlDataReader = sqlCountry.ExecuteReader();
            //    while (sqlDataReader.Read())
            //    {
            //        countryDropDownList.Items.Add(sqlDataReader[0].ToString());
            //        CIty myCity = new CIty();
            //        myCity.SerialNo = serialNo.ToString();
            //        myCity.Name = sqlDataReader[0].ToString();
            //        myCity.NoOfDwellers = Convert.ToInt32(sqlDataReader[1].ToString());
            //        myCity.Country.Name = sqlDataReader[2].ToString();
            //        cityList.Add(myCity);
                    
            //    }
            //    cityListGridView.DataSource = cityList;
            //cityListGridView.DataBind();
            //}


           // connection.Close();
            
        }

        public void DropdownListBind()
        {
            using (SqlConnection connection = new SqlConnection(DatabaseConnectionLink.databaseLink))
            {
                connection.Open();

                string query = "select countryName from country;";

                SqlCommand sql = new SqlCommand(query, connection);
                SqlCommand sqlCountry = new SqlCommand(query, connection);
                SqlDataReader sqlDataReader = sqlCountry.ExecuteReader();
                while (sqlDataReader.Read())
                {
                    countryDropDownList.Items.Add(sqlDataReader[0].ToString());
                }
            }
        }


        protected void BindGridview()
        {
            DataSet ds = new DataSet();
            using (SqlConnection con = new SqlConnection(DatabaseConnectionLink.databaseLink))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("select * from city", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(ds);
                con.Close();
                cityListGridView.DataSource = ds;
                cityListGridView.DataBind();
            }
        }
        protected void gvDetails_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            cityListGridView.PageIndex = e.NewPageIndex;
            BindGridview();
        }

    }
}