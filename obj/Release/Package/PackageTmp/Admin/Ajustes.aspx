<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Ajustes.aspx.cs" Inherits="AfinanDotNet2._0.Admin.Ajustes" %>
<asp:Content ID="HeadContentConfiguracion" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .style1
        {
            width: 241px;
            font-weight: bold;
        }
        .style3
        {
            width: 243px;
            font-weight: bold;
        }
        .style4
        {
            width: 280px;
            font-weight: bold;
        }
        .style5
        {
            width: 105px;
            font-weight: bold;
        }
        .style6
        {
            width: 110px;
            font-weight: bold;
        }
        .style9
        {
            width: 107px;
            font-weight: bold;
        }
        .style10
        {
            width: 89px;
            font-weight: bold;
        }
        .style11
        {
            width: 176px;
            font-weight: bold;
        }
    </style>

    <script type="text/javascript" language="javascript">
    
            function ClearTextboxes(objname, waterMarkText) {
                obj = document.getElementById(objname);
                if (obj.value == waterMarkText) {
                    obj.value = '';
                }
                obj.style.color = 'navy';
                obj.style.fontWeight = 'bold';
                obj.style.background = 'ddFFFF';
            }

            function Blur(objname, waterMarkText) {
                obj = document.getElementById(objname);
                if (obj.value == "") {
                    obj.value = waterMarkText;
                }
                obj.style.color = 'black';
                obj.style.fontWeight = 'normal';
                obj.style.background = 'white';
            }


    </script>
</asp:Content>

