&GLOBAL-DEFINE OUT PUT UNFORMATTED
/*
'(fg1.rows - fg1.fixedrows - (1 - fg1.fixedrows))
*/
{&out}
'
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link rel="stylesheet" type="text/css" href="/gmm/css/EstilosGMM.css">
<script language="JavaScript" type="text/JavaScript">
<!--
function MM_reloadPage(init) ~{  //reloads the window if Nav4 resized
  if (init==true) with (navigator) ~{if ((appName=="Netscape")&&(parseInt(appVersion)==4)) ~{
    document.MM_pgW=innerWidth; document.MM_pgH=innerHeight; onresize=MM_reloadPage; }}
  else if (innerWidth!=document.MM_pgW || innerHeight!=document.MM_pgH) location.reload();
}
MM_reloadPage(true);
//-->
</script>
</head>
' skip.
{&out}
'
<script language="VBScript" type="text/VBScript">

Private Sub document_onmousedown()
  
  if window.event.button = 2 then 
    Alert "Esta funci¾n esta deshabilitada !!"
  end if
End Sub

Sub fg_AfterRowColChange (OldRow, OldCol, NewRow, NewCol)
	   Muestrafg1()
	   pintafg()
    if  NewRow > 0 then
       for I = fg1.fixedrows to  (fg1.rows - 1)
	      if fg1.textmatrix(I,fg1.colindex("NumAsegurado")) = fg.textmatrix(fg.row,fg.colindex("NumAsegurado")) then
		     fg1.rowhidden(I) = false
   		   else
		     fg1.rowhidden(I) = true
		   end if
	   next

   end if
End Sub
                 ' skip.
                 {&out}
                 '

Sub Muestrafg1()
    if (fg1.rows - fg1.fixedrows) > 0 then
       for I = fg1.fixedrows to  fg1.rows 
	      if fg1.rowhidden(I) = false then
		      fg1.select I, 0, I, 0
			  fg1.row = I
			  fg1.col = 0
			  fg1.showcell I, 0
			  pintafg()
			  exit For 
		  end if 
	   next
	end if
end sub

Sub Muestrafg()
    if (fg.rows - fg.fixedrows) > 0 then
	   fg.select fg.fixedrows, 0, fg.fixedrows, 0
	   for I = fg1.fixedrows to (fg1.rows - fg1.fixedrows - (1 - fg1.fixedrows))
	       if fg1.textmatrix(I,fg1.colindex("NumAsegurado")) = fg.textmatrix(fg.row,fg.colindex("NumAsegurado")) then
		      fg1.rowhidden(I) = false
           else
              fg1.rowhidden(I) = true
  		   end if
	   next
	end if
	Muestrafg1()
end sub
                  ' skip.
                  {&out}
                  '

sub pintafg()
 with fg
	          Endoso.value          = .textmatrix(.row,.colindex("NumEndoso"))
              fechaanti.value       = .textmatrix(.row,.colindex("FechaAntiguedad"))
	          fechaalta.value       = .textmatrix(.row,.colindex("FechaAlta"))
	          primaasegurado.value  = .textmatrix(.row,.colindex("PrimaAseg"))
			  fechancimiento.value  = .textmatrix(.row,.colindex("FechaNacimiento"))
	          edad.value            = .textmatrix(.row,.colindex("Edad")) 
	          sexo.value            = .textmatrix(.row,.colindex("Sexo"))
	          edocivil.value        = .textmatrix(.row,.colindex("Edocivil"))
	          parentesco.value      = .textmatrix(.row,.colindex("Parentesco"))
	          NombreCompleto.value  = .textmatrix(.row,.colindex("NombreCompleto"))
	          Ocupacion.value       = .textmatrix(.row,.colindex("Ocupacion"))
			  Cantidad.value        = .textmatrix(.row,.colindex("Cantidad"))
	          Porcentaje.value      = .textmatrix(.row,.colindex("Porcentaje"))
	          Millaraje.value       = .textmatrix(.row,.colindex("Millaraje"))
     	  	  pbasica.checked = (.textmatrix(.Row,.colindex("Pbasica")) = "yes")
	          ptotal.checked = (.textmatrix(.Row,.colindex("Ptotal")) = "yes")
                  ' skip.
                  {&out}
                  '
			  if (.textmatrix(.Row,.colindex("Pbasica")) = "no") and (.textmatrix(.Row,.colindex("Ptotal")) = "no") then
			     document.all("cantidad").style.visibility = "hidden"
			     document.all("porcentaje").style.visibility = "hidden"
				 document.all("millaraje").style.visibility = "hidden"
				 document.all("pbasica").style.visibility = "hidden"
				 document.all("ptotal").style.visibility = "hidden" 
				 document.all("LayerExtra").style.visibility = "hidden" 
			  else
			     document.all("cantidad").style.visibility = "visible"
			     document.all("porcentaje").style.visibility = "visible" 
				 document.all("millaraje").style.visibility = "visible"
				 document.all("pbasica").style.visibility = "visible"
				 document.all("ptotal").style.visibility = "visible" 
				 document.all("LayerExtra").style.visibility = "visible" 
			  end if
   end with
