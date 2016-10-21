<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="IndexUI.aspx.cs" Inherits="CountryCityInformationManagementSystem.UI.IndexUI" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:LinkButton ID="countryEntryLinkButton" runat="server" OnClick="countryEntryLinkButton_Click">Country Entry</asp:LinkButton>
        <br />
        <asp:LinkButton ID="countryViewLinkButton" runat="server" OnClick="countryViewLinkButton_Click">Country View</asp:LinkButton>
        <br />
        <asp:LinkButton ID="cityEntryLinkButton" runat="server" OnClick="cityEntryLinkButton_Click">City Entry</asp:LinkButton>
        <br />
        <asp:LinkButton ID="cityViewLinkButton" runat="server" OnClick="cityViewLinkButton_Click">City View</asp:LinkButton>
    
    </div>
    </form>
</body>
</html>
