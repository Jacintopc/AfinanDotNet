using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.OleDb;
using System.Web.Configuration;
using System.Configuration;
using System.Collections.Specialized;
using System.Web.Security;



namespace AfinanDotNet2._0.Admin
{
    public partial class EditaNautica : System.Web.UI.Page
    {
        public static string Old_UserName=""; 

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string ID_Nautica = Request.QueryString.Get("IdNautica");
                
                if (ID_Nautica != "0")
                {
                    // leer base de datos, rellenar los campos y editar.    
                    IDNautica.Text = ID_Nautica;              
                    LeeNautica(ID_Nautica); 
                }
                Empresa.Focus();
            }
        }

        public string GetUserRole(string username)
        {
            string myConnectionString = WebConfigurationManager.ConnectionStrings["DBAfinanConnectionString"].ConnectionString;
            string mySqlQuery = "SELECT Rolename FROM [UsersInRoles] " +
                                " WHERE Username = '" + username + "' AND ApplicationName = 'AfinanDotNet2.0' ";

            OleDbConnection myConnection = new OleDbConnection(myConnectionString);
            using (myConnection)
            {
                try
                {
                    myConnection.Open();
                    OleDbDataAdapter da = new OleDbDataAdapter(mySqlQuery, myConnection);
                    DataSet ds = new DataSet();
                    da.Fill(ds);
                    myConnection.Close();
                    if (ds.Tables[0].Rows.Count > 0)
                        return ds.Tables[0].Rows[0]["Rolename"].ToString();
                }
                catch (OleDbException e)
                {
                    //Response.Write(e.Message);
                    Response.Redirect("~/AfinanError.aspx?Error='" + e.Message + "'");
                    throw ;
                }
                return ""; 
            }
        }
    
        public void ActualizaRole(string oldusuario, string usuario, string rol)
        {
            string myquery = ""; 
            if ((oldusuario == usuario) && (GetUserRole(usuario) != ""))  // si usuario = oldusuario y está en UsersInRoles actualizo Rolename
            {
                myquery = "UPDATE [UsersInRoles] " +
                          " SET [Rolename] = '" + rol  + "'" +
                          " WHERE [Username] = '" + oldusuario+ "'";
            }
            else if (GetUserRole(oldusuario) != "")  // else si existe oldusuario (!= usuario) actualizo usuario y Rolename
            {
                myquery = "UPDATE [UsersInRoles] " +
                          " SET [Rolename] = '" + rol + "', [Username] = '" + usuario + "'" +
                          " WHERE [Username] = '" + oldusuario + "'";

            }
            else   // else creo uno nuevo con Username y Rolename y ApplicationName
            {
                myquery = "INSERT INTO [UsersInRoles] "+
                          " (Username, Rolename, ApplicationName) " +
                          " Values('" + usuario + "','" + rol + "','AfinanDotNet2.0')";
            }

            string myConnectionString = WebConfigurationManager.ConnectionStrings["DBAfinanConnectionString"].ConnectionString;
            OleDbConnection conn = new OleDbConnection(myConnectionString);
            OleDbCommand cmd = new OleDbCommand(myquery, conn);

            try
            {
                conn.Open();
                int recUpdated = cmd.ExecuteNonQuery();
                conn.Close();
                if (recUpdated <= 0) Response.Redirect("~/AfinanError.aspx?Error='" + "Error en la query: update roles" + "'");
            }
            catch (OleDbException oledbexcep)
            {
                // Response.Write(oledbexcep.Message);
                Response.Redirect("~/AfinanError.aspx?Error='" + oledbexcep.Message + "'");
            }
        }

        protected void EliminaUsuarioenRoles(string usuario)
        {
            if (GetUserRole(usuario) != "")  // si usuario está en UsersInRoles lo borro
            {
                string myquery = "";
                myquery = "DELETE FROM [UsersInRoles] " +
                          " WHERE [Username] = '" + usuario + "'";

                string myConnectionString = WebConfigurationManager.ConnectionStrings["DBAfinanConnectionString"].ConnectionString;
                OleDbConnection conn = new OleDbConnection(myConnectionString);
                OleDbCommand cmd = new OleDbCommand(myquery, conn);
                try
                {
                    conn.Open();
                    int recUpdated = cmd.ExecuteNonQuery();
                    conn.Close();
                    if (recUpdated <= 0) Response.Redirect("~/AfinanError.aspx?Error='" + "Error en la query: eliminar usuario de roles" + "'");
                }
                catch (OleDbException oledbexcep)
                {
                    // Response.Write(oledbexcep.Message);
                    Response.Redirect("~/AfinanError.aspx?Error='" + oledbexcep.Message + "'");
                }

                }
        
        }



        protected void LeeNautica(string ID_Nautica)
        { 

            string myConnectionString = WebConfigurationManager.ConnectionStrings["DBAfinanConnectionString"].ConnectionString;
            string mySqlQuery = "SELECT Username, Email, Comment, Password, IsApproved, LastLoginDate, CreationDate, IsLockedOut, IDNautica, " +
                                "Empresa, Vendedor, Movil, Fax "+
                                "FROM [Users] " +
                                "WHERE IDNautica = "+ ID_Nautica ;

            OleDbConnection myConnection = new OleDbConnection(myConnectionString);
            using (myConnection)
            {
                try
                {
                    myConnection.Open();
                    OleDbDataAdapter da = new OleDbDataAdapter(mySqlQuery, myConnection);
                    DataSet ds = new DataSet();
                    da.Fill(ds);
                    myConnection.Close();

                    if (ds.Tables[0].Rows.Count > 0)  //  Carga de valores 
                    {
                        IDNautica.Text = ds.Tables[0].Rows[0]["IDNautica"].ToString();
                        IsApproved.Checked = Convert.ToBoolean(ds.Tables[0].Rows[0]["IsApproved"].ToString());
                        Empresa.Text = ds.Tables[0].Rows[0]["Empresa"].ToString();
                        Vendedor.Text = ds.Tables[0].Rows[0]["Vendedor"].ToString();
                        EMail.Text = ds.Tables[0].Rows[0]["Email"].ToString();
                        Movil.Text = ds.Tables[0].Rows[0]["Movil"].ToString();
                        Fax.Text = ds.Tables[0].Rows[0]["Fax"].ToString();
                        Usuario.Text = ds.Tables[0].Rows[0]["Username"].ToString();
                        Rol.Text = GetUserRole(Usuario.Text);
                        IsLockedOut.Checked = Convert.ToBoolean(ds.Tables[0].Rows[0]["IsLockedOut"].ToString());

                        Old_UserName = Usuario.Text;
                        FechaAlta.Text = ds.Tables[0].Rows[0]["CreationDate"].ToString();
                        UltimaConexion.Text = ds.Tables[0].Rows[0]["LastLoginDate"].ToString();

                        // mp.GetPassword(Usuario.Text, "Password Answer");   // (ds.Tables[0].Rows[0]["Password"].ToString());
                        Contrasena.Text = "*************";

                    }  
                    

                }
                catch (OleDbException OleDB_exception)
                {
                    // Response.Write(OleDB_exception.Message);
                    Response.Redirect("~/AfinanError.aspx?Error='" + OleDB_exception.Message + "'");
                }

            }
        
        }


        protected void GuardarNautica(object sender, EventArgs e)
            
        {
            if (IDNautica.Text == "")   //si está vacio --> crear una nueva Nautica
            {
                // ID_Nautica = CreaNautica(sender,e);
                // LeeNautica(ID_Nautica);

                //  pkid no duplicates, required
                //  username no duplicates, required
                //  idnautica no duplicates autoincrement,
                //  ApplicationName required
                //  Email required
                //  Password required
                
                object User_ID = Guid.NewGuid();
                string estado = "Creating Nautica nueva...";
                
                ImportDatabase ImpDB = new ImportDatabase(); 
                ImpDB.CreateUserAfinan(Usuario.Text, Contrasena.Text,  EMail.Text, "Password Question", "Password Answer", true, User_ID,
                                        Empresa.Text, Vendedor.Text, Movil.Text , Fax.Text, "Usuario", out estado);
            
                if (estado == "Registro añadido")
                {
                    string myConnectionString = WebConfigurationManager.ConnectionStrings["DBAfinanConnectionString"].ConnectionString;
                    string mySqlQuery = "SELECT [PKID], [IDNautica] " +
                                        "FROM [Users] " +
                                        "WHERE [PKID] = {"+ User_ID+"}" ;

                    OleDbConnection myConnection = new OleDbConnection(myConnectionString);
                    using (myConnection)
                    {
                        try
                        {
                            myConnection.Open();
                            OleDbDataAdapter da = new OleDbDataAdapter(mySqlQuery, myConnection);
                            DataSet ds = new DataSet();
                            da.Fill(ds);
                            myConnection.Close();

                            if (ds.Tables[0].Rows.Count > 0)  //  Carga de valores 
                                IDNautica.Text = ds.Tables[0].Rows[0]["IDNautica"].ToString();
                        }
                        catch
                        {
                            Response.Write("Error al leer ID_Nautica al crear la Náutica");
                        }
                    }
                    Response.Redirect("~/Admin/ListaNauticas.aspx"); 
                }
                else   //debe pintar el tipo de Error encontrado, y continuar editando
                {
                    Response.Write(estado);
                   
                }    
                
            }
            else //si ya existe actualizamos
            {
                Afinan_MembershipProvider mp = new Afinan_MembershipProvider();
                string configPath = "~/web.config";
                Configuration config = WebConfigurationManager.OpenWebConfiguration(configPath);
                MembershipSection section = (MembershipSection)config.GetSection("system.web/membership");
                ProviderSettingsCollection settings = section.Providers;
                NameValueCollection membershipParams = settings[section.DefaultProvider].Parameters;
                mp.Initialize(section.DefaultProvider, membershipParams);

                string updatequery = "";
                if (Contrasena.Text == "*************")
                {
                    updatequery= "UPDATE [Users] " +
                                 " SET [Empresa] = @Empresa, [Vendedor] = @Vendedor, [Movil] = @Movil, [Fax] = @Fax, [Username] = @Username, " +
                                 " [Email] = @Email, [Comment] = @Comment, [IsApproved] = @IsApproved , " +
                                 " [FailedPasswordAttemptCount] = 0 " +  
                                 " WHERE [IDNautica] = @ID_Nautica";
                }
                else
                {
                    updatequery = "UPDATE [Users] " +
                                  " SET [Empresa] = @Empresa, [Vendedor] = @Vendedor, [Movil] = @Movil, [Fax] = @Fax, [Username] = @Username, " +
                                  " [Email] = @Email, [Comment] = @Comment, [Password] = @Password, [IsApproved] = @IsApproved , " +
                                  " [FailedPasswordAttemptCount] = 0 " +
                                  " WHERE [IDNautica] = @ID_Nautica";
                }

                string myConnectionString = WebConfigurationManager.ConnectionStrings["DBAfinanConnectionString"].ConnectionString;
                OleDbConnection conn = new OleDbConnection(myConnectionString);

                OleDbCommand cmd = new OleDbCommand(updatequery , conn);

                cmd.Parameters.Add("@Empresa", OleDbType.VarChar, 50).Value = Empresa.Text;
                cmd.Parameters.Add("@Vendedor", OleDbType.VarChar, 50).Value = Vendedor.Text;
                cmd.Parameters.Add("@Movil", OleDbType.VarChar, 50).Value = Movil.Text;
                cmd.Parameters.Add("@Fax", OleDbType.VarChar, 50).Value = Fax.Text;
                cmd.Parameters.Add("@Username", OleDbType.VarChar, 255).Value = Usuario.Text;
                cmd.Parameters.Add("@Email", OleDbType.VarChar, 50).Value = EMail.Text;
                cmd.Parameters.Add("@Commnet", OleDbType.VarChar, 255).Value = Comentarios.Text;
                
                if (Contrasena.Text != "*************")
                {
                    string contrasenaencriptada = mp.EncodePassword(Contrasena.Text);
                    cmd.Parameters.Add("@Password", OleDbType.VarChar, 50).Value = contrasenaencriptada;  //  Contrasena.Text;
                    //cmd.Parameters.Add("@IsLockedOut", OleDbType.Boolean).Value = false;  //  Contrasena.Text;
                    //cmd.Parameters.Add("@FailedPasswordAttemptCount", OleDbType.Integer).Value = 0 ;  //  Contrasena.Text;
                    
                }
                
                cmd.Parameters.Add("@IsApproved", OleDbType.Boolean, 50).Value = IsApproved.Checked;
                cmd.Parameters.Add("@ID_Nautica", OleDbType.Integer, 10).Value = Convert.ToInt32(IDNautica.Text);

                try
                {
                    conn.Open();
                    int recUpdated = cmd.ExecuteNonQuery();
                    if (recUpdated <= 0)
                    {
                        // Response.Write("Error en la query: update datos de empresa");
                        Response.Redirect("~/AfinanError.aspx?Error='Error en la query: update datos de empresa'");
                    }
                    else
                    {
                        ActualizaRole(Old_UserName, Usuario.Text, Rol.SelectedValue);   // @jacinto al añadir un usuario a un rol deberíamos eliminar el anterior.
                        if ( ! IsLockedOut.Checked ) 
                            mp.UnlockUser(Usuario.Text);
                        /*
                        Afinan_RoleProvider rp = new Afinan_RoleProvider();
                        RoleManagerSection rolesection = (RoleManagerSection)config.GetSection("system.web/roleManager");
                        //RoleProviderCollection; 
                        ProviderSettingsCollection rolesettings = rolesection.Providers;
                        NameValueCollection roleManagerParams = rolesettings[rolesection.DefaultProvider].Parameters;
                        rp.Initialize(rolesection.DefaultProvider, roleManagerParams);

                        if (! rp.IsUserInRole(Usuario.Text, Rol.SelectedValue))
                        {
                            string[] Listausers = {Usuario.Text}; 
                            string[] Listaroles = {Rol.SelectedValue};
                            rp.AddUsersToRoles(Listausers, Listaroles);
                        }
                        */
                    }
                }
                catch (OleDbException oledbexcep)
                {
                    // Response.Write(oledbexcep.Message);
                    Response.Redirect("~/AfinanError.aspx?Error='" + oledbexcep.Message + "'");
                }
                finally
                {
                    conn.Close();
                    Response.Redirect("~/Admin/ListaNauticas.aspx"); 
                }
            }
        }

        protected void CancelarEdicion(object sender, EventArgs e)
        {
             Response.Redirect("~/Admin/ListaNauticas.aspx");            
        }

        protected void EliminarNautica(object sender, EventArgs e)
        {
            questionlabel.Text = "¿Desea eliminar el registro " + IDNautica.Text + " ?";
            PanelDatosNautica.Enabled = false;
            divConfirmDelete.Visible = true;
            divDeleteInfo.Visible = false;

        }

        protected void Delete_Record(object sender, EventArgs e)
        {
            Afinan_MembershipProvider mp = new Afinan_MembershipProvider();
            string configPath = "~/web.config";
            Configuration config = WebConfigurationManager.OpenWebConfiguration(configPath);
            MembershipSection section = (MembershipSection)config.GetSection("system.web/membership");
            ProviderSettingsCollection settings = section.Providers;
            NameValueCollection membershipParams = settings[section.DefaultProvider].Parameters;
            mp.Initialize(section.DefaultProvider, membershipParams);

            string myConnectionString = WebConfigurationManager.ConnectionStrings["DBAfinanConnectionString"].ConnectionString;
            OleDbConnection conn = new OleDbConnection(myConnectionString);
            OleDbCommand cmd = new OleDbCommand(" DELETE FROM [Users] " +
                                                " WHERE [IDNautica] = @ID_Nautica", conn);

            cmd.Parameters.Add("@ID_Nautica", OleDbType.Integer, 10).Value = Convert.ToInt32(IDNautica.Text);

            try
            {
                conn.Open();
                int recUpdated = cmd.ExecuteNonQuery();
                if (recUpdated <= 0)
                {
                    // Response.Write("Error en la query: update datos de empresa");
                    Response.Redirect("~/AfinanError.aspx?Error='Error en la query: borrando nautica '+IDNautica.Text");
                }
                else
                {
                    EliminaUsuarioenRoles(Usuario.Text);
                    EditMSG.Text = " El registro " + ViewState["IDNautica"] + " ha sido borrado.";
                    divConfirmDelete.Visible = false;
                    divDeleteInfo.Visible = true;
                }
            }
            catch (OleDbException oledbexcep)
            {
                // Response.Write(oledbexcep.Message);
                Response.Redirect("~/AfinanError.aspx?Error='" + oledbexcep.Message + "'");
            }
            finally
            {
                conn.Close();
            }

        }

        protected void Cancel_Delete(object sender, EventArgs e)
        {
            PanelDatosNautica.Enabled = true;
            divConfirmDelete.Visible = false;
            divDeleteInfo.Visible = false;

        }
        protected void Confirm_Deleted(object sender, EventArgs e)
        {
            PanelDatosNautica.Enabled = true;
            divConfirmDelete.Visible = false;
            divDeleteInfo.Visible = false;
            Response.Redirect("~/Admin/ListaNauticas.aspx");
        }
        

        
    }
}