end sub
                     ' skip.
                     {&out}
                     '

Sub repintafg()
    Muestrafg1()
    pintafg()
End Sub

Sub inicializa_grids()
    with fg
       .ExplorerBar = 7 		
       .FontName    = "Tahoma"		
       .FontSize    = 8		
       .AllowUserResizing = 1		
       .AllowUserFreezing = 1		
       .cols = 20
       .rows = 1
	   .BorderStyle        = 0
       .BackColorFixed     = &H947750&  
       .ForeColorFixed     = &HFFFFFF&  
       .BackColor          = &HFFFFFF&  
       .BackColorAlternate = &HD8DFE8&  
       .BackColorFrozen    = &HCBB89E&  
       .BackColorBkg       = &HFFFFFF&  
       .Editable           = false   
       .FrozenCols         = 0
       .AutoSearch         = 2
                     ' skip.
                     {&out}
                     '
	   
       .colwidth(0) = 2750
	   .colwidth(1) = 2750
	   .colwidth(2) = 2750
	   .fixedrows = 1
	   .fixedcols = 0
	   .extendlastcol = true
	   .colkey(0) = "Nombre"
	   .colkey(1) = "Apellido Paterno"
	   .colkey(2) = "Apellido Materno"
	   .colkey(3) = "NumAsegurado"
	   .colkey(4) = "NumEndoso"
	   .colkey(5) = "FechaAntiguedad"
	   .colkey(6) = "FechaAlta"
	   .colkey(7) = "PrimaAseg"
	   .colkey(8) = "FechaNacimiento"
	   .colkey(9) = "Edad"
	   .colkey(10) = "Sexo"
	   .colkey(11) = "Edocivil"
	   .colkey(12) = "Parentesco"
	   .colkey(13) = "NombreCompleto"
	   .colkey(14) = "Ocupacion"
	   .colkey(15) = "Cantidad"
	   .colkey(16) = "Porcentaje"
	   .colkey(17) = "Millaraje"
	   .colkey(18) = "Pbasica"
	   .colkey(19) = "Ptotal"
                     ' skip.
                     {&out}
                     '
	   .colhidden(.colindex("NumAsegurado")) = true
	   .colhidden(.colindex("NumEndoso")) = true
	   .colhidden(.colindex("FechaAntiguedad")) = true
	   .colhidden(.colindex("FechaAlta")) = true
	   .colhidden(.colindex("PrimaAseg")) = true
	   .colhidden(.colindex("FechaNacimiento")) = true
	   .colhidden(.colindex("Edad")) = true
	   .colhidden(.colindex("Sexo")) = true
	   .colhidden(.colindex("Edocivil")) = true
	   .colhidden(.colindex("Parentesco")) = true
	   .colhidden(.colindex("NombreCompleto")) = true
	   .colhidden(.colindex("Ocupacion")) = true
	   .colhidden(.colindex("Cantidad")) = true
	   .colhidden(.colindex("Porcentaje")) = true
	   .colhidden(.colindex("Millaraje")) = true
	   .colhidden(.colindex("Pbasica")) = true
	   .colhidden(.colindex("Ptotal")) = true
	   .selectionmode = 1
	   .allowselection = false
	   .textmatrix(0,.colindex("Nombre")) = "Nombre"
	   .textmatrix(0,.colindex("Apellido Paterno")) = "Apellido Paterno"
	   .textmatrix(0,.colindex("Apellido Materno")) = "Apellido Materno"
	   .FixedAlignment(.colindex("Nombre")) = 4
	   .FixedAlignment(.colindex("Apellido Paterno")) = 4	   
	   .FixedAlignment(.colindex("Apellido Materno")) = 4
	   .autosearch = 2
	   .autosearchdelay = 5
                     ' skip.
                     {&out}
                     '
	end with
	with fg1
	   .ExplorerBar = 7 
       .FontName    = "Tahoma"		
       .FontSize    = 8		
       .AllowUserResizing = 1		
       .AllowUserFreezing = 1
	   .cols = 2
	   .rows = 1
	   .BorderStyle        = 0
       .BackColorFixed     = &H947750&  
       .ForeColorFixed     = &HFFFFFF&  
       .BackColor          = &HFFFFFF&  
       .BackColorFrozen    = &HCBB89E&  
       .BackColorBkg       = &HFFFFFF&  
       .Editable           = false   
     ' skip.
     {&out}
     '
       .FrozenCols         = 0
       .AutoSearch         = 2
	   .fixedrows = 1
	   .fixedcols = 0
	   .extendlastcol = true
	   .colkey(0) = "Poliza"
	   .colkey(1) = "NumAsegurado"
	   .colhidden(.colindex("NumAsegurado")) = true
	   .selectionmode = 1
	   .allowselection = false
	   .textmatrix(0,.colindex("Poliza")) = "P¾lizas del Asegurado"
	   .FixedAlignment(.colindex("Poliza")) = 4
	end with
