<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Site.Master" AutoEventWireup="true" CodeBehind="CreateKund.aspx.cs" Inherits="IndividuelltArbete.Pages.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
    <section class="featured">
        <div class="content-wrapper">
            <hgroup class="title">
                <h1>Videohuset</h1>
            </hgroup>
        </div>
    </section>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">

    <h1>Ny kund</h1>

    <asp:Label ID="CreatedText" runat="server" Text="" Visible="false"></asp:Label>

    <asp:PlaceHolder ID="FormDiv" runat="server">

        <div>
            <label for="FnamnBox">Förnamn</label>
            <asp:TextBox ID="FnamnBox" runat="server"></asp:TextBox>
        </div>
        <div>
            <label for="EnamnBox">Efternamn</label>
            <asp:TextBox ID="EnamnBox" runat="server"></asp:TextBox>
        </div>
        <div>
            <label for="AdressBox">Adress</label>
            <asp:TextBox ID="AdressBox" runat="server"></asp:TextBox>
        </div>
        <div>
            <label for="PostnrBox">Postnummer</label>
            <asp:TextBox ID="PostnrBox" runat="server"></asp:TextBox>
        </div>
        <div>
            <label for="OrtBox">Ort</label>
            <asp:TextBox ID="OrtBox" runat="server"></asp:TextBox>
        </div>

    </asp:PlaceHolder>

    <asp:Button ID="SendButton" runat="server" Text="Spara kund" OnClick="SendButton_Click" />
    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Default.aspx">Tillbaka</asp:HyperLink>

</asp:Content>
