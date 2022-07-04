using System;
using System.Data.OleDb;
using System.Web.Configuration;

using System.Web.Security;
using System.Collections.Specialized;
using System.Configuration;


namespace AfinanDotNet2._0.Admin
{
    public partial class ImportDatabase : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Importar_Click(object sender, EventArgs e)
        {
        
        //
        // Leer la base de datos de una tabla access
        //

            string myConnectionString = WebConfigurationManager.ConnectionStrings["DBAfinanConnectionString"].ConnectionString;

            OleDbConnection conn = new OleDbConnection(myConnectionString);
            OleDbCommand cmd = new OleDbCommand("SELECT ID_Nautica, Activo_Nau, Empresa_Nau, Nombre_Vendedor, Email_Nau, Password_Nau, Telf_Movil_Nau," +
                                                "Fax_Nau, Login_Nau, Role_Nau " +
                                                "FROM [Nauticas-old] " +
                                                "WHERE Activo_Nau = true "+
                                                "ORDER BY ID_Nautica", conn);
            OleDbDataReader reader = null;

            string estado = "Leyendo registros para crear usuarios...";
            object User_ID;
            int NumRegistros_added = 0;

            try
            {
                conn.Open();
                reader = cmd.ExecuteReader();
                while (reader.Read())         // crear usuario
                {
                    // CreateUser(string username, string password, string email, string passwordQuestion, string passwordAnswer, 
                    //            bool isApproved, object providerUserKey, Empresa, Movil, Fax,...  out MembershipCreateStatus status)

                    estado = "Creando usuario";                    
                    User_ID = Guid.NewGuid();

                    CreateUserAfinan( reader["Login_Nau"].ToString(), reader["Password_Nau"].ToString(), reader["Email_Nau"].ToString(), "Password Question", "Password Answer",
                                     Convert.ToBoolean(reader["Activo_Nau"].ToString()), User_ID, reader["Empresa_Nau"].ToString(), reader["Nombre_Vendedor"].ToString(), reader["Telf_Movil_Nau"].ToString(),
                                     reader["Fax_Nau"].ToString(), reader["Role_Nau"].ToString(), out estado);

                    if (estado == "Registro añadido")  NumRegistros_added += 1;
                    else //Response.Write(estado+" ("+reader["ID_Nautica"].ToString() +")");
                       Response.Redirect("~/AfinanError.aspx?Error='" + estado + " (" + reader["ID_Nautica"].ToString() + "'");
                        
                }
                RegistrosImportados.Text = NumRegistros_added.ToString();

            }
            catch (OleDbException OleDB_exception)
            {
                // Response.Write(OleDB_exception.Message);
                Response.Redirect("~/AfinanError.aspx?Error='" + OleDB_exception.Message + "'");
            }
            finally
            {
                if (reader != null) { reader.Close(); }
                conn.Close();
            }

        }

        public void CreateUserAfinan(string username,
            string password,
            string email,
            string passwordQuestion,
            string passwordAnswer,
            bool   isApproved,
            object providerUserKey,  // User_ID = Guid.NewGuid();
            string empresa,
            string vendedor,
            string movil,
            string fax,
            string role,
            out string status)
        {

            status = "Error añadiendo registro: " + username;
            MembershipCreateStatus st = new MembershipCreateStatus(); 
            Afinan_MembershipProvider mp = new Afinan_MembershipProvider();

            string configPath = "~/web.config";
            Configuration config = WebConfigurationManager.OpenWebConfiguration(configPath);
            MembershipSection section = (MembershipSection)config.GetSection("system.web/membership");
            ProviderSettingsCollection settings = section.Providers;
            NameValueCollection membershipParams = settings[section.DefaultProvider].Parameters;
            mp.Initialize(section.DefaultProvider, membershipParams);

            mp.CreateUser(username,password,email,passwordQuestion,passwordAnswer,isApproved, providerUserKey, out st);

            if (st == MembershipCreateStatus.Success)
            {
                string myConnectionString = WebConfigurationManager.ConnectionStrings["DBAfinanConnectionString"].ConnectionString;
                OleDbConnection conn = new OleDbConnection(myConnectionString);
                OleDbCommand cmd = new OleDbCommand("UPDATE [Users] SET [Empresa] = @Empresa, [Vendedor] = @Vendedor, [Movil] = @Movil,"+
                                                    "[Fax]= @Fax WHERE [Username] = @Username" , conn);

                cmd.Parameters.Add("@Empresa", OleDbType.VarChar,50).Value = empresa;
                cmd.Parameters.Add("@Vendedor", OleDbType.VarChar,50).Value = vendedor;
                cmd.Parameters.Add("@Movil", OleDbType.VarChar,50).Value = movil;
                cmd.Parameters.Add("@Fax", OleDbType.VarChar,50).Value = fax;
                cmd.Parameters.Add("@Username", OleDbType.VarChar, 255).Value = username;

                try
                {
                    conn.Open();
                    int recUpdated = cmd.ExecuteNonQuery();
                    if (recUpdated <= 0)
                    {
                        status = "Error en la query: update datos de empresa";
                    }
                    else
                    {
                        status = "Registro añadido";
                        string[] Listausers = {username}; 
                        string[] Listaroles = {role};

                        Afinan_RoleProvider rp = new Afinan_RoleProvider();

                        RoleManagerSection rolesection = (RoleManagerSection)config.GetSection("system.web/roleManager");
                        //RoleProviderCollection; 
                        ProviderSettingsCollection rolesettings = rolesection.Providers;
                        NameValueCollection roleManagerParams = rolesettings[rolesection.DefaultProvider].Parameters;
                        rp.Initialize(rolesection.DefaultProvider, roleManagerParams);
                        
                        rp.AddUsersToRoles(Listausers, Listaroles);
                      
                    }
                }
                catch (OleDbException e)
                {
                    status = "Exception in executenonquery";
                    // Response.Write (e.Message);
                    Response.Redirect("~/AfinanError.aspx?Error='" + e.Message + "'");
                }
                finally
                {
                    conn.Close();
                }

            }
            
        }
         
    }
}