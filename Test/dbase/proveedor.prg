/* 
   Catalogo de productos
   2018-05-18   
   Focus on Services, SA de CV
*/

#include "box.ch"

SET DELETED OFF

Function Main()
   Aperturas(.t.)
   While LastKey()<>27
         Pantalla(1,1,22,98)
   End While
   Aperturas(.f.)
Return nil

Function Pantalla(ren1,Col1,Ren2,Col2)
cDelete := ""
cOldColors:=SetColor()
cColor:= "W/B,R/W,,,B/W"
cColorSayGet:="R/W"
cColorSayMsg:="Y/R*"
SET COLOR TO (cColor)
@  Ren1,  Col1, Ren2, Col2 BOX B_DOUBLE_SINGLE
@  Ren1,  Col1, Ren2, Col2 BOX B_DOUBLE_SINGLE + SPACE(1)

@  Ren1+2, Col1+2 Say "Proveedor :-"
@  Ren1+5, Col1+2 Say "Nombre    :-"
@  Ren1+7, Col1+2 Say "Calle    :-"
@  Ren1+9, Col1+2 Say "Colonia:-"
@  Ren1+11, Col1+2 Say "Ciudad:-"
@  Ren1+13, Col1+2 Say "Estatus:-"
@  Ren2-2, Col1+7  Prompt "< Registrar >"
@  Ren2-2, Col1+22 Prompt "< Consultar >"
@  Ren2-2, Col1+36 Prompt "< Modificar >"
@  Ren2-2, Col1+50 Prompt "< Eliminar  >"
@  Ren2-2, Col1+66 Prompt "< Salir  >"
Menu to MenuProd
Do case
   Case MenuProd=1
        Registra()
   Case MenuProd=2
        Consulta()
   Case MenuProd=3
        Modifica()
   Case MenuProd=4
        Elimina()
   Case MenuProd=5
        Salir()
EndCase
SET COLOR TO (cOldColors)
Clear Screen
Return nil

Function Aperturas(lEstatus)
Do Case
   Case lEstatus
        Use M_Prov NEW Alias Prov Shared
        		
        Index On Proveedor Tag Proveedor
        Sele Prov
   Case !lEstatus
        DbCloseAll()
EndCase
Return Nil

Function Registra()
cProd2:=Space(Len(Prov->Proveedor) )
cDesc1:=Space(Len(Prov->Nombre))
cMarca2:=Space(Len(Prov->Calle))
cLinea2:=Space(Len(Prov->Colonia))
cProve2:=Space(Len(Prov->Ciudad))

While lastkey()<>27
      @  3, 15 Get cProd2          Color cColorSayGet Valid Eval({|| SiExiste("cProd2")})
      @  6, 15 Get cDesc1          Color cColorSayGet
      Read
      @  8, 15 Get cMarca2         Color cColorSayGet 
      Read
      @ 10, 15 Get cLinea2         Color cColorSayGet 
      Read
      @ 12, 15 Get cProve2         Color cColorSayGet 
      Read
End While
If mimsg("¿DESEA REGISTRAR",7)
   Sele Prov
   Prov->(Rlock())
   Prov->(DbAppend())
   Prov->Proveedor:=cProd2
   Prov->Nombre:=cDesc1
   Prov->Calle:=cMarca2
   Prov->Colonia:=cLinea2
   Prov->Ciudad:=cProve2
   Prov->(DbUnlock())
EndIf
Return nil

Function Consulta()

cProd2:=Space(Len(Prov->Proveedor))
cDelete := "***Registro marcado para borrar"
if Prov->(Deleted())
   cDelete := ""
endif
@  3, 15 Get cProd2          Color cColorSayGet Valid Eval({|| MiBrowse("Prov","cProd2")})
Read
@  6, 15 Say Prov->Nombre     Color cColorSayGet
@  8, 15 Say Prov->Calle     Color cColorSayGet
@  10, 15 Say Prov->Colonia     Color cColorSayGet
@ 12, 15 Say Prov->Ciudad Color cColorSayGet
@ 14, 15 Say Prov->Marcado Color cColorSayGet

miMsg(,1)

Return nil

