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

    <%-- Rätt och felmeddelanden --%>
    <asp:Label ID="KundNamn" runat="server" Text=""></asp:Label>
    <div id="RightMessage" runat="server" class="close" visible="false">
        <p id="closeSaveMessage" onclick="remover()">X</p>
        <asp:Label ID="CreatedText" runat="server" Text=""></asp:Label>
    </div>
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ValidationGroup="RentInput" CssClass="red" />


    <%-- Formuläret börjar här --%>
    <asp:PlaceHolder ID="FormDiv" runat="server">

        <div>
            <label for="FilmBox">Film</label>

            <asp:DropDownList ID="FilmBox" runat="server"
                ItemType="IndividuelltArbete.Model.Film"
                SelectMethod="FilmDDList_GetData"
                DataValueField="Filmid"
                DataTextField="Namn">
            </asp:DropDownList>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="En film måste väljas" Display="Dynamic" CssClass="red" Text="*" ValidationGroup="RentInput" ControlToValidate="FilmBox"></asp:RequiredFieldValidator>
        </div>
        
        <div>
            <label for="PrisBox">Pris</label>
            <asp:TextBox ID="PrisBox" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Pris får inte vara tom" Display="Dynamic" CssClass="red" Text="*" ValidationGroup="RentInput" ControlToValidate="PrisBox"></asp:RequiredFieldValidator>
            <asp:RangeValidator ID="RangeValidator2" runat="server" CssClass="red" ErrorMessage="Pris är inte i rätt format eller för litet / stort" Display="Dynamic" Text="*" ValidationGroup="RentInput" ControlToValidate="PrisBox" Type="Currency" MinimumValue="0" MaximumValue="2000"></asp:RangeValidator>
        </div>
        
        <div>
            <label for="StartdatumBox">Startdatum</label>
            <asp:TextBox ID="StartdatumBox" runat="server" placeholder="lämnas tom för dagens datum"></asp:TextBox>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" CssClass="red" runat="server" ErrorMessage="Startdatum är inte i rätt format" Display="Dynamic" Text="*" ValidationGroup="RentInput" ControlToValidate="StartdatumBox" ValidationExpression="^\d{4}[-]{1}\d{2}[-]{1}\d{2}\s{1}\d{2}[:]{1}\d{2}[:]{1}\d{2}$"></asp:RegularExpressionValidator>
        </div>
        
        <div>
            <label for="DagarBox">Antal dagar</label>
            <asp:TextBox ID="DagarBox" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Dagar får inte vara tom" Display="Dynamic" CssClass="red" Text="*" ValidationGroup="RentInput" ControlToValidate="DagarBox"></asp:RequiredFieldValidator>
            <asp:RangeValidator ID="RangeValidator1" runat="server" CssClass="red" ErrorMessage="Fältet dagar är inte i rätt format" Type="Integer" MinimumValue="1" MaximumValue="256" Display="Dynamic" ValidationGroup="RentInput" Text="*" ControlToValidate="DagarBox"></asp:RangeValidator>

        </div>

    </asp:PlaceHolder>

    <asp:Button ID="SendButton" runat="server" Text="Lägg till" OnClick="SendButton_Click" ValidationGroup="RentInput" />
    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Pages/Edit.aspx">Tillbaka</asp:HyperLink>

</asp:Content>
