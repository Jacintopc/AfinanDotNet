<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="AfinanDotNet2._0.Admin.Register" %>
<asp:Content ID="RegisterHeadContent" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="RegisterMainContent" ContentPlaceHolderID="MainContent" runat="server">
<div id="RegisterBox" style="margin:auto; width:450px; " runat="server">
    <asp:CreateUserWizard ID="CreateUserWizard1" runat="server" BackColor="#F7F6F3" 
        BorderColor="#E6E2D8" BorderStyle="Solid" BorderWidth="1px" 
        Font-Names="Verdana" Font-Size="0.8em" Width="450px" 
        oncreateduser="CreateUserWizard1_CreatedUser">
        <ContinueButtonStyle BackColor="#FFFBFF" BorderColor="#CCCCCC" 
            BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" 
            ForeColor="#284775" />
        <CreateUserButtonStyle BackColor="#FFFBFF" BorderColor="#CCCCCC" 
            BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" 
            ForeColor="#284775" />
        <TitleTextStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <WizardSteps>
            <asp:CreateUserWizardStep runat="server" Title="Creación de una nueva cuenta" >
                <ContentTemplate>
                    <table style="font-family:Verdana;font-size:100%;width:450px;color:#333333;" >
                        <tr>
                            <td align="center" colspan="2" 
                                style="color:White;background-color:#5D7B9D;font-weight:bold;">
                                Creación de una nueva cuenta</td>
                        </tr>
                        <tr style="background-color:#E9ECE1;">
                            <td align="right" style="font-weight:bold;" >
                                <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">Usuario:</asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="UserName" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" 
                                    ControlToValidate="UserName" ErrorMessage="Es necesario un nombre de usuario." 
                                    ToolTip="Es necesario un nombre de usuario." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">Contraseña:</asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="Password" runat="server" TextMode="Password"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" 
                                    ControlToValidate="Password" ErrorMessage="Es necesaria una contraseña." 
                                    ToolTip="Es necesaria una contraseña." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr style="background-color:#E9ECE1;">
                            <td align="right">
                                <asp:Label ID="ConfirmPasswordLabel" runat="server" 
                                    AssociatedControlID="ConfirmPassword">Confirmar contraseña:</asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="ConfirmPassword" runat="server" TextMode="Password"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="ConfirmPasswordRequired" runat="server" 
                                    ControlToValidate="ConfirmPassword" 
                                    ErrorMessage="Es necesario confirmar la contraseña." 
                                    ToolTip="Es necesario confirmar la contraseña." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                <asp:Label ID="EmailLabel" runat="server" AssociatedControlID="Email">E-mail:</asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="Email" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="EmailRequired" runat="server" 
                                    ControlToValidate="Email" ErrorMessage="Es necesaria una dirección de E-mail." 
                                    ToolTip="Es necesaria una dirección de E-mail." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr style="background-color:#E9ECE1;">
                            <td align="right">
                                <asp:Label ID="QuestionLabel" runat="server" AssociatedControlID="Question">Pregunta de confirmación:</asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="Question" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="QuestionRequired" runat="server" 
                                    ControlToValidate="Question" ErrorMessage="Es necesaria una pregunta para confirmar su identidad." 
                                    ToolTip="Es necesaria una pregunta para confirmar su identidad." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                <asp:Label ID="AnswerLabel" runat="server" AssociatedControlID="Answer">Respuesta de confirmación:</asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="Answer" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="AnswerRequired" runat="server" 
                                    ControlToValidate="Answer" ErrorMessage="Es necesaria la respuesta a la pregunta de confirmación." 
                                    ToolTip="Es necesaria la respuesta a la pregunta de confirmación." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr style="background-color:#E9ECE1;">
                            <td align="right">
                                <asp:Label ID="EmpresaLabel" runat="server" AssociatedControlID="Empresa">Empresa</asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="Empresa" runat="server"></asp:TextBox>
                             </td>
                        </tr>
                        <tr>
                            <td align="right">
                                <asp:Label ID="VendedorLabel" runat="server" AssociatedControlID="Vendedor">Vendedor</asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="Vendedor" runat="server"></asp:TextBox>
                             </td>
                        </tr>
                        <tr style="background-color:#E9ECE1;">
                            <td align="right">
                                <asp:Label ID="MovilLabel" runat="server" AssociatedControlID="Movil">Móvil</asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="Movil" runat="server"></asp:TextBox>
                             </td>
                        </tr>
                        <tr>
                            <td align="right">
                                <asp:Label ID="FaxLabel" runat="server" AssociatedControlID="Fax">Fax</asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="Fax" runat="server"></asp:TextBox>
                             </td>
                        </tr>
                        <tr style="background-color:#E9ECE1;">
                            <td align="center" colspan="2">
                                <asp:CompareValidator ID="PasswordCompare" runat="server" 
                                    ControlToCompare="Password" ControlToValidate="ConfirmPassword" 
                                    Display="Dynamic" 
                                    ErrorMessage="La contraseña y su confirmación deben coincidir." 
                                    ValidationGroup="CreateUserWizard1"></asp:CompareValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="center" colspan="2" style="color:Red;">
                                <asp:Literal ID="ErrorMessage" runat="server" EnableViewState="False"></asp:Literal>
                            </td>
                        </tr>
                    </table>
                </ContentTemplate>
            </asp:CreateUserWizardStep>
            <asp:CompleteWizardStep runat="server" Title="Completado" >
                <ContentTemplate>
                    <table style="font-family:Verdana;font-size:100%;width:450px;">
                        <tr>
                            <td align="center" 
                                style="color:White;background-color:#5D7B9D;font-weight:bold;">
                                Creación de nuevo usuario completado</td>
                        </tr>
                        <tr>
                            <td>
                                El nuevo usuario ha sido creado satisfactoriamente.</td>
                        </tr>
                        <tr>
                            <td align="right">
                                <asp:Button ID="ContinueButton" runat="server" BackColor="#FFFBFF" 
                                    BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px" 
                                    CausesValidation="False" CommandName="Continue" Font-Names="Verdana" 
                                    ForeColor="#284775" Text="Continuar" ValidationGroup="CreateUserWizard1" />
                            </td>
                        </tr>
                    </table>
                </ContentTemplate>
            </asp:CompleteWizardStep>
        </WizardSteps>
        <HeaderStyle BackColor="#5D7B9D" BorderStyle="Solid" Font-Bold="True" 
            Font-Size="0.9em" ForeColor="White" HorizontalAlign="Center" />
        <NavigationButtonStyle BackColor="#FFFBFF" BorderColor="#CCCCCC" 
            BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" 
            ForeColor="#284775" />
        <SideBarButtonStyle BorderWidth="0px" Font-Names="Verdana" ForeColor="White" />
        <SideBarStyle BackColor="#5D7B9D" BorderWidth="0px" Font-Size="0.9em" 
            VerticalAlign="Top" />
        <StepStyle BorderWidth="0px" />
    </asp:CreateUserWizard>
</div>

</asp:Content>
<asp:Content ID="RegisterFootContent" ContentPlaceHolderID="ContentPlaceHolderFoot" runat="server">
</asp:Content>
