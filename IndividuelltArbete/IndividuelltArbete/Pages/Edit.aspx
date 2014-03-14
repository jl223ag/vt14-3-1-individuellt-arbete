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

    <%-- Fel och rättmeddelanden --%>

    <asp:Label ID="ErrorText" runat="server" Text="" Visible="false" CssClass="red"></asp:Label>
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ValidationGroup="EditKunden" CssClass="red" />
    <asp:ValidationSummary ID="ValidationSummary2" runat="server" ValidationGroup="EditUthyrningen" CssClass="red" />
    
    <div id="RightMessage" runat="server" class="close" visible="false">
        <p id="closeSaveMessage" onclick="remover()">X</p>
        <asp:Label ID="SuccessText" runat="server" Text=""></asp:Label>
    </div>


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
                        <asp:Label ID="FnamnLabel" runat="server" Text="<%# Item.Fnamn %>"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="EnamnLabel" runat="server" Text="<%# Item.Enamn %>"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="AdressLabel" runat="server" Text="<%# Item.Adress %>"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="PostnrLabel" runat="server" Text="<%# Item.Postnr %>"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="OrtLabel" runat="server" Text="<%# Item.Ort %>"></asp:Label>
                    </td>
                    <td class="command">
                        <asp:LinkButton runat="server" CommandName="Delete" Text="Ta bort kund" OnClientClick='<%# String.Format("return confirm(\"Ta bort {0} {1}?\")", Item.Fnamn, Item.Enamn) %>' CausesValidation="false"></asp:LinkButton>
                        <asp:LinkButton runat="server" CommandName="Edit" Text="Redigera kund" CausesValidation="false"></asp:LinkButton>
                    </td>
                </tr>
            </ItemTemplate>

            <%-- Edit kund--%>

            <EditItemTemplate>
                <tr>
                    <td>
                        <asp:TextBox ID="FnamnBox" runat="server" Text="<%# BindItem.Fnamn %>" MaxLength="30"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" CssClass="red" ErrorMessage="Förnamn får inte vara tom" ControlToValidate="FnamnBox" Display="Dynamic" Text="*" ValidationGroup="EditKunden"></asp:RequiredFieldValidator>
                    </td>
                    <td>
                        <asp:TextBox ID="EnamnBox" runat="server" Text="<%# BindItem.Enamn %>" MaxLength="30"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" CssClass="red" ErrorMessage="Efternamn får inte vara tom" Display="Dynamic" Text="*" ControlToValidate="EnamnBox" ValidationGroup="EditKunden"></asp:RequiredFieldValidator>
                    </td>
                    <td>
                        <asp:TextBox ID="AdressBox" runat="server" Text="<%# BindItem.Adress %>" MaxLength="40"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" CssClass="red" ErrorMessage="Adress får inte vara tom" Display="Dynamic" Text="*" ControlToValidate="AdressBox" ValidationGroup="EditKunden"></asp:RequiredFieldValidator>
                    </td>
                    <td>
                        <asp:TextBox ID="PostnrBox" runat="server" Text="<%# BindItem.Postnr %>" MaxLength="5"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" CssClass="red" ErrorMessage="Postnummer får inte vara tom" Display="Dynamic" Text="*" ControlToValidate="PostnrBox" ValidationGroup="EditKunden"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Postnummret är i felaktigt format" ValidationExpression="^[0-9]{5}$" CssClass="red" Display="Dynamic" Text="*" ValidationGroup="EditKunden" ControlToValidate="PostnrBox"></asp:RegularExpressionValidator>

                    </td>
                    <td>
                        <asp:TextBox ID="OrtBox" runat="server" Text="<%# BindItem.Ort %>" MaxLength="30"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" CssClass="red" ErrorMessage="Ort får inte vara tom" Display="Dynamic" Text="*" ControlToValidate="OrtBox" ValidationGroup="EditKunden"></asp:RequiredFieldValidator>
                    </td>
                    <td>
                        <asp:LinkButton runat="server" CommandName="Update" Text="Spara" ValidationGroup="EditKunden"></asp:LinkButton>
                        <asp:LinkButton runat="server" CommandName="Cancel" Text="Avbryt" CausesValidation="False"></asp:LinkButton>
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
    <hr />

    <div id="EditUthyrning">
        <asp:ListView ID="KundensUthyrningar" runat="server"
            SelectMethod="KundensUthyrningar_GetData"
            ItemType="IndividuelltArbete.Model.Uthyrning"
            DataKeyNames="Uthyrningsid"
            UpdateMethod="KundensUthyrningar_UpdateItem"
            DeleteMethod="KundensUthyrningar_DeleteItem"
            OnItemDataBound="KundensUthyrningar_ItemDataBound">
            <LayoutTemplate>

                <table>
                    <tr>
                        <th>
                            Film
                        </th>
                        <th>
                            Kategori
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
                    <td>
                        <asp:Label ID="FilmNamnLabel" runat="server" Text="" />
                    </td>
                    <td>
                        <asp:Label ID="KategoriLabel" runat="server" Text="" />
                    </td>                                           
                    <td>
                        <asp:Label ID="PrisLabel" runat="server" Text="<%# Item.Pris %>"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="StartLabel" runat="server" Text="<%# Item.Startdatum %>"></asp:Label>                   
                    </td>
                    <td>
                        <asp:Label ID="DagarLabel" runat="server" Text="<%# Item.Dagar %>"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="SlutLabel" runat="server" Text="<%# Item.Slutdatum %>"></asp:Label>
                    </td>
                    <td class="command">
                        <asp:LinkButton runat="server" CommandName="Delete" Text="Ta bort" OnClientClick='<%# String.Format("return confirm(\"Ta bort uthyrningen från: {0}?\")", Item.Startdatum) %>' CausesValidation="false"></asp:LinkButton>
                        <asp:LinkButton runat="server" CommandName="Edit" Text="Redigera" CausesValidation="false"></asp:LinkButton>
                    </td>
                </tr>
            </ItemTemplate>

            <%-- Edit uthyrning --%>

            <EditItemTemplate>
                <tr>
                    <td>
                        <asp:DropDownList ID="InsertUthyrningDDList" runat="server"
                            ItemType="IndividuelltArbete.Model.Film"
                            SelectMethod="FilmDDList_GetData"
                            DataTextField="Namn"
                            DataValueField="Filmid"
                            SelectedValue="<%# BindItem.Filmid %>"></asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" CssClass="red" runat="server" ErrorMessage="En film måste vara vald" Display="Dynamic" Text="*" ValidationGroup="EditUthyrningen" ControlToValidate="InsertUthyrningDDList"></asp:RequiredFieldValidator>
                    </td>
                    <td>
                        Väljs automatiskt <%-- filmkategorin --%>
                    </td>
                    <td>
                        <asp:TextBox ID="PrisBox" runat="server" Text="<%# BindItem.Pris %>"></asp:TextBox>
                        <asp:RangeValidator ID="RangeValidator2" runat="server" CssClass="red" ErrorMessage="Pris är inte i rätt format eller för litet / stort" Display="Dynamic" Text="*" ValidationGroup="EditUthyrningen" ControlToValidate="PrisBox" Type="Currency" MinimumValue="0" MaximumValue="2000"></asp:RangeValidator>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" CssClass="red" runat="server" ErrorMessage="Pris får inte vara tom" Display="Dynamic" Text="*" ValidationGroup="EditUthyrningen" ControlToValidate="PrisBox"></asp:RequiredFieldValidator>
                    </td>
                    <td>
                        <asp:TextBox ID="StartBox" runat="server" Text="<%# BindItem.Startdatum %>"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" CssClass="red" runat="server" ErrorMessage="Startdatum är i fel format" Display="Dynamic" Text="*" ValidationGroup="EditUthyrningen" ControlToValidate="StartBox" ValidationExpression="^\d{4}[-]{1}\d{2}[-]{1}\d{2}\s{1}\d{2}[:]{1}\d{2}[:]{1}\d{2}$"></asp:RegularExpressionValidator>
                    </td>
                    <td>
                        <asp:TextBox ID="DagarBox" runat="server" Text="<%# BindItem.Dagar %>"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" CssClass="red" runat="server" ErrorMessage="Antal dagar får inte vara tom" Display="Dynamic" Text="*" ValidationGroup="EditUthyrningen" ControlToValidate="DagarBox"></asp:RequiredFieldValidator>
                        <asp:RangeValidator ID="RangeValidator1" runat="server" CssClass="red" ErrorMessage="Fältet dagar är inte i rätt format" Type="Integer" MinimumValue="1" MaximumValue="256" Display="Dynamic" ValidationGroup="EditUthyrningen" Text="*" ControlToValidate="DagarBox"></asp:RangeValidator>
                    </td>
                    <td>
                        <asp:Label ID="SlutBox" runat="server" Text="<%# Item.Slutdatum %>"></asp:Label> <%-- Går inte att påverka --%>
                    </td>
                    <td>
                        <asp:LinkButton runat="server" CommandName="Update" Text="Spara" ValidationGroup="EditUthyrningen"></asp:LinkButton>
                        <asp:LinkButton runat="server" CommandName="Cancel" Text="Avbryt" CausesValidation="False"></asp:LinkButton>
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
