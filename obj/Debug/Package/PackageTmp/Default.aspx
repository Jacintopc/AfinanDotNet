<%@ Page Title="Afinan.net" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="AfinanDotNet2._0.WebForm1" %>
<asp:Content ID="HeaderContent" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div style="width: 95%;  margin: 5px auto 5px auto; padding: 10px;">
        <h2>Applicación para el cálculo de financiación de nautica</h2>
        <p>Si no tiene una cuenta de acceso, por favor póngase en contacto para darle de alta como socio. </p>
    </div>

    <div style="width:390px; background-color: #ffffdd ; border: 1px solid black; margin: 35px auto 15px auto; padding: 5px; -moz-border-radius: 8px; -webkit-border-radius: 8px;">
        <asp:ValidationSummary ID="ValidationSummaryLogin" runat="server" DisplayMode="BulletList"
            HeaderText="Datos incompletos:" Font-Name="verdana" Font-Size="12" 
            ValidationGroup="LoginAfinan" />
        <asp:Login ID="LoginAfinan" runat="server" BackColor="#ffffdd" Font-Names="Verdana" 
            Font-Size="1em" ForeColor="#333333" Width="380px"  OnLoggedIn="UsuarioLoggedIn" >
            <InstructionTextStyle Font-Italic="True" ForeColor="Black" />
            <LayoutTemplate>
                <table cellpadding="4" cellspacing="0" style="border-collapse:collapse; ">
                    <tr style="height:30px;">
                        <td>
                            <table cellpadding="0" style="width:380px;">
                                <tr style="height:30px;">
                                    <td align="right" style="padding-right:10px;">
                                        <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">Usuario: </asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="UserName" runat="server" Width="150px" Font-Size="1em"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" InitialValue="" Width="25px"
                                            ControlToValidate="UserName" ErrorMessage="Es necesario un nombre de usuario." Display="Static" 
                                            ToolTip="Es necesario un nombre de usuario." ValidationGroup="LoginAfinan">*</asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr style="height:30px;">
                                    <td align="right"  style="padding-right:10px;" >
                                        <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password" >Contraseña: </asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="Password" runat="server" Width="150px" Font-Size="1em" TextMode="Password"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password" 
                                             ErrorMessage="Es necesaria una contraseña." Display="Static"  InitialValue="" Width="25px"
                                             ToolTip="Es necesaria una contraseña." ValidationGroup="LoginAfinan">*</asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr style="height:30px;">
                                    <td align="center" colspan="2">
                                        <asp:Button ID="LoginButton" CssClass="botom_menu" runat="server" CommandName="Login" causesvalidation="true"
                                             Text="Entrar" ValidationGroup="LoginAfinan" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </LayoutTemplate>
            <LoginButtonStyle BackColor="#FFFBFF" BorderColor="#CCCCCC" BorderStyle="Solid" 
                BorderWidth="1px" Font-Names="Verdana" Font-Size="0.9em" ForeColor="#284775" />
            <TextBoxStyle Font-Size="0.9em" />
            <TitleTextStyle BackColor="#5D7B9D" Font-Bold="True" Font-Size="0.9em" 
                ForeColor="White" />
        </asp:Login>

        <div style="margin:auto; text-align:center; color:Red;  font-size:1em;">
                <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>
        </div>
            
    </div>
    <div> </div> 
    </asp:Content>

