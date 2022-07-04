using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Web.Configuration;
using System.Data;
using System.Data.OleDb;
using System.Web.UI.HtmlControls;


namespace AfinanDotNet2._0.User
{
    public partial class Presupuesto : System.Web.UI.Page
    {
        public static string IDPresupuesto = "";
        public static string Capitalize(string value)
        {
            return System.Globalization.CultureInfo.CurrentCulture.TextInfo.ToTitleCase(value);
        }

        protected void LeeDatosNautica()
        {
            //a partir del usuario (único) debe buscar la náutica y guardar los datos de la nautica (Nombre, Vendedor, Telefono, Fax y E-mail)

            string myConnectionString = WebConfigurationManager.ConnectionStrings["DBAfinanConnectionString"].ConnectionString;
            string mySqlQueryNauticas = "SELECT [IDNautica], [Empresa], [Vendedor], [Email], [Movil], [Fax] " +
                                        "FROM [Users] WHERE [Username]='" + User.Identity.Name + "';";

            OleDbConnection myConnection = new OleDbConnection(myConnectionString);
            OleDbCommand myCommandNauticas = new OleDbCommand(mySqlQueryNauticas, myConnection);

            using (myConnection)
                try
                {
                    myConnection.Open();
                    OleDbDataAdapter da = new OleDbDataAdapter(mySqlQueryNauticas, myConnection);
                    DataSet ds = new DataSet();
                    da.Fill(ds);
                    myConnection.Close();


                    if (ds.Tables[0].Rows.Count > 0)  //  Carga de valores del presupuesto
                    {
                        IDNautica.Text = "";
                        if (ds.Tables[0].Rows[0]["IDNautica"] != DBNull.Value) { IDNautica.Text = ds.Tables[0].Rows[0]["IDNautica"].ToString().Trim().PadLeft(5, '0'); }

                        Empresa_Nau.Text = "";
                        if (ds.Tables[0].Rows[0]["Empresa"] != DBNull.Value) { Empresa_Nau.Text = ds.Tables[0].Rows[0]["Empresa"].ToString().Trim(); }

                        Vendedor.Text = "";
                        if (ds.Tables[0].Rows[0]["Vendedor"] != DBNull.Value) { Vendedor.Text = ds.Tables[0].Rows[0]["Vendedor"].ToString().Trim(); }

                        Telf_Movil_Nau.Text = "";
                        if (ds.Tables[0].Rows[0]["Movil"] != DBNull.Value) { Telf_Movil_Nau.Text = ds.Tables[0].Rows[0]["Movil"].ToString().Trim(); }

                        Fax_Nau.Text = "";
                        if (ds.Tables[0].Rows[0]["Fax"] != DBNull.Value) { Fax_Nau.Text = ds.Tables[0].Rows[0]["Fax"].ToString().Trim(); }

                        Email_Nau.Text = "";
                        if (ds.Tables[0].Rows[0]["Email"] != DBNull.Value) { Email_Nau.Text = ds.Tables[0].Rows[0]["Email"].ToString().Trim(); }

                        if (IDPresupuesto == "")
                            IDPresupuesto = DateTime.Now.Year.ToString("D4") + DateTime.Now.Month.ToString("D2") +
                                            DateTime.Now.Day.ToString("D2") + "-" + IDNautica.Text;
                        Referencia.Text = IDPresupuesto;
                    }
                    da.Dispose();
                    ds.Dispose();

                }
                catch (Exception ex3)
                {
                    labelerrores.Text += " Select LeeDatosNautica: " + ex3.Message;
                    // Response.Write(labelerrores.Text);
                    Response.Redirect("~/AfinanError.aspx?Error='" + labelerrores.Text + "'");
                        
                }

        }

        protected void Page_Load(object sender, EventArgs e)
        {
            labelerrores.Text = "   ";

            if (!IsPostBack) 
            {
                LeeDatosNautica();
                HtmlGenericControl gc = Master.FindControl("MenuPrincipalAdm") as HtmlGenericControl;
                if (gc != null && User.IsInRole("Admin")) gc.Visible = true;
                else gc.Visible = false;

                // MostrarOpcionesAvanzadas.Checked = false;
                // ExtrasyAccesorios.Visible = false;
                // ServiciosdeRenting.Visible = false;
                
                /*
                RBtnEntradaNeto.Checked = true;
                Entrada.Visible = RBtnEntradaNeto.Checked;
                EntradaPorc.Visible = !(RBtnEntradaNeto.Checked);
                Entrada.Enabled = RBtnEntradaNeto.Checked;
                EntradaPorc.Enabled = !(RBtnEntradaNeto.Checked);
                */

                Borrar(sender,e);

                RBtnEntradaNeto.Checked = true; 
                MostrarOpcionesAvanzadas.Checked = false;               
                
                Tratamiento.Focus();
            }
            
            MostrarOpcionesAvanzadas.InputAttributes.Add("onclick", "SwitchAdvancedOptions(this.id);");  //@jacinto: debería estar en !IsPostBack pero al pulsar calcular desaparece.
            RBtnEntradaNeto.InputAttributes.Add("onclick", "EntradaNetoClicked(this.id);");              //@jacinto: debería estar en !IsPostBack pero al pulsar calcular desaparece.
            RBtnEntradaPorc.InputAttributes.Add("onclick", "EntradaNetoClicked(this.id);");              //@jacinto: debería estar en !IsPostBack pero al pulsar calcular desaparece.
            
            if (MostrarOpcionesAvanzadas.Checked)
            {
                ExtrasyAccesorios.Style["display"]= "block";
                ServiciosdeRenting.Style["display"] = "block";
            }
            else
            {
                ExtrasyAccesorios.Style["display"] = "none";
                ServiciosdeRenting.Style["display"] = "none";
            }

            if (RBtnEntradaNeto.Checked)
            {
                Entrada.Style["display"] = "block";
                EntradaPorc.Style["display"] = "none";
            }
            else
            {
                Entrada.Style["display"] = "none";
                EntradaPorc.Style["display"] = "block";
            
            }
            Page.Form.DefaultButton = BtnCalcular.UniqueID;
            if (IDPresupuesto != null) Referencia.Text = IDPresupuesto;
            else
            {
                //Response.Write("IDPresupuesto = Null");
                Response.Redirect("~/AfinanError.aspx?Error=' IDPresupuesto = Null'");
            }

        }
        