End Sub
</script>
                     ' skip.
                     {&out}
                     '

<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">

<div id="LayerExtra" style="position:absolute; left:207px; top:231px; width:312px; height:128px; z-index:1">
  <table width="299" border="0">
    <tr> 
      <td colspan="3" class="separador" ><div align="center">Extraprima</div></td>
    </tr>
    <tr> 
      <td width="80" class="label">Aplica en:</td>
      <td colspan="2" valign="middle" class="labelder"> <input name="pbasica" type="radio" disabled="true" style="visibility:visible" value="radiobutton" disable = "true">
        Prima B&aacute;sica 
        <input name="ptotal" type="radio" disabled="true" style="visibility:visible"value="radiobutton" disable = "true">
        Prima Total</td>
    </tr>
    <tr> 
      <td width="80" class="label">Cantidad:</td>
      <td colspan="2" class="labelder"><input name="cantidad" type="text" class="display" id="cantidad3" style="visibility:visible" size="15" readonly="true"></td>
    </tr>
    <tr> 
      <td width="80" class="label">Porcentaje:</td>
      <td width="76" class="labelder"><input name="porcentaje" type="text" class="display" id="porcentaje2" style="visibility:visible" size="15" readonly="true"></td>
      <td width="129" class="label"> %</td>
    </tr>
    <tr> 
      <td width="80" class="label">Millaraje:</td>
      <td colspan="2" class="labelder"><input name="millaraje" type="text" class="display" id="millaraje2" style="visibility:visible" size="15" readonly="true"></td>
    </tr>
  </table>
</div>
                     ' skip.
                     {&out}
                     '

<table width="770" height="375" border="0" align="left" cellpadding="0" cellspacing="0">
  <tr> 
    <td width="770" height="320" align="left" valign="top">
