<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Site.Master" AutoEventWireup="true" CodeBehind="CreateUthyrning.aspx.cs" Inherits="IndividuelltArbete.Pages.WebForm3" %>
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

    <h1>Lägg till ny uthyrning</h1>

    <asp:Label ID="KundNamn" runat="server" Text=""></asp:Label>
    <asp:Label ID="CreatedText" runat="server" Text="" Visible="false"></asp:Label>

    <asp:PlaceHolder ID="FormDiv" runat="server">

        <div>
            <label for="FilmBox">Film</label>

            <asp:DropDownList ID="FilmBox" runat="server"
                ItemType="IndividuelltArbete.Model.Film"
                SelectMethod="FilmDDList_GetData"
                DataValueField="Filmid"
                DataTextField="Namn">
            </asp:DropDownList>
        </div>
        <div>
            <label for="PrisBox">Pris</label>
            <asp:TextBox ID="PrisBox" runat="server"></asp:TextBox>
        </div>
        <div>
            <label for="StartdatumBox">Startdatum</label>
            <asp:TextBox ID="StartdatumBox" runat="server" placeholder="2014-01-01 00:00:00"></asp:TextBox>
        </div>
        <div>
            <label for="DagarBox">Antal dagar</label>
            <asp:TextBox ID="DagarBox" runat="server"></asp:TextBox>
        </div>

    </asp:PlaceHolder>

    <asp:Button ID="SendButton" runat="server" Text="Spara kund" OnClick="SendButton_Click" />
    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Pages/Edit.aspx">Tillbaka</asp:HyperLink>

</asp:Content>
