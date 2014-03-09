<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Site.Master" AutoEventWireup="true" CodeBehind="Edit.aspx.cs" Inherits="IndividuelltArbete.Pages.WebForm1" %>
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
    <h1>Redigera kund</h1>

    <asp:Label ID="ErrorText" runat="server" Text="" Visible="false"></asp:Label>
    <asp:Label ID="SuccessText" runat="server" Text="" Visible="false"></asp:Label>


    <%-- Listview för Kund---------------------------------------------------------%>
    <div id="EditKund">
        <asp:ListView ID="EditKunderListView" runat="server"
            SelectMethod="EditKunderListView_GetData"
            ItemType="IndividuelltArbete.Model.Kund"
            DataKeyNames="Kundid"
            UpdateMethod="EditKunderListView_UpdateItem"
            DeleteMethod="EditKunderListView_DeleteItem">

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
                        <th>

                        </th>
                    </tr>
                    <asp:PlaceHolder ID="ItemPlaceHolder" runat="server"></asp:PlaceHolder>
                </table>

            </LayoutTemplate>

            <%-- Item template--%>

            <ItemTemplate>
            
                <tr>
                    <td>
                        <asp:Label ID="FnamnLabel" runat="server" Text="<%#: Item.Fnamn %>"></asp:Label>
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
                    <td class="command">
                        <asp:LinkButton runat="server" CommandName="Delete" Text="Ta bort" CausesValidation="false"></asp:LinkButton>
                        <asp:LinkButton runat="server" CommandName="Edit" Text="Redigera" CausesValidation="false"></asp:LinkButton>
                    </td>
                </tr>
            </ItemTemplate>

            <%-- Edit kund--%>

            <EditItemTemplate>
                <tr>
                    <td>
                        <asp:TextBox ID="FnamnBox" runat="server" Text="<%#: BindItem.Fnamn %>"></asp:TextBox>

                    </td>
                    <td>
                        <asp:TextBox ID="EnamnBox" runat="server" Text="<%#: BindItem.Enamn %>"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="AdressBox" runat="server" Text="<%#: BindItem.Adress %>"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="PostnrBox" runat="server" Text="<%#: BindItem.Postnr %>"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="OrtBox" runat="server" Text="<%#: BindItem.Ort %>"></asp:TextBox>
                    </td>
                    <td>
                        <asp:LinkButton runat="server" CommandName="Update" Text="Spara" ValidationGroup="EditGroup"></asp:LinkButton>
                        <asp:LinkButton runat="server" CommandName="Cancel" Text="Avbryt" CausesValidation="False" ValidationGroup="EditGroup"></asp:LinkButton>
                    </td>
                </tr>
            </EditItemTemplate>

            <%-- Empty data--%>

            <EmptyDataTemplate>
                <table>
                    <tr>
                        <td>
                            Kunduppgifter finns ej
                        </td>
                    </tr>
                </table>
            </EmptyDataTemplate>
        </asp:ListView>
    </div>

    <%-- Listview för Uthyrningar---------------------------------------------------------------------------%>

    <div id="EditUthyrning">
        <asp:ListView ID="KundensUthyrningar" runat="server"
            SelectMethod="KundensUthyrningar_GetData"
            ItemType="IndividuelltArbete.Model.Uthyrning"
            DataKeyNames="Uthyrningsid"
            UpdateMethod="KundensUthyrningar_UpdateItem"
            DeleteMethod="KundensUthyrningar_DeleteItem">

            <LayoutTemplate>

                <table>
                    <tr>
                        <th>
                            Film
                        </th>
                        <th>
                            Pris
                        </th>
                        <th>
                            Startdatum
                        </th>
                        <th>
                            Dagar
                        </th>
                        <th>
                            Slutdatum
                        </th>
                    </tr>
                    <asp:PlaceHolder ID="ItemPlaceHolder" runat="server"></asp:PlaceHolder>
                </table>

            </LayoutTemplate>

            <%-- Item template--%>

            <ItemTemplate>

                <tr>
                    <%--<td>
                        <asp:Label ID="NummerLabel" runat="server" Text="<%#: Item.Filmid %>"></asp:Label>
                    </td>--%>
                    <td>
                        <asp:DropDownList ID="FilmLabel" runat="server"
                            ItemType="IndividuelltArbete.Model.Film"
                            SelectMethod="FilmDDList_GetData"
                            DataTextField="Namn"
                            DataValueField="Filmid"
                            SelectedValue="<%# Item.Filmid %>"
                            Enabled="false"></asp:DropDownList>     
                    </td>
                    <td>
                        <asp:Label ID="KontakttypLabel" runat="server" Text="<%#: Item.Pris %>"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="StartLabel" runat="server" Text="<%#: Item.Startdatum %>"></asp:Label>                        
                    </td>
                    <td>
                        <asp:Label ID="DagarLabel" runat="server" Text="<%#: Item.Dagar %>"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="SlutLabel" runat="server" Text="<%#: Item.Slutdatum %>"></asp:Label>
                    </td>
                    <td class="command">
                        <asp:LinkButton runat="server" CommandName="Delete" Text="Ta bort" CausesValidation="false"></asp:LinkButton>
                        <asp:LinkButton runat="server" CommandName="Edit" Text="Redigera" CausesValidation="false"></asp:LinkButton>
                    </td>
                </tr>
            </ItemTemplate>

            <%-- Edit uthyrning --%>

            <EditItemTemplate>
                <tr>
                    <td>
                        <asp:DropDownList ID="InsertKontakttypDDList" runat="server"
                            ItemType="IndividuelltArbete.Model.Film"
                            SelectMethod="FilmDDList_GetData"
                            DataTextField="Namn"
                            DataValueField="Filmid"
                            SelectedValue="<%# BindItem.Filmid %>"></asp:DropDownList>
                    </td>
                    <td>
                        <asp:TextBox ID="PrisBox" runat="server" Text="<%#: BindItem.Pris %>"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="StartBox" runat="server" Text="<%#: BindItem.Startdatum %>"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="DagarBox" runat="server" Text="<%#: BindItem.Dagar %>"></asp:TextBox>
                    </td>
                    <td>
                        <asp:Label ID="SlutBox" runat="server" Text="<%#: Item.Slutdatum %>"></asp:Label>
                    </td>
                    <td>
                        <asp:LinkButton runat="server" CommandName="Update" Text="Spara" ValidationGroup="EditGroup"></asp:LinkButton>
                        <asp:LinkButton runat="server" CommandName="Cancel" Text="Avbryt" CausesValidation="False" ValidationGroup="EditGroup"></asp:LinkButton>
                    </td>
                </tr>
            </EditItemTemplate>

            <%-- Empty data--%>

            <EmptyDataTemplate>
                <table>
                    <tr>
                        <td>
                            Kunden har inte hyrt några filmer
                        </td>
                    </tr>
                </table>
            </EmptyDataTemplate>
        </asp:ListView>

        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Pages/CreateUthyrning.aspx">Ny Uthyrning</asp:HyperLink>
        <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/Default.aspx">Tillbaka</asp:HyperLink>

    </div>

</asp:Content>