<table width="770" height="98" border="0" cellpadding="0" cellspacing="0">
        <tr> 
          <td width="770" height="26" align="center" valign="top" class="separador"> <div align="center">ASEGURADOS</div></td>
        </tr>
        <tr>
          <td height="72"  valign="top"><object  id=fg 
            classid=clsid:D76D712E-4A96-11d3-BD95-D296DC2DD072 
            height=67 width=626 border = 0
            codebase="/gmm/cabs/vsflex7.cab">
            </object>
            &nbsp; 
            <object  id=fg1 
            classid=clsid:D76D712E-4A96-11d3-BD95-D296DC2DD072 
            height=67 width=134 border = 0
            codebase="/gmm/cabs/vsflex7.cab">
              <embed width="900" height="67" border="0"></embed> </object></td>
        </tr>
      </table>
                     ' skip.
                     {&out}
                     '
      
      <table width="770" height="90" border="0">
        <tr> 
          <td width="171" class="label">No.Endoso:</td>
          <td height="10" colspan="3"   class="labelder"><input name="Endoso" type="text"  class="display" id="Endoso2" size="15" readonly="true"></td>
          <td width="170" height="10" class="label">Fecha de Alta: </td>
          <td width="247" height="10"  class="labelder"><input name="fechaalta" type="text" class="display" id="fechaalta2" size="12" readonly="true"></td>
        </tr>
        <tr> 
          <td class="label">Fecha de Antiguedad:</td>
          <td height="10" colspan="3"  class="labelder"><input name="fechaanti" type="text" class="display"  id="fechaanti2" size="11" readonly="true"></td>
          <td width="170" height="10" class="label">Fecha de nacimiento:</td>
          <td height="10" class="labelder"><input name="fechancimiento" type="text" class="display" id="fechancimiento3" size="11" readonly="true"></td>
        </tr>
        <tr> 
          <td class="label">Prima del Asegurado</td>
          <td height="10" colspan="3"  class="labelder"><input class="display" name="Primaasegurado" type="text"  id="Primaasegurado3" size="15" readonly="true"></td>
          <td width="170" height="10" class="label">Parentesco:</td>
          <td height="10"  class="labelder"><input name="Parentesco" type="text" class="display" id="Parentesco3" size="15" readonly="true"></td>
        </tr>
        <tr> 
          <td height="10" class="label">Edad:</td>
          <td height="10" colspan="3" class="labelder"><input name="edad" class="display" type="text"  id="edad4" size="4" readonly="true"></td>
          <td width="170" height="10" class="label">Ocupaci&oacute;n :</td>
          <td height="10"  class="labelder"><input name="ocupacion" type="text" class="display" id="ocupacion3" size="15" readonly="true"></td>
        </tr>
        <tr> 
          <td height="10" class="label" >Estado Civil:</td>
          <td height="10" colspan="3" class="labelder"><input name="edocivil"  class="display" type="text"  id="edocivil2" size="10" readonly="true"></td>
          <td width="170" height="10" class="label">Sexo:</td>
          <td height="10"  class="labelder"><input name="sexo" type="text" class="display" id="sexo3" size="15" readonly="true"></td>
        </tr>
        <tr> 
          <td height="10" class="label">Nombre: </td>
          <td height="10" colspan="6" class="labelder"><input name="nombrecompleto" type="text" class="display" id="nombrecompleto3" size="60" readonly="true"></td>
        </tr>
        <tr> 
          <td height="10" >&nbsp;</td>
          <td width="1" height="10" class=>&nbsp;</td>
          <td width="58" class=>&nbsp;</td>
          <td width="116" class=>&nbsp;</td>
          <td height="10" class=>&nbsp;</td>
          <td height="10" colspan="2" >&nbsp;</td>
        </tr>
        <tr> 
          <td height="2" colspan="9" valign="top"></td>
        </tr>
      </table>
      <p>&nbsp;</p></td>
  </tr>
</table>
              ' skip.


{C:\Cnxns-GMM\individual\endodos\galleta.i}
FUNCTION CONVIERTEFECHA RETURNS CHAR (INPUT Fecha AS DATE )  FORWARD.
DEF VAR vRamoDivision AS CHAR NO-UNDO.
DEF VAR vNumPoliza       AS INTE NO-UNDO.
DEF VAR vNombreCompleto  AS CHAR NO-UNDO.
DEF VAR vNumRenovacion   AS INTE NO-UNDO.
DEF VAR vNumReExp        AS INTE NO-UNDO.
DEF VAR Vcvesexo         AS CHAR NO-UNDO.
DEF VAR vEdoCivil        AS CHAR NO-UNDO.
DEF VAR vParentesco      AS CHAR NO-UNDO.
DEF VAR vOcupacion       AS CHAR NO-UNDO.
DEF VAR vCantidad        AS CHAR NO-UNDO.
DEF VAR vPorcentaje      AS CHAR NO-UNDO.
DEF VAR vMillaraje       AS CHAR NO-UNDO.
DEF VAR VAUXAPLICA       AS INT NO-UNDO. 
DEF VAR Vappaterno       AS CHAR NO-UNDO.
DEF VAR Vapmaterno       AS CHAR NO-UNDO.
DEF VAR Vapnombre        AS CHAR NO-UNDO.
DEF VAR Vpbasica         AS LOG  NO-UNDO.
DEF VAR Vptotal          AS Log  NO-UNDO.
DEF VAR VFechaNac        AS  CHAR.
DEF VAR VFechaAdquisicion AS CHAR .
DEF VAR VFechaAlta        AS CHAR.
DEF VAR VPrimaAsegurado   AS CHAR .

DEF TEMP-TABLE T-ASEGURADOS LIKE EDAsegurados
    FIELD t-recid      AS RECID.   
	