Function Modifica()
cProd2:=Space(Len(Prov->Proveedor))
@  3, 15 Get cProd2          Color cColorSayGet Valid Eval({|| MiBrowse("Prov","cProd2")})
Read
@  6, 15 Say Prov->Nombre     Color cColorSayGet
@  8, 15 Say Prov->Calle     Color cColorSayGet
@ 10, 15 Say Prov->Colonia     Color cColorSayGet
@ 12, 15 Say Prov->Ciudad Color cColorSayGet
mimsg(,1)
cDesc2 :=Prov->Nombre
cMarca2:=Prov->Calle
cLinea2:=Prov->Colonia
cProve2:=Prov->Ciudad
While lastkey()<>27
      @  6, 15 Get cDesc2         Color cColorSayGet 
      Read
      @  8, 15 Get cMarca2         Color cColorSayGet 
      Read
      @  10, 15 Get cLinea2         Color cColorSayGet 
      Read
      @ 14, 15 Get cProve2         Color cColorSayGet 
      Read
End While
mimsg(,1)
Sele Prov
Prov->(Rlock())
Prov->Nombre:=cDesc2
Prov->Calle:=cMarca2
Prov->Colonia:=cLinea2
Prov->Ciudad:=cProve2
Prov->(DbUnlock())
Return nil

Function Elimina()
cProd2:=Space(Len(Prov->Proveedor))
@  3, 15 Get cProd2          Color cColorSayGet Valid Eval({|| MiBrowse("Prov","cProd2")})
Read
@   6, 15 Say Prov->Nombre     Color cColorSayGet
@   8, 15 Say Prov->Calle      Color cColorSayGet
@  10, 15 Say Prov->Colonia    Color cColorSayGet
@  12, 15 Say Prov->Ciudad     Color cColorSayGet

miMsg(,1)
lmenu7:=miMSg(,7)
@ 12, 21 Say  lmenu7   Color cColorSayGet

cDelete := "Borrado"

IF lmenu7
   Prov->(Rlock())
   Prov->Marcado:=cDelete  
   Prov->(DbDelete())
   Prov->(DbSkip())
   Prov->(DbUnlock())
   *Prov->(Pack)
ENDIF
Return nil

Function miMsg(cMsg,ncaso)
IF Empty(cMsg)
   Do Case
      Case nCaso==1
         cMsg:="**** PRESIONA CUALQUIER TECLA PARA CONTINUAR ****"
      Case nCaso==7
         cMsg:="¿DESEA ELIMINAR EL REGISTRO?, SI  NO "
      Case nCaso==8
         cMsg:="**** ERROR, CLAVE YA REGISTRADA ****"
      Case nCaso==9
         cMsg:="**** ERROR, CLAVE NO REGISTRADA ****"
   EndCase
Else
   IF nCaso==7
      cMsg+=", SI  NO "
   ENDIF
ENDIF
ppa2:=SaveScreen(20,9,22,9+Len(cMsg)+1)
@  21,  9, 22, 9+Len(cMsg)+1 BOX B_DOUBLE_SINGLE
@  21,  9, 22, 9+Len(cMsg)+1 BOX B_DOUBLE_SINGLE + SPACE(1)
@  21, 10 SAY cMsg Color cColorSayMsg
IF nCaso==7
   @ 21, (10+Len(cMsg)-7) Prompt "SI"
   @ 21, (10+Len(cMsg)-3) Prompt "NO"
   Menu to MenuMsg7
   Do Case
      Case MenuMsg7==1
           RestScreen(20,9,22,9+Len(cMsg)+1,ppa2)
           Return .T.
      Case MenuMsg7==2
           RestScreen(20,9,22,9+Len(cMsg)+1,ppa2)
           Return .F.
   EndCase
Else
   Inkey(0)
ENDIF
RestScreen(20,9,22,9+Len(cMsg)+1,ppa2)
Return Nil

Function SiExiste(Varseek)
   IF Prov->(deleted())
      lRet:=.t.
   ELSE     
     IF Prov->(Dbseek(&Varseek))
      lRet:=.f.
      miMsg(,8)
     ELSE
      lRet:=.t.
     ENDIF
	ENDIF 
Return lRet

Function Salir()
        DbCloseAll()
		quit
Return lRet


Function mibrowse(cAlias,Varseek)
AreaAnt:=Alias()
Sele &cAlias
Do Case
   Case Empty(&Varseek)
        aColumnas:={Field(1),Field(2)}
        ppa1:=Savescreen(4,4,16,42)
        @  4,  4, 16, 41 BOX B_DOUBLE_SINGLE
        @  4,  4, 16, 41 BOX B_DOUBLE_SINGLE + SPACE(1)
        DbEdit(5,5,15,40,aColumnas)
        Restscreen(4,4,16,42,ppa1)
        &(Varseek):=&(Field(1))
   Case !Empty(&Varseek)
        If DbSeek(&Varseek)
           &(Varseek):=&(Field(1))
        Else
            mimsg(,9)
            Sele &AreaAnt
            Return .F.
        EndIf
EndCase
Sele &AreaAnt
Return .T.

