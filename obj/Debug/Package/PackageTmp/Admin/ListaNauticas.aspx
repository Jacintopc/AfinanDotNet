<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ListaNauticas.aspx.cs" Inherits="AfinanDotNet2._0.Admin.ListaNauticas" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="MainContentEditaNauticas" ContentPlaceHolderID="MainContent" runat="server">
    <asp:AccessDataSource ID="AccessDataSourceNauticas" runat="server" 
        ConflictDetection="CompareAllValues" DataFile="~/App_Data/DBAfinan.mdb" 
        DeleteCommand="DELETE FROM [Users] WHERE [PKID] = ? AND [Username] = ? AND [ApplicationName] = ? AND [Email] = ? AND (([Comment] = ?) OR ([Comment] IS NULL AND ? IS NULL)) AND [Password] = ? AND (([PasswordQuestion] = ?) OR ([PasswordQuestion] IS NULL AND ? IS NULL)) AND (([PasswordAnswer] = ?) OR ([PasswordAnswer] IS NULL AND ? IS NULL)) AND [IsApproved] = ? AND (([LastActivityDate] = ?) OR ([LastActivityDate] IS NULL AND ? IS NULL)) AND (([LastLoginDate] = ?) OR ([LastLoginDate] IS NULL AND ? IS NULL)) AND (([LastPasswordChangedDate] = ?) OR ([LastPasswordChangedDate] IS NULL AND ? IS NULL)) AND (([CreationDate] = ?) OR ([CreationDate] IS NULL AND ? IS NULL)) AND [IsOnLine] = ? AND [IsLockedOut] = ? AND (([LastLockedOutDate] = ?) OR ([LastLockedOutDate] IS NULL AND ? IS NULL)) AND (([FailedPasswordAttemptCount] = ?) OR ([FailedPasswordAttemptCount] IS NULL AND ? IS NULL)) AND (([FailedPasswordAttemptWindowStart] = ?) OR ([FailedPasswordAttemptWindowStart] IS NULL AND ? IS NULL)) AND (([FailedPasswordAnswerAttemptCount] = ?) OR ([FailedPasswordAnswerAttemptCount] IS NULL AND ? IS NULL)) AND (([FailedPasswordAnswerAttemptWindowStart] = ?) OR ([FailedPasswordAnswerAttemptWindowStart] IS NULL AND ? IS NULL)) AND [IDNautica] = ? AND (([Empresa] = ?) OR ([Empresa] IS NULL AND ? IS NULL)) AND (([Vendedor] = ?) OR ([Vendedor] IS NULL AND ? IS NULL)) AND (([Movil] = ?) OR ([Movil] IS NULL AND ? IS NULL)) AND (([Fax] = ?) OR ([Fax] IS NULL AND ? IS NULL))"
        InsertCommand="INSERT INTO [Users] ([PKID], [Username], [ApplicationName], [Email], [Comment], [Password], [PasswordQuestion], [PasswordAnswer], [IsApproved], [LastActivityDate], [LastLoginDate], [LastPasswordChangedDate], [CreationDate], [IsOnLine], [IsLockedOut], [LastLockedOutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [IDNautica], [Empresa], [Vendedor], [Movil], [Fax]) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)" 
        OldValuesParameterFormatString="original_{0}" 
        SelectCommand="SELECT * FROM [Users] ORDER BY [Empresa]" 
        
        UpdateCommand="UPDATE [Users] SET [Username] = ?, [ApplicationName] = ?, [Email] = ?, [Comment] = ?, [Password] = ?, [PasswordQuestion] = ?, [PasswordAnswer] = ?, [IsApproved] = ?, [LastActivityDate] = ?, [LastLoginDate] = ?, [LastPasswordChangedDate] = ?, [CreationDate] = ?, [IsOnLine] = ?, [IsLockedOut] = ?, [LastLockedOutDate] = ?, [FailedPasswordAttemptCount] = ?, [FailedPasswordAttemptWindowStart] = ?, [FailedPasswordAnswerAttemptCount] = ?, [FailedPasswordAnswerAttemptWindowStart] = ?, [IDNautica] = ?, [Empresa] = ?, [Vendedor] = ?, [Movil] = ?, [Fax] = ? WHERE [PKID] = ? AND [Username] = ? AND [ApplicationName] = ? AND [Email] = ? AND (([Comment] = ?) OR ([Comment] IS NULL AND ? IS NULL)) AND [Password] = ? AND (([PasswordQuestion] = ?) OR ([PasswordQuestion] IS NULL AND ? IS NULL)) AND (([PasswordAnswer] = ?) OR ([PasswordAnswer] IS NULL AND ? IS NULL)) AND [IsApproved] = ? AND (([LastActivityDate] = ?) OR ([LastActivityDate] IS NULL AND ? IS NULL)) AND (([LastLoginDate] = ?) OR ([LastLoginDate] IS NULL AND ? IS NULL)) AND (([LastPasswordChangedDate] = ?) OR ([LastPasswordChangedDate] IS NULL AND ? IS NULL)) AND (([CreationDate] = ?) OR ([CreationDate] IS NULL AND ? IS NULL)) AND [IsOnLine] = ? AND [IsLockedOut] = ? AND (([LastLockedOutDate] = ?) OR ([LastLockedOutDate] IS NULL AND ? IS NULL)) AND (([FailedPasswordAttemptCount] = ?) OR ([FailedPasswordAttemptCount] IS NULL AND ? IS NULL)) AND (([FailedPasswordAttemptWindowStart] = ?) OR ([FailedPasswordAttemptWindowStart] IS NULL AND ? IS NULL)) AND (([FailedPasswordAnswerAttemptCount] = ?) OR ([FailedPasswordAnswerAttemptCount] IS NULL AND ? IS NULL)) AND (([FailedPasswordAnswerAttemptWindowStart] = ?) OR ([FailedPasswordAnswerAttemptWindowStart] IS NULL AND ? IS NULL)) AND [IDNautica] = ? AND (([Empresa] = ?) OR ([Empresa] IS NULL AND ? IS NULL)) AND (([Vendedor] = ?) OR ([Vendedor] IS NULL AND ? IS NULL)) AND (([Movil] = ?) OR ([Movil] IS NULL AND ? IS NULL)) AND (([Fax] = ?) OR ([Fax] IS NULL AND ? IS NULL))">
        <DeleteParameters>
            <asp:Parameter Name="original_PKID" Type="Object" />
            <asp:Parameter Name="original_Username" Type="String" />
            <asp:Parameter Name="original_ApplicationName" Type="String" />
            <asp:Parameter Name="original_Email" Type="String" />
            <asp:Parameter Name="original_Comment" Type="String" />
            <asp:Parameter Name="original_Comment" Type="String" />
            <asp:Parameter Name="original_Password" Type="String" />
            <asp:Parameter Name="original_PasswordQuestion" Type="String" />
            <asp:Parameter Name="original_PasswordQuestion" Type="String" />
            <asp:Parameter Name="original_PasswordAnswer" Type="String" />
            <asp:Parameter Name="original_PasswordAnswer" Type="String" />
            <asp:Parameter Name="original_IsApproved" Type="Boolean" />
            <asp:Parameter Name="original_LastActivityDate" Type="DateTime" />
            <asp:Parameter Name="original_LastActivityDate" Type="DateTime" />
            <asp:Parameter Name="original_LastLoginDate" Type="DateTime" />
            <asp:Parameter Name="original_LastLoginDate" Type="DateTime" />
            <asp:Parameter Name="original_LastPasswordChangedDate" Type="DateTime" />
            <asp:Parameter Name="original_LastPasswordChangedDate" Type="DateTime" />
            <asp:Parameter Name="original_CreationDate" Type="DateTime" />
            <asp:Parameter Name="original_CreationDate" Type="DateTime" />
            <asp:Parameter Name="original_IsOnLine" Type="Boolean" />
            <asp:Parameter Name="original_IsLockedOut" Type="Boolean" />
            <asp:Parameter Name="original_LastLockedOutDate" Type="DateTime" />
            <asp:Parameter Name="original_LastLockedOutDate" Type="DateTime" />
            <asp:Parameter Name="original_FailedPasswordAttemptCount" Type="Int32" />
            <asp:Parameter Name="original_FailedPasswordAttemptCount" Type="Int32" />
            <asp:Parameter Name="original_FailedPasswordAttemptWindowStart" 
                Type="DateTime" />
            <asp:Parameter Name="original_FailedPasswordAttemptWindowStart" 
                Type="DateTime" />
            <asp:Parameter Name="original_FailedPasswordAnswerAttemptCount" Type="Int32" />
            <asp:Parameter Name="original_FailedPasswordAnswerAttemptCount" Type="Int32" />
            <asp:Parameter Name="original_FailedPasswordAnswerAttemptWindowStart" 
                Type="DateTime" />
            <asp:Parameter Name="original_FailedPasswordAnswerAttemptWindowStart" 
                Type="DateTime" />
            <asp:Parameter Name="original_IDNautica" Type="Int32" />
            <asp:Parameter Name="original_Empresa" Type="String" />
            <asp:Parameter Name="original_Empresa" Type="String" />
            <asp:Parameter Name="original_Vendedor" Type="String" />
            <asp:Parameter Name="original_Vendedor" Type="String" />
            <asp:Parameter Name="original_Movil" Type="String" />
            <asp:Parameter Name="original_Movil" Type="String" />
            <asp:Parameter Name="original_Fax" Type="String" />
            <asp:Parameter Name="original_Fax" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="PKID" Type="Object" />
            <asp:Parameter Name="Username" Type="String" />
            <asp:Parameter Name="ApplicationName" Type="String" />
            <asp:Parameter Name="Email" Type="String" />
            <asp:Parameter Name="Comment" Type="String" />
            <asp:Parameter Name="Password" Type="String" />
            <asp:Parameter Name="PasswordQuestion" Type="String" />
            <asp:Parameter Name="PasswordAnswer" Type="String" />
            <asp:Parameter Name="IsApproved" Type="Boolean" />
            <asp:Parameter Name="LastActivityDate" Type="DateTime" />
            <asp:Parameter Name="LastLoginDate" Type="DateTime" />
            <asp:Parameter Name="LastPasswordChangedDate" Type="DateTime" />
            <asp:Parameter Name="CreationDate" Type="DateTime" />
            <asp:Parameter Name="IsOnLine" Type="Boolean" />
            <asp:Parameter Name="IsLockedOut" Type="Boolean" />
            <asp:Parameter Name="LastLockedOutDate" Type="DateTime" />
            <asp:Parameter Name="FailedPasswordAttemptCount" Type="Int32" />
            <asp:Parameter Name="FailedPasswordAttemptWindowStart" Type="DateTime" />
            <asp:Parameter Name="FailedPasswordAnswerAttemptCount" Type="Int32" />
            <asp:Parameter Name="FailedPasswordAnswerAttemptWindowStart" Type="DateTime" />
            <asp:Parameter Name="IDNautica" Type="Int32" />
            <asp:Parameter Name="Empresa" Type="String" />
            <asp:Parameter Name="Vendedor" Type="String" />
            <asp:Parameter Name="Movil" Type="String" />
            <asp:Parameter Name="Fax" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Username" Type="String" />
            <asp:Parameter Name="ApplicationName" Type="String" />
            <asp:Parameter Name="Email" Type="String" />
            <asp:Parameter Name="Comment" Type="String" />
            <asp:Parameter Name="Password" Type="String" />
            <asp:Parameter Name="PasswordQuestion" Type="String" />
            <asp:Parameter Name="PasswordAnswer" Type="String" />
            <asp:Parameter Name="IsApproved" Type="Boolean" />
            <asp:Parameter Name="LastActivityDate" Type="DateTime" />
            <asp:Parameter Name="LastLoginDate" Type="DateTime" />
            <asp:Parameter Name="LastPasswordChangedDate" Type="DateTime" />
            <asp:Parameter Name="CreationDate" Type="DateTime" />
            <asp:Parameter Name="IsOnLine" Type="Boolean" />
            <asp:Parameter Name="IsLockedOut" Type="Boolean" />
            <asp:Parameter Name="LastLockedOutDate" Type="DateTime" />
            <asp:Parameter Name="FailedPasswordAttemptCount" Type="Int32" />
            <asp:Parameter Name="FailedPasswordAttemptWindowStart" Type="DateTime" />
            <asp:Parameter Name="FailedPasswordAnswerAttemptCount" Type="Int32" />
            <asp:Parameter Name="FailedPasswordAnswerAttemptWindowStart" Type="DateTime" />
            <asp:Parameter Name="IDNautica" Type="Int32" />
            <asp:Parameter Name="Empresa" Type="String" />
            <asp:Parameter Name="Vendedor" Type="String" />
            <asp:Parameter Name="Movil" Type="String" />
            <asp:Parameter Name="Fax" Type="String" />
            <asp:Parameter Name="original_PKID" Type="Object" />
            <asp:Parameter Name="original_Username" Type="String" />
            <asp:Parameter Name="original_ApplicationName" Type="String" />
            <asp:Parameter Name="original_Email" Type="String" />
            <asp:Parameter Name="original_Comment" Type="String" />
            <asp:Parameter Name="original_Comment" Type="String" />
            <asp:Parameter Name="original_Password" Type="String" />
            <asp:Parameter Name="original_PasswordQuestion" Type="String" />
            <asp:Parameter Name="original_PasswordQuestion" Type="String" />
            <asp:Parameter Name="original_PasswordAnswer" Type="String" />
            <asp:Parameter Name="original_PasswordAnswer" Type="String" />
            <asp:Parameter Name="original_IsApproved" Type="Boolean" />
            <asp:Parameter Name="original_LastActivityDate" Type="DateTime" />
            <asp:Parameter Name="original_LastActivityDate" Type="DateTime" />
            <asp:Parameter Name="original_LastLoginDate" Type="DateTime" />
            <asp:Parameter Name="original_LastLoginDate" Type="DateTime" />
            <asp:Parameter Name="original_LastPasswordChangedDate" Type="DateTime" />
            <asp:Parameter Name="original_LastPasswordChangedDate" Type="DateTime" />
            <asp:Parameter Name="original_CreationDate" Type="DateTime" />
            <asp:Parameter Name="original_CreationDate" Type="DateTime" />
            <asp:Parameter Name="original_IsOnLine" Type="Boolean" />
            <asp:Parameter Name="original_IsLockedOut" Type="Boolean" />
            <asp:Parameter Name="original_LastLockedOutDate" Type="DateTime" />
            <asp:Parameter Name="original_LastLockedOutDate" Type="DateTime" />
            <asp:Parameter Name="original_FailedPasswordAttemptCount" Type="Int32" />
            <asp:Parameter Name="original_FailedPasswordAttemptCount" Type="Int32" />
            <asp:Parameter Name="original_FailedPasswordAttemptWindowStart" 
                Type="DateTime" />
            <asp:Parameter Name="original_FailedPasswordAttemptWindowStart" 
                Type="DateTime" />
            <asp:Parameter Name="original_FailedPasswordAnswerAttemptCount" Type="Int32" />
            <asp:Parameter Name="original_FailedPasswordAnswerAttemptCount" Type="Int32" />
            <asp:Parameter Name="original_FailedPasswordAnswerAttemptWindowStart" 
                Type="DateTime" />
            <asp:Parameter Name="original_FailedPasswordAnswerAttemptWindowStart" 
                Type="DateTime" />
            <asp:Parameter Name="original_IDNautica" Type="Int32" />
            <asp:Parameter Name="original_Empresa" Type="String" />
            <asp:Parameter Name="original_Empresa" Type="String" />
            <asp:Parameter Name="original_Vendedor" Type="String" />
            <asp:Parameter Name="original_Vendedor" Type="String" />
            <asp:Parameter Name="original_Movil" Type="String" />
            <asp:Parameter Name="original_Movil" Type="String" />
            <asp:Parameter Name="original_Fax" Type="String" />
            <asp:Parameter Name="original_Fax" Type="String" />
        </UpdateParameters>
    </asp:AccessDataSource>
    <div style="clear:both; height :20px;"></div>
    <div id="divDeleteInfo" style="position:absolute; top:50%; left:50%; Width:350px; height:50px; 
        margin-left: -175px; border: 2px solid red; vertical-align:middle;  
        background-color:White;" runat="server" visible="false" >
        <asp:Label id="EditMSG" Style="margin:15px 10px auto 30px; " Text="&nbsp; labelEditMSG" ForeColor="Red" Runat="Server" EnableViewState="True" />
        <asp:Button ID="OkButton" style="margin:15px  10px auto 30px;" Text="OK" OnClick="Cancel_Delete" Runat="Server" Font-Size="7pt" Height="17px" Width="50px"/>
    </div>
    <div id="divConfirmDelete" style="position: absolute; top:50%; left:50% ; width:550px; height:50px;
           margin-left:-175px; border: 2px solid red;  vertical-align:middle;  
           background-color:White;" runat="server" visible="false" >
        <asp:Panel id="ConfirmDelete" EnableViewState="False" Runat="Server" style="vertical-align:middle; " >
            <asp:Label ID="questionlabel" style="float:left; margin:15px 10px auto 30px;" Text="¿Eliminar este registro? " ForeColor="Red" Runat="Server"/>
            <asp:Button ID="yesbutton" style="float:left; margin:15px  10px auto 30px;" Text="Si" OnClick="Delete_Record" Runat="Server" Font-Size="7pt" Height="17px" Width="50px"/>
            <asp:Button ID="nobutton" style="float:left; margin:15px  10px auto 10px;" Text="No" OnClick="Cancel_Delete" Runat="Server" Font-Size="7pt" Height="17px" Width="50px"/>
       </asp:Panel>
    </div>
    <div id="SelectorNauticas" style="margin:auto; width:auto;">
    <asp:GridView ID="GridViewNauticas" runat="server" AutoGenerateColumns="False" 
        DataKeyNames="PKID" DataSourceID="AccessDataSourceNauticas" 
        EnableModelValidation="True" Width="960px" AllowPaging="True" 
        AllowSorting="True" BackColor="White" BorderColor="#E7E7FF" 
        BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Horizontal"
        Height="10px" PageSize="15" HorizontalAlign="Center"
        OnRowCommand="View_RowCommand"
        OnRowCreated="GridViewNauticas_RowCreated" 
        OnRowDeleting="GridViewNauticas_Deleting"
        OnRowDeleted="GridViewNauticas_Deleted"
        OnSelectedIndexChanged="GridViewNauticas_SelectedIndexChanged" > 
        <AlternatingRowStyle BackColor="#F7F7F7" />
        <Columns>
            <asp:ButtonField DataTextField="IDNautica" HeaderText="Cod." 
                SortExpression="IDNautica" CommandName="Select">
            <HeaderStyle HorizontalAlign="Right" Width="30px" Wrap="False" />
            <ItemStyle HorizontalAlign="Right" Width="30px" Wrap="False" />
            </asp:ButtonField>
            <asp:CheckBoxField DataField="IsApproved" HeaderText="Activo" 
                SortExpression="IsApproved">
            <HeaderStyle HorizontalAlign="Center" Width="30px" />
            <ItemStyle HorizontalAlign="Center" Width="30px"/>
            </asp:CheckBoxField>
            <asp:ButtonField DataTextField="Empresa" HeaderText="Empresa" 
                SortExpression="Empresa" Text="Button" ItemStyle-Width="100px" 
                CommandName="Select">
            <HeaderStyle HorizontalAlign="Left" />
            <ItemStyle HorizontalAlign="Left" Width="100px" Wrap="false" />
            </asp:ButtonField>
            <asp:ButtonField DataTextField="Vendedor" HeaderText="Vendedor" 
                SortExpression="Vendedor" Text="Button" CommandName="Select">
            <HeaderStyle HorizontalAlign="Left" />
            <ItemStyle HorizontalAlign="Left" />
            </asp:ButtonField>
            <asp:BoundField DataField="Email" HeaderText="Email" 
                SortExpression="Email">
            <HeaderStyle HorizontalAlign="Left" Width="180px" Wrap="false" />
            <ItemStyle HorizontalAlign="Left" Width="180px" Wrap="false" />
            </asp:BoundField>
            <asp:BoundField DataField="Movil" HeaderText="Movil" SortExpression="Movil">
            <HeaderStyle HorizontalAlign="Left" Width="120px"  Wrap="false" />
            <ItemStyle HorizontalAlign="Left" Width="120px"  Wrap="false" />
            </asp:BoundField>
            <asp:BoundField DataField="LastActivityDate" DataFormatString="{0:d}" 
                HeaderText="Ultima Conexión" SortExpression="LastActivityDate">
            <HeaderStyle HorizontalAlign="Center" Width="100px" Wrap="false" />
            <ItemStyle HorizontalAlign="Center" Width="100px"  Wrap="false" />
            </asp:BoundField>
            <asp:CommandField ButtonType="Image" DeleteImageUrl="~/Images/DeleteHS.png" 
                HeaderText="Del" ShowDeleteButton="True">
            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
            </asp:CommandField>
        </Columns>
        <PagerTemplate>
                <asp:Button ID="BtnFirst" CssClass="botom_menu" runat="server" CommandName="Primero" Text="Primero"/>
                <asp:Button ID="BtnPrev"  CssClass="botom_menu" runat="server" CommandName="Anterior" Text="Anterior" />
                <asp:Button ID="BtnNueva" CssClass="botom_menu" runat="server" CommandName="Nueva" Text="Nueva" />
                <asp:Button ID="BtnNext"  CssClass="botom_menu" runat="server" CommandName="Siguiente" Text="Siguiente" />
                <asp:Button ID="BtnLast"  CssClass="botom_menu" runat="server" CommandName="Ultimo" Text="Último" />
        </PagerTemplate>

        <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
        <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
        <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Center" />
        <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
        <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
    </asp:GridView>
    </div>
    <div style="clear:both; height:30px;"></div>
   
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolderFoot" runat="server">
</asp:Content>