DEF VAR cuenta           AS INT NO-UNDO.
DEF VAR VEdad            AS INT NO-UNDO.
DEF VAR vDivision     AS INTE NO-UNDO.
DEF VAR POrigenPol AS INTE NO-UNDO.
DEF VAR NOMBREPLAN AS CHAR NO-UNDO.
DEF VAR INICIOVIG  AS DATE.
DEF VAR FINVIG     AS DATE.
DEF VAR PLANVIG          AS CHAR NO-UNDO.
DEF VAR AUXEXTPMACOBASEG AS DECI NO-UNDO.
DEF Var CveCoberturaVig  AS CHAR FORMAT "x(8)" NO-UNDO.
DEF BUFFER BEdasegurados for edasegurados.

vRamoDivision    = OS-GETENV("vRamoDiv").
vNumPoliza       = INTEGER(OS-GETENV("vNumPoliza")).
vNumRenovacion   = INTEGER(OS-GETENV("vNumRenova")).
vNumReexp        = INTEGER(OS-GETENV("vNumReexp")).
vDivision        = INTEGER(OS-GETENV("vDivision")).

vRamoDivision    = "1".
vNumPoliza       = 18.
vNumRenovacion   = 0.
vNumReexp        = 0.
vDivision        = 1.
{&OUT} 'vRamoDivision:' vRamoDivision "vNumPoliza:" vNumPoliza SKIP.
{&OUT} '<script language="VBScript" type="text/VBScript">' SKIP
       'inicializa_grids()' SKIP.
FUNCTION CONVIERTEFECHA RETURNS CHAR (INPUT Fecha AS DATE ):
   DEF VAR vDia AS CHAR.
   DEF VAR vMes AS CHAR.
   DEF VAR vAnio AS CHAR.
   DEF VAR Resultado AS CHAR.
   DEF VAR Asignar AS CHAR.
   DEF VAR I AS INTEGER.

   vDia = STRING(DAY(Fecha),"99").
   vMes = STRING(MONTH(Fecha),"99").
   vAnio = STRING(YEAR(Fecha),"9999").
   
   DO I = 1 TO LENGTH(SESSION:DATE-FORMAT):
       CASE SUBSTRING(SESSION:DATE-FORMAT,I,1):
           WHEN "D" THEN
               Asignar = vDia.
           WHEN "M" THEN
               Asignar = vMes.
           WHEN "Y" THEN
               Asignar = vAnio.
       END CASE.
       IF I > 1 THEN
           Resultado = Resultado + "/". 
       Resultado = Resultado + Asignar.
   END.
   
   RETURN Resultado.
END FUNCTION.
		   
    FOR EACH EDASEGURADOS
        WHERE EDASEGURADOS.CVERAMODIVISION = vRamoDivision
          AND EDASEGURADOS.NUMPOLIZA       = vNumPoliza
          AND EDASEGURADOS.NUMRENOVACION   = vNumRenovacion
          AND EDASEGURADOS.NUMREEXP        = vNumReExp
          AND EDASEGURADOS.CVEDIVISION     = vDivision
          AND EDASEGURADOS.CVEESTATUS      = "V"
		  USE-INDEX IAseguradoPoliza NO-LOCK:
		  cuenta = cuenta + 1.
		 /* IF cuenta = 1 THEN DO:  */
             vappaterno = edasegurados.appaterno.
		     vapmaterno = edasegurados.apmaterno.
		     vapnombre  = edasegurados.nombre.
         /*		  END.	   */
		  IF EDASEGURADOS.CVESEXO = "F" THEN
             Vcvesexo  = "FEMENINO".
          ELSE 
		     Vcvesexo = "MASCULINO".
          FIND FIRST EDEDOCIVIL WHERE 
              EDEDOCIVIL.CVEEDOCIVIL = EDASEGURADOS.CVEEDOCIVIL 
              NO-LOCK NO-ERROR.
          IF AVAIL EDEDOCIVIL THEN           
              vEdoCivil = EDEDOCIVIL.DSCONEDOCIVIL.
	      ELSE 		  
		      vEdoCivil =  " ".
         FIND FIRST EDPARENTESCO OF EDASEGURADOS
         NO-LOCK NO-ERROR.
         IF AVAIL EDPARENTESCO THEN
            vParentesco = EDPARENTESCO.DSCONPARENTESCO.
		 ELSE 
		    vParentesco = " ".
         FIND FIRST EDOCUPACION OF EDASEGURADOS
         NO-LOCK NO-ERROR.
         IF AVAIL EDOCUPACION THEN                
          VOcupacion = EDOCUPACION.DSCONOCUPACION.
		 ELSE 
		  VOcupacion = "".
       /*  VFechaNac =  STRING(EDASEGURADOS.FECHANAC,"99/99/9999"). */
	     VFechaNac =   CONVIERTEFECHA(EDasegurados.Fechanac).
         VEdad     =  EDAsegurados.Edad.
		 VFechaAdquisicion =  CONVIERTEFECHA(EDASEGURADOS.FECHAADQUISICION).
		 VFechaAlta        =  CONVIERTEFECHA(EDASEGURADOS.FECHAALTAPOLIZA).
		 VPrimaAsegurado   =  STRING(EDASEGURADOS.PRIMAASEGURADO,">>>,>>>,999.99").
		 
