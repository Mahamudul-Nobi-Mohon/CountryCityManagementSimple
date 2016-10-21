<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CityVIewUI.aspx.cs" Inherits="CountryCityInformationManagementSystem.UI.CityVIewUI" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .GridviewDiv {
            font-size: 100%;
            font-family: 'Lucida Grande', 'Lucida Sans Unicode', Verdana, Arial, Helevetica, sans-serif;
            color: #303933;
        }

        .headerstyle {
            color: #FFFFFF;
            border-right-color: #abb079;
            border-bottom-color: #abb079;
            background-color: #df5015;
            padding: 0.5em 0.5em 0.5em 0.5em;
            text-align: center;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:RadioButton ID="cityNameRadioButton" runat="server" Text="City Name" Checked="True" GroupName="oneChoice" />
&nbsp;&nbsp;
        <asp:TextBox ID="cityNameTextBox" runat="server"></asp:TextBox>
        <br />
        <asp:RadioButton ID="countryRadioButton" runat="server" Text="Country" GroupName="oneChoice" />
&nbsp;
        <asp:DropDownList ID="countryDropDownList" runat="server">
            <asp:ListItem Text="--Select Country--" Value="" />
        </asp:DropDownList>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="searchButton" runat="server" Text="Search" OnClick="searchButton_Click" />
        <br />
        <br />
        <div class="GridviewDiv">
            <asp:GridView runat="server" ID="cityListGridView" AllowPaging="true" PageSize="10" AutoGenerateColumns="false" Width="80%" OnPageIndexChanging="gvDetails_PageIndexChanging">
                <HeaderStyle CssClass="headerstyle" />
                <Columns>
                    <asp:TemplateField HeaderText="serial No">
                        <ItemTemplate>
                            <%#Container.DataItemIndex+1 %>
                        </ItemTemplate>
                    </asp:TemplateField>


                    <asp:BoundField DataField="cityName" HeaderText="City Name" />
                    <asp:BoundField DataField="about" HeaderText="About" />
                    <asp:BoundField DataField="noOfDwellers" HeaderText="No Of Dwellers" />
                   
                    <asp:BoundField DataField="location" HeaderText="Location" />
                    <asp:BoundField DataField="weather" HeaderText="Weather" />
                     <asp:BoundField DataField="countryName" HeaderText="Country" />
                    <asp:BoundField DataField="about" HeaderText="About Country" />
                </Columns>
            </asp:GridView>
        </div>
    
    </div>
    </form>
</body>
</html>
