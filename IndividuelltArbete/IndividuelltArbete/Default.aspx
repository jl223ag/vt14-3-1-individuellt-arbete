<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Pages/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="IndividuelltArbete._Default" %>

<asp:Content runat="server" ID="FeaturedContent" ContentPlaceHolderID="FeaturedContent">
    <section class="featured">
        <div class="content-wrapper">
            <hgroup class="title">
                <h1>Videohuset</h1>
            </hgroup>
        </div>
    </section>
</asp:Content>
<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    
    <h1>Videohuset startsida</h1>

    <div id="HomeRightMessage" class="close" runat="server" visible="false"> <%-- javascript stängfunktion.. finns i master--%>
        <p id="HomecloseSaveMessage"onclick="remover()">X</p>
        <asp:Label ID="Messages" runat="server" Text=""></asp:Label>
    </div>

    <%-- List View--%>
    <asp:ListView ID="FirstPageListView" runat="server"
        SelectMethod="FirstPageListView_GetData"
        ItemType="IndividuelltArbete.Model.Kund"
        DataKeyNames="Kundid">

        <%-- Layout--%>
        <LayoutTemplate>
            <table>
                <tr>
                    <th>
                        Förnamn
                    </th>
                    <th>
                        Efternamn
                    </th>
                    <th>
                        Adress
                    </th>
                    <th>
                        Postnummer
                    </th>
                    <th>
                        Ort
                    </th>
                </tr>
                <asp:PlaceHolder ID="ItemPlaceHolder" runat="server"></asp:PlaceHolder>
            </table>
        </LayoutTemplate>

        <%-- Item template--%>
        <ItemTemplate>
            <tr>
                <td>
                    <asp:Hyperlink ID="FnamnLabel" runat="server" Text="<%#: Item.Fnamn %>" NavigateUrl='<%#:"~/Pages/Edit.aspx?Kundid=" + Item.Kundid %>'></asp:Hyperlink>
                </td>
                <td>
                    <asp:Label ID="EnamnLabel" runat="server" Text="<%#: Item.Enamn %>"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="AdressLabel" runat="server" Text="<%#: Item.Adress %>"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="PostnrLabel" runat="server" Text="<%#: Item.Postnr %>"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="OrtLabel" runat="server" Text="<%#: Item.Ort %>"></asp:Label>
                </td>
            </tr>
        </ItemTemplate>

        <%-- Inga kunder i databasen--%>
        <EmptyDataTemplate>
            <table>
                <tr>
                    <td>
                        Det finns inga kunder i databasen
                    </td>
                </tr>
            </table>
        </EmptyDataTemplate>
    </asp:ListView>
</asp:Content>
