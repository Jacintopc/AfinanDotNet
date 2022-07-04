using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Web.Configuration;
using System.Data;
using System.Data.OleDb;

namespace AfinanDotNet2._0.Admin
{
    public partial class Ajustes : System.Web.UI.Page
    {
        protected void VolverAPresupuestos(object sender, EventArgs e)
        {
            Response.Redirect("~/user/presupuestos.aspx");
        }

        protected void Lee_AjustesDB()
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

                        tasa24.Text = ds.Tables[0].Rows[0]["Tasa_24"].ToString();
                        tasa36.Text = ds.Tables[0].Rows[0]["Tasa_36"].ToString();
                        tasa48.Text = ds.Tables[0].Rows[0]["Tasa_48"].ToString();
                        tasa60.Text = ds.Tables[0].Rows[0]["Tasa_60"].ToString();
                        tasa72.Text = ds.Tables[0].Rows[0]["Tasa_72"].ToString();
                        tasa84.Text = ds.Tables[0].Rows[0]["Tasa_84"].ToString();
                        tasa96.Text = ds.Tables[0].Rows[0]["Tasa_96"].ToString();
                        tasa108.Text = ds.Tables[0].Rows[0]["Tasa_108"].ToString();
                        tasa120.Text = ds.Tables[0].Rows[0]["Tasa_120"].ToString();

                        ValorResidual.Text = ds.Tables[0].Rows[0]["Valor_Residual"].ToString();
                        ComisionAF.Text = ds.Tables[0].Rows[0]["Comis_AF"].ToString();

                        BarcosPeninsula.Text = ds.Tables[0].Rows[0]["ImpMatr_BarcosPeninsula"].ToString();
                        BarcosCanarias.Text = ds.Tables[0].Rows[0]["ImpMatr_BarcosCanarias"].ToString();
                        MotosPeninsula.Text = ds.Tables[0].Rows[0]["ImpMatr_MotosPeninsula"].ToString();
                        MotosCanarias.Text = ds.Tables[0].Rows[0]["ImpMatr_MotosCanarias"].ToString();

                        GestLista6Zona1.Text = ds.Tables[0].Rows[0]["Gest_61"].ToString();
                        GestLista7Zona1.Text = ds.Tables[0].Rows[0]["Gest_71"].ToString();
                        GestLista6Zona2.Text = ds.Tables[0].Rows[0]["Gest_62"].ToString();
                        GestLista7Zona2.Text = ds.Tables[0].Rows[0]["Gest_72"].ToString();
                        GestLista6Zona3.Text = ds.Tables[0].Rows[0]["Gest_63"].ToString();
                        GestLista7Zona3.Text = ds.Tables[0].Rows[0]["Gest_73"].ToString();
                        GestLista6Zona4.Text = ds.Tables[0].Rows[0]["Gest_64"].ToString();
                        GestLista7Zona4.Text = ds.Tables[0].Rows[0]["Gest_74"].ToString();
                        GestLista6Zona5.Text = ds.Tables[0].Rows[0]["Gest_65"].ToString();
                        GestLista7Zona5.Text = ds.Tables[0].Rows[0]["Gest_75"].ToString();
                        GestLista6Zona6.Text = ds.Tables[0].Rows[0]["Gest_66"].ToString();
                        GestLista7Zona6.Text = ds.Tables[0].Rows[0]["Gest_76"].ToString();
                        GestLista6Zona7.Text = ds.Tables[0].Rows[0]["Gest_67"].ToString();
                        GestLista7Zona7.Text = ds.Tables[0].Rows[0]["Gest_77"].ToString();

                        GestMotoAgua.Text = ds.Tables[0].Rows[0]["Gest_Moto_Agua"].ToString();
                        GestMotor.Text = ds.Tables[0].Rows[0]["Gest_Motor"].ToString();
                        GestOtros.Text = ds.Tables[0].Rows[0]["Gest_Otros"].ToString();

