<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Presupuestos.aspx.cs" Inherits="AfinanDotNet2._0.User.Presupuesto" %>
<asp:Content ID="HeaderContent" ContentPlaceHolderID="HeadContent" runat="server">

    <script runat="server">

        void Check_Clicked(Object sender, EventArgs e)
        {
            Entrada.Visible = RBtnEntradaNeto.Checked;
            EntradaPorc.Visible = !(RBtnEntradaNeto.Checked);
            Entrada.Enabled = RBtnEntradaNeto.Checked;
            EntradaPorc.Enabled = !(RBtnEntradaNeto.Checked);
        }
        
        void CambiaOpcionesAvanzadas(Object sender, EventArgs e)
        {
            ExtrasyAccesorios.Visible = MostrarOpcionesAvanzadas.Checked;
            ServiciosdeRenting.Visible = MostrarOpcionesAvanzadas.Checked;
        }
        
    </script>

    <script type="text/javascript" language="javascript">
        
        function ClearTextboxes(objname, waterMarkText) {
            obj = document.getElementById(objname);
            if (obj.value == waterMarkText) {
                obj.value = "";
            }
            obj.style.color = "navy";
            obj.style.background = "ddFFFF";  
        }

        function Blur(objname, waterMarkText) {
            obj = document.getElementById(objname);
            if (obj.value == "") {
                obj.value = waterMarkText;
            }
            obj.style.color = "black";
            obj.style.background = "white";
        }

        function ShowHide(divName, OnOff) {
            var elemento = document.getElementById(divName);
            if (elemento != null) {
                if (OnOff == "on")
                    elemento.style.display = "block";
                else
                    elemento.style.display = "none";
            }
        }

        function SwitchAdvancedOptions(objname) {
            var elemento = document.getElementById(objname);
            var div1 = document.getElementById('ExtrasyAccesorios');
            var div2 = document.getElementById('ServiciosdeRenting');

            alert(objname);
            alert(elemento);
            alert(div1);
            alert(div2);
            alert(elemento.checked);

            var estado = "off";
            if (elemento.checked == true) estado = "on";

            div1.style.display = "block";
            div2.style.display = "block";

            ShowHide(div1, "on");
            ShowHide(div2, "on");
        }

    </script>
        
