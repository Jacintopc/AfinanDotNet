<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EditaNautica.aspx.cs" Inherits="AfinanDotNet2._0.Admin.EditaNautica" %>
<asp:Content ID="HeadEditaNautica" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="ContentEditaNautica" ContentPlaceHolderID="MainContent" runat="server">
    
    <div style="clear:both; height :20px;"></div>
    <div id="TablaDetalle" style="margin:auto; width:500px; border: 2px bold blue; ">
        <table id="TableDatosNautica"  style="width: 100%; height: 20px; color: Navy;  border:1px solid #E7E7FF; ">
            <tr style="width: 30%; font-weight:bold; background:Navy; font-weight:bold; color:White; text-align:center; height:25px;">
                <td colspan="2" >NAUTICA</td>
            </tr>
            <tr style="background-color:#F7F7F7; color: #284775; height:25px;">
                <td style="width: 30%; font-weight:bold;  text-align: right; padding-right: 5px; ">Código </td>
                <td style="width: 70%; font-weight:bold; color:Black; padding-left:5px; "><asp:Label ID="IDNautica" runat="server"></asp:Label></td>    
            </tr>
            <tr style="background-color:#E7E7FF; color: #284775;height:25px;">
                <td style="width: 30%; font-weight:bold; text-align: right; padding-right: 5px;">Activo </td>
                <td style="width: 70%; padding-left:5px; "><asp:CheckBox ID="IsApproved" runat="server" /></td>    
            </tr>
            <tr style="background-color:#F7F7F7; color: #284775;height:25px;">
                <td style="width: 30%; font-weight:bold; text-align: right; padding-right: 5px; ">Empresa </td>
                <td style="width: 70%; padding-left:5px; "><asp:TextBox ID="Empresa" style="width:250px;" runat="server"></asp:TextBox></td>    
            </tr>
            <tr style="background-color:#E7E7FF ; color: #284775; height:25px; ">
                <td style="width: 30%; font-weight:bold; text-align: right; padding-right: 5px; ">Vendedor </td>
                <td style="width: 70%; padding-left:5px;  "><asp:TextBox ID="Vendedor" style="width:250px;" runat="server"></asp:TextBox></td>    
            </tr>
            <tr style="background-color:#F7F7F7; color: #284775;height:25px; ">
                <td style="width: 30%; font-weight:bold; text-align: right; padding-right: 5px; ">Correo electrónico </td>
                <td style="width: 70%;padding-left:5px;  "><asp:TextBox ID="EMail" style="width:250px;" runat="server"></asp:TextBox></td>    
            </tr>
            <tr style="background-color:#E7E7FF ; color: #284775;height:25px; ">
                <td style="width: 30%; font-weight:bold; text-align: right; padding-right: 5px; ">Móvil </td>
                <td style="width: 70%;padding-left:5px;  "><asp:TextBox ID="Movil" style="width:250px;" runat="server"></asp:TextBox></td>    
            </tr>
            <tr style="background-color:#F7F7F7; color: #284775;height:25px; ">
                <td style="width: 30%; font-weight:bold; text-align: right; padding-right: 5px; ">Fax </td>
                <td style="width: 70%; padding-left:5px; "><asp:TextBox ID="Fax" style="width:250px;" runat="server"></asp:TextBox></td>    
            </tr>
            <tr style="background-color:#E7E7FF ; color: #284775;height:25px; ">
                <td style="width: 30%; font-weight:bold; text-align: right; padding-right: 5px; ">Usuario </td>
                <td style="width: 70%; padding-left:5px; "><asp:TextBox ID="Usuario" style="width:250px;" runat="server"></asp:TextBox></td>    
            </tr>
            <tr style="background-color:#F7F7F7; color: #284775;height:25px; ">
                <td style="width: 30%; font-weight:bold; text-align: right; padding-right: 5px;">Contraseña </td>
                <td style="width: 70%;padding-left:5px;  "><asp:TextBox ID="Contrasena" style="width:250px;" runat="server" TextMode="SingleLine"></asp:TextBox></td>    
            </tr>
            <tr style="background-color:#E7E7FF ; color: #284775;height:25px; ">
                <td style="width: 30%; font-weight:bold; text-align: right;  padding-right: 5px;">Rol </td>
                <td style="width: 70%;padding-left:5px;  "><asp:DropDownList ID="Rol" Width="150px" runat="server">
                    <asp:ListItem>Usuario</asp:ListItem>
                    <asp:ListItem>Admin</asp:ListItem>
                    </asp:DropDownList></td>    
            </tr>
            <tr style="background-color:#F7F7F7; color: #284775;height:25px; ">
                <td style="width: 30%; font-weight:bold; text-align: right; padding-right: 5px; ">Comentarios </td>
                <td style="width: 70%; padding-left:5px;  "><asp:TextBox ID="Comentarios" style="width:340px;  height:80px; " runat="server" Rows="3" 
                        TextMode="MultiLine"></asp:TextBox></td>    
            </tr>
            <tr style="background-color:#E7E7FF ; color: #284775;height:25px; ">
                <td style="width: 30%; font-weight:bold; text-align: right; padding-right: 5px; ">Fecha alta</td>
                <td style="width: 70%; padding-left:5px;  font-weight:bold;color:Black; "><asp:Label ID="FechaAlta" runat="server"></asp:Label></td>    
            </tr>
            <tr style="background-color:#F7F7F7; color: #284775;height:25px; " >
                <td style="width: 30%; font-weight:bold; text-align: right;  padding-right: 5px;">Última conexión</td>
                <td style="width: 70%; padding-left:5px;  font-weight:bold;color:Black;  "><asp:Label ID="UltimaConexion" runat="server"></asp:Label></td>    
            </tr>
        </table>
    </div>
    <div style="clear:both; height:20px;"></div>
    <div style="width:230px; margin: 10px auto 10px auto; ">
        <asp:Button ID="Guardar" style="width:100px; "  runat="server" Text="Guardar" cssclass="botom_menu" OnClick="GuardarNautica" />
        <asp:Button ID="Cancelar" style="width:100px; margin-left:5px; " runat="server" cssclass="botom_menu" Text="Cancelar"  OnClick="CancelarEdicion" />
    </div>
    <div style="clear:both; height:20px;"></div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolderFoot" runat="server">
</asp:Content>
