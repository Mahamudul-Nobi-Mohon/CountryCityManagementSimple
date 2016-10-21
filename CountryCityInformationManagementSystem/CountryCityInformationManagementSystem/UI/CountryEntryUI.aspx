<%@ Page Language="C#" ValidateRequest="false" AutoEventWireup="true" CodeBehind="CountryEntryUI.aspx.cs" Inherits="CountryCityInformationManagementSystem.UI.CountryEntryUI" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <script src="//cdn.tinymce.com/4/tinymce.min.js"></script>
  <script>tinymce.init({ selector: 'textarea' });</script>
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
        <asp:Label ID="Label1" runat="server" Text="Name"></asp:Label>
&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="nameTextBox" runat="server" ></asp:TextBox>
        <br />
        <asp:Label ID="Label2" runat="server" Text="About"></asp:Label>
         &nbsp;<asp:TextBox ID="aboutTextBox" TextMode="MultiLine" runat="server"></asp:TextBox>
&nbsp;
        <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="saveButton" runat="server" Text="Save" OnClick="saveButton_Click" />
&nbsp;
        <asp:Button ID="cancelButton" runat="server" OnClick="cancelButton_Click" Text="Cancel" />
        <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="messageLable" runat="server" ForeColor="#009933"></asp:Label>
        <br />
        <br />
        <br />
       
        <div class="GridviewDiv">
            <asp:GridView runat="server" ID="countryListGridView" AllowPaging="true" PageSize="10" AutoGenerateColumns="false" Width="80%" OnPageIndexChanging="gvDetails_PageIndexChanging">
                <HeaderStyle CssClass="headerstyle" />
                <Columns>
                    <asp:TemplateField HeaderText="serial No">
                        <ItemTemplate>
                            <%#Container.DataItemIndex+1 %>
                        </ItemTemplate>
                    </asp:TemplateField>


                    <asp:BoundField DataField="countryName" HeaderText="Country Name" />
                    <asp:BoundField DataField="about" HeaderText="About" />
                     </Columns>
            </asp:GridView>
        </div>
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
    </form>
</body>
</html>