<asp:Content ID="MainContentConfiguracion" ContentPlaceHolderID="MainContent" runat="server">
    <div style="border:2px solid #4b6c9e ; background-color: #ffffdd;  margin-left: 5px; width: 98%; -moz-border-radius: 8px; -webkit-border-radius: 8px;">
         <span id="Titulo" style=" font-size:large; font-weight:bold; margin-left: 5px; ">Parámetros de configuración</span>
         <span id="fecha" style="font-size:small; margin:5px; ">(<asp:Label ID="LabelFecha" runat="server"></asp:Label>)</span>
    </div>
    <div id="DatosConfiguracionTasas" class="CajaConfig" style="height: auto; width:250px">  
      <div class="TituloCajaConfig" style="width:244px">Tasas</div>
          <div class="CajaTabladatosConfig" style="width:244px">
              <table class="TablaDatosConfig">
                  <tr>
                     <td class="style9">Tasa 24 meses</td>
                     <td class="style10"><asp:TextBox ID="tasa24" runat="server" Width="60px" onfocus="ClearTextboxes(this.id,'0,0000')" onblur="Blur(this.id,'0,0000')" >0,0000</asp:TextBox> %</td>
                  </tr>
                  <tr>
                     <td class="style9">Tasa 36 meses</td>
                     <td class="style10"><asp:TextBox ID="tasa36" runat="server" Width="60px" onfocus="ClearTextboxes(this.id,'0,0000')" onblur="Blur(this.id,'0,0000')" >0,0000</asp:TextBox> %</td>
                  </tr>
                  <tr>
                     <td class="style9">Tasa 48 meses</td>
                     <td class="style10"><asp:TextBox ID="tasa48" runat="server" Width="60px" onfocus="ClearTextboxes(this.id,'0,0000')" onblur="Blur(this.id,'0,0000')" >0,0000</asp:TextBox> %</td>
                  </tr>
                  <tr>
                     <td class="style9">Tasa 60 meses</td>
                     <td class="style10"><asp:TextBox ID="tasa60" runat="server" Width="60px" onfocus="ClearTextboxes(this.id,'0,0000')" onblur="Blur(this.id,'0,0000')" >0,0000</asp:TextBox> %</td>
                  </tr>
                  <tr>
                     <td class="style9">Tasa 72 meses</td>
                     <td class="style10"><asp:TextBox ID="tasa72" runat="server" Width="60px" onfocus="ClearTextboxes(this.id,'0,0000')" onblur="Blur(this.id,'0,0000')" >0,0000</asp:TextBox> %</td>
                  </tr>
                  <tr>
                     <td class="style9">Tasa 84 meses</td>
                     <td class="style10"><asp:TextBox ID="tasa84" runat="server" Width="60px" onfocus="ClearTextboxes(this.id,'0,0000')" onblur="Blur(this.id,'0,0000')" >0,0000</asp:TextBox> %</td>
                  </tr>
                  <tr>
                     <td class="style9">Tasa 96 meses</td>
                     <td class="style10"><asp:TextBox ID="tasa96" runat="server" Width="60px" onfocus="ClearTextboxes(this.id,'0,0000')" onblur="Blur(this.id,'0,0000')" >0,0000</asp:TextBox> %</td>
                  </tr>
                  <tr>
                     <td class="style9">Tasa 108 meses</td>
                     <td class="style10"><asp:TextBox ID="tasa108" runat="server" Width="60px" onfocus="ClearTextboxes(this.id,'0,0000')" onblur="Blur(this.id,'0,0000')" >0,0000</asp:TextBox> %</td>
                  </tr>
                  <tr>
                     <td class="style9">Tasa 120 meses</td>
                     <td class="style10"><asp:TextBox ID="tasa120" runat="server" Width="60px" onfocus="ClearTextboxes(this.id,'0,0000')" onblur="Blur(this.id,'0,0000')" >0,0000</asp:TextBox> %</td>
                  </tr>
              </table>
          </div>
    </div>

    <div id="DatosConfiguracionVarios" class="CajaConfig" style="height: auto; width:285px">
      <div class="TituloCajaConfig" style="width:279px;">Varios</div>
          <div class="CajaTabladatosConfig" style="width:279px">
              <table class="TablaDatosConfig">
              <tr>
                 <td class="style11">Valor Residual</td>
                 <td class="style6"><asp:TextBox ID="ValorResidual" runat="server" Width="60px" onfocus="ClearTextboxes(this.id,'0,00')" onblur="Blur(this.id,'0,00')" >0,00</asp:TextBox> €</td>
              </tr>
              <tr>
                 <td class="style11">Comisión AF</td>
                 <td class="style6"><asp:TextBox ID="ComisionAF" runat="server" Width="60px" onfocus="ClearTextboxes(this.id,'0,00')" onblur="Blur(this.id,'0,00')" >0,00</asp:TextBox> %</td>   <!-- hay que sumarle 1, por defecto 1,030 -->
              </tr>
              <tr>
                 <td class="style11">Gestoría Moto Agua</td>
                 <td class="style6"><asp:TextBox ID="GestMotoAgua" runat="server" Width="60px" onfocus="ClearTextboxes(this.id,'0,00')" onblur="Blur(this.id,'0,00')" >0,00</asp:TextBox> €</td>
              </tr>
              <tr>
                 <td class="style11">Gestoría Motor</td>
                 <td class="style6"><asp:TextBox ID="GestMotor" runat="server" Width="60px" onfocus="ClearTextboxes(this.id,'0,00')" onblur="Blur(this.id,'0,00')" >0,00</asp:TextBox> €</td>
              </tr>
              <tr>
                 <td class="style11">Gestoría Otros</td>
                 <td class="style6"><asp:TextBox ID="GestOtros" runat="server" Width="60px" onfocus="ClearTextboxes(this.id,'0,00')" onblur="Blur(this.id,'0,00')" >0,00</asp:TextBox> €</td>
              </tr>
              <tr>
                 <td class="style11">Seguridad Moto Agua</td>
                 <td class="style6"><asp:TextBox ID="SegMotoAgua" runat="server" Width="60px" onfocus="ClearTextboxes(this.id,'0,00')" onblur="Blur(this.id,'0,00')" >0,00</asp:TextBox> €</td>
              </tr>
              <tr>
                 <td class="style11">Seguridad Motor</td>
                 <td class="style6"><asp:TextBox ID="SegMotor" runat="server" Width="60px" onfocus="ClearTextboxes(this.id,'0,00')" onblur="Blur(this.id,'0,00')" >0,00</asp:TextBox> €</td>
              </tr>
              <tr>
                 <td class="style11">Seguridad Otros</td>
                 <td class="style6"><asp:TextBox ID="SegOtros" runat="server" Width="60px" onfocus="ClearTextboxes(this.id,'0,00')" onblur="Blur(this.id,'0,00')" >0,00</asp:TextBox> €</td>
              </tr>
              <tr>
                 <td class="style11">Cuota Gestoria</td>
                 <td class="style6"><asp:TextBox ID="CuotaGestoria" runat="server" Width="60px" onfocus="ClearTextboxes(this.id,'0,00')" onblur="Blur(this.id,'0,00')" >0,00</asp:TextBox> €</td>
              </tr>
              <tr>
                 <td class="style11">Cuota Material</td>
                 <td class="style6"><asp:TextBox ID="CuotaMaterial" runat="server" Width="60px" onfocus="ClearTextboxes(this.id,'0,00')" onblur="Blur(this.id,'0,00')" >0,00</asp:TextBox> €</td>
              </tr>
           </table>
       </div>
    </div>

    <div id="ImpuestosMatriculacion" class="CajaConfig" style=" height: auto; width:355px">
      <div class="TituloCajaConfig" style="width:348px">Impuestos Matriculación, IVA e IGIC</div>
          <div class="CajaTabladatosConfig" style="width:348px">
              <table class="TablaDatosConfig">
              <tr>
                 <td class="style3">Mat. Barcos Peninsula y Baleares</td>
                 <td class="style5"><asp:TextBox ID="BarcosPeninsula" runat="server" Width="60px" onfocus="ClearTextboxes(this.id,'0,00')" onblur="Blur(this.id,'0,00')" >0,00</asp:TextBox> %</td>
              </tr>
              <tr>
                 <td class="style3">Mat. Barcos Canarias</td>
                 <td class="style5"><asp:TextBox ID="BarcosCanarias" runat="server" Width="60px" onfocus="ClearTextboxes(this.id,'0,00')" onblur="Blur(this.id,'0,00')" >0,00</asp:TextBox> %</td>
              </tr>
              <tr>
                 <td class="style3">Mat. Motos Peninsula y Baleares</td>
                 <td class="style5"><asp:TextBox ID="MotosPeninsula" runat="server" Width="60px" onfocus="ClearTextboxes(this.id,'0,00')" onblur="Blur(this.id,'0,00')" >0,00</asp:TextBox> %</td>
              </tr>
              <tr>
                 <td class="style3">Mat. Motos Canarias</td>
                 <td class="style5"><asp:TextBox ID="MotosCanarias" runat="server" Width="60px" onfocus="ClearTextboxes(this.id,'0,00')" onblur="Blur(this.id,'0,00')" >0,00</asp:TextBox> %</td>
              </tr>
              <tr>
                 <td class="style3">IVA General</td>
                 <td class="style5"><asp:TextBox ID="IVA" runat="server" Width="60px" onfocus="ClearTextboxes(this.id,'0,00')" onblur="Blur(this.id,'0,00')" >0,00</asp:TextBox> %</td>
              </tr>
              <tr>
                 <td class="style3">IGIC General</td>
                 <td class="style5"><asp:TextBox ID="IGICGral" runat="server" Width="60px" onfocus="ClearTextboxes(this.id,'0,00')" onblur="Blur(this.id,'0,00')" >0,00</asp:TextBox> %</td>
              </tr>
              <tr>
                 <td class="style3">IGIC Bajo</td>
                 <td class="style5"><asp:TextBox ID="IGICBajo" runat="server" Width="60px" onfocus="ClearTextboxes(this.id,'0,00')" onblur="Blur(this.id,'0,00')" >0,00</asp:TextBox> %</td>
              </tr>
              <tr>
                 <td class="style3">IGIC Alto</td>
                 <td class="style5"><asp:TextBox ID="IGICAlto" runat="server" Width="60px" onfocus="ClearTextboxes(this.id,'0,00')" onblur="Blur(this.id,'0,00')" >0,00</asp:TextBox> %</td>
              </tr>
              <tr>
                 <td class="style3">Contract Fees</td>
                 <td class="style5"><asp:TextBox ID="ContractFee" runat="server" Width="60px" onfocus="ClearTextboxes(this.id,'0,00')" onblur="Blur(this.id,'0,00')" >0,00</asp:TextBox> €</td>
              </tr>
              </table>
          </div>
    </div>
    <div style="clear:both"></div>
    <div id="GastosGestoriaLista6" class="CajaConfig" style="height: auto; width:218px">
      <div class="TituloCajaConfig" style="width:210px">Gastos Gestoria Lista 6</div>
          <div class="CajaTabladatosConfig" style="width:208px;">
              <table class="TablaDatosConfig" >
              <tr>
                 <td class="style4">Zona 1</td>
                 <td class="style1"><asp:TextBox ID="GestLista6Zona1" runat="server" Width="60px" onfocus="ClearTextboxes(this.id,'0,00')" onblur="Blur(this.id,'0,00')" >0,00</asp:TextBox> €</td>
              </tr>
              <tr>
                 <td class="style4">Zona 2</td>
                 <td class="style1"><asp:TextBox ID="GestLista6Zona2" runat="server" Width="60px" onfocus="ClearTextboxes(this.id,'0,00')" onblur="Blur(this.id,'0,00')" >0,00</asp:TextBox> €</td>
              </tr>
              <tr>
                 <td class="style4">Zona 3</td>
                 <td class="style1"><asp:TextBox ID="GestLista6Zona3" runat="server" Width="60px" onfocus="ClearTextboxes(this.id,'0,00')" onblur="Blur(this.id,'0,00')" >0,00</asp:TextBox> €</td>
              </tr>
              <tr>
                 <td class="style4">Zona 4</td>
                 <td class="style1"><asp:TextBox ID="GestLista6Zona4" runat="server" Width="60px" onfocus="ClearTextboxes(this.id,'0,00')" onblur="Blur(this.id,'0,00')" >0,00</asp:TextBox> €</td>
              </tr>
              <tr>
                 <td class="style4">Zona 5</td>
                 <td class="style1"><asp:TextBox ID="GestLista6Zona5" runat="server" Width="60px" onfocus="ClearTextboxes(this.id,'0,00')" onblur="Blur(this.id,'0,00')" >0,00</asp:TextBox> €</td>
              </tr>
              <tr>
                 <td class="style4">Zona 6</td>
                 <td class="style1"><asp:TextBox ID="GestLista6Zona6" runat="server" Width="60px" onfocus="ClearTextboxes(this.id,'0,00')" onblur="Blur(this.id,'0,00')" >0,00</asp:TextBox> €</td>
              </tr>
              <tr>
                 <td class="style4">Zona 7</td>
                 <td class="style1"><asp:TextBox ID="GestLista6Zona7" runat="server" Width="60px" onfocus="ClearTextboxes(this.id,'0,00')" onblur="Blur(this.id,'0,00')" >0,00</asp:TextBox> €</td>
              </tr>
        </table>
        </div>
    </div>
    <div id="GastosGestoriaLista7" class="CajaConfig" style="height: auto; width:218px">
      <div class="TituloCajaConfig" style="width:210px;">Gastos Gestoria Lista 7</div>
          <div class="CajaTabladatosConfig"style="width:208px;">
              <table class="TablaDatosConfig">
              <tr>
                 <td class="style4">Zona 1</td>
                 <td class="style1"><asp:TextBox ID="GestLista7Zona1" runat="server" Width="60px" onfocus="ClearTextboxes(this.id,'0,00')" onblur="Blur(this.id,'0,00')" >0,00</asp:TextBox> €</td>
              </tr>
              <tr>
                 <td class="style4">Zona 2</td>
                 <td class="style1"><asp:TextBox ID="GestLista7Zona2" runat="server" Width="60px" onfocus="ClearTextboxes(this.id,'0,00')" onblur="Blur(this.id,'0,00')" >0,00</asp:TextBox> €</td>
              </tr>
              <tr>
                 <td class="style4">Zona 3</td>
                 <td class="style1"><asp:TextBox ID="GestLista7Zona3" runat="server" Width="60px" onfocus="ClearTextboxes(this.id,'0,00')" onblur="Blur(this.id,'0,00')" >0,00</asp:TextBox> €</td>
              </tr>
              <tr>
                 <td class="style4">Zona 4</td>
                 <td class="style1"><asp:TextBox ID="GestLista7Zona4" runat="server" Width="60px" onfocus="ClearTextboxes(this.id,'0,00')" onblur="Blur(this.id,'0,00')" >0,00</asp:TextBox> €</td>
              </tr>
              <tr>
                 <td class="style4">Zona 5</td>
                 <td class="style1"><asp:TextBox ID="GestLista7Zona5" runat="server" Width="60px" onfocus="ClearTextboxes(this.id,'0,00')" onblur="Blur(this.id,'0,00')" >0,00</asp:TextBox> €</td>
              </tr>
              <tr>
                 <td class="style4">Zona 6</td>
                 <td class="style1"><asp:TextBox ID="GestLista7Zona6" runat="server" Width="60px" onfocus="ClearTextboxes(this.id,'0,00')" onblur="Blur(this.id,'0,00')" >0,00</asp:TextBox> €</td>
              </tr>
              <tr>
                 <td class="style4">Zona 7</td>
                 <td class="style1"><asp:TextBox ID="GestLista7Zona7" runat="server" Width="60px" onfocus="ClearTextboxes(this.id,'0,00')" onblur="Blur(this.id,'0,00')" >0,00</asp:TextBox> €</td>
              </tr>
        </table>
        </div>
    </div>

    <div id="GastosSeguridadLista6" class="CajaConfig" style="height:auto ; width:218px">
      <div class="TituloCajaConfig" style="width:210px">Gastos Seguridad Lista 6</div>
          <div class="CajaTabladatosConfig" style="width:208px;">
              <table class="TablaDatosConfig">
              <tr>
                 <td class="style4">Zona 1</td>
                 <td class="style1"><asp:TextBox ID="SegLista6Zona1" runat="server" Width="60px" onfocus="ClearTextboxes(this.id,'0,00')" onblur="Blur(this.id,'0,00')" >0,00</asp:TextBox> €</td>
              </tr>
              <tr>
                 <td class="style4">Zona 2</td>
                 <td class="style1"><asp:TextBox ID="SegLista6Zona2" runat="server" Width="60px" onfocus="ClearTextboxes(this.id,'0,00')" onblur="Blur(this.id,'0,00')" >0,00</asp:TextBox> €</td>
              </tr>
              <tr>
                 <td class="style4">Zona 3</td>
                 <td class="style1"><asp:TextBox ID="SegLista6Zona3" runat="server" Width="60px" onfocus="ClearTextboxes(this.id,'0,00')" onblur="Blur(this.id,'0,00')" >0,00</asp:TextBox> €</td>
              </tr>
              <tr>
                 <td class="style4">Zona 4</td>
                 <td class="style1"><asp:TextBox ID="SegLista6Zona4" runat="server" Width="60px" onfocus="ClearTextboxes(this.id,'0,00')" onblur="Blur(this.id,'0,00')" >0,00</asp:TextBox> €</td>
              </tr>
              <tr>
                 <td class="style4">Zona 5</td>
                 <td class="style1"><asp:TextBox ID="SegLista6Zona5" runat="server" Width="60px" onfocus="ClearTextboxes(this.id,'0,00')" onblur="Blur(this.id,'0,00')" >0,00</asp:TextBox> €</td>
              </tr>
              <tr>
                 <td class="style4">Zona 6</td>
                 <td class="style1"><asp:TextBox ID="SegLista6Zona6" runat="server" Width="60px" onfocus="ClearTextboxes(this.id,'0,00')" onblur="Blur(this.id,'0,00')" >0,00</asp:TextBox> €</td>
              </tr>
              <tr>
                 <td class="style4">Zona 7</td>
                 <td class="style1"><asp:TextBox ID="SegLista6Zona7" runat="server" Width="60px" onfocus="ClearTextboxes(this.id,'0,00')" onblur="Blur(this.id,'0,00')" >0,00</asp:TextBox> €</td>
              </tr>
        </table>
        </div>
    </div>
    <div id="GastosSeguridadLista7" class="CajaConfig" style="height: auto; width:218px">
      <div class="TituloCajaConfig" style="width:210px">Gastos Seguridad Lista 7</div>
          <div class="CajaTabladatosConfig" style="width:208px;">
              <table class="TablaDatosConfig">
              <tr>
                 <td class="style4">Zona 1</td>
                 <td class="style1"><asp:TextBox ID="SegLista7Zona1" runat="server" Width="60px" onfocus="ClearTextboxes(this.id,'0,00')" onblur="Blur(this.id,'0,00')" >0,00</asp:TextBox> €</td>
              </tr>
              <tr>
                 <td class="style4">Zona 2</td>
                 <td class="style1"><asp:TextBox ID="SegLista7Zona2" runat="server" Width="60px" onfocus="ClearTextboxes(this.id,'0,00')" onblur="Blur(this.id,'0,00')" >0,00</asp:TextBox> €</td>
              </tr>
              <tr>
                 <td class="style4">Zona 3</td>
                 <td class="style1"><asp:TextBox ID="SegLista7Zona3" runat="server" Width="60px" onfocus="ClearTextboxes(this.id,'0,00')" onblur="Blur(this.id,'0,00')" >0,00</asp:TextBox> €</td>
              </tr>
              <tr>
                 <td class="style4">Zona 4</td>
                 <td class="style1"><asp:TextBox ID="SegLista7Zona4" runat="server" Width="60px" onfocus="ClearTextboxes(this.id,'0,00')" onblur="Blur(this.id,'0,00')" >0,00</asp:TextBox> €</td>
              </tr>
              <tr>
                 <td class="style4">Zona 5</td>
                 <td class="style1"><asp:TextBox ID="SegLista7Zona5" runat="server" Width="60px" onfocus="ClearTextboxes(this.id,'0,00')" onblur="Blur(this.id,'0,00')" >0,00</asp:TextBox> €</td>
              </tr>
              <tr>
                 <td class="style4">Zona 6</td>
                 <td class="style1"><asp:TextBox ID="SegLista7Zona6" runat="server" Width="60px" onfocus="ClearTextboxes(this.id,'0,00')" onblur="Blur(this.id,'0,00')" >0,00</asp:TextBox> €</td>
              </tr>
              <tr>
                 <td class="style4">Zona 7</td>
                 <td class="style1"><asp:TextBox ID="SegLista7Zona7" runat="server" Width="60px" onfocus="ClearTextboxes(this.id,'0,00')" onblur="Blur(this.id,'0,00')" >0,00</asp:TextBox> €</td>
              </tr>
        </table>
        </div>
    </div>
    <div style="clear:both"></div>
    <div id="MenuBotones" style="margin:auto; width:210px">
         <asp:Button ID="BtnGuardar" runat="server" Text="Guardar" cssclass="botom_menu" OnClick="GuardarConfiguracion" />
         <asp:Button ID="Volver" runat="server" Text="Volver" cssclass="botom_menu" OnClick="VolverAPresupuestos" />
    </div>
    <div style="clear:both"></div>
</asp:Content>
<asp:Content ID="ConfiguracionFooter" ContentPlaceHolderID="ContentPlaceHolderFoot" runat="server">
</asp:Content>
