&GLOBAL-DEFINE OUT PUT UNFORMATTED
DEF VAR v-titulo AS CHAR.
v-titulo = "Polizas".
{inicio.i}

Vprog = "Clientes3.p".              
DEFINE VAR ipc-Cve-Pol    AS CHARACTER  NO-UNDO INIT "BW00075A".

DEFINE TEMP-TABLE tt-ConsPorPoliza 
FIELD fcve-pol                LIKE  pol.cve-pol                     
FIELD fcve-poliza             LIKE  derecho.cve-poliza              
FIELD ffec-inicio             LIKE  pol.fec-inicio                  
FIELD ffec-vigencia           LIKE  pol.fec-vigencia                
FIELD fini-vig                LIKE  planes-poliza.ini-vig           
FIELD ffin-vig                LIKE  planes-poliza.fin-vig           
FIELD fcve-ramo               LIKE  pol.cve-ramo                    
FIELD fcve-plan               LIKE  derecho.cve-plan                
FIELD fdescripcion            LIKE  derech.plan.descripcion                
FIELD fSuma-Aseg              LIKE  pol.Suma-Aseg                   
FIELD fDeducible              LIKE  pol.Deducible                   
FIELD fcve-cliente            LIKE  derecho.cve-cliente             
FIELD festatus                LIKE  pol.estatus                     
FIELD frfc                    LIKE  derechohabiente.rfc             
FIELD fpaterno                LIKE  derechohabiente.paterno         
FIELD fmaterno                LIKE  derechohabiente.materno         
FIELD fnombre                 LIKE  derechohabiente.nombre          
FIELD fcve-parentesco         LIKE  derechohabiente.cve-parentesco  
FIELD ffecha-nacimiento       LIKE  derechohabiente.fecha-nacimiento
FIELD ffecha-alta             LIKE  derechohabiente.fecha-alta      
FIELD fcve-divi               LIKE  pol.cve-divi                    
FIELD fcve-estatus            LIKE  derechohabiente.cve-estatus     
FIELD fnumero-empleado        LIKE  derecho.numero-empleado         
FIELD ffecha-limite           LIKE  derechohabiente.fecha-limite    
FIELD fconsecutivo-empleado   LIKE  derecho.consecutivo-empleado    
FIELD fconsecutivo-familia    LIKE  derecho.consecutivo-familia.
  DEFINE VAR opi-Error      AS INTEGER    NO-UNDO.
  DEFINE VAR opc-MsgError   AS CHARACTER  NO-UNDO.

def var start_code     as character no-undo.
def var Vfcve-cliente    as character no-undo.
def var Vfcve-poliza     as character no-undo.
DEF VAR Vfdescripcion  as character no-undo.
DEF VAR Vfnombre    as character no-undo.
DEF VAR Vfpaterno     as character no-undo.
DEF VAR Vfmaterno        as character no-undo.
DEF VAR Vfestatus   as character no-undo.
DEF VAR vcli           as character no-undo.
DEF STREAM pagina.
&GLOBAL-DEFINE OUT PUT UNFORMATTED       

ASSIGN
Vfcve-cliente     = OS-GETENV("tt-ConsPorPolizafcve-cliente")
Vfcve-poliza      = OS-GETENV("tt-ConsPorPolizafcve-poliza")
Vfdescripcion     = OS-GETENV("tt-ConsPorPolizafdescripcion")
Vfnombre          = OS-GETENV("tt-ConsPorPolizafnombre")
Vfpaterno         = OS-GETENV("tt-ConsPorPolizafpaterno")
Vfmaterno         = OS-GETENV("tt-ConsPorPolizafmaterno")
Vfestatus         = OS-GETENV("tt-ConsPorPolizafestatus")
Vprog             = OS-GETENV("prog")

start_code      = OS-GETENV("SubmitField").

