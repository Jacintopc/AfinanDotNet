using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

//using System.Web.Security;
using System.Web.Configuration;
using System.Data;
using System.Data.OleDb;

using System.Web.UI.HtmlControls;


namespace AfinanDotNet2._0
{
    public partial class WebForm1 : System.Web.UI.Page
    {

        protected void abrebasedatos()
        {
            
            string myConnectionString = WebConfigurationManager.ConnectionStrings["DBAfinanConnectionString"].ConnectionString;
            string mySqlQueryNauticas = "SELECT count(*) FROM [Users] WHERE [Username]='AFINAN';";
            OleDbConnection myConnection = new OleDbConnection(myConnectionString);
            OleDbCommand myCommandNauticas = new OleDbCommand(mySqlQueryNauticas, myConnection);
            
            using (myConnection)
                try
                {
                    myConnection.Open();
                    Int32 ExisteAfinan = (Int32)myCommandNauticas.ExecuteScalar();
                }
                catch (Exception ex)
                {
                    Response.Redirect("~/AfinanError.aspx?Error='" + ex.Message + "'");
                }
                finally
                {
                    myConnection.Close();

                }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                HtmlGenericControl gc = Master.FindControl("MenuPrincipal") as HtmlGenericControl;
                if (gc != null) gc.Visible = false;  
                gc = Master.FindControl("MenuPrincipalAdm") as HtmlGenericControl;
                if (gc != null) gc.Visible = false;
                gc = Master.FindControl("LogonUserInfo") as HtmlGenericControl;
                if (gc != null) gc.Visible = false;
                // @jacinto: abrir la conexión a la base de datos para intentar corregir el problema de que el primer logon no entra
                // abrebasedatos(); 
            }
            LoginAfinan.Focus();
        }

        protected void UsuarioLoggedIn(object sender, EventArgs e)
        {
            Response.Redirect("~/User/Presupuestos.aspx");
        }

    }
}