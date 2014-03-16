<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Site.Master" AutoEventWireup="true" CodeBehind="theError.aspx.cs" Inherits="IndividuelltArbete.Pages.WebForm4" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">

    <h1>Felmeddelande</h1>
    <div>
        <p id="ErrorCode">Error! Något gick snett</p>
        <asp:HyperLink ID="HyperLink1" NavigateUrl="~/Default.aspx" runat="server">Tillbaka till startsidan!</asp:HyperLink>
    </div>

</asp:Content>