Vprog = "polizas.p".
{&out} "Vfcve-cliente:" Vfcve-cliente.
IF Vfcve-cliente <> ? AND Vfcve-cliente <> "!" THEN DO:
    {&OUT} "inicio:" STRING(TIME,"hh:mm:ss").
   IF SEARCH("C:\TEMP\VER11\" + Vfcve-cliente + ".DAT") <> ? THEN DO:
      INPUT FROM VALUE("C:\TEMP\VER11\" + Vfcve-cliente + ".DAT").
      REPEAT:
          CREATE tt-ConsPorPoliza.
          IMPORT tt-ConsPorPoliza.
      END.
      INPUT CLOSE.
   END.
   ELSE DO:
   FOR EACH cliente WHERE cliente.cve-cliente = string(int(Vfcve-cliente),"99999") NO-LOCK.

   RUN C:\proyectos\Galeno\Programas\p-ConsultaPorCliente01.p (string(int(Vfcve-cliente),"99999"), OUTPUT TABLE tt-ConsPorPoliza, OUTPUT opi-Error, OUTPUT opc-MsgError).
   END.
   OUTPUT TO VALUE("C:\TEMP\VER11\" + Vfcve-cliente + ".DAT").
   FOR EACH tt-ConsPorPoliza.
       EXPORT tt-ConsPorPoliza.
   END.
   OUTPUT CLOSE.
   END.
   {&OUT} "final:" STRING(TIME,"hh:mm:ss").

END.

OUTPUT STREAM pagina TO pagina.txt.
PUT STREAM pagina  UNFORM  Vfcve-cliente    
           Vfcve-poliza     
           Vfdescripcion  
           Vfnombre    
           Vfpaterno     
           Vfmaterno        
           Vfestatus   
           start_code    vprog  SKIP.

OUTPUT STREAM pagina CLOSE.
/* {&OUT} Vfcve-cliente " oscar " start_code " os" OS-GETENV("tt-ConsPorPolizafcve-cliente"). */
{&OUT} '<BODY bgcolor=Green >' skip.

IF start_code = "Actualizar" THEN DO:
   FIND tt-ConsPorPoliza EXCLUSIVE-LOCK WHERE tt-ConsPorPoliza.fcve-cliente = Vfcve-cliente NO-ERROR NO-WAIT.
   IF AVAIL tt-ConsPorPoliza THEN DO:
       
       Assign
        fcve-poliza     = Vfcve-poliza
        fdescripcion     = Vfdescripcion
        fnombre       = Vfnombre
        tt-ConsPorPoliza.fpaterno        = Vfpaterno
        tt-ConsPorPoliza.fmaterno        = Vfmaterno
        festatus      = Vfestatus.
       
       {&OUT} '
       <CENTER>
       <TABLE BGCOLOR ="yellow" align = "center">
       <TR><TD ALIGN="RIGHT" COLSTART="1">Poliza Actualizada!</TD><TD COLSTART="2"> 
        </TD></TR>
       </TABLE>' skip.
   END.
   ELSE DO:
       {&OUT} '
       <CENTER>
       <TABLE BGCOLOR ="RED" align = "center">
       <TR><TD ALIGN="RIGHT" COLSTART="1">Pöliza en uso por otro usuario....Intente de nuevo </TD><TD COLSTART="2"> 
        </TD></TR>
       </TABLE>' skip.

   END.
END.
{&OUT} '
    <CENTER>

    <form action="" method="POST" name="SearchForm1">
       <input type="hidden" name="tt-ConsPorPolizafcve-cliente">
       <input type="hidden" name="start_code">
       <input type="hidden" name="prog">
       <input type="hidden" name="Navigar" value="Buscar">
       <p><strong>Clave de Cliente
       <input type="text" size="15" name="tt-ConsPorPolizafcve-cliente" value="' Vfcve-cliente '">
       <input type="submit" name="SubmitBtn" value="Buscar">
       </strong></p>
       <hr>
    </form>
' skip.

 if start_code = ? then start_code = "".

{&OUT} '
<FORM  name="SearchForm2" action="" METHOD="POST" >
<INPUT TYPE ="hidden" name="tt-ConsPorPolizafcve-cliente">
<INPUT TYPE="hidden" name="tt-ConsPorPolizafcve-poliza">
<INPUT TYPE="hidden" name="tt-ConsPorPolizafdescripcion">
<INPUT TYPE="hidden" name="tt-ConsPorPolizafnombre">
<INPUT TYPE="hidden" name="tt-ConsPorPolizafpaterno">
<INPUT TYPE="hidden" name="tt-ConsPorPolizafmaterno">  
<INPUT TYPE="hidden" name="tt-ConsPorPolizafestatus">
<INPUT TYPE="hidden" name="SubmitField">
<INPUT TYPE="hidden" name="start_code">
<input type="hidden" name="prog">
' skip.
{&out} string(int(Vfcve-cliente),"99999").
OUTPUT STREAM pagina TO pagina.txt.
FOR FIRST Cliente WHERE cve-cliente = string(int(Vfcve-cliente),"99999") NO-LOCK :
               
DISPLAY STREAM pagina 
    calle 
    ciudad 
    ciudadedocertificacion 
    ciudadedoregpub 
    colonia 
    contacto 
    cp 
    cve-acceso-cte 
    cve-cliente 
    delegacion 
    escriturapublica 
    estado 
    estatus 
    nombre 
    rfc 
    WITH 1 COL FRAME detalle WIDTH 200.
        ASSIGN
        Vfcve-cliente     =  Cliente.cve-cliente   
        Vfnombre          =  Cliente.nombre         
        Vfdescripcion     =  Cliente.calle      
        Vfcve-poliza      =  Cliente.colonia  
        Vfpaterno         =  Cliente.delegacion
        Vfmaterno         =  Cliente.estado 
        Vfestatus         =  Cliente.estatus .     

END.
OUTPUT STREAM pagina CLOSE.
IF AVAIL Cliente THEN
{&OUT} '
<CENTER>
              
<TABLE BGCOLOR="gray" align = "center" >
    <TR>
        <TD ALIGN="RIGHT" COLSTART="1">' Cliente.cve-cliente:LABEL IN FRAME Detalle '</TD><TD COLSTART="2"> 
              <INPUT NAME="Clientefcve-cliente" SIZE=12 TYPE="TEXT" VALUE="' Vfcve-cliente '">
        </TD>
    </TR>
<TR>
    <TD ALIGN="RIGHT" COLSTART="1">'  Cliente.nombre:LABEL IN FRAME Detalle    '</TD><TD COLSTART="2">
            <INPUT NAME="Clientefnombre"      SIZE=50  VALUE="' Vfnombre '"></TD>
    </TR>
    <TR>
        <TD ALIGN="RIGHT" COLSTART="1">'  Cliente.calle:LABEL IN FRAME Detalle '</TD>
    <TD COLSTART="2">
        <INPUT NAME="Clientefdescripcion"   SIZE=50  VALUE="' Vfdescripcion '">
        </td>
    </TR>
    <TR><TD ALIGN="RIGHT" COLSTART="1">'  Cliente.colonia:LABEL IN FRAME Detalle '</TD><TD COLSTART="2">
        <INPUT NAME="Clientefcve-poliza" SIZE=50 VALUE="' vfcve-poliza '"></TD>
    </TR>
    <TR><TD ALIGN="RIGHT" COLSTART="1">'  Cliente.delegacion:LABEL IN FRAME Detalle '</TD><TD COLSTART="2">
        <INPUT NAME="Clientefpaterno" SIZE=30 VALUE="' Vfpaterno '"></TD>
    </TR>
    <TR><TD ALIGN="RIGHT" COLSTART="1">'  Cliente.estado:LABEL IN FRAME Detalle '</TD><TD COLSTART="2">
        <INPUT NAME="Clientefmaterno" SIZE=30 VALUE="' Vfmaterno '"></TD>
    </TR>
    <TR><TD ALIGN="RIGHT" COLSTART="1">' Cliente.estatus:LABEL IN FRAME Detalle    '</TD><TD COLSTART="2">
        <INPUT NAME="Clientefestatus" SIZE=15 VALUE="' Vfestatus '"></TD>
    </TR>
' skip.
ELSE   
    {&OUT} '
    <CENTER>
    <TABLE BGCOLOR ="Red" align = "center">
    <TR><TD ALIGN="RIGHT" COLSTART="1">Poliza NO existe... Intente de nuevo</TD><TD COLSTART="2"> 
     </TD></TR>
    </TABLE>' skip.
IF AVAIL Cliente  THEN 
{&OUT} ' 
</TR>
</TABLE>' skip.



DEF VAR v-tot1 AS DEC.
DEF VAR v-tot2 AS DEC.
{&OUT} "inicio:" STRING(TIME,"hh:mm:ss").
{&OUT} '<PRE>'.
DEF VAR v-inte AS INTE.
FOR EACH tt-ConsPorPoliza NO-LOCK.  
/* Valida si la póliza existe  */
   v-inte = v-inte + 1.  
  DISP 
      tt-ConsPorPoliza.fcve-poliza  
      tt-ConsPorPoliza.fdescripcion  
      tt-ConsPorPoliza.fnumero-empleado
      tt-ConsPorPoliza.fnombre   
      tt-ConsPorPoliza.fpaterno      
      tt-ConsPorPoliza.fmaterno      
      tt-ConsPorPoliza.ffecha-nacimiento  
      v-inte FORMAT "999999" LABEL "No Empleado"
        with frame detalle2 width 232 60 DOWN STREAM-IO.
end.
{&OUT} '</PRE>'.
{&OUT} "inicio:" STRING(TIME,"hh:mm:ss").
{&OUT} '
</CENTER>
' skip.
    {&OUT} '</FORM>' SKIP. 