                        SegLista6Zona1.Text = ds.Tables[0].Rows[0]["Segd_61"].ToString();
                        SegLista7Zona1.Text = ds.Tables[0].Rows[0]["Segd_71"].ToString();
                        SegLista6Zona2.Text = ds.Tables[0].Rows[0]["Segd_62"].ToString();
                        SegLista7Zona2.Text = ds.Tables[0].Rows[0]["Segd_72"].ToString();
                        SegLista6Zona3.Text = ds.Tables[0].Rows[0]["Segd_63"].ToString();
                        SegLista7Zona3.Text = ds.Tables[0].Rows[0]["Segd_73"].ToString();
                        SegLista6Zona4.Text = ds.Tables[0].Rows[0]["Segd_64"].ToString();
                        SegLista7Zona4.Text = ds.Tables[0].Rows[0]["Segd_74"].ToString();
                        SegLista6Zona5.Text = ds.Tables[0].Rows[0]["Segd_65"].ToString();
                        SegLista7Zona5.Text = ds.Tables[0].Rows[0]["Segd_75"].ToString();
                        SegLista6Zona6.Text = ds.Tables[0].Rows[0]["Segd_66"].ToString();
                        SegLista7Zona6.Text = ds.Tables[0].Rows[0]["Segd_76"].ToString();
                        SegLista6Zona7.Text = ds.Tables[0].Rows[0]["Segd_67"].ToString();
                        SegLista7Zona7.Text = ds.Tables[0].Rows[0]["Segd_77"].ToString();

                        SegMotoAgua.Text = ds.Tables[0].Rows[0]["Segd_Moto_Agua"].ToString();
                        SegMotor.Text = ds.Tables[0].Rows[0]["Segd_Motor"].ToString();
                        SegOtros.Text = ds.Tables[0].Rows[0]["Segd_Otros"].ToString();

                        ContractFee.Text = ds.Tables[0].Rows[0]["Contract_Fees"].ToString();

                        IVA.Text = ds.Tables[0].Rows[0]["IVA"].ToString();
                        IGICGral.Text = ds.Tables[0].Rows[0]["IGIC_General"].ToString();
                        IGICAlto.Text = ds.Tables[0].Rows[0]["IGIC_Alto"].ToString();
                        IGICBajo.Text = ds.Tables[0].Rows[0]["IGIC_Bajo"].ToString();

