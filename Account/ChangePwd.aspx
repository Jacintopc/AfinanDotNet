<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ChangePwd.aspx.cs" Inherits="AfinanDotNet2._0.Admin.ChangePwd" %>
<asp:Content ID="HeadContentChangePwd" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="MainContentChangePwd" ContentPlaceHolderID="MainContent" runat="server">
    <div id="ChangePwdBox" style="margin:auto; width:559px; " runat="server" >
    <asp:ChangePassword Width="557px" ID="ChangePasswordUsuario" runat="server" 
            BackColor="#F7F6F3" BorderColor="#E6E2D8" BorderPadding="4" BorderStyle="Solid" 
            BorderWidth="1px" Font-Names="Verdana" Font-Size="0.8em" Height="209px" 
            style="font-size: large" CancelButtonText="Cancelar" 
            ChangePasswordButtonText="Cambiar contraseña" 
            ChangePasswordFailureText="Contraseña incorrecta o contraseña nueva incorrecta. La nueva contraseña debe tener una longitud mínima: {0}. Caractéres no alfahumericos: {1}." 
            ChangePasswordTitleText="Cambia contraseña" 
            ConfirmNewPasswordLabelText="Confirmar nueva contraseña :" 
            ContinueButtonText="Continuar" NewPasswordLabelText="Nueva contraseña:" 
            PasswordLabelText="Contraseña" SuccessText="Su contraseña ha sido cambiada." 
            SuccessTitleText="Cambio de contraseña terminado." UserNameLabelText="Usuario:">
        <CancelButtonStyle BackColor="#FFFBFF" BorderColor="#CCCCCC" 
            BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" Font-Size="0.8em" 
            ForeColor="#284775" />
        <ChangePasswordButtonStyle BackColor="#FFFBFF" BorderColor="#CCCCCC" 
            BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" Font-Size="0.8em" 
            ForeColor="#284775" />
        <ContinueButtonStyle BackColor="#FFFBFF" BorderColor="#CCCCCC" 
            BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" Font-Size="0.8em" 
            ForeColor="#284775" />
        <InstructionTextStyle Font-Italic="True" ForeColor="Black" />
        <PasswordHintStyle Font-Italic="True" ForeColor="#888888" />
        <TextBoxStyle Font-Size="0.8em" />
        <TitleTextStyle BackColor="#5D7B9D" Font-Bold="True" Font-Size="0.9em" 
            ForeColor="White" />
    </asp:ChangePassword>
    </div>
</asp:Content>
<asp:Content ID="FootChangePwd" ContentPlaceHolderID="ContentPlaceHolderFoot" runat="server">
</asp:Content>