        protected double AdaptaStringToDouble(string valortexto)
        {
            double valordevuelta = 0;
            valortexto = valortexto.Replace(" ","");
            valortexto = valortexto.Replace(".", "");

            string textolimpio = "";
            int posultimacoma = valortexto.LastIndexOf(",");
            if (posultimacoma == valortexto.Length) 
            { 
                valortexto = valortexto.Replace(",", ""); 
            }
            else if (posultimacoma >= 0)
            {
                valortexto = valortexto.Substring(0, posultimacoma).Replace(",", "") + valortexto.Substring(posultimacoma);
            }

            for (int i = 0; i < valortexto.Length; i++){               
                if ( char.IsNumber(valortexto, i) || valortexto.Substring(i, 1)=="," )                //char.IsPunctuation(valortexto, i)))
                {
                    textolimpio += valortexto.Substring(i, 1);
                }
            }

            if (string.IsNullOrEmpty(textolimpio))   // ((valortexto == null) || (valortexto == "") )
            {
                valordevuelta = 0.00;
            }
            else
            {
                //valortexto = textolimpio.Replace(".", ",");  
                valordevuelta = Convert.ToDouble(textolimpio);
            }

            return valordevuelta;
        }

        protected double AdaptaStringToInteger(string valortexto)
        {
            Int32 valordevuelta = 0;

            if (string.IsNullOrEmpty(valortexto.Trim()))   // ((valortexto == null) || (valortexto == ""))
            {
                valordevuelta = 0;
            }
            else
            {
                valordevuelta = Convert.ToInt32(valortexto);
            }

            return valordevuelta;
        }

        protected void Borrar(object sender, EventArgs e)
        {
            // ID_Presupuesto=0;
            // ID_Nautica.value=0;
            // Sold=false;

            Tratamiento.SelectedIndex = 0;
            Apellidos.Text = "";
            Nombre.Text = "";
            TelefonoCl.Text = "";
            EmailCl.Text = "";
            Domicilio.SelectedIndex = 0;

            Tipo.SelectedIndex = 0;
            MarcaModelo.Text = "";
            Eslora.Text = "0,0";
            ValorsinIVA.Text = "0,0";
            Lista6o7.SelectedIndex = 1;
            Zona.SelectedIndex = 2;
            
            InstalacionMotores.Text = "0,0";
            SiInstalaMot.Checked = false;

            Remolque.Text = "0,0";
            SiRemolque.Checked = false;

            Fundas.Text = "0,0";
            SiFundas.Checked = false;

            OtrosExtras.Text = "0,0";
            SiOtrosExtras.Checked = false;

            TotalExtras.Text = "0,0";
            LabelImpuestoMatriculacion.Text = "0";
            ImpuestoMatricula.Text = "0,0";

            ImpuestoMatricula.Text = "0,0";
            SiImpMat.Checked = false;

            Mantenimiento.Text = "0,0";
            SiManten.Checked = false;

            Parking.Text = "0,0";
            SiParking.Checked = false;

            Desinvernaje.Text = "0,0";
            SiDesinv.Checked = false;

            OtrosServicios.Text = "0,0";
            SiOtrosS.Checked = false;

            TotalServicios.Text = "0,0";

            DDLPlazoRenting.SelectedIndex = 6;

            RBtnEntradaNeto.Checked = true;
            Entrada.Text = "0,0";
            EntradaPorc.Text = "0,0";

            DropDownListValorResidual.SelectedIndex = 0;

            //MostrarOpcionesAvanzadas.Checked = false;
            //ExtrasyAccesorios.Visible = false;
            //ServiciosdeRenting.Visible = false;

            /*
            RBtnEntradaNeto.Checked = true;
            RBtnEntradaPorc.Checked = false;
            
            Entrada.Visible = RBtnEntradaNeto.Checked;
            EntradaPorc.Visible = !(RBtnEntradaNeto.Checked);
            Entrada.Enabled = RBtnEntradaNeto.Checked;
            EntradaPorc.Enabled = !(RBtnEntradaNeto.Checked);
            */

            // RBtnEntradaNeto.Checked = true;
            // Entrada.Style["display"]= "block";
            // EntradaPorc.Style["display"] = "none";      

            NumerodeCuotas.Text= "0";
            ImportedelasCuotas.Text = "0 €";
            ValorResidualCuotas.Text= "0 €";

            LabelIVACuotas.Text = " ";

            if (IDPresupuesto.Length < 14 ) { LeeDatosNautica(); }

            Referencia.Text = IDPresupuesto;
            
            Tratamiento.Focus();
        }


