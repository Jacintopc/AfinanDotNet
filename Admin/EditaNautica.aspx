<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EditaNautica.aspx.cs" Inherits="AfinanDotNet2._0.Admin.EditaNautica" %>
<asp:Content ID="HeadEditaNautica" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="ContentEditaNautica" ContentPlaceHolderID="MainContent" runat="server">
    
     <script type="text/javascript" language="javascript">

            function ClearTextboxes(objname, waterMarkText) {
                var obj = document.getElementById(objname);
                if (obj.value == waterMarkText) {
                    obj.value = '';
                }
                obj.style.color = 'navy';
                obj.style.fontWeight = 'bold';
                obj.style.background = '#ddFFFF';
                return true;
            }

            function BlurTextboxes(objname, waterMarkText) {
                var obj = document.getElementById(objname);
                if (obj.value == "") {
                    obj.value = waterMarkText;
                }
                obj.style.color = 'black';
                obj.style.fontWeight = 'normal';
                obj.style.background = 'white';
                return true;
            }

    </script>
    <div style="clear:both; height :20px;"></div>
        <div id="divDeleteInfo" style="position:absolute;  top:410px; left:50%; Width:350px; height:50px; 
        margin-left: -175px; border: 2px solid red; vertical-align:middle; background-color:#E7E7FF;" runat="server" visible="false" >
        <asp:Label id="EditMSG" Style="margin:15px 10px auto 30px; " Text="El registro [X] ha sido borrado." ForeColor="Red" Runat="Server" EnableViewState="True" />
        <asp:Button ID="OkButton" style="margin:15px  10px auto 30px;" Text="OK" OnClick="Confirm_Deleted" Runat="Server" Font-Size="7pt" Height="17px" Width="50px"/>
        </div>
        <div id="divConfirmDelete" style="position: absolute; top:410px; left:50% ; width:550px; height:50px;
           margin-left:-275px; border: 2px solid red;  vertical-align:middle; background-color:#E7E7FF;" runat="server" visible="false" >
        <asp:Panel id="ConfirmDelete" EnableViewState="False" Runat="Server" style="vertical-align:middle; " >
            <asp:Label ID="questionlabel" style="float:left; margin:15px 10px auto 30px;" Text="¿Eliminar este registro? " ForeColor="Red" Runat="Server"/>
            <asp:Button ID="yesbutton" style="float:left; margin:15px  10px auto 30px;" Text="Si" OnClick="Delete_Record" Runat="Server" Font-Size="7pt" Height="17px" Width="50px"/>
            <asp:Button ID="nobutton" style="float:left; margin:15px  10px auto 10px;" Text="No" OnClick="Cancel_Delete" Runat="Server" Font-Size="7pt" Height="17px" Width="50px"/>
       </asp:Panel>
    </div>
    <asp:Panel ID="PanelDatosNautica" runat="server">
    <div id="TablaDetalle" style="margin:auto; width:500px; border: 2px bold blue; " runat="server" >
        <asp:ValidationSummary ID="ValidationSummaryEditaNautica" runat="server" DisplayMode="BulletList"
        HeaderText="Datos incorrectos:" Font-Name="verdana" Font-Size="12" ValidationGroup="ValidationEditaNautica" />

        <table id="TableDatosNautica"  style="width: 100%; height: 20px; color: Navy;  border:1px solid #E7E7FF; " runat="server">
            <tr style="width: 30%; font-weight:bold; background:Navy; font-weight:bold; color:White; text-align:center; height:25px;">
                <td colspan="2" >NAUTICA</td>
            </tr>
            <tr style="background-color:#F7F7F7; color: #284775; height:25px;">
                <td style="width: 30%; font-weight:bold;  text-align: right; padding-right: 5px; ">Código </td>
                <td style="width: 70%; font-weight:bold; color:Black; padding-left:5px; "><asp:Label ID="IDNautica" runat="server"></asp:Label></td>    
            </tr>
            <tr style="background-color:#E7E7FF; color: #284775;height:25px;">
                <td style="width: 30%; font-weight:bold; text-align: right; padding-right: 5px;">Activo </td>
                <td style="width: 70%; padding-left:5px; "><asp:CheckBox ID="IsApproved" runat="server" Checked="true" /></td>    
            </tr>
            <tr style="background-color:#F7F7F7; color: #284775;height:25px;">
                <td style="width: 30%; font-weight:bold; text-align: right; padding-right: 5px;">Bloqueado </td>
                <td style="width: 70%; padding-left:5px; "><asp:CheckBox ID="IsLockedOut" runat="server" Checked="true" /></td>    
            </tr>
            <tr style="background-color:#E7E7FF; color: #284775;height:25px;">
                <td style="width: 30%; font-weight:bold; text-align: right; padding-right: 5px; ">Empresa </td>
                <td style="width: 70%; padding-left:5px; "><asp:TextBox ID="Empresa" style="width:250px;" runat="server"></asp:TextBox></td>    
            </tr>
            <tr style="background-color:#F7F7F7 ; color: #284775; height:25px; ">
                <td style="width: 30%; font-weight:bold; text-align: right; padding-right: 5px; ">Vendedor </td>
                <td style="width: 70%; padding-left:5px;  "><asp:TextBox ID="Vendedor" style="width:250px;" runat="server"></asp:TextBox></td>    
            </tr>
            <tr style="background-color:#E7E7FF; color: #284775;height:25px; ">
                <td style="width: 30%; font-weight:bold; text-align: right; padding-right: 5px; ">Correo electrónico </td>
                <td style="width: 70%;padding-left:5px;  "><asp:TextBox ID="EMail" style="width:250px;" runat="server"></asp:TextBox>
                   <asp:RequiredFieldValidator ID="EmailRequired" runat="server" InitialValue="" Width="25px"
                   ControlToValidate="EMail" ErrorMessage="Es necesaria una dirección de email." Display="Static" 
                   ToolTip="Es necesaria una dirección de email." ValidationGroup="ValidationEditaNautica">*</asp:RequiredFieldValidator>                                   
            </td>    
            </tr>
            <tr style="background-color:#F7F7F7 ; color: #284775;height:25px; ">
                <td style="width: 30%; font-weight:bold; text-align: right; padding-right: 5px; ">Móvil </td>
                <td style="width: 70%;padding-left:5px;  "><asp:TextBox ID="Movil" style="width:250px;" runat="server"></asp:TextBox></td>    
            </tr>
            <tr style="background-color:#E7E7FF; color: #284775;height:25px; ">
                <td style="width: 30%; font-weight:bold; text-align: right; padding-right: 5px; ">Fax </td>
                <td style="width: 70%; padding-left:5px; "><asp:TextBox ID="Fax" style="width:250px;" runat="server"></asp:TextBox></td>    
            </tr>
            <tr style="background-color:#F7F7F7 ; color: #284775;height:25px; ">
                <td style="width: 30%; font-weight:bold; text-align: right; padding-right: 5px; ">Usuario </td>
                <td style="width: 70%; padding-left:5px; "><asp:TextBox ID="Usuario" style="width:250px;" runat="server"></asp:TextBox>
                   <asp:RequiredFieldValidator ID="UsuarioRequiredFieldValidator" runat="server" InitialValue="" Width="25px"
                   ControlToValidate="Usuario" ErrorMessage="Es necesario un nombre de usuario." Display="Static" 
                   ToolTip="Es necesario un nombre de usuario." ValidationGroup="ValidationEditaNautica">*</asp:RequiredFieldValidator>
                </td>    
            </tr>
            <tr style="background-color:#E7E7FF; color: #284775;height:25px; ">
                <td style="width: 30%; font-weight:bold; text-align: right; padding-right: 5px;">Contraseña </td>
                <td style="width: 70%;padding-left:5px;  "><asp:TextBox ID="Contrasena" 
                        style="width:250px;" runat="server" MaxLength="50"
                         onfocus="ClearTextboxes(this.id,'*************')" onblur="BlurTextboxes(this.id,'*************')" 
                        >*************</asp:TextBox>
                   <asp:RequiredFieldValidator ID="ContrasenaRequiredFieldValidator" runat="server" InitialValue="" Width="25px"
                   ControlToValidate="Contrasena" ErrorMessage="Es necesaria una contraseña." Display="Static" 
                   ToolTip="Es necesaria una contraseña." ValidationGroup="ValidationEditaNautica">*</asp:RequiredFieldValidator>
               </td>    
            </tr>
            <tr style="background-color:#F7F7F7 ; color: #284775;height:25px; ">
                <td style="width: 30%; font-weight:bold; text-align: right;  padding-right: 5px;">Rol </td>
                <td style="width: 70%;padding-left:5px;  "><asp:DropDownList ID="Rol" Width="150px" runat="server">
                    <asp:ListItem>Usuario</asp:ListItem>
                    <asp:ListItem>Admin</asp:ListItem>
                    </asp:DropDownList></td>    
            </tr>
            <tr style="background-color:#E7E7FF; color: #284775;height:25px; ">
                <td style="width: 30%; font-weight:bold; text-align: right; padding-right: 5px; ">Comentarios </td>
                <td style="width: 70%; padding-left:5px;  "><asp:TextBox ID="Comentarios" style="width:340px;  height:80px; " runat="server" Rows="3" 
                        TextMode="MultiLine"></asp:TextBox></td>    
            </tr>
            <tr style="background-color:#F7F7F7 ; color: #284775;height:25px; ">
                <td style="width: 30%; font-weight:bold; text-align: right; padding-right: 5px; ">Fecha alta</td>
                <td style="width: 70%; padding-left:5px;  font-weight:bold;color:Black; "><asp:Label ID="FechaAlta" runat="server"></asp:Label></td>    
            </tr>
            <tr style="background-color:#E7E7FF; color: #284775;height:25px; " >
                <td style="width: 30%; font-weight:bold; text-align: right;  padding-right: 5px;">Última conexión</td>
                <td style="width: 70%; padding-left:5px;  font-weight:bold;color:Black;  "><asp:Label ID="UltimaConexion" runat="server"></asp:Label></td>    
            </tr>
        </table>
    </div>
    <div style="clear:both; height:20px;"></div>
    <div style="width:340px; margin: 10px auto 10px auto; ">
        <asp:Button ID="Guardar" style="width:100px; " runat="server" Text="Guardar" cssclass="botom_menu" OnClick="GuardarNautica" 
                    CausesValidation ="true" ValidationGroup="ValidationEditaNautica" />                
        <asp:Button ID="Cancelar" style="width:100px; margin-left:5px; " runat="server" cssclass="botom_menu" Text="Cancelar"  OnClick="CancelarEdicion" />
        <asp:Button ID="Eliminar" style="width:100px; margin-left:5px; " runat="server" cssclass="botom_menu" Text="Eliminar"  OnClick="EliminarNautica" />
    </div>
    </asp:Panel>
    <div style="clear:both; height:20px;"></div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolderFoot" runat="server">
</asp:Content>
