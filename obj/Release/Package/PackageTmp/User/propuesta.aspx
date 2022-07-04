<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="propuesta.aspx.cs" Inherits="AfinanDotNet2._0.User.propuesta" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Propuesta de Renting</title>

    <script type="text/javascript">
     function PagePrint()
     {
        window.print();
        return;
     }
     
    </script>
</head>
<body style="width:900px;  margin-left:auto; margin-right:auto;" onload="PagePrint();">
    <form id="FormularioImpresion" runat="server">
    <div>
    <div id="Encabezado" style="Width:100%; height:115px; ">
        <div style="float:left; position:absolute; margin: 3px; "><img alt="Afinan.net" src="/Images/AfinanRent5.jpg" /></div>
        <div style="font-size: x-large; float:right; margin: 5px; width:350px; text-align:right">Propuesta de Renting
        <table style="font-size: small;  width:350px; color:Navy;" runat="server">
            <tr>
                <td >Referencia: <asp:label ID="Referencia" runat="server">0000000000000</asp:label></td>
            </tr>
            <tr>
                <td >Presentado por: <asp:label ID="Nautica" style="font-size:small;" runat="server"></asp:label> / <asp:label ID="Comercial" style="font-size:small;" runat="server"></asp:label></td>
            </tr>
            <tr>
                <td >Teléfono: <asp:label ID="Telf_Movil_Nau" style="font-size:small;" runat="server"></asp:label> - Fax: <asp:label ID="Fax_Nau" style="font-size:small;" runat="server"></asp:label></td>
            </tr>
            <tr>
                <td >Correo:  <asp:label ID="Email_Nau" style="font-size:small;" runat="server"></asp:label></td>
            </tr>
        </table>
        </div>
    </div>
    
    <div style="clear:both" />
        
    <div id="Introduccion" style="margin-top:10px;" >
        <div style="margin-top:20px; margin-left:30px; margin-right:30px; font-size: medium;">
            <span> Estimados Señores,</span><br />
            <span style="font-size: xx-small;"><br /></span>
            <span> Tras su solicitud, les presentamos nuestra oferta de renting con las siguientes características:</span>   
        </div>

        <table style="border:2px solid black; width:90%;  background-color:#F2F2F2 ; margin:20px auto 20px auto;" runat="server">
            <tr>
                <td colspan="2" style="font-weight:bold;">Sus datos de contacto:</td>
                <td style="width:130px;">Bien financiado:</td>
                <td ><asp:label ID="BienFinanciado" runat="server"><b>BARCO</b></asp:label></td>
            </tr>
            <tr>
                <td style="width:100px;">Nombre:</td>
                <td style="width:250px;"><asp:label ID="Nombrecontacto" runat="server"></asp:label></td>
                <td >Marca y modelo:</td>
                <td style="width:280px;"><asp:label ID="MarcayModelo" runat="server"><b>X</b></asp:label></td>
            </tr>
            <tr>
                <td>Teléfono:</td>
                <td ><asp:label ID="Telefonocontacto" runat="server"></asp:label></td>
                <td>Valor de factura:</td>
                <td><b><asp:Label ID="ValorFactura" runat="server">0,0</asp:Label> € + <asp:Label ID="Impuestos" runat="server">0%</asp:Label> de <asp:Label ID="TipoImpuestos" runat="server">IVA</asp:Label></b></td>
            </tr>
            <tr>
                <td>Correo:</td>
                <td ><asp:label ID="Correocontacto" runat="server"></asp:label></td>
                <td>Lista:</td>
                <td><asp:Label ID="Lista" runat="server"><b>X</b></asp:Label></td>
            </tr>
        </table>
    </div>

    <div id="tabladatos">
    
        <table id="tablacondiciones" style="border:2px solid black; width:90%; margin:20px auto 20px auto;" runat="server">
            <tr style="background: #F2F2F2; ">
                <td style="width:50%; font-size: large;font-weight: bold;"><strong>Condiciones en €</strong></td>
                <td style="width:25%; text-align:right; "><b>Importes (*)</b> </td>
                <td style="width:25%; text-align:right; "><b>Con <asp:label ID="labelimpuestos" runat="server" >IVA</asp:label></b></td>
            </tr>
            <tr>
                <td>Valor factura proforma</td>
                <td style=" text-align:right;"><asp:label ID="ValorFacturaSinImp" runat="server">0,00</asp:label> €</td>
                <td style=" text-align:right;"><asp:label ID="ValorFacturaConImp" runat="server">0,00</asp:label> €</td>
            </tr>
            <tr>
                <td>Entrada</td>
                <td style=" text-align:right;"><asp:label ID="EntradaSinImp" runat="server">0,00</asp:label> €</td>
                <td style=" text-align:right;"><asp:label ID="EntradaConImp" runat="server">0,00</asp:label> €</td>
            </tr>
            <tr>
                <td>Plazo en años</td>
                <td style=" text-align:right;"><asp:label ID="Plazo" runat="server">0</asp:label></td>
                <td style=" text-align:right;"></td>
            </tr>
            <tr>
                <td>Importe de <asp:label id="NumerodeCuotas" runat="server"></asp:label> cuotas fijas mensuales</td>
                <td style=" text-align:right;"><asp:label ID="ImporteCuotasSinImp" runat="server">0,00</asp:label> €</td>
                <td style=" text-align:right;"><asp:label ID="ImporteCuotasConImp" runat="server">0,00</asp:label> €</td>
            </tr>
            <tr>
                <td>Valor residual</td>
                <td style=" text-align:right;" ><asp:label ID="ValorResidual" runat="server">0,00</asp:label> €</td>
                <td style=" text-align:right;" ><asp:label ID="ValorResidualConIVA" runat="server">0,00</asp:label> €</td>
            </tr>
            <tr>
                <td colspan="3">
                   <span style="font-size: large; font-style:italic; font-size: medium; text-align:center;">
                      La compañía de Renting contratará un seguro a todo riesgo a cargo del arrendatario.
                   </span> 
                </td>
            </tr>
            <tr>
                <td colspan="3" style="background-color: #F2F2F2; text-align:center; font-size: large;">
                    <strong>Incluido en la cuota:</strong>
                </td>
            </tr>
            <tr>
                <td><b>Impuestos de matriculación ( <asp:label runat="server" ID="PorcentajeImpuestoMatriculacion" >0</asp:label> % )</b></td>
                <td style=" text-align:right;" ><asp:label ID="ImpuestoMatriculacion" runat="server">NO</asp:label></td>
                <td style=" text-align:right;" ></td>
            </tr>
            <tr>
                <td><b>Matrícula y tasas para </b> </td>
                <td style=" text-align:right;" ><asp:label ID="Zona" runat="server">Zona X (Y Millas)</asp:label></td>
                <td></td>
            </tr>
            <tr>
                <td style="border-bottom: 2px solid black;" colspan="3"></td>
            </tr>
            <tr>
                <td><b>Extras y accesorios</b></td>
                <td style=" text-align:right;"><b>Coste sin <asp:label ID="ImpuestosExtrasyAccesorios" runat="server">IVA</asp:label></b></td>
                <td></td>
            </tr>
            <tr>
                <td style="text-indent:20px;">Instalación motores</td>
                <td style=" text-align:right;"><asp:label ID="InstalacionMotores" runat="server">NO</asp:label></td>
                <td></td>
            </tr>
            <tr>
                <td style="text-indent:20px;">Remolque</td>
                <td style=" text-align:right;"><asp:label ID="Remolque" runat="server">NO</asp:label></td>
                <td></td>
            </tr>
            <tr>
                <td style="text-indent:20px;">Fundas</td>
                <td style=" text-align:right;" ><asp:label ID="Fundas" runat="server">NO</asp:label></td>
                <td></td>
            </tr>
            <tr>
                <td style="text-indent:20px;">Otros extras y accesorios</td>
                <td style=" text-align:right;" ><asp:label ID="OtrosExtras" runat="server">NO</asp:label></td>
                <td></td>
            </tr>
            <tr>
                <td style="text-indent:20px; text-align: right;" ><strong>Total extras y accesorios</strong></td>
                <td style=" text-align:right;" ><asp:label ID="TotalExtrasyAccesorios" runat="server">-</asp:label> €</td>
                <td ></td>
            </tr>
            <tr>
                <td style="border-bottom: 2px solid black;" colspan="3"></td>
            </tr>
            <tr>
                <td><b>Servicios de Renting anuales</b></td>
                <td style=" text-align:right;"><b>Coste anual sin <asp:label ID="ImpuestosServicios" runat="server">IVA</asp:label></b></td>
                <td></td>
            </tr>
            <tr>
                <td style="text-indent:20px;">Mantenimiento básico anual (invernaje)</td>
                <td style=" text-align:right;"><asp:label ID="MantenimientoBasico" runat="server">NO</asp:label></td>
                <td></td>
            </tr>
            <tr>
                <td style="text-indent:20px;">Parking - pupilaje</td>
                <td style=" text-align:right;"><asp:label ID="Parking" runat="server">NO</asp:label></td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td style="text-indent:20px;">Desinvernaje</td>
                <td style=" text-align:right;"><asp:label ID="Desinvernaje" runat="server">NO</asp:label></td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td style="text-indent:20px;">Otros servicios</td>
                <td style=" text-align:right;"><asp:label ID="OtrosServicios" runat="server">NO</asp:label></td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td style="text-indent:20px; text-align: right;"><strong>Total servicios anuales</strong></td>
                <td style=" text-align:right;"><asp:label ID="TotalServiciosAnuales" runat="server">-</asp:label> €</td>
                <td>&nbsp;</td>
            </tr>
        </table>
    </div>
    <div id="notas y firma" style="margin-left:20px; margin-right:20px; font-size: medium;">
        <span><strong>NOTAS:</strong></span><br />
        <span>(*) No incluyen impuestos (IVA/IGIC): </span><asp:label ID="PorcentajeImpuestos" runat="server">X</asp:label> %<br />
        <span>Cuota informativa sujeta a la validez técnica de las facturas proforma. Oferta condicionada a la aprobación de la sociedad de Renting con validez 15 días.</span>
        <span>Las condiciones serán adaptadas en el día de la firma del contrato. La propuesta en el presente documento es orientativa, y no definitiva.</span> 
        <span>La propuesta ha sido establecida en base del tipo de IVA o IGIC en vigor y  es susceptible de modificación durante la vida del contrato de Renting.</span>
        <span>Trámites de matriculación realizados por gestoría autorizada en el banco.</span><br/>

        <div style="margin-top:30px">Atentamente, </div>
        <div style="margin-top:50px"><b>AFINAN</b><br />
            <span>Renting Nautico</span>
        </div>
        <div style="margin-top:30px; font-style:italic; font-weight:bold; border: 2px solid black; padding:10px; "> 
            <span>Por favor, envíenos su número de DNI por correo electrónico con su nombre y le informaremos si podemos presentar la operación al banco. Gracias por su confianza.</span>
        </div> 
    </div>
    <div id="piedepagina" style="text-align:center; font-size:smaller; margin-top:10px;">
        <span>AFINAN - Telf: 902 808 072 - afinan@afinan.com </span>  
    </div>
    <div style="margin: 20px auto 20px auto; width:170px;">
      <asp:Button style="margin:2px;" Width="75px" OnClientClick="window.print();"  ID="ButtonImprimir" runat="server" Text="Imprimir"/>
      <asp:Button style="margin:2px;" Width="75px" OnClientClick="history.back(); return false;"  ID="ButtonBack" runat="server" Text="Volver"/>
    </div>
    <asp:Label ID="labelerrores" runat="server" style="color:Red;"></asp:Label>
    </div>
    </form>
</body>
</html>