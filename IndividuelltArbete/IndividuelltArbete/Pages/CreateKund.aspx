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
    
    <%-- Fel och rättmeddelanden--%>
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" CssClass="red" ValidationGroup="KundInput" />

    <div id="RightMessage" runat="server" visible="false">
        <p id="closeSaveMessage" onclick="remover()">X</p>
        <asp:Label ID="CreatedText" runat="server" Text=""></asp:Label>
    </div>
    
    <%-- Formuläret --%>
    <asp:PlaceHolder ID="FormDiv" runat="server">

        <div>
            <label for="FnamnBox">Förnamn</label>
            <asp:TextBox ID="FnamnBox" runat="server" MaxLength="30"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Förnamn får inte lämnas tom" CssClass="red" Display="Dynamic" Text="*" ValidationGroup="KundInput" ControlToValidate="FnamnBox"></asp:RequiredFieldValidator>
        </div>
        <div>
            <label for="EnamnBox">Efternamn</label>
            <asp:TextBox ID="EnamnBox" runat="server" MaxLength="30"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Efternamn får inte lämnas tom" CssClass="red" Display="Dynamic" Text="*" ValidationGroup="KundInput" ControlToValidate="EnamnBox"></asp:RequiredFieldValidator>
        </div>
        <div>
            <label for="AdressBox">Adress</label>
            <asp:TextBox ID="AdressBox" runat="server" MaxLength="40"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Adress får inte lämnas tom" CssClass="red" Display="Dynamic" Text="*" ValidationGroup="KundInput" ControlToValidate="AdressBox"></asp:RequiredFieldValidator>
        </div>
        <div>
            <label for="PostnrBox">Postnummer</label>
            <asp:TextBox ID="PostnrBox" runat="server" MaxLength="5"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Postnummer får inte lämnas tom" CssClass="red" Display="Dynamic" Text="*" ValidationGroup="KundInput" ControlToValidate="PostnrBox"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Postnummret är i felaktigt format" ValidationExpression="^[0-9]{5}$" CssClass="red" Display="Dynamic" Text="*" ValidationGroup="KundInput" ControlToValidate="PostnrBox"></asp:RegularExpressionValidator>
        </div>
        <div>
            <label for="OrtBox">Ort</label>
            <asp:TextBox ID="OrtBox" runat="server" MaxLength="30"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Ort får inte lämnas tom" CssClass="red" Display="Dynamic" Text="*" ValidationGroup="KundInput" ControlToValidate="OrtBox"></asp:RequiredFieldValidator>
        </div>

    </asp:PlaceHolder>

    <asp:Button ID="SendButton" runat="server" Text="Spara kund" OnClick="SendButton_Click" ValidationGroup="KundInput" />
    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Default.aspx">Tillbaka</asp:HyperLink>

</asp:Content>