Vpbasica = False.
Vptotal = False.
IF EDASEGURADOS.EXTRAPRIMA  = True THEN DO:
  FIND FIRST EDEXTPMAASEGURADO OF EDASEGURADOS
      NO-LOCK NO-ERROR.
  IF AVAILABLE EDEXTPMAASEGURADO THEN DO:
        VAUXAPLICA = EDEXTPMAASEGURADO.CVEAPLICAEXTPMA.
        Vpbasica = False.
		Vptotal  = False.
		IF VAuxAplica = 2 THEN
            Vpbasica = true.
	    Else DO:
	     IF VAuxAplica =  3 THEN
               Vptotal =  true.
	     END.   		
        ASSIGN
        vCantidad   =  STRING(EDEXTPMAASEGURADO.CANTEXTPMAASEGURADO,">>>,999.99")
        vPorcentaje =  STRING(EDEXTPMAASEGURADO.PORCEXTPMAASEGURADO,">>>,999.99")
        vMillaraje  =  STRING(EDEXTPMAASEGURADO.MILLAREXTPMAASEGURADO,">>>,999.99").
  END.
  ELSE DO:
        VAUXAPLICA  =  0.
		vCantidad   =  "0.00".
        vPorcentaje =  "0.00".
        vMillaraje  =  "0.00".
  END.		
END.
         {&OUT} 'fg.additem ' '"' EDAsegurados.Nombre '"' "& vbTab &" '"' EDAsegurados.ApPaterno '"' "& vbTab &" '"' EDAsegurados.ApMaterno '"'  "& vbTab &" '"' EDAsegurados.NumAsegurado '"' "& vbTab &" '"' EDAsegurados.NumEndosoGlobal '"' "& vbTab &" '"' VFECHAADQUISICION '"' "& vbTab &" '"' VFECHAALTA '"'  "& vbTab &" '"' VPRIMAASEGURADO '"' "& vbTab &" '"' VFechaNac '"' "& vbTab &" '"' VEdad '"'  "& vbTab &" '"' Vcvesexo '"' "& vbTab &" '"' VEdocivil '"'  "& vbTab &" '"' Vparentesco '"' "& vbTab &" '"' Edasegurados.NombreCompleto '"'  "& vbTab &" '"' VOcupacion '"' "& vbTab &" '"' VCantidad '"'  "& vbTab &" '"' VPorcentaje '"' "& vbTab &"  '"' VMillaraje '"' "& vbTab &" '"' VPbasica '"' "& vbTab &"  '"' Vptotal '"'  SKIP.
         
         RUN C:\AppServ\www\ton\PEDNombre.p
        (EDAsegurados.NombreCompleto,"", INPUT-OUTPUT TABLE T-Asegurados).
        
  FOR EACH T-Asegurados NO-LOCK:
	  FOR EACH BEDasegurados OF T-Asegurados NO-LOCK:
            FIND FIRST EDPOLIZA OF BEDasegurados	 NO-LOCK NO-ERROR.
		IF AVAILABLE EDPOLIZA THEN 
		DO: 
			   		{&OUT} 'fg1.additem ' '"' EDPoliza.PolizaCompleta '"' "& vbTab &" '"' EDAsegurados.NumAsegurado '"' SKIP (1).
	
        END.
      END. 
   END.
END.
		  {&OUT} 'Muestrafg()' SKIP.
		  {&OUT} '</script>' SKIP.
          {&OUT} "</body>" SKIP.
          {&OUT} "</html>" SKIP.