</asp:Content>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="FormularioEdicion">

        <div style="clear:both ; height: 0px">&nbsp;</div>
        <div style="border:2px solid #4b6c9e ; background-color: #ffffdd;  margin-left: 5px; width: 98%; -moz-border-radius: 8px; -webkit-border-radius: 8px;">
           <table style="width: 100%; height: 20px; color: Navy; ">
                <tr>
                    <td style="width: 33.33%; height: 10px; font-weight:bold; ">Nautica: <asp:Label ID="Empresa_Nau" runat="server"></asp:Label> (<asp:Label ID="IDNautica" runat="server"></asp:Label>)</td>
                    <td style="width: 33.33%; height: 10px;">Vendedor: <asp:Label ID="Vendedor" runat="server"></asp:Label></td>
                    <td style="width: 33.33%; height: 10px; text-align:right">Referencia: <asp:Label ID="Referencia" runat="server"></asp:Label></td>
                </tr>
                <tr>    
                    <td style="width: 33.33%; height: 10px;" >Teléfono: <asp:Label ID="Telf_Movil_Nau" runat="server"></asp:Label></td>
                    <td style="width: 33.33%; height: 10px;">Fax: <asp:Label ID="Fax_Nau" runat="server"></asp:Label></td>
                    <td style="width: 33.33%; height: 10px; text-align:right">Correo: <asp:Label ID="Email_Nau" runat="server"></asp:Label></td>
                </tr>
            </table>
        </div>
              
        <div id="DatosCliente" class="CajaDatos" runat="server">
            <div class="TituloCajaDatos">1 Datos del cliente</div>
            <div class="CajaTabladatosPpto">
                <table class="TablaDatos">
                    <tr>
                        <td style = "width: 58px; height: 26px; font-weight: bold;">Tratamiento</td>
                        <td style="width: 109px; height: 26px;">
                            <asp:DropDownList ID="Tratamiento" runat="server" Width="61px" Height="20px">
                                <asp:ListItem>Sr.</asp:ListItem>
                                <asp:ListItem>Sra.</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td style = "width: 58px; height: 26px; font-weight: bold;">Apellidos</td>
                        <td style="width: 109px; height: 26px;"><asp:TextBox ID="Apellidos" runat="server" Width="225px"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td style = "width: 58px; height: 26px; font-weight: bold;">Nombre</td>
                        <td style="width: 109px; height: 26px;"><asp:TextBox ID="Nombre" runat="server" Width="225px"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td style = "width: 58px; height: 26px; font-weight: bold;">Teléfono</td>
                        <td style="width: 109px; height: 26px;"><asp:TextBox ID="TelefonoCl" runat="server" Width="128px"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td style = "width: 58px; height: 26px; font-weight: bold;">e-mail</td>
                        <td style="width: 109px; height: 26px;"><asp:TextBox ID="EmailCl" runat="server" Width="225px"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td style = "width: 58px; height: 26px; font-weight: bold;">Domicilio</td>
                        <td style="width: 109px; height: 26px;">
                            <asp:DropDownList ID="Domicilio" runat="server" Width="180px">
                                <asp:ListItem>Peninsula y Baleares</asp:ListItem>
                                <asp:ListItem>Canarias</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                </table>    
             </div>       
        </div>
        <div id="BienFinanciado" class="CajaDatos" style="float: right; margin-right:1.5%" runat="server">
            <div class="TituloCajaDatos">2 Bien financiado</div>
            <div class="CajaTabladatosPpto">
                <table class="TablaDatos">
                    <tr>
                        <td style = "width: 147px; height: 26px; font-weight: bold;">Tipo</td>
                        <td style="width: 109px; height: 26px;">
                            <asp:DropDownList ID="Tipo" runat="server" Width="230px">
                                <asp:ListItem>Barco</asp:ListItem>   
                                <asp:ListItem>Electrónica y equipos</asp:ListItem>
                                <asp:ListItem>Moto de agua</asp:ListItem>
                                <asp:ListItem>Motor</asp:ListItem>
                                <asp:ListItem>Neumática</asp:ListItem>
                                <asp:ListItem>Remolque</asp:ListItem>
                                <asp:ListItem>Semirígida</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td style = "width: 147px; height: 26px; font-weight: bold;">Marca y modelo</td>
                        <td style="width: 109px; height: 26px;"><asp:TextBox ID="MarcaModelo" runat="server" Width="225px"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td style = "width: 147px; height: 26px; font-weight: bold;">Eslora homologada (m)</td>
                        <td style="width: 109px; height: 26px;"><asp:TextBox ID="Eslora" runat="server" Width="64px" onfocus="ClearTextboxes(this.id,'0,0')" onblur="Blur(this.id,'0,0')" ></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td style = "width: 147px; height: 26px; font-weight: bold;">Valor sin IVA</td>
                        <td style="width: 109px; height: 26px;"><asp:TextBox ID="ValorsinIVA" runat="server" Width="128px" onfocus="ClearTextboxes(this.id,'0,0')" onblur="Blur(this.id,'0,0')" ></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td style = "width: 147px; height: 26px; font-weight: bold;">Lista (6 o 7)</td>
                        <td style="width: 109px; height: 26px;">
                            <asp:DropDownList ID="Lista6o7" runat="server" Width="64px">
                                <asp:ListItem>6</asp:ListItem>
                                <asp:ListItem Selected="True">7</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td style = "width: 147px; height: 26px; font-weight: bold;">Zona (1,2,3,..7)</td>
                        <td style="width: 109px; height: 26px;">
                             <asp:DropDownList ID="Zona" runat="server" Width="64px">
                                <asp:ListItem>1</asp:ListItem>
                                <asp:ListItem>2</asp:ListItem>
                                <asp:ListItem>3</asp:ListItem>
                                <asp:ListItem>4</asp:ListItem>
                                <asp:ListItem>5</asp:ListItem>
                                <asp:ListItem>6</asp:ListItem>
                                <asp:ListItem>7</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
        <div style="clear:both ; height: 0px">&nbsp;</div>
        <div ID="ExtrasyAccesorios" class="CajaDatos"  visible="false" runat="server">
            <div class="TituloCajaDatos">3 Extras y accesorios</div>
            <div class="CajaTabladatosPpto">
                <table class="TablaDatos">
                    <tr>
                        <td style = "width: 133px;height: 26px;font-weight: bold;">Instalación motores</td>
                        <td style = "width: 90px;height: 26px;"><asp:TextBox ID="InstalacionMotores" runat="server" Width="128px" onfocus="ClearTextboxes(this.id,'0,0')" onblur="Blur(this.id,'0,0')" ></asp:TextBox></td>
                        <td style="width: 109px; height: 26px;"><asp:CheckBox  ID="SiInstalaMot" runat="server"></asp:CheckBox></td>
                    </tr>
                    <tr>
                        <td style = "width: 133px;height: 26px;font-weight: bold;">Remolque</td>
                        <td style = "width: 90px;height: 26px;"><asp:TextBox ID="Remolque" runat="server" Width="128px" onfocus="ClearTextboxes(this.id,'0,0')" onblur="Blur(this.id,'0,0')" ></asp:TextBox></td>
                        <td style="width: 109px; height: 26px;"><asp:CheckBox  ID="SiRemolque" runat="server"></asp:CheckBox></td>
                    </tr>
                    <tr>
                        <td style = "width: 133px;height: 26px;font-weight: bold;">Fundas</td>
                        <td style = "width: 90px;height: 26px;"><asp:TextBox ID="Fundas" runat="server" Width="128px" onfocus="ClearTextboxes(this.id,'0,0')" onblur="Blur(this.id,'0,0')" ></asp:TextBox></td>
                        <td style="width: 109px; height: 26px;"><asp:CheckBox  ID="SiFundas" runat="server"></asp:CheckBox></td>
                    </tr>
                    <tr>
                        <td style = "width: 133px;height: 26px;font-weight: bold;">Otros extras</td>
                        <td style = "width: 90px;height: 26px;"><asp:TextBox ID="OtrosExtras" runat="server" Width="128px" onfocus="ClearTextboxes(this.id,'0,0')" onblur="Blur(this.id,'0,0')" ></asp:TextBox></td>
                        <td style="width: 109px; height: 26px;"><asp:CheckBox  ID="SiOtrosExtras" runat="server"></asp:CheckBox></td>
                    </tr>
                    <tr>
                        <td style = "width: 133px;height: 26px;font-weight: bold;">Total Extras</td>
                        <td style = "width: 90px;height: 26px;"><asp:TextBox ID="TotalExtras" runat="server" Width="128px" Enabled="false"></asp:TextBox></td>
                        <td style="width: 109px; height: 26px;">&nbsp;</td>
                    </tr>
                    <tr>
                        <td style = "width: 133px;height: 26px;font-weight: bold;">Imp. matricula <span style="color:Red">( </span><asp:Label ID="LabelImpuestoMatriculacion" runat="server" Text="12" style="color:Red;"></asp:Label><span style="color:Red"> %)</span></td>
                        <td style = "width: 90px;height: 26px;"><asp:TextBox ID="ImpuestoMatricula" runat="server" Width="128px" Enabled ="false"></asp:TextBox></td>
                        <td style="width: 109px; height: 26px;"><asp:CheckBox  ID="SiImpMat" runat="server"></asp:CheckBox></td>
                    </tr>
                </table>
            </div>
        </div>
        <div ID="ServiciosdeRenting" class="CajaDatos" style="float: right; margin-right:1.5%" visible="false" runat="server">
            <div class="TituloCajaDatos">4 Servicios de renting anuales</div>
            <div class="CajaTabladatosPpto">            
                <table class="TablaDatos">
                    <tr>
                        <td style = "width: 153px;height: 26px;font-weight: bold;">Mantenimiento básico</td>
                        <td style = "width: 90px;height: 26px;"><asp:TextBox ID="Mantenimiento" runat="server" Width="128px" Wrap="False" onfocus="ClearTextboxes(this.id,'0,0')" onblur="Blur(this.id,'0,0')" ></asp:TextBox></td>
                        <td style="width: 109px; height: 26px;"><asp:CheckBox  ID="SiManten" runat="server"></asp:CheckBox></td>
                    </tr>
                    <tr>
                        <td style = "width: 153px;height: 26px;font-weight: bold;">Parking / Pupilaje</td>
                        <td style = "width: 90px;height: 26px;"><asp:TextBox ID="Parking" runat="server" Width="128px" onfocus="ClearTextboxes(this.id,'0,0')" onblur="Blur(this.id,'0,0')" ></asp:TextBox></td>
                        <td style="width: 109px; height: 26px;"><asp:CheckBox  ID="SiParking" runat="server"></asp:CheckBox></td>
                    </tr>
                    <tr>
                        <td style = "width: 153px;height: 26px;font-weight: bold;">Desinvernaje</td>
                        <td style = "width: 90px;height: 26px;"><asp:TextBox ID="Desinvernaje" runat="server" Width="128px" onfocus="ClearTextboxes(this.id,'0,0')" onblur="Blur(this.id,'0,0')" ></asp:TextBox></td>
                        <td style="width: 109px; height: 26px;"><asp:CheckBox  ID="SiDesinv" runat="server"></asp:CheckBox></td>
                    </tr>
                    <tr>
                        <td style = "width: 153px;height: 26px;font-weight: bold;">Otros Servicios</td>
                        <td style = "width: 90px;height: 26px;"><asp:TextBox ID="OtrosServicios" runat="server" Width="128px" onfocus="ClearTextboxes(this.id,'0,0')" onblur="Blur(this.id,'0,0')" ></asp:TextBox></td>
                        <td style="width: 109px; height: 26px;"><asp:CheckBox  ID="SiOtrosS" runat="server"></asp:CheckBox></td>
                    </tr>
                    <tr>
                        <td style = "width: 153px;height: 26px;font-weight: bold;">Total servicios</td>
                        <td style = "width: 90px;height: 26px;"><asp:TextBox ID="TotalServicios" runat="server" Width="128px" Enabled="false"></asp:TextBox></td>
                        <td style="width: 109px; height: 26px;">&nbsp;</td>
                    </tr>
                </table>
            </div>
        </div>
        <div style="clear:both ; height: 0px">&nbsp;</div>
        <div id="DatosdeFinanciacion" class="CajaDatos" runat="server">
            <div class="TituloCajaDatos">5 Datos de financiación</div>
            <div class="CajaTabladatosPpto">
                <table class="TablaDatos">
                    <tr>
                        <td style = "width: 224px;height: 26px;font-weight: bold; ">Plazo Renting Nautico (2 a 10 años)</td>
                        <td style = "width: 90px;height: 26px;">
                             <asp:DropDownList ID="DDLPlazoRenting" runat="server" Width="64px">
                                <asp:ListItem>2</asp:ListItem>
                                <asp:ListItem>3</asp:ListItem>
                                <asp:ListItem>4</asp:ListItem>
                                <asp:ListItem>5</asp:ListItem>
                                <asp:ListItem>6</asp:ListItem>
                                <asp:ListItem>7</asp:ListItem>
                                <asp:ListItem>8</asp:ListItem>
                                <asp:ListItem>9</asp:ListItem>
                                <asp:ListItem>10</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td style = "width: 224px;height: 26px;font-weight: bold; ">
                            <asp:RadioButton ID="RBtnEntradaNeto" runat="server" Text="Entrada neto (con IVA)" 
                                Checked="True" GroupName="RadioGroupEntrada" OnCheckedChanged="Check_Clicked" AutoPostBack="True"/>
                        </td>
                        <td style = "width: 90px;height: 26px;"><asp:TextBox ID="Entrada" runat="server" Width="128px" onfocus="ClearTextboxes(this.id,'0,0')" onblur="Blur(this.id,'0,0')" ></asp:TextBox></td>
                    </tr> 
                    <tr>
                        <td style = "width: 224px;height: 26px;font-weight: bold; "> 
                            <asp:RadioButton ID="RBtnEntradaPorc" runat="server" Text="Entrada en %" 
                            Checked="False" GroupName="RadioGroupEntrada" OnCheckedChanged="Check_Clicked" AutoPostBack="True"/>                 
                        </td>
                        <td style = "width: 90px;height: 26px;"><asp:TextBox ID="EntradaPorc" runat="server" Width="64px" onfocus="ClearTextboxes(this.id,'0,0')" onblur="Blur(this.id,'0,0')"></asp:TextBox></td>
                    </tr>
                </table>
            </div>
        </div>
        <div id="ResultadoFinanciacion" class="CajaDatos" style="float: right; background-color: #ddFFFF; font-size:large ; margin-right:1.5%" runat="server">
            <div class="TituloCajaDatos">6 Resultado financiación</div>
            <div class="CajaTabladatosPpto">
                <table class="TablaDatos">
                    <tr>          
                        <td style="font-weight: bold; height: 26px; width: 280px;" >Número de cuotas</td>
                        <td style="height: 26px;">
                            <asp:Label ID="NumerodeCuotas" runat="server" Text="0" Style=" color:Navy; font-size:large; font-weight:bold" ></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td style="font-weight: bold; height: 26px;width: 280px;" >Importe <asp:Label ID="LabelIVACuotas" runat="server" Text=" " style="color: red;"></asp:Label></td>
                        <td style="height: 26px;">
                            <asp:Label ID="ImportedelasCuotas" runat="server" Text="0 €" Style=" color:Navy; font-size:large; font-weight:bold" ></asp:Label>
                            <asp:Label ID="LabelImportedelasCuotasSinIva" style=" font-size:xx-small;" runat="server" Visible="false" ></asp:Label>
                            <asp:Label ID="LabelCoefIVA" style=" font-size:xx-small;" runat="server" Visible="false"></asp:Label>
                        </td> 
                    </tr>
                    <tr>
                        <td style="font-weight: bold; height: 26px;width: 280px;" >Valor Residual</td>
                        <td style="height: 26px;">
                            <asp:Label ID="ValorResidualCuotas" runat="server" Text="0 €" Style=" color:Navy; font-size:large; font-weight:bold"></asp:Label>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
        <div style="clear:both ; height: 0px">&nbsp;</div>
        <div style="border:2px solid #4b6c9e ; background-color: #ffffdd; margin-left: 5px; width: 98%;  padding-left: 5px; font-weight:bold; float:left; height:20px; -moz-border-radius: 8px; -webkit-border-radius: 8px;">
            <asp:CheckBox ID="MostrarOpcionesAvanzadas" runat="server" AutoPostBack="True"  OnCheckedChanged="CambiaOpcionesAvanzadas"/> Mostrar opciones avanzadas.
        </div> 
        <div id="MenuBotones" style="margin:auto; width:310px">
            <asp:Button ID="BtnBorrar"   runat="server" Text="Borrar" cssclass="botom_menu" OnClick="Borrar" />
            <asp:Button ID="BtnCalcular" runat="server" Text="Calcular" cssclass="botom_menu" OnClick="CalculaCuotas"/>
            <asp:Button ID="BtnImprimir" runat="server" Text="Imprimir" cssclass="botom_menu" OnClick="Imprimir"/> 
        </div>
        <asp:Label ID="labelerrores" runat="server"></asp:Label>
     </div>  
</asp:Content>

