<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ImportDatabase.aspx.cs" Inherits="AfinanDotNet2._0.Admin.ImportDatabase" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<div style="margin:100px auto 100px auto; width: 600px;">
<asp:Button ID="Importar" style="margin:10px auto 10px auto;" runat="server" Text="Importar" onclick="Importar_Click" /><br />
Registros importados: <asp:Label ID="RegistrosImportados" runat="server" Text="0"></asp:Label>
</div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolderFoot" runat="server">
</asp:Content>