        protected void CalculaCuotas(object sender, EventArgs e)
        {
            double BaseImponible = AdaptaStringToDouble(ValorsinIVA.Text);
                
            if (BaseImponible != 0)
            {
                string myConnectionString = WebConfigurationManager.ConnectionStrings["DBAfinanConnectionString"].ConnectionString;
                string mySqlQuery = "Select * from Ajustes";
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

                        if (ds.Tables[0].Rows.Count > 0)  //  Carga de Parámetros
                        {

                            //  ************************************************************
                            //                Carga de Parámetros
                            //  ************************************************************

                            //string passwordQuestion = "";
                            //if (reader.GetValue(3) != DBNull.Value)
                            //    passwordQuestion = reader.GetString(3);

                            double VTasa24 = 0;
                            if (ds.Tables[0].Rows[0]["Tasa_24"] != DBNull.Value) { VTasa24 = Convert.ToDouble(ds.Tables[0].Rows[0]["Tasa_24"]);}   // 2 años: es el porcentaje de tasa de cálculo utilizado para 24 meses
                            double VTasa36 = 0;
                            if (ds.Tables[0].Rows[0]["Tasa_36"] != DBNull.Value) { VTasa36 = Convert.ToDouble(ds.Tables[0].Rows[0]["Tasa_36"]);}    // 3 años 
                            double VTasa48 = 0;
                            if (ds.Tables[0].Rows[0]["Tasa_48"] != DBNull.Value) { VTasa48 = Convert.ToDouble(ds.Tables[0].Rows[0]["Tasa_48"]);}   // 4 años 
                            double VTasa60 = 0;
                            if (ds.Tables[0].Rows[0]["Tasa_60"] != DBNull.Value) { VTasa60 = Convert.ToDouble(ds.Tables[0].Rows[0]["Tasa_60"]);}  // 5 años 
                            double VTasa72 = 0;
                            if (ds.Tables[0].Rows[0]["Tasa_72"] != DBNull.Value) { VTasa72 = Convert.ToDouble(ds.Tables[0].Rows[0]["Tasa_72"]);}    // 6 años 
                            double VTasa84 = 0;
                            if (ds.Tables[0].Rows[0]["Tasa_84"] != DBNull.Value) { VTasa84 = Convert.ToDouble(ds.Tables[0].Rows[0]["Tasa_84"]);}   // 7 años    
                            double VTasa96 = 0;
                            if (ds.Tables[0].Rows[0]["Tasa_96"] != DBNull.Value) { VTasa96 = Convert.ToDouble(ds.Tables[0].Rows[0]["Tasa_96"]);}  // 8 años
                            double VTasa108 = 0;
                            if (ds.Tables[0].Rows[0]["Tasa_108"] != DBNull.Value) { VTasa108 = Convert.ToDouble(ds.Tables[0].Rows[0]["Tasa_108"]);}  // 9 años
                            double VTasa120 = 0;
                            if (ds.Tables[0].Rows[0]["Tasa_120"] != DBNull.Value) { VTasa120 = Convert.ToDouble(ds.Tables[0].Rows[0]["Tasa_120"]);}  // 10 años

                            double ValorResidualFinal = 0; 
                            double VValorResidual = 0;
                            if (ds.Tables[0].Rows[0]["Valor_Residual"] != DBNull.Value) { VValorResidual = Convert.ToDouble(ds.Tables[0].Rows[0]["Valor_Residual"]);}
                            double VComisAF = 0;
                            if (ds.Tables[0].Rows[0]["Comis_AF"] != DBNull.Value) { VComisAF = Convert.ToDouble(ds.Tables[0].Rows[0]["Comis_AF"]);}

                            double VImpMatriculaBarcosPeninsula = 0;
                            if (ds.Tables[0].Rows[0]["ImpMatr_BarcosPeninsula"] != DBNull.Value) { VImpMatriculaBarcosPeninsula = Convert.ToDouble(ds.Tables[0].Rows[0]["ImpMatr_BarcosPeninsula"]);}    // Indica el % del impuesto Matriculación 
                            double VImpMatriculaBarcosCanarias = 0;
                            if (ds.Tables[0].Rows[0]["ImpMatr_BarcosCanarias"] != DBNull.Value) { VImpMatriculaBarcosCanarias = Convert.ToDouble(ds.Tables[0].Rows[0]["ImpMatr_BarcosCanarias"]);}
                            double VImpMatriculaMotosPeninsula = 0;
                            if (ds.Tables[0].Rows[0]["ImpMatr_MotosPeninsula"] != DBNull.Value) { VImpMatriculaMotosPeninsula = Convert.ToDouble(ds.Tables[0].Rows[0]["ImpMatr_MotosPeninsula"]);}
                            double VImpMatriculaMotosCanarias = 0;
                            if (ds.Tables[0].Rows[0]["ImpMatr_MotosCanarias"] != DBNull.Value) { VImpMatriculaMotosCanarias = Convert.ToDouble(ds.Tables[0].Rows[0]["ImpMatr_MotosCanarias"]);}

                            double VGest61 = 0;
                            if (ds.Tables[0].Rows[0]["Gest_61"] != DBNull.Value) { VGest61 = Convert.ToDouble(ds.Tables[0].Rows[0]["Gest_61"]);}      // Gasto asignado de Gestoría en lista “6” y Zona “1”
                            double VGest71 = 0;
                            if (ds.Tables[0].Rows[0]["Gest_71"] != DBNull.Value) { VGest71 = Convert.ToDouble(ds.Tables[0].Rows[0]["Gest_71"]);}      // Gasto asignado de Gestoría en lista “7” y Zona “1”
                            double VGest62 = 0;
                            if (ds.Tables[0].Rows[0]["Gest_62"] != DBNull.Value) { VGest62 = Convert.ToDouble(ds.Tables[0].Rows[0]["Gest_62"]);}      // Gasto asignado de Gestoría en lista “6” y Zona “2”
                            double VGest72 = 0;
                            if (ds.Tables[0].Rows[0]["Gest_72"] != DBNull.Value) { VGest72 = Convert.ToDouble(ds.Tables[0].Rows[0]["Gest_72"]);}
                            double VGest63 = 0;
                            if (ds.Tables[0].Rows[0]["Gest_63"] != DBNull.Value) { VGest63 = Convert.ToDouble(ds.Tables[0].Rows[0]["Gest_63"]);}
                            double VGest73 = 0;
                            if (ds.Tables[0].Rows[0]["Gest_73"] != DBNull.Value) { VGest73 = Convert.ToDouble(ds.Tables[0].Rows[0]["Gest_73"]);}
                            double VGest64 = 0;
                            if (ds.Tables[0].Rows[0]["Gest_64"] != DBNull.Value) { VGest64 = Convert.ToDouble(ds.Tables[0].Rows[0]["Gest_64"]);}
                            double VGest74 = 0;
                            if (ds.Tables[0].Rows[0]["Gest_74"] != DBNull.Value) { VGest74 = Convert.ToDouble(ds.Tables[0].Rows[0]["Gest_74"]);}
                            double VGest65 = 0;
                            if (ds.Tables[0].Rows[0]["Gest_65"] != DBNull.Value) { VGest65 = Convert.ToDouble(ds.Tables[0].Rows[0]["Gest_65"]);}
                            double VGest75 = 0;
                            if (ds.Tables[0].Rows[0]["Gest_75"] != DBNull.Value) { VGest75 = Convert.ToDouble(ds.Tables[0].Rows[0]["Gest_75"]);}
                            double VGest66 = 0;
                            if (ds.Tables[0].Rows[0]["Gest_66"] != DBNull.Value) { VGest66 = Convert.ToDouble(ds.Tables[0].Rows[0]["Gest_66"]);}
                            double VGest76 = 0;
                            if (ds.Tables[0].Rows[0]["Gest_76"] != DBNull.Value) { VGest76 = Convert.ToDouble(ds.Tables[0].Rows[0]["Gest_76"]);}
                            double VGest67 = 0;
                            if (ds.Tables[0].Rows[0]["Gest_67"] != DBNull.Value) { VGest67 = Convert.ToDouble(ds.Tables[0].Rows[0]["Gest_67"]);}
                            double VGest77 = 0;
                            if (ds.Tables[0].Rows[0]["Gest_77"] != DBNull.Value) { VGest77 = Convert.ToDouble(ds.Tables[0].Rows[0]["Gest_77"]);}

                            double VGestMotoAgua = 0;
                            if (ds.Tables[0].Rows[0]["Gest_Moto_Agua"] != DBNull.Value) { VGestMotoAgua = Convert.ToDouble(ds.Tables[0].Rows[0]["Gest_Moto_Agua"]);}      // Coste Gestoría para motos de agua
                            double VGestMotor = 0;
                            if (ds.Tables[0].Rows[0]["Gest_Motor"] != DBNull.Value) { VGestMotor = Convert.ToDouble(ds.Tables[0].Rows[0]["Gest_Motor"]);}
                            double VGestOtros = 0;
                            if (ds.Tables[0].Rows[0]["Gest_Otros"] != DBNull.Value) { VGestOtros = Convert.ToDouble(ds.Tables[0].Rows[0]["Gest_Otros"]);}

                            double VSegd61 = 0;
                            if (ds.Tables[0].Rows[0]["Segd_61"] != DBNull.Value) { VSegd61 = Convert.ToDouble(ds.Tables[0].Rows[0]["Segd_61"]);}       //  Gasto asignado de Seguridad Barco lista “6” y Zona “1”
                            double VSegd71 = 0;
                            if (ds.Tables[0].Rows[0]["Segd_71"] != DBNull.Value) { VSegd71 = Convert.ToDouble(ds.Tables[0].Rows[0]["Segd_71"]);}
                            double VSegd62 = 0;
                            if (ds.Tables[0].Rows[0]["Segd_62"] != DBNull.Value) { VSegd62 = Convert.ToDouble(ds.Tables[0].Rows[0]["Segd_62"]);}
                            double VSegd72 = 0;
                            if (ds.Tables[0].Rows[0]["Segd_72"] != DBNull.Value) { VSegd72 = Convert.ToDouble(ds.Tables[0].Rows[0]["Segd_72"]);}
                            double VSegd63 = 0;
                            if (ds.Tables[0].Rows[0]["Segd_63"] != DBNull.Value) { VSegd63 = Convert.ToDouble(ds.Tables[0].Rows[0]["Segd_63"]);}
                            double VSegd73 = 0;
                            if (ds.Tables[0].Rows[0]["Segd_73"] != DBNull.Value) { VSegd73 = Convert.ToDouble(ds.Tables[0].Rows[0]["Segd_73"]);}
                            double VSegd64 = 0;
                            if (ds.Tables[0].Rows[0]["Segd_64"] != DBNull.Value) { VSegd64 = Convert.ToDouble(ds.Tables[0].Rows[0]["Segd_64"]);}
                            double VSegd74 = 0;
                            if (ds.Tables[0].Rows[0]["Segd_74"] != DBNull.Value) { VSegd74 = Convert.ToDouble(ds.Tables[0].Rows[0]["Segd_74"]);}
                            double VSegd65 = 0;
                            if (ds.Tables[0].Rows[0]["Segd_65"] != DBNull.Value) { VSegd65 = Convert.ToDouble(ds.Tables[0].Rows[0]["Segd_65"]);}
                            double VSegd75 = 0;
                            if (ds.Tables[0].Rows[0]["Segd_75"] != DBNull.Value) { VSegd75 = Convert.ToDouble(ds.Tables[0].Rows[0]["Segd_75"]);}
                            double VSegd66 = 0;
                            if (ds.Tables[0].Rows[0]["Segd_66"] != DBNull.Value) { VSegd66 = Convert.ToDouble(ds.Tables[0].Rows[0]["Segd_66"]);}
                            double VSegd76 = 0;
                            if (ds.Tables[0].Rows[0]["Segd_76"] != DBNull.Value) { VSegd76 = Convert.ToDouble(ds.Tables[0].Rows[0]["Segd_76"]);}
                            double VSegd67 = 0;
                            if (ds.Tables[0].Rows[0]["Segd_67"] != DBNull.Value) { VSegd67 = Convert.ToDouble(ds.Tables[0].Rows[0]["Segd_67"]);}
                            double VSegd77 = 0;
                            if (ds.Tables[0].Rows[0]["Segd_77"] != DBNull.Value) { VSegd77 = Convert.ToDouble(ds.Tables[0].Rows[0]["Segd_77"]);}

                            double VSegdMotoAgua = 0;
                            if (ds.Tables[0].Rows[0]["Segd_Moto_Agua"] != DBNull.Value) { VSegdMotoAgua = Convert.ToDouble(ds.Tables[0].Rows[0]["Segd_Moto_Agua"]);}
                            double VSegdMotor = 0;
                            if (ds.Tables[0].Rows[0]["Segd_Motor"] != DBNull.Value) { VSegdMotor = Convert.ToDouble(ds.Tables[0].Rows[0]["Segd_Motor"]);}
                            double VSegdOtros = 0;
                            if (ds.Tables[0].Rows[0]["Segd_Otros"] != DBNull.Value) { VSegdOtros = Convert.ToDouble(ds.Tables[0].Rows[0]["Segd_Otros"]);}

                            double VContratFees = 0;
                            if (ds.Tables[0].Rows[0]["Contract_Fees"] != DBNull.Value) { VContratFees = Convert.ToDouble(ds.Tables[0].Rows[0]["Contract_Fees"]);}

                            double VIVA = 0;
                            if (ds.Tables[0].Rows[0]["IVA"] != DBNull.Value) { VIVA = Convert.ToDouble(ds.Tables[0].Rows[0]["IVA"]);}      // Porcentual del impuesto de valor añadido
                            double VIGICGeneral = 0;
                            if (ds.Tables[0].Rows[0]["IGIC_General"] != DBNull.Value) { VIGICGeneral = Convert.ToDouble(ds.Tables[0].Rows[0]["IGIC_General"]);}
                            double VIGICAlto = 0;
                            if (ds.Tables[0].Rows[0]["IGIC_Alto"] != DBNull.Value) { VIGICAlto = Convert.ToDouble(ds.Tables[0].Rows[0]["IGIC_Alto"]);}
                            double VIGICBajo = 0;
                            if (ds.Tables[0].Rows[0]["IGIC_Bajo"] != DBNull.Value) { VIGICBajo = Convert.ToDouble(ds.Tables[0].Rows[0]["IGIC_Bajo"]);}

                            double CuotaGestoria = 0;
                            if (ds.Tables[0].Rows[0]["Cuota_Gestoria"] != DBNull.Value) { CuotaGestoria = Convert.ToDouble(ds.Tables[0].Rows[0]["Cuota_Gestoria"]);}
                            double CuotaMaterial = 0;
                            if (ds.Tables[0].Rows[0]["Cuota_Material"] != DBNull.Value) { CuotaMaterial = Convert.ToDouble(ds.Tables[0].Rows[0]["Cuota_Material"]);}

                            //  **********************************************
                            //       Cálculo de los valores para la fórmula
                            //  **********************************************

                            // Incrementaremos la base imposible con los diversos extras si los check-box están activos

                            Apellidos.Text = Apellidos.Text.ToUpper();
                            Nombre.Text = Capitalize(Nombre.Text);

                            if (SiInstalaMot.Checked) BaseImponible += AdaptaStringToDouble(InstalacionMotores.Text);
                            if (SiRemolque.Checked) BaseImponible += AdaptaStringToDouble(Remolque.Text);
                            if (SiFundas.Checked) BaseImponible += AdaptaStringToDouble(Fundas.Text);
                            if (SiOtrosExtras.Checked) BaseImponible += AdaptaStringToDouble(OtrosExtras.Text);

                            if (SiInstalaMot.Checked || SiRemolque.Checked || SiFundas.Checked || SiOtrosExtras.Checked)
                                TotalExtras.Text = Convert.ToString(BaseImponible - AdaptaStringToDouble(ValorsinIVA.Text));
                            else
                                TotalExtras.Text = "0,0";

                            double ImpuestoMatriculacion = 0.0;     // % de impuesto de matriculación  
                            // Por defecto NO hay impuesto de Matriculaciónen muchos casos… 0%    
                            // Pero en otros casos hay que computarlo

                            // Imp_Matricula_Barcos_Peninsula	=  12,00   // Indica el % del impuesto Matriculación 
                            // Imp_Matricula_Barcos_Canarias	=  11,00   
                            // Imp_Matricula_Motos_ Peninsula	=  14,75   
                            // Imp_Matricula_Motos_Canarias	    =  13,75


                            // Veamos si el Bien a financiar es de tipo barcos (flota pero no es una moto)
                            bool Flota = ((Tipo.SelectedIndex == 0) || (Tipo.SelectedIndex == 2) || (Tipo.SelectedIndex == 4) || (Tipo.SelectedIndex == 6));

                            if ((Domicilio.SelectedIndex == 1) && (Tipo.SelectedIndex == 2)) ImpuestoMatriculacion = VImpMatriculaMotosCanarias;   //Canarias & Motos Agua
                            else if ((Domicilio.SelectedIndex == 1) && (Flota) && (AdaptaStringToDouble(Eslora.Text) > 8))                            //Canarias & Flota & > 8m eslora
                                ImpuestoMatriculacion = VImpMatriculaBarcosCanarias;
                            if ((Domicilio.SelectedIndex == 0) && (Tipo.SelectedIndex == 2)) ImpuestoMatriculacion = VImpMatriculaMotosPeninsula;  //Peninsula & Motos Agua
                            else if ((Domicilio.SelectedIndex == 0) && (Flota) && (AdaptaStringToDouble(Eslora.Text) > 8))                            //Peninsula & Flota & > 8m eslora
                                ImpuestoMatriculacion = VImpMatriculaBarcosPeninsula;

                            double VImpuestoMatriculacion = BaseImponible * (ImpuestoMatriculacion) / 100; // neto del impuesto de matriculación
                            LabelImpuestoMatriculacion.Text = Convert.ToString(ImpuestoMatriculacion);
                            ImpuestoMatricula.Text = Convert.ToString(VImpuestoMatriculacion);

                            // Costes de Gestoria y de material de seguridad

                            // Por defecto los costes en material de seguridad son los definidos como Segd_Otros
                            // Por defecto los costes de Gestorias son los definidos como Gest_Otros
                            double CosteSeguridad = VSegdOtros;
                            double CosteGestoria = VGestOtros;

                            if (Tipo.SelectedIndex == 2)        // Motos Agua
                            {
                                CosteSeguridad = VSegdMotoAgua;
                                CosteGestoria = VGestMotoAgua;
                            }
                            else
                                if (Tipo.SelectedIndex == 3)    // Motor
                                {
                                    CosteSeguridad = VSegdMotor;
                                    CosteGestoria = VGestMotor;
                                }
                                else if (Flota)                      // Si no es motor, ni motos de agua, pero flota, entonces aplican las listas y zonas 
                                {
                                    if (Lista6o7.SelectedIndex == 0)    //  lista==6
                                    {
                                        if (Zona.SelectedIndex == 0)
                                        {     // zona==1
                                            CosteSeguridad = VSegd61;
                                            CosteGestoria = VGest61;
                                        }
                                        if (Zona.SelectedIndex == 1)
                                        {     // zona==2
                                            CosteSeguridad = VSegd62;
                                            CosteGestoria = VGest62;
                                        }
                                        if (Zona.SelectedIndex == 2)
                                        {     // zona==3
                                            CosteSeguridad = VSegd63;
                                            CosteGestoria = VGest63;
                                        }
                                        if (Zona.SelectedIndex == 3)
                                        {     // zona==4
                                            CosteSeguridad = VSegd64;
                                            CosteGestoria = VGest64;
                                        }
                                        if (Zona.SelectedIndex == 4)
                                        {     // zona==5
                                            CosteSeguridad = VSegd65;
                                            CosteGestoria = VGest65;
                                        }
                                        if (Zona.SelectedIndex == 5)
                                        {     // zona==6
                                            CosteSeguridad = VSegd66;
                                            CosteGestoria = VGest66;
                                        }
                                        if (Zona.SelectedIndex == 6)
                                        {     // zona==7 
                                            CosteSeguridad = VSegd67;
                                            CosteGestoria = VGest67;
                                        }
                                    }
                                    else                               // lista==7 
                                    {
                                        if (Zona.SelectedIndex == 0)
                                        {      // zona==1
                                            CosteSeguridad = VSegd71;
                                            CosteGestoria = VGest71;
                                        }
                                        if (Zona.SelectedIndex == 1)
                                        {      // zona==2
                                            CosteSeguridad = VSegd72;
                                            CosteGestoria = VGest72;
                                        }
                                        if (Zona.SelectedIndex == 2)
                                        {      // zona==3
                                            CosteSeguridad = VSegd73;
                                            CosteGestoria = VGest73;
                                        }
                                        if (Zona.SelectedIndex == 3)
                                        {      // zona==4
                                            CosteSeguridad = VSegd74;
                                            CosteGestoria = VGest74;
                                        }
                                        if (Zona.SelectedIndex == 4)
                                        {      // zona==5
                                            CosteSeguridad = VSegd75;
                                            CosteGestoria = VGest75;
                                        }
                                        if (Zona.SelectedIndex == 5)
                                        {      // zona==6
                                            CosteSeguridad = VSegd76;
                                            CosteGestoria = VGest76;
                                        }
                                        if (Zona.SelectedIndex == 6)
                                        {      // zona==7
                                            CosteSeguridad = VSegd77;
                                            CosteGestoria = VGest77;
                                        }
                                    }
                                }

                            // Ya tenemos la cuota total. Ahora calculamos el IVA
                            double CoefIVA = 0.0;

                            // Si el cliente es Canario, de entrada le asigno el IGI general sino el IVA general. 
                            string TipoImpuestoAplicable = " IVA";

                            if (Domicilio.SelectedIndex == 1)
                            {           // Canarias
                                TipoImpuestoAplicable = " IGIC";
                                if (Flota)
                                {
                                    if (AdaptaStringToDouble(Eslora.Text) <= 9)
                                        CoefIVA = VIGICBajo;
                                    else
                                        CoefIVA = VIGICAlto;
                                }
                                else
                                    CoefIVA = VIGICGeneral;
                            }
                            else
                                CoefIVA = VIVA;

                            LabelCoefIVA.Text = CoefIVA.ToString();

                            LabelIVACuotas.Text = "(" + Convert.ToString(CoefIVA) + "%" + TipoImpuestoAplicable + " incluido)";

                            //  Convierto el IVA conseguido a un coef listo para multiplicar. Por ejemplo de 16% paso a 1,16
                            CoefIVA = 1 + (CoefIVA / 100);


                            // Importe del impuesto de matriculación a financiar 
                            double ValorFinalImpMatricula = 0.0;  // neto del impuesto de matriculación después de la casuística

                            if (SiImpMat.Checked) ValorFinalImpMatricula = AdaptaStringToDouble(ImpuestoMatricula.Text);
                            else ValorFinalImpMatricula = 0.0;   // En principio NO añadimos el impuesto

                            double BaseTotal = (BaseImponible + ValorFinalImpMatricula + CosteGestoria + CosteSeguridad) * VComisAF;

                            // Veamos como sacamos la cantidad aportada como valor de entrada 
                            double EntradaSinIVA = 0.0;
                            
                            // @jacinto EntradaPorc.Text no puede ser >99 

                            if (RBtnEntradaNeto.Checked) EntradaSinIVA = AdaptaStringToDouble(Entrada.Text) / CoefIVA; // Quito el IVA
                            else EntradaSinIVA = BaseImponible * AdaptaStringToDouble(EntradaPorc.Text) / 100;

                            // Ahora restamos el impuesto de matriculación de la entrada si fuera necesario
                            // // if ((RBtnEntradaNeto.Checked) && (EntradaSinIVA >= ValorFinalImpMatricula))
                            // if (EntradaSinIVA >= ValorFinalImpMatricula)
                            // {
                            //    EntradaSinIVA -= ValorFinalImpMatricula;  //separamos el impuesto de la entrada
                            //    ValorFinalImpMatricula = 0.0;
                            // }

                            //  ahora ya podemos sumar y dejar la variable lista para invocar a PAGA()
                            double ValorActual = (BaseImponible + ValorFinalImpMatricula - EntradaSinIVA) * VComisAF;

                            // Calculamos el valor de la tasa
                            double Tasa = 0.0;

                            switch (DDLPlazoRenting.SelectedIndex)
                            {
                                case 0:
                                    Tasa = VTasa24;   // 2 años
                                    break;
                                case 1:
                                    Tasa = VTasa36;   // 3
                                    break;
                                case 2:
                                    Tasa = VTasa48;   // 4
                                    break;
                                case 3:
                                    Tasa = VTasa60;   // 5
                                    break;
                                case 4:
                                    Tasa = VTasa72;   // 6
                                    break;
                                case 5:
                                    Tasa = VTasa84;   // 7
                                    break;
                                case 6:
                                    Tasa = VTasa96;   // 8
                                    break;
                                case 7:
                                    Tasa = VTasa108;   // 9
                                    break;
                                case 8:
                                    Tasa = VTasa120;   // 10
                                    break;
                            }

                            double NumMeses = 12 + (DDLPlazoRenting.SelectedIndex + 1) * 12;

                            // Calculamos el valor de la cuota mensual   -Pago(Tasa, Plazo*12, VA, -Valor,1);
                            // Pagos = (-1)* Microsoft.VisualBasic.Financial.Pmt(interes/12, Nmeses, -importe,1);  -- aclarar los signos de valor y valor residual 
                            // Payment = Pmt(APR / 12, TotPmts, -PVal, FVal, PayType)
                            // http://msdn.microsoft.com/query/dev10.query?appId=Dev10IDEF1&l=EN-US&k=k(MICROSOFT.VISUALBASIC.FINANCIAL.PMT)

                            /*
            
                            Tipo	        eslora	    valor 	    lista	    zona 	    domicilio 	    años	entrada	    cuota con iva
                            Barco	        15	        25000	    7	        6	        peninsula	    5	    5000	    487,38
 
             
                            p1	            p2	        p3	        p4	        -pmt	        gastos	        total
                            0,004833333	    60	        20600	    -6	        396,2563389	    23,90053393	    420,16
            
                            =IF(valor_barco=0;" - ";-PMT(t_renting/12;duración_leasing;valor_barco+t_extras+c_afin-entrada;-IF(vr_bsr=0;6/valor_barco;vr_bsr)*valor_barco)+
                                                         Listas!I24 + Listas!I23 + 'Datos Renting'!Q4 + t_servicios/duración_leasing)
             
                            Tasa = 5.8;
                            NumMeses = 60;
                            ValorActual = 20600;
                            VValorResidual = 6;
             
                            */
                            
                            
                            switch (DropDownListValorResidual.SelectedIndex)
                            {                    
                                case 1:     // 5%
                                    ValorResidualFinal = AdaptaStringToDouble(ValorsinIVA.Text) * 0.05;
                                    break;
                                case 2:     // 10%
                                    ValorResidualFinal = AdaptaStringToDouble(ValorsinIVA.Text) * 0.1;
                                    break;
                                case 3:     // 15%
                                    ValorResidualFinal = AdaptaStringToDouble(ValorsinIVA.Text) * 0.15;
                                    break;
                                case 4:     // 20%
                                    ValorResidualFinal = AdaptaStringToDouble(ValorsinIVA.Text) * 0.20;
                                    break;
                                default:
                                    ValorResidualFinal = VValorResidual;
                                    break;
                            }
                            
                            double CuotaBase = (-1) * Microsoft.VisualBasic.Financial.Pmt(Tasa / 1200, NumMeses, ValorActual, (-1) * ValorResidualFinal, Microsoft.VisualBasic.DueDate.BegOfPeriod);
                            CuotaGestoria = (-1) * Microsoft.VisualBasic.Financial.Pmt(Tasa / 1200, NumMeses, CosteGestoria * VComisAF, 0);  //@alberto: en el excel está así sin Microsoft.VisualBasic.DueDate.BegOfPeriod
                            CuotaMaterial = (-1) * Microsoft.VisualBasic.Financial.Pmt(Tasa / 1200, NumMeses, CosteSeguridad * VComisAF, 0); //@alberto: en el excel está así sin Microsoft.VisualBasic.DueDate.BegOfPeriod


                            double CuotaFinal = CuotaBase + CuotaGestoria + CuotaMaterial + VContratFees;
                            double ImporteTotalServicios = 0.0;

                            if (SiManten.Checked) ImporteTotalServicios += AdaptaStringToDouble(Mantenimiento.Text);
                            if (SiParking.Checked) ImporteTotalServicios += AdaptaStringToDouble(Parking.Text);
                            if (SiDesinv.Checked) ImporteTotalServicios += AdaptaStringToDouble(Desinvernaje.Text);
                            if (SiOtrosS.Checked) ImporteTotalServicios += AdaptaStringToDouble(OtrosServicios.Text);

                            if (SiManten.Checked || SiParking.Checked || SiDesinv.Checked || SiOtrosS.Checked)
                            {
                                TotalServicios.Text = Convert.ToString(ImporteTotalServicios);
                                CuotaFinal += ImporteTotalServicios / 12;
                            }
                            else
                                TotalServicios.Text = "0,0";

                            NumerodeCuotas.Text = Convert.ToString(NumMeses);
                            LabelImportedelasCuotasSinIva.Text = CuotaFinal.ToString();
                            ImportedelasCuotas.Text = string.Format("{0:#,##0.00 €}", Math.Round(CuotaFinal * CoefIVA, 0));
                            ValorResidualCuotas.Text = string.Format("{0:#,##0. €}", Math.Round(ValorResidualFinal));
                            LabelValorResidualCuotas.Text = string.Format("{0:#,##0.00 €}", ValorResidualFinal);
                            
                            if (IDPresupuesto.Length < 14) { LeeDatosNautica(); }
                        }
                        da.Dispose();
                        ds.Dispose();
                    }
                    catch (Exception ex)
                    {
                        // Response.Write(ex.Message);
                        //labelerrores.Text = ex.Message;
                        Response.Redirect("~/AfinanError.aspx?Error='" + ex.Message + "'");
                    }
                    // The connection is automatically closed when the
                    // code exits the using block.
                    
                }

            }
            else
            {
                ImportedelasCuotas.Text = "0 €";
                ValorResidualCuotas.Text = "0 €";
            }

        }


        protected void Imprimir(object sender, EventArgs e)
        {
            double BaseImponible = AdaptaStringToDouble(ValorsinIVA.Text);
            
            if ((ImportedelasCuotas.Text != "0 €") && (BaseImponible != 0))
            {
                if (IDPresupuesto.Length < 14) { LeeDatosNautica(); }

                CalculaCuotas(sender, e); // vuelve a calcular por si se ha cambiado algún dato.
                double CoefIVA = 1 + (AdaptaStringToDouble(LabelCoefIVA.Text) / 100);
                
                // Guardar en la base de datos
                string mySqlQuery = "INSERT INTO [Presupuestos] ([ID_Nautica], [UserName], [Sold], [Nautica], [Nombre_Vendedor], [Telf_Movil_Nau],[Fax_Nau],[Email_Nau], [Tratamiento_cli], [Apellidos_cli], " +
                                    " [Nombre_cli], [Telf_Movil_cli], [Email_cli], [Tipo_Domicilio_cli], [ImpuestosAplicables], [Tipo_Bien], [Marca_Modelo], [Eslora], " +
                                    " [Valor_Sin_IVA], [Lista], [Zona], [Instala_Motor], [Remolque], [Fundas], [Otros_extras], [Instala_motor_boolean], " +
                                    " [Remolque_boolean], [Fundas_boolean], [Otros_extras_boolean], [Invernaje], [Pupilaje], [Desinvernaje], " +
                                    " [OtrosServicios], [Invernaje_boolean], [Pupilaje_boolean], [Desinvernaje_boolean], [OtrosServicios_boolean], " +
                                    " [Entrada_sin_iva], [Plazo], [NumerodeCuotas], [ImporteCuotasSinIva],[ValorResidual], [Created], [LastAccess], " +
                                    " [ImpuestoMatriculacion], [VImpuestoMatriculacion], [ImpuestoMatriculacion_boolean]) " +
                                    " VALUES (@ID_Nautica, @UserName, @Sold, @Nautica, @Nombre_Vendedor, @Telf_Movil_Nau, @Fax_Nau, @Email_Nau, @Tratamiento_cli, @Apellidos_cli, " +
                                    " @Nombre_cli, @Telf_Movil_cli, @Email_cli, @Tipo_Domicilio_cli, @ImpuestosAplicables, @Tipo_Bien, @Marca_Modelo, @Eslora, " +
                                    " @Valor_Sin_IVA, @Lista, @Zona, @Instala_Motor, @Remolque, @Fundas, @Otros_extras, @Instala_motor_boolean, " +
                                    " @Remolque_boolean, @Fundas_boolean, @Otros_extras_boolean, @Invernaje, @Pupilaje, @Desinvernaje, " +
                                    " @OtrosServicios, @Invernaje_boolean, @Pupilaje_boolean, @Desinvernaje_boolean, @OtrosServicios_boolean, " +
                                    " @Entrada_sin_iva, @Plazo, @NumerodeCuotas, @ImporteCuotasSinIva, @ValorResidual, @Created, @LastAccess, "+
                                    " @ImpuestoMatriculacion, @VImpuestoMatriculacion, @ImpuestoMatriculacion_boolean)";

                string myConnectionString = WebConfigurationManager.ConnectionStrings["DBAfinanConnectionString"].ConnectionString;
                OleDbConnection myConnection = new OleDbConnection(myConnectionString);
                
                using (myConnection)
                {
                    try
                    {
                        myConnection.Open();
                        OleDbCommand myCommand = new OleDbCommand(mySqlQuery, myConnection);
                        
                        myCommand.Parameters.Add("@ID_Nautica", OleDbType.Integer).Value = AdaptaStringToInteger(IDNautica.Text);
                        myCommand.Parameters.Add("@UserName", OleDbType.WChar).Value = User.Identity.Name;
                        myCommand.Parameters.Add("@Sold", OleDbType.Boolean).Value = Convert.ToBoolean("False");
                        myCommand.Parameters.Add("@Nautica", OleDbType.WChar).Value = Empresa_Nau.Text;
                        myCommand.Parameters.Add("@Nombre_Vendedor", OleDbType.WChar).Value = Vendedor.Text;
                        myCommand.Parameters.Add("@Telf_Movil_Nau", OleDbType.WChar).Value = Telf_Movil_Nau.Text;
                        myCommand.Parameters.Add("@Fax_Nau", OleDbType.WChar).Value = Fax_Nau.Text;
                        myCommand.Parameters.Add("@Email_Nau", OleDbType.WChar).Value = Email_Nau.Text;
                        
                        myCommand.Parameters.Add("@Tratamiento_cli", OleDbType.WChar).Value = Tratamiento.Text;
                        myCommand.Parameters.Add("@Apellidos_cli", OleDbType.WChar).Value = Apellidos.Text;
                        myCommand.Parameters.Add("@Nombre_cli", OleDbType.WChar).Value = Nombre.Text;
                        myCommand.Parameters.Add("@Telf_Movil_cli", OleDbType.WChar).Value = TelefonoCl.Text;
                        myCommand.Parameters.Add("@Email_cli", OleDbType.WChar).Value = EmailCl.Text;
                        myCommand.Parameters.Add("@Tipo_Domicilio_cli", OleDbType.WChar).Value = Domicilio.Text;
                        myCommand.Parameters.Add("@ImpuestosAplicables", OleDbType.Double).Value = AdaptaStringToDouble(LabelCoefIVA.Text);
                        
                        myCommand.Parameters.Add("@Tipo_Bien", OleDbType.WChar).Value = Tipo.Text;
                        myCommand.Parameters.Add("@Marca_Modelo", OleDbType.WChar).Value = MarcaModelo.Text;
                        myCommand.Parameters.Add("@Eslora", OleDbType.Double).Value = AdaptaStringToDouble(Eslora.Text);
                        myCommand.Parameters.Add("@Valor_Sin_IVA", OleDbType.Double).Value = AdaptaStringToDouble(ValorsinIVA.Text);
                        myCommand.Parameters.Add("@Lista", OleDbType.WChar).Value = Lista6o7.SelectedItem.Value;
                        myCommand.Parameters.Add("@Zona", OleDbType.WChar).Value = Zona.SelectedItem.Value;

                        myCommand.Parameters.Add("@Instala_Motor", OleDbType.Double).Value = AdaptaStringToDouble(InstalacionMotores.Text);
                        myCommand.Parameters.Add("@Remolque", OleDbType.Double).Value = AdaptaStringToDouble(Remolque.Text);
                        myCommand.Parameters.Add("@Fundas", OleDbType.Double).Value = AdaptaStringToDouble(Fundas.Text);
                        myCommand.Parameters.Add("@Otros_extras", OleDbType.Double).Value = AdaptaStringToDouble(OtrosExtras.Text);
                        myCommand.Parameters.Add("@Instala_motor_boolean", OleDbType.Boolean).Value = SiInstalaMot.Checked;
                        myCommand.Parameters.Add("@Remolque_boolean", OleDbType.Boolean).Value = SiRemolque.Checked;
                        myCommand.Parameters.Add("@Fundas_boolean", OleDbType.Boolean).Value = SiFundas.Checked;
                        myCommand.Parameters.Add("@Otros_extras_boolean", OleDbType.Boolean).Value = SiOtrosExtras.Checked;

                        myCommand.Parameters.Add("@Invernaje", OleDbType.Double).Value = AdaptaStringToDouble(Mantenimiento.Text);
                        myCommand.Parameters.Add("@Pupilaje", OleDbType.Double).Value = AdaptaStringToDouble(Parking.Text);
                        myCommand.Parameters.Add("@Desinvernaje", OleDbType.Double).Value = AdaptaStringToDouble(Desinvernaje.Text);
                        myCommand.Parameters.Add("@OtrosServicios", OleDbType.Double).Value = AdaptaStringToDouble(OtrosServicios.Text);
                        myCommand.Parameters.Add("@Invernaje_boolean", OleDbType.Boolean).Value = SiManten.Checked;
                        myCommand.Parameters.Add("@Pupilaje_boolean", OleDbType.Boolean).Value = SiParking.Checked;
                        myCommand.Parameters.Add("@Desinvernaje_boolean", OleDbType.Boolean).Value = SiDesinv.Checked;
                        myCommand.Parameters.Add("@OtrosServicios_boolean", OleDbType.Boolean).Value = SiOtrosS.Checked;

                        if (RBtnEntradaNeto.Checked)
                            myCommand.Parameters.Add("@Entrada_sin_iva", OleDbType.Double).Value = AdaptaStringToDouble(Entrada.Text) / CoefIVA;
                        else
                        {
                            double EntradaSinIVA = BaseImponible * AdaptaStringToDouble(EntradaPorc.Text) / 100;
                            myCommand.Parameters.Add("@Entrada_sin_iva", OleDbType.Double).Value = EntradaSinIVA ;
                        }

                        myCommand.Parameters.Add("@Plazo", OleDbType.SmallInt).Value = Convert.ToInt16(DDLPlazoRenting.Text);
                        myCommand.Parameters.Add("@NumerodeCuotas", OleDbType.SmallInt).Value = Convert.ToInt16(NumerodeCuotas.Text);
                        myCommand.Parameters.Add("@ImporteCuotasSinIva", OleDbType.Double).Value = AdaptaStringToDouble(LabelImportedelasCuotasSinIva.Text);
                        myCommand.Parameters.Add("@ValorResidual", OleDbType.Double).Value = AdaptaStringToDouble(LabelValorResidualCuotas.Text);
                        myCommand.Parameters.Add("@Created", OleDbType.Date).Value = DateTime.Now.Date;
                        myCommand.Parameters.Add("@LastAccess", OleDbType.Date).Value = DateTime.Now.Date;

                        myCommand.Parameters.Add("@ImpuestoMatriculacion", OleDbType.Double).Value = AdaptaStringToDouble(LabelImpuestoMatriculacion.Text);
                        myCommand.Parameters.Add("@VImpuestoMatriculacion", OleDbType.Double).Value = AdaptaStringToDouble(ImpuestoMatricula.Text);
                        myCommand.Parameters.Add("@ImpuestoMatriculacion_boolean", OleDbType.Boolean).Value = SiImpMat.Checked;

                        myCommand.ExecuteNonQuery();

                        try
                        {
                            myCommand.Parameters.Clear();
                            myCommand.CommandText = "Select @@Identity;";
                            Int32 Referencia_ID = (Int32) myCommand.ExecuteScalar();
                            if (IDPresupuesto.Length > 14) { IDPresupuesto = IDPresupuesto.Substring(0, 14); }
                            IDPresupuesto += "-" + Referencia_ID.ToString().PadLeft(5, '0');
                            Referencia.Text = IDPresupuesto;
                        }
                        catch (Exception ex2)
                        {
                            labelerrores.Text = "Select @@Identity: " + ex2.Message + "-" + Referencia.Text + "-" + Server.HtmlEncode(mySqlQuery);
                            // Response.Write(labelerrores.Text);
                            Response.Redirect("~/AfinanError.aspx?Error='" + labelerrores.Text + "'");
                        }
                        finally
                        {
                            myCommand.Dispose();
                            myConnection.Close();
                        }
                    }

                    catch (Exception ex1)
                    {
                        labelerrores.Text += "INSERT INTO [Presupuestos]:" + ex1.Message + "-" + Referencia.Text;
                        // Response.Write(labelerrores.Text);
                        Response.Redirect("~/AfinanError.aspx?Error='" + labelerrores.Text + "'");
                    }
                    
                    Response.Redirect("~/User/propuesta.aspx?IDPresupuesto=" + IDPresupuesto + "&IDNautica=" + IDNautica.Text,false);


                    // The connection is automatically closed when the
                    // code exits the using block
                }

            }

        }

    }
}