                        CuotaGestoria.Text = ds.Tables[0].Rows[0]["Cuota_Gestoria"].ToString();
                        CuotaMaterial.Text = ds.Tables[0].Rows[0]["Cuota_Material"].ToString();

                    }
                }
                catch (Exception ex)
                {
                    // Response.Write(ex.Message);
                    Response.Redirect("~/AfinanError.aspx?Error='" + ex.Message + "'");
                }
                
                // The connection is automatically closed when the
                // code exits the using block.
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //leer la base de datos  Lee_AjustesDB()
                Lee_AjustesDB();
                LabelFecha.Text = DateTime.Now.ToShortDateString();
                tasa24.Focus();
                Page.Form.DefaultButton = BtnGuardar.UniqueID;
            }
          
        }

        protected double AdaptaStringToDouble(string valortexto)
        {
            double valordevuelta = 0;
            valortexto = valortexto.Replace(" ", "");
            valortexto = valortexto.Replace(".", "");

            string textolimpio = "";

            for (int i = 0; i < valortexto.Length; i++)
            {

                if (char.IsNumber(valortexto, i) || valortexto.Substring(i, 1) == ",")    //char.IsPunctuation(valortexto, i)))
                { textolimpio += valortexto.Substring(i, 1); }
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



        protected void GuardarConfiguracion(object sender, EventArgs e)
        {
            //guardar la base de datos

            string myConnectionString = WebConfigurationManager.ConnectionStrings["DBAfinanConnectionString"].ConnectionString;
            string mySqlQuery = "UPDATE Ajustes SET Tasa_24=@Tasa_24, Tasa_36=@Tasa_36, Tasa_48=@Tasa_48, Tasa_60=@Tasa_60, Tasa_72=@Tasa_72, " +
                                 "Tasa_84=@Tasa_84, Tasa_96=@Tasa_96, Tasa_108=@Tasa_108, Tasa_120=@Tasa_120, Valor_Residual=@Valor_Residual, " +
                                 "Comis_AF=@Comis_AF, ImpMatr_BarcosPeninsula=@ImpMatr_BarcosPeninsula, ImpMatr_BarcosCanarias=@ImpMatr_BarcosCanarias, " +
                                 "ImpMatr_MotosPeninsula=@ImpMatr_MotosPeninsula, ImpMatr_MotosCanarias=@ImpMatr_MotosCanarias, " +
                                 "Gest_61=@Gest_61, Gest_71=@Gest_71, Gest_62=@Gest_62, Gest_72=@Gest_72, Gest_63=@Gest_63, Gest_73=@Gest_73, " +
                                 "Gest_64=@Gest_64, Gest_74=@Gest_74, Gest_65=@Gest_65, Gest_75=@Gest_75, Gest_66=@Gest_66, Gest_76=@Gest_76, " +
                                 "Gest_67=@Gest_67, Gest_77=@Gest_77, Gest_Moto_Agua=@Gest_Moto_Agua, Gest_Motor=@Gest_Motor, Gest_Otros=@Gest_Otros, " +
                                 "Segd_61=@Segd_61, Segd_71=@Segd_71, Segd_62=@Segd_62, Segd_72=@Segd_72, Segd_63=@Segd_63, Segd_73=@Segd_73, " +
                                 "Segd_64=@Segd_64, Segd_74=@Segd_74, Segd_65=@Segd_65, Segd_75=@Segd_75, Segd_66=@Segd_66, Segd_76=@Segd_76, " +
                                 "Segd_67=@Segd_67, Segd_77=@Segd_77, Segd_Moto_Agua=@Segd_Moto_Agua, Segd_Motor=@Segd_Motor, Segd_Otros=@Segd_Otros, " +
                                 "Contract_Fees=@Contract_Fees, IVA=@IVA, IGIC_General=@IGIC_General, IGIC_Alto=@IGIC_Alto, IGIC_Bajo=@IGIC_Bajo," +
                                 "Cuota_Gestoria=@Cuota_Gestoria, Cuota_Material=@Cuota_Material, Last_Update=@Last_Update";
                          
            OleDbConnection myConnection = new OleDbConnection(myConnectionString);
            using (myConnection)
            {
                try
                {
                    myConnection.Open();
                    OleDbCommand myCommand = new OleDbCommand(mySqlQuery, myConnection);

                    myCommand.Parameters.Add("@Tasa_24", OleDbType.Double).Value = AdaptaStringToDouble(tasa24.Text);
                    myCommand.Parameters.Add("@Tasa_36", OleDbType.Double).Value = AdaptaStringToDouble(tasa36.Text);
                    myCommand.Parameters.Add("@Tasa_48", OleDbType.Double).Value = AdaptaStringToDouble(tasa48.Text);
                    myCommand.Parameters.Add("@Tasa_60", OleDbType.Double).Value = AdaptaStringToDouble(tasa60.Text);
                    myCommand.Parameters.Add("@Tasa_72", OleDbType.Double).Value = AdaptaStringToDouble(tasa72.Text);
                    myCommand.Parameters.Add("@Tasa_84", OleDbType.Double).Value = AdaptaStringToDouble(tasa84.Text);
                    myCommand.Parameters.Add("@Tasa_96", OleDbType.Double).Value = AdaptaStringToDouble(tasa96.Text);
                    myCommand.Parameters.Add("@Tasa_108", OleDbType.Double).Value = AdaptaStringToDouble(tasa108.Text);
                    myCommand.Parameters.Add("@Tasa_120", OleDbType.Double).Value = AdaptaStringToDouble(tasa120.Text);

                    myCommand.Parameters.Add("@Valor_Residual", OleDbType.Double).Value = AdaptaStringToDouble(ValorResidual.Text);
                    myCommand.Parameters.Add("@Comis_AF", OleDbType.Double).Value = AdaptaStringToDouble(ComisionAF.Text);
                    myCommand.Parameters.Add("@ImpMatr_BarcosPeninsula", OleDbType.Double).Value = AdaptaStringToDouble(BarcosPeninsula.Text);
                    myCommand.Parameters.Add("@ImpMatr_BarcosCanarias", OleDbType.Double).Value = AdaptaStringToDouble(BarcosCanarias.Text);
                    myCommand.Parameters.Add("@ImpMatr_MotosPeninsula", OleDbType.Double).Value = AdaptaStringToDouble(MotosPeninsula.Text);
                    myCommand.Parameters.Add("@ImpMatr_MotosCanarias", OleDbType.Double).Value = AdaptaStringToDouble(MotosCanarias.Text);

                    myCommand.Parameters.Add("@Gest_61", OleDbType.Double).Value = AdaptaStringToDouble(GestLista6Zona1.Text);
                    myCommand.Parameters.Add("@Gest_71", OleDbType.Double).Value = AdaptaStringToDouble(GestLista7Zona1.Text);
                    myCommand.Parameters.Add("@Gest_62", OleDbType.Double).Value = AdaptaStringToDouble(GestLista6Zona2.Text);
                    myCommand.Parameters.Add("@Gest_72", OleDbType.Double).Value = AdaptaStringToDouble(GestLista7Zona2.Text);
                    myCommand.Parameters.Add("@Gest_63", OleDbType.Double).Value = AdaptaStringToDouble(GestLista6Zona3.Text);
                    myCommand.Parameters.Add("@Gest_73", OleDbType.Double).Value = AdaptaStringToDouble(GestLista7Zona3.Text);
                    myCommand.Parameters.Add("@Gest_64", OleDbType.Double).Value = AdaptaStringToDouble(GestLista6Zona4.Text);
                    myCommand.Parameters.Add("@Gest_74", OleDbType.Double).Value = AdaptaStringToDouble(GestLista7Zona4.Text);
                    myCommand.Parameters.Add("@Gest_65", OleDbType.Double).Value = AdaptaStringToDouble(GestLista6Zona5.Text);
                    myCommand.Parameters.Add("@Gest_75", OleDbType.Double).Value = AdaptaStringToDouble(GestLista7Zona5.Text);
                    myCommand.Parameters.Add("@Gest_66", OleDbType.Double).Value = AdaptaStringToDouble(GestLista6Zona6.Text);
                    myCommand.Parameters.Add("@Gest_76", OleDbType.Double).Value = AdaptaStringToDouble(GestLista7Zona6.Text);
                    myCommand.Parameters.Add("@Gest_67", OleDbType.Double).Value = AdaptaStringToDouble(GestLista6Zona7.Text);
                    myCommand.Parameters.Add("@Gest_77", OleDbType.Double).Value = AdaptaStringToDouble(GestLista7Zona7.Text);

                    myCommand.Parameters.Add("@Gest_Moto_Agua", OleDbType.Double).Value = AdaptaStringToDouble(GestMotoAgua.Text);
                    myCommand.Parameters.Add("@Gest_Motor", OleDbType.Double).Value = AdaptaStringToDouble(GestMotor.Text);
                    myCommand.Parameters.Add("@Gest_Otros", OleDbType.Double).Value = AdaptaStringToDouble(GestOtros.Text);

                    myCommand.Parameters.Add("@Segd_61", OleDbType.Double).Value = AdaptaStringToDouble(SegLista6Zona1.Text);
                    myCommand.Parameters.Add("@Segd_71", OleDbType.Double).Value = AdaptaStringToDouble(SegLista7Zona1.Text);
                    myCommand.Parameters.Add("@Segd_62", OleDbType.Double).Value = AdaptaStringToDouble(SegLista6Zona2.Text);
                    myCommand.Parameters.Add("@Segd_72", OleDbType.Double).Value = AdaptaStringToDouble(SegLista7Zona2.Text);
                    myCommand.Parameters.Add("@Segd_63", OleDbType.Double).Value = AdaptaStringToDouble(SegLista6Zona3.Text);
                    myCommand.Parameters.Add("@Segd_73", OleDbType.Double).Value = AdaptaStringToDouble(SegLista7Zona3.Text);
                    myCommand.Parameters.Add("@Segd_64", OleDbType.Double).Value = AdaptaStringToDouble(SegLista6Zona4.Text);
                    myCommand.Parameters.Add("@Segd_74", OleDbType.Double).Value = AdaptaStringToDouble(SegLista7Zona4.Text);
                    myCommand.Parameters.Add("@Segd_65", OleDbType.Double).Value = AdaptaStringToDouble(SegLista6Zona5.Text);
                    myCommand.Parameters.Add("@Segd_75", OleDbType.Double).Value = AdaptaStringToDouble(SegLista7Zona5.Text);
                    myCommand.Parameters.Add("@Segd_66", OleDbType.Double).Value = AdaptaStringToDouble(SegLista6Zona6.Text);
                    myCommand.Parameters.Add("@Segd_76", OleDbType.Double).Value = AdaptaStringToDouble(SegLista7Zona6.Text);
                    myCommand.Parameters.Add("@Segd_67", OleDbType.Double).Value = AdaptaStringToDouble(SegLista6Zona7.Text);
                    myCommand.Parameters.Add("@Segd_77", OleDbType.Double).Value = AdaptaStringToDouble(SegLista7Zona7.Text);

                    myCommand.Parameters.Add("@Segd_Moto_Agua", OleDbType.Double).Value = AdaptaStringToDouble(SegMotoAgua.Text);
                    myCommand.Parameters.Add("@Segd_Motor", OleDbType.Double).Value = AdaptaStringToDouble(SegMotor.Text);
                    myCommand.Parameters.Add("@Segd_Otros", OleDbType.Double).Value = AdaptaStringToDouble(SegOtros.Text);

                    myCommand.Parameters.Add("@Contract_Fees", OleDbType.Double).Value = AdaptaStringToDouble(ContractFee.Text);

                    myCommand.Parameters.Add("@IVA", OleDbType.Double).Value = AdaptaStringToDouble(IVA.Text);
                    myCommand.Parameters.Add("@IGIC_General", OleDbType.Double).Value = AdaptaStringToDouble(IGICGral.Text);
                    myCommand.Parameters.Add("@IGIC_Alto", OleDbType.Double).Value = AdaptaStringToDouble(IGICAlto.Text);
                    myCommand.Parameters.Add("@IGIC_Bajo", OleDbType.Double).Value = AdaptaStringToDouble(IGICBajo.Text);

                    myCommand.Parameters.Add("@Cuota_Gestoria", OleDbType.Double).Value = AdaptaStringToDouble(CuotaGestoria.Text);
                    myCommand.Parameters.Add("@Cuota_Material", OleDbType.Double).Value = AdaptaStringToDouble(CuotaMaterial.Text);

                    myCommand.Parameters.Add("@Last_Update", OleDbType.Date).Value = DateTime.Now.Date;

                    myCommand.ExecuteNonQuery();
                
                }

                catch (Exception ex)
                {
                    // Response.Write(ex.Message);
                    Response.Redirect("~/AfinanError.aspx?Error='" + ex.Message + "'");
                }

                finally
                {
                    myConnection.Close();
                }


                // The connection is automatically closed when the
                // code exits the using block.

            }
        }

    }
}
