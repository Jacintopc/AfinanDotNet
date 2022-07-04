using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Web.Configuration;
using System.Data;
using System.Data.OleDb;
using System.Globalization;


namespace AfinanDotNet2._0.User
{
    public partial class propuesta : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {
            labelerrores.Text = "  ";

            if (!IsPostBack) 
            {
                string IDPresupuesto = Request.QueryString.Get("IDPresupuesto");
                IDPresupuesto = IDPresupuesto.Replace(" ", "");  //To Avoid SQL injection
                IDPresupuesto = IDPresupuesto.Replace(";", "");  //To Avoid SQL injection
                
                Referencia.Text = IDPresupuesto;
                // 01234567890123456789
                // 20100708-00003-00275

                if (IDPresupuesto.Length > 14)
                { 
                    IDPresupuesto = IDPresupuesto.Substring(15);   // nos quedamos con los 5 ultimos caracteres  
                    IDPresupuesto = IDPresupuesto.TrimStart('0');  // le quitamos los 0's del principio y nos quedamos con el num. de ppto.

                }                   
                string myConnectionString = WebConfigurationManager.ConnectionStrings["DBAfinanConnectionString"].ConnectionString;
                string mySqlQuery = "SELECT * FROM [Presupuestos] WHERE [ID_Presupuesto]=" + IDPresupuesto;
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

                        if (ds.Tables[0].Rows.Count > 0)  //  Carga de valores del presupuesto
                        {
                           if  ( ds.Tables[0].Rows[0]["UserName"].ToString() != User.Identity.Name)
                               throw new System.InvalidOperationException("Este usuario no tiene permisos para ver este presupuesto");
                            
                           // Referencia.Text = ds.Tables[0].Rows[0]["ID_Presupuesto"].ToString().Trim() ;                            
                           // .Text = ds.Tables[0].Rows[0]["Sold"].ToString();
                           Nautica.Text = ds.Tables[0].Rows[0]["Nautica"].ToString().Trim();
                           Comercial.Text = ds.Tables[0].Rows[0]["Nombre_Vendedor"].ToString().Trim();
                           Telf_Movil_Nau.Text = ds.Tables[0].Rows[0]["Telf_Movil_Nau"].ToString().Trim();
                           Fax_Nau.Text = ds.Tables[0].Rows[0]["Fax_Nau"].ToString().Trim();
                           Email_Nau.Text = ds.Tables[0].Rows[0]["Email_Nau"].ToString().Trim();                                                     

                           if (ds.Tables[0].Rows[0]["Nombre_cli"].ToString().Trim()+ds.Tables[0].Rows[0]["Apellidos_cli"].ToString().Trim()!="")
                            {
                                Nombrecontacto.Text = ds.Tables[0].Rows[0]["Tratamiento_cli"].ToString().Trim() + " " + ds.Tables[0].Rows[0]["Nombre_cli"].ToString().Trim() +
                                    " " + ds.Tables[0].Rows[0]["Apellidos_cli"].ToString().Trim(); 
                            }
                           Telefonocontacto.Text = ds.Tables[0].Rows[0]["Telf_Movil_cli"].ToString();
                           Correocontacto.Text = ds.Tables[0].Rows[0]["Email_cli"].ToString();

                           BienFinanciado.Text = ds.Tables[0].Rows[0]["Tipo_Bien"].ToString();
                           MarcayModelo.Text = ds.Tables[0].Rows[0]["Marca_Modelo"].ToString();
                           //.Text = ds.Tables[0].Rows[0]["Eslora"].ToString();
                           ValorFactura.Text = String.Format("{0:#,##0.00}", ds.Tables[0].Rows[0]["Valor_Sin_IVA"]); 
                           ValorFacturaSinImp.Text = String.Format("{0:#,##0.00}",ds.Tables[0].Rows[0]["Valor_Sin_IVA"]);

                           if (ds.Tables[0].Rows[0]["Tipo_Domicilio_cli"].ToString() == "Canarias")
                           {
                               TipoImpuestos.Text = "IGIC";
                               labelimpuestos.Text = "IGIC";
                               ImpuestosExtrasyAccesorios.Text = "IGIC";
                               ImpuestosServicios.Text = "IGIC";
                           }
                           
                           PorcentajeImpuestos.Text= String.Format("{0:0.00}",ds.Tables[0].Rows[0]["ImpuestosAplicables"]);
                           Impuestos.Text = PorcentajeImpuestos.Text + " %";

                           double CoefIVA = 1 + (Convert.ToDouble(PorcentajeImpuestos.Text)/100);

                           ValorFacturaConImp.Text = String.Format("{0:#,##0.00}", Convert.ToDouble(ds.Tables[0].Rows[0]["Valor_Sin_IVA"]) * CoefIVA);
                                                   //Convert.ToString(Convert.ToDouble(ds.Tables[0].Rows[0]["Valor_Sin_IVA"].ToString())*CoefIVA) ;
                           
                           Lista.Text = ds.Tables[0].Rows[0]["Lista"].ToString();
                           
                           switch (ds.Tables[0].Rows[0]["Zona"].ToString())
                           {
                               case "1":
                                   Zona.Text = "Zona 1 - (Ilimitado)";
                                   break;
                               case "2":
                                   Zona.Text = "Zona 2 - (60 millas)";
                                   break;
                               case "3":
                                   Zona.Text = "Zona 3 - (25 millas)";
                                   break;
                               case "4":
                                   Zona.Text = "Zona 4 - (12 millas)";
                                   break;
                               case "5":
                                   Zona.Text = "Zona 5 - (5 millas)";
                                   break;
                               case "6":
                                   Zona.Text = "Zona 6 - (2 millas)";
                                   break;
                               case "7":
                                   Zona.Text = "Zona 7 - (costeras protegidas)";
                                   break;
                               default:
                                   Zona.Text = " ";
                                   break;
                           }
                           
                           double totalEyA = 0.0;

                           if (ds.Tables[0].Rows[0]["Instala_motor_boolean"].ToString() == "True")
                           {
                               InstalacionMotores.Text = String.Format("{0:#,##0.00}", ds.Tables[0].Rows[0]["Instala_Motor"]) + " €";
                               totalEyA += Convert.ToDouble(ds.Tables[0].Rows[0]["Instala_Motor"]);
                           }
                           if (ds.Tables[0].Rows[0]["Remolque_boolean"].ToString() == "True")
                           {
                               Remolque.Text = String.Format("{0:#,##0.00}", ds.Tables[0].Rows[0]["Remolque"]) + " €";
                               totalEyA += Convert.ToDouble(ds.Tables[0].Rows[0]["Remolque"]);
                           }
                           if (ds.Tables[0].Rows[0]["Fundas_boolean"].ToString() == "True") 
                           {
                               Fundas.Text = String.Format("{0:#,##0.00}", ds.Tables[0].Rows[0]["Fundas"]) + " €";
                               totalEyA += Convert.ToDouble(ds.Tables[0].Rows[0]["Fundas"]);
                           }

                           if (ds.Tables[0].Rows[0]["Otros_extras_boolean"].ToString() == "True") 
                           {
                               OtrosExtras.Text = String.Format("{0:#,##0.00}", ds.Tables[0].Rows[0]["Otros_extras"]) + " €";
                               totalEyA += Convert.ToDouble(ds.Tables[0].Rows[0]["Otros_extras"]);
                           }
                           
                           TotalExtrasyAccesorios.Text = String.Format("{0:#,##0.00}",totalEyA);                                                                            
                           
                           double totalServ = 0.0;

                           if (ds.Tables[0].Rows[0]["Invernaje_boolean"].ToString() == "True") 
                           {
                               MantenimientoBasico.Text = String.Format("{0:#,##0.00}", ds.Tables[0].Rows[0]["Invernaje"]) + " €";
                               totalServ += Convert.ToDouble(ds.Tables[0].Rows[0]["Invernaje"]); 
                           }
                           if (ds.Tables[0].Rows[0]["Pupilaje_boolean"].ToString() == "True" ) 
                           {
                               Parking.Text = String.Format("{0:#,##0.00}", ds.Tables[0].Rows[0]["Pupilaje"]) + " €";
                               totalServ += Convert.ToDouble(ds.Tables[0].Rows[0]["Pupilaje"]);
                           }
                           if (ds.Tables[0].Rows[0]["Desinvernaje_boolean"].ToString() == "True") 
                           {
                               Desinvernaje.Text = String.Format("{0:#,##0.00}", ds.Tables[0].Rows[0]["Desinvernaje"]) + " €";
                               totalServ += Convert.ToDouble(ds.Tables[0].Rows[0]["Desinvernaje"]);
                           }
                           if (ds.Tables[0].Rows[0]["OtrosServicios_boolean"].ToString() == "True")
                           {
                               OtrosServicios.Text = String.Format("{0:#,##0.00}", ds.Tables[0].Rows[0]["OtrosServicios"]) + " €";
                               totalServ += Convert.ToDouble(ds.Tables[0].Rows[0]["OtrosServicios"]);
                           }

                           PorcentajeImpuestoMatriculacion.Text = ds.Tables[0].Rows[0]["ImpuestoMatriculacion"].ToString();
                           
                           if (ds.Tables[0].Rows[0]["ImpuestoMatriculacion_boolean"].ToString() == "True")
                           {
                               ImpuestoMatriculacion.Text = String.Format("{0:#,##0.00}", ds.Tables[0].Rows[0]["VImpuestoMatriculacion"]) + " €"; 
                           }

                           TotalServiciosAnuales.Text = String.Format("{0:#,##0.00}", totalServ);
                           
                           EntradaConImp.Text = String.Format("{0:#,##0.00}", Convert.ToDouble(ds.Tables[0].Rows[0]["Entrada_sin_iva"]) * CoefIVA );
                           EntradaSinImp.Text = String.Format("{0:#,##0.00}", ds.Tables[0].Rows[0]["Entrada_sin_iva"]);

                           Plazo.Text = ds.Tables[0].Rows[0]["Plazo"].ToString();
                           NumerodeCuotas.Text = ds.Tables[0].Rows[0]["NumerodeCuotas"].ToString();
                           ImporteCuotasSinImp.Text = String.Format("{0:#,##0.00}", ds.Tables[0].Rows[0]["ImporteCuotasSinIva"]);
                           ImporteCuotasConImp.Text = String.Format("{0:#,##0.00}", Convert.ToDouble(ds.Tables[0].Rows[0]["ImporteCuotasSinIva"]) * CoefIVA);

                           ValorResidual.Text = String.Format("{0:#,##0.00}", ds.Tables[0].Rows[0]["ValorResidual"]);
                           ValorResidualConIVA.Text = String.Format("{0:#,##0.00}", Convert.ToDouble(ds.Tables[0].Rows[0]["ValorResidual"]) * CoefIVA);

                           //Referencia.Text = ds.Tables[0].Rows[0]["Created"].ToString().Substring(6,4)+
                           //                  ds.Tables[0].Rows[0]["Created"].ToString().Substring(3,2)+
                           //                  ds.Tables[0].Rows[0]["Created"].ToString().Substring(0,2)+ "-" + Referencia.Text;
                           //   DateTime.Now.Year.ToString("D4") + DateTime.Now.Month.ToString("D2") + DateTime.Now.Day.ToString("D2");
                           //.Text = ds.Tables[0].Rows[0]["Created"].ToString();
                           //.Text = ds.Tables[0].Rows[0]["LastAccess"].ToString();
                        }
                        da.Dispose();
                        ds.Dispose();
                        
                    }
                    catch (Exception ex)
                    {
                        labelerrores.Text = ex.Message + "-" + Referencia.Text + "-" + Server.HtmlEncode(mySqlQuery);
                        //Response.Write(labelerrores.Text);     
                        Response.Redirect("~/AfinanError.aspx?Error='" + labelerrores.Text + "'");
                    }

                    // The connection is automatically closed when the
                    // code exits the using block
                    
                }
                
            }
        }
    }
}