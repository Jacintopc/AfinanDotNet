<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Presupuestos.aspx.cs" Inherits="AfinanDotNet2._0.User.Presupuesto" %>
<asp:Content id="HeaderContent" ContentPlaceHolderID="HeadContent" runat="server">

    <script type="text/javascript" language="javascript">

        function EntradaNetoClicked(objname) {
            var radiob = document.getElementById(objname);

            var rad1 = document.getElementById('<%=RBtnEntradaNeto.ClientID%>');
            var rad2 = document.getElementById('<%=RBtnEntradaPorc.ClientID%>');
            
            var ent1 = document.getElementById('<%=Entrada.ClientID%>');
            var ent2 = document.getElementById('<%=EntradaPorc.ClientID%>');

            if (rad1.checked) 
            {
               ent1.style.display = "block";
               ent2.style.display = "none";
            }
            else
            {
               ent1.style.display = "none";
               ent2.style.display = "block";     
            }
            return true;
        }

        function SwitchAdvancedOptions(objname) {
            var elemento = document.getElementById(objname);
            var div1 = document.getElementById('<%=ExtrasyAccesorios.ClientID%>');
            var div2 = document.getElementById('<%=ServiciosdeRenting.ClientID%>');
            
            var state = div1.style.display;
            
             if (state == 'block') {  
                 div1.style.display = 'none';  
                 div2.style.display = 'none';
                 elemento.cheched = false;

             } else {  
                 div1.style.display = 'block';
                 div2.style.display = 'block';
                 elemento.cheched = true;
             }  

            return true;
        }    

        function maskedTextbox(evt,objname) { 
            var e = evt || window.event; 
            var pK = evt.which || e.keyCode; 
            var keyPressed = String.fromCharCode(pK);
            
            var obj = document.getElementById(objname);
            var mascarareal = /^((([0-9]|[\x60-\x69])*)|(([0-9]|[\x60-\x69])+(\,|\xBC)?([0-9]|[\x60-\x69])*))$/;
            var candidato = obj.value;

            var reDigit = /^(\d|\xBC)$/;                                                // cualquier digito o comma
            var reNumPadDigit = /[\x60-\x69]/;                                          // cualquier digito del numpad
            var reCTRLChars = /[\x63\x78\x76\x7A]/;                                     // <!-- Non-IE: cut, paste, etc. IE lets CTRL operations through. -->
            var reAllowedCodes = /[\x00\x08\x23\x24\x25\x26\x27\x28\x2D\x2E\x0D\x09]/;      // <!--  arrow keys, ins, del, hom, end, bspace -->

            if (reCTRLChars.test(keyPressed) || reAllowedCodes.test(keyPressed) || reDigit.test(keyPressed) || reNumPadDigit.test(keyPressed)) 
                 {
                     if (reDigit.test(keyPressed) || reNumPadDigit.test(keyPressed)) 
                        { candidato = candidato + keyPressed; }

                    if (mascarareal.test(candidato)) { return true; }        // es una tecla válida y cumple con el patron
                    else {
                        // alert(candidato + ' ES UN VALOR INCORRECTO: Intentelo de nuevo.');
                        obj.focus();
                        return false;
                    }                 
                 }
            else { return false; }
        }

        /* 
         Normal HTML example: input type="text" onkeypress="return maskedTextbox(event);"  
         ASP.NET C# example:  asp:TextBox id="txtEmail" onkeypress="return maskedTextbox(event);" runat="server"  
        */

        function validateEmail(objname) {
            var emailPat = /^(\".*\"|[A-Za-z]\w*)@(\[\d{1,3}(\.\d{1,3}){3}]|[A-Za-z]\w*(\.[A-Za-z]\w*)+)$/;
            var emailid = document.getElementById(objname).value;
            var matchArray = emailid.match(emailPat);

            if ((emailid != "") && (matchArray == null)) {
                alert("Dirección de correo electrónico incorrecta. Inténtelo de nuevo.");
                document.getElementById(objname).focus();
                return false;
            }
            obj.style.color = 'black';
            obj.style.fontWeight = 'normal';
            obj.style.background = 'white';
            return true;
        }


        function ClearTextboxes(objname, waterMarkText) {
            var obj = document.getElementById(objname);
            if (obj.value == waterMarkText) {
                obj.value = '';
            }
            obj.style.color = 'navy';
            obj.style.fontWeight = 'bold';
            obj.style.background = '#ddFFFF';  
            return true;
        }

        function BlurTextboxes(objname, waterMarkText) {
            var obj = document.getElementById(objname);
            if (obj.value == "") {
                obj.value = waterMarkText;
            }
            obj.style.color = 'black';
            obj.style.fontWeight = 'normal';
            obj.style.background = 'white';
            return true;
        }

    </script>
        
</asp:Content>
<asp:Content id="BodyContent" ContentPlaceHolderID="MainContent" runat="server" >

    <div class="FormularioEdicion">

        <div style="clear:both ; height: 0px">&nbsp;</div>
        <div id="CabeceraNautica" style="border:2px solid #4b6c9e ; background-color: #ffffdd;  margin-left: 5px; width: 98%; -moz-border-radius: 8px; -webkit-border-radius: 8px;">
           <table style="width: 100%; height: 20px; color: Navy; ">
                <tr>
                    <td style="width: 33.33%; height: 10px; font-weight:bold; ">Nautica: <asp:Label id="Empresa_Nau" runat="server"></asp:Label> (<asp:Label id="IDNautica" runat="server"></asp:Label>)</td>
                    <td style="width: 33.33%; height: 10px;">Vendedor: <asp:Label id="Vendedor" runat="server"></asp:Label></td>
                    <td style="width: 33.33%; height: 10px; text-align:right">Referencia: <asp:Label id="Referencia" runat="server"></asp:Label></td>
                </tr>
                <tr>    
                    <td style="width: 33.33%; height: 10px;" >Teléfono: <asp:Label id="Telf_Movil_Nau" runat="server"></asp:Label></td>
                    <td style="width: 33.33%; height: 10px;">Fax: <asp:Label id="Fax_Nau" runat="server"></asp:Label></td>
                    <td style="width: 33.33%; height: 10px; text-align:right">Correo: <asp:Label id="Email_Nau" runat="server"></asp:Label></td>
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
                            <asp:DropDownList id="Tratamiento" runat="server" Width="61px" Height="20px">
                                <asp:ListItem>Sr.</asp:ListItem>
                                <asp:ListItem>Sra.</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td style = "width: 58px; height: 26px; font-weight: bold;">Apellidos</td>
                        <td style="width: 109px; height: 26px;"><asp:TextBox id="Apellidos" onfocus="ClearTextboxes(this.id,'')" onblur="BlurTextboxes(this.id,'')" runat="server" Width="225px"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td style = "width: 58px; height: 26px; font-weight: bold;">Nombre</td>
                        <td style="width: 109px; height: 26px;"><asp:TextBox id="Nombre" onfocus="ClearTextboxes(this.id,'')" onblur="BlurTextboxes(this.id,'')" runat="server" Width="225px"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td style = "width: 58px; height: 26px; font-weight: bold;">Teléfono</td>
                        <td style="width: 109px; height: 26px;"><asp:TextBox id="TelefonoCl" onfocus="ClearTextboxes(this.id,'')" onblur="BlurTextboxes(this.id,'')" runat="server" Width="128px"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td style = "width: 58px; height: 26px; font-weight: bold;">e-mail</td>
                        <td style="width: 109px; height: 26px;"><asp:TextBox id="EmailCl" onfocus="ClearTextboxes(this.id,'')" onblur="return validateEmail(this.id);" 
                         runat="server" Width="225px"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td style = "width: 58px; height: 26px; font-weight: bold;">Domicilio</td>
                        <td style="width: 109px; height: 26px;">
                            <asp:DropDownList id="Domicilio" runat="server" Width="180px">
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
                            <asp:DropDownList id="Tipo" runat="server" Width="230px">
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
                        <td style="width: 109px; height: 26px;"><asp:TextBox id="MarcaModelo" onfocus="ClearTextboxes(this.id,'')" onblur="BlurTextboxes(this.id,'')" runat="server" Width="225px"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td style = "width: 147px; height: 26px; font-weight: bold;">Eslora homologada (m)</td>
                        <td style="width: 109px; height: 26px;"><asp:TextBox id="Eslora" runat="server" Width="64px" onKeydown="return maskedTextbox(event,this.id);" onfocus="ClearTextboxes(this.id,'0,0')" onblur="BlurTextboxes(this.id,'0,0')" ></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td style = "width: 147px; height: 26px; font-weight: bold;">Valor sin IVA</td>
                        <td style="width: 109px; height: 26px;"><asp:TextBox id="ValorsinIVA" runat="server" Width="128px" onKeydown="return maskedTextbox(event,this.id);" onfocus="ClearTextboxes(this.id,'0,0')" onblur="BlurTextboxes(this.id,'0,0')" ></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td style = "width: 147px; height: 26px; font-weight: bold;">Lista (6 o 7)</td>
                        <td style="width: 109px; height: 26px;">
                            <asp:DropDownList id="Lista6o7" runat="server" Width="64px">
                                <asp:ListItem>6</asp:ListItem>
                                <asp:ListItem Selected="True">7</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td style = "width: 147px; height: 26px; font-weight: bold;">Zona (1,2,3,..7)</td>
                        <td style="width: 109px; height: 26px;">
                             <asp:DropDownList id="Zona" runat="server" Width="64px">
                                <asp:ListItem>1</asp:ListItem>
                                <asp:ListItem>2</asp:ListItem>
                                <asp:ListItem Selected="True">3</asp:ListItem>
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
        <div id="ExtrasyAccesorios" class="CajaDatos" runat="server"  style="display:block;">
            <div class="TituloCajaDatos">3 Extras y accesorios</div>
            <div class="CajaTabladatosPpto">
                <table class="TablaDatos">
                    <tr>
                        <td style = "width: 133px;height: 26px;font-weight: bold;">Instalación motores</td>
                        <td style = "width: 90px;height: 26px;"><asp:TextBox id="InstalacionMotores" runat="server" Width="128px" onKeydown="return maskedTextbox(event,this.id);" onfocus="ClearTextboxes(this.id,'0,0')" onblur="BlurTextboxes(this.id,'0,0')" ></asp:TextBox></td>
                        <td style="width: 109px; height: 26px;"><asp:CheckBox  id="SiInstalaMot" runat="server" ToolTip="Financiar"></asp:CheckBox></td>
                    </tr>
                    <tr>
                        <td style = "width: 133px;height: 26px;font-weight: bold;">Remolque</td>
                        <td style = "width: 90px;height: 26px;"><asp:TextBox id="Remolque" runat="server" Width="128px" onKeydown="return maskedTextbox(event,this.id);"  onfocus="ClearTextboxes(this.id,'0,0')" onblur="BlurTextboxes(this.id,'0,0')" ></asp:TextBox></td>
                        <td style="width: 109px; height: 26px;"><asp:CheckBox  id="SiRemolque" runat="server" ToolTip="Financiar"></asp:CheckBox></td>
                    </tr>
                    <tr>
                        <td style = "width: 133px;height: 26px;font-weight: bold;">Fundas</td>
                        <td style = "width: 90px;height: 26px;"><asp:TextBox id="Fundas" runat="server" Width="128px" onKeydown="return maskedTextbox(event,this.id);"  onfocus="ClearTextboxes(this.id,'0,0')" onblur="BlurTextboxes(this.id,'0,0')" ></asp:TextBox></td>
                        <td style="width: 109px; height: 26px;"><asp:CheckBox  id="SiFundas" runat="server" ToolTip="Financiar"></asp:CheckBox></td>
                    </tr>
                    <tr>
                        <td style = "width: 133px;height: 26px;font-weight: bold;">Otros extras</td>
                        <td style = "width: 90px;height: 26px;"><asp:TextBox id="OtrosExtras" runat="server" Width="128px"  onKeydown="return maskedTextbox(event,this.id);" onfocus="ClearTextboxes(this.id,'0,0')" onblur="BlurTextboxes(this.id,'0,0')" ></asp:TextBox></td>
                        <td style="width: 109px; height: 26px;"><asp:CheckBox  id="SiOtrosExtras" runat="server" ToolTip="Financiar"></asp:CheckBox></td>
                    </tr>
                    <tr>
                        <td style = "width: 133px;height: 26px;font-weight: bold;">Total Extras</td>
                        <td style = "width: 90px;height: 26px;"><asp:TextBox id="TotalExtras" runat="server" Width="128px" Enabled="false"></asp:TextBox></td>
                        <td style="width: 109px; height: 26px;">&nbsp;</td>
                    </tr>
                    <tr>
                        <td style = "width: 133px;height: 26px;font-weight: bold;">Imp. matricula <span style="color:Red">( </span><asp:Label id="LabelImpuestoMatriculacion" runat="server" Text="12" style="color:Red;"></asp:Label><span style="color:Red"> %)</span></td>
                        <td style = "width: 90px;height: 26px;"><asp:TextBox id="ImpuestoMatricula" runat="server" Width="128px" Enabled ="false"></asp:TextBox></td>
                        <td style="width: 109px; height: 26px;"><asp:CheckBox  id="SiImpMat" runat="server" ToolTip="Financiar"></asp:CheckBox></td>
                    </tr>
                </table>
            </div>
        </div>
        <div id="ServiciosdeRenting" class="CajaDatos" style="float: right; margin-right:1.5%; display:block;" runat="server">
            <div class="TituloCajaDatos">4 Servicios de renting anuales</div>
            <div class="CajaTabladatosPpto">            
                <table class="TablaDatos">
                    <tr>
                        <td style = "width: 153px;height: 26px;font-weight: bold;">Mantenimiento básico</td>
                        <td style = "width: 90px;height: 26px;"><asp:TextBox id="Mantenimiento" runat="server" Width="128px" Wrap="False"  onKeydown="return maskedTextbox(event,this.id);" onfocus="ClearTextboxes(this.id,'0,0')" onblur="BlurTextboxes(this.id,'0,0')" ></asp:TextBox></td>
                        <td style="width: 109px; height: 26px;"><asp:CheckBox  id="SiManten" runat="server" ToolTip="Financiar"></asp:CheckBox></td>
                    </tr>
                    <tr>
                        <td style = "width: 153px;height: 26px;font-weight: bold;">Parking / Pupilaje</td>
                        <td style = "width: 90px;height: 26px;"><asp:TextBox id="Parking" runat="server" Width="128px"  onKeydown="return maskedTextbox(event,this.id);" onfocus="ClearTextboxes(this.id,'0,0')" onblur="BlurTextboxes(this.id,'0,0')" ></asp:TextBox></td>
                        <td style="width: 109px; height: 26px;"><asp:CheckBox  id="SiParking" runat="server" ToolTip="Financiar"></asp:CheckBox></td>
                    </tr>
                    <tr>
                        <td style = "width: 153px;height: 26px;font-weight: bold;">Desinvernaje</td>
                        <td style = "width: 90px;height: 26px;"><asp:TextBox id="Desinvernaje" runat="server" Width="128px" onKeydown="return maskedTextbox(event,this.id);"  onfocus="ClearTextboxes(this.id,'0,0')" onblur="BlurTextboxes(this.id,'0,0')" ></asp:TextBox></td>
                        <td style="width: 109px; height: 26px;"><asp:CheckBox  id="SiDesinv" runat="server" ToolTip="Financiar"></asp:CheckBox></td>
                    </tr>
                    <tr>
                        <td style = "width: 153px;height: 26px;font-weight: bold;">Otros Servicios</td>
                        <td style = "width: 90px;height: 26px;"><asp:TextBox id="OtrosServicios" runat="server" Width="128px" onKeydown="return maskedTextbox(event,this.id);" onfocus="ClearTextboxes(this.id,'0,0')" onblur="BlurTextboxes(this.id,'0,0')" ></asp:TextBox></td>
                        <td style="width: 109px; height: 26px;"><asp:CheckBox  id="SiOtrosS" runat="server" ToolTip="Financiar"></asp:CheckBox></td>
                    </tr>
                    <tr>
                        <td style = "width: 153px;height: 26px;font-weight: bold;">Total servicios</td>
                        <td style = "width: 90px;height: 26px;"><asp:TextBox id="TotalServicios" runat="server" Width="128px" Enabled="false"></asp:TextBox></td>
                        <td style="width: 109px; height: 26px;">&nbsp;</td>
                    </tr>
                </table>
            </div>
        </div>
      
        <div style="clear:both ; height: 0px">&nbsp;</div>
        <div id="DatosdeFinanciacion" class="CajaDatos" runat="server">
            <div class="TituloCajaDatos">5 Datos de financiación</div>
            <div class="CajaTabladatosPpto">
                <table class="TablaDatos" style="table-layout: fixed"  >
                    <colgroup>
                        <col width="65%"/><col width="35%"/>
                    </colgroup>
                    <tr>
                        <td style = "width: 65%; height: 26px; font-weight: bold; " >Plazo Renting Nautico (2 a 10 años)</td>
                        <td style = "width: 35%; height: 26px; ">
                             <asp:DropDownList id="DDLPlazoRenting" runat="server" Width="64px">
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
                        <td style = "height: 26px; font-weight: bold;">
                            <asp:RadioButton id="RBtnEntradaNeto" runat="server" Text="Entrada neto (con IVA)" Checked="True" GroupName="RadioGroupEntrada" />
                        </td>
                        <td style = "height: 26px; "><asp:TextBox id="Entrada" runat="server" Width="128px" onKeydown="return maskedTextbox(event,this.id);"  onfocus="ClearTextboxes(this.id,'0,0')" onblur="BlurTextboxes(this.id,'0,0')" ></asp:TextBox></td>
                    </tr> 
                    <tr>
                        <td style = "height: 26px; font-weight: bold "> 
                            <asp:RadioButton id="RBtnEntradaPorc" runat="server" Text="Entrada en %" Checked="False" GroupName="RadioGroupEntrada"/>                 
                        </td>
                        <td style = "height: 26px; "><asp:TextBox id="EntradaPorc" runat="server" Width="64px" onKeydown="return maskedTextbox(event,this.id);" onfocus="ClearTextboxes(this.id,'0,0')" onblur="BlurTextboxes(this.id,'0,0')"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td style = "height: 26px; font-weight: bold ">Valor Residual </td>
                        <td style = "height: 26px; "><asp:DropDownList ID="DropDownListValorResidual" runat="server" Width="64px">
                            <asp:ListItem>0%</asp:ListItem>
                            <asp:ListItem>5%</asp:ListItem>
                            <asp:ListItem>10%</asp:ListItem>
                            <asp:ListItem>15%</asp:ListItem>
                            <asp:ListItem>20%</asp:ListItem>
                            </asp:DropDownList>
                        </td>
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
                            <asp:Label id="NumerodeCuotas" runat="server" Text="0" Style=" color:Navy; font-size:large; font-weight:bold" ></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td style="font-weight: bold; height: 26px;width: 280px;" >Importe <asp:Label id="LabelIVACuotas" runat="server" Text=" " style="color: red;"></asp:Label></td>
                        <td style="height: 26px;">
                            <asp:Label id="ImportedelasCuotas" runat="server" Text="0 €" Style=" color:Navy; font-size:large; font-weight:bold" ></asp:Label>
                            <asp:Label id="LabelImportedelasCuotasSinIva" style=" font-size:xx-small;" runat="server" Visible="false" ></asp:Label>
                            <asp:Label id="LabelCoefIVA" style=" font-size:xx-small;" runat="server" Visible="false"></asp:Label>
                            <asp:Label id="LabelValorResidualCuotas" style=" font-size:xx-small;" runat="server" Visible="false"></asp:Label>
                        </td> 
                    </tr>
                    <tr>
                        <td style="font-weight: bold; height: 26px;width: 280px;" >Valor Residual</td>
                        <td style="height: 26px;">
                            <asp:Label id="ValorResidualCuotas" runat="server" Text="0 €" Style=" color:Navy; font-size:large; font-weight:bold"></asp:Label>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
        <div style="clear:both ; height: 0px">&nbsp;</div>
        <div id="opcionesavanzadas" style="margin:10px auto 10px auto; border:2px solid #4b6c9e ; background-color: #ffffdd;  margin-left: 5px; width: 98%; -moz-border-radius: 8px; -webkit-border-radius: 8px;">
            <asp:CheckBox id="MostrarOpcionesAvanzadas"  style="font-weight: bold;" Checked="false" runat="server" Text=" Mostrar opciones avanzadas"/> 
        </div>
        <div id="MenuBotones" style="margin:10px auto 10px auto; width:310px">
            <asp:Button id="BtnBorrar"   runat="server" Text="Borrar" cssclass="botom_menu" OnClick="Borrar" />
            <asp:Button id="BtnCalcular" runat="server" Text="Calcular" cssclass="botom_menu" OnClick="CalculaCuotas"/>
            <asp:Button id="BtnImprimir" runat="server" Text="Imprimir" cssclass="botom_menu" OnClick="Imprimir" /> 
        </div>
        <asp:Label id="labelerrores" runat="server" style="color:Red;"></asp:Label>
     </div>  
</asp:Content>

