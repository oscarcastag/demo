/*
   2018-07-17
   Programa ABC Automatico para proveedores
   Param1   :=    "A" o "B" o "C" o "G"
   Param2   :=    "Proveedor"
   Param3   :=    "Nombre"
   Param4   :=    "Estatus"
*/
SET DELETE ON
Function Main(param1,param2,param3,param4,param5,param6)
Public cLogRobot:=""
************ Parametros **********************************
nt1:=1
cParam0:=Param1
While !Empty(cParam0)
      cnt1:=Ltrim(Str(nt1))
      nPos2:=IIF(At(",",cParam0)=0,Len(cParam0),At(",",cParam0)-1)
      Public cParam&cnt1:=Substr(cParam0,1,nPos2)
      cParam0:=Substr(cParam0,npos2+2,Len(cPAram0))
      nt1+=1
End while


While nt1<=6
     Cnt1:=Ltrim(Str(nt1))
     Public cParam&cnt1:=Nil
     nt1+=1
End While
***********************************************************

Aperturas(.T.)
   Do Case
      Case Param1="A"
            AltasProd(cparam1,cparam2,cparam3,cparam4,cparam5,cparam6)
      Case Param1="B"
            BajasProd(cparam1,cparam2,cparam3,cparam4,cparam5,cparam6)
      Case Param1="C"
            CambiosProd(cparam1,cparam2,cparam3,cparam4,cparam5,cparam6)
      Case Param1="G"
            JsonProd(cparam1,cparam2,cparam3,cparam4,cparam5,cparam6)			
   End Case
   
Aperturas(.F.)

cDia:=StrTran(Str(Day(Date()),2)," ","0")
cMes:=StrTran(Str(Month(Date()),2)," ","0")
cHrs:=Substr(Time(),1,2)
cMin:=Substr(Time(),4,2)
cSeg:=Substr(Time(),7,2)
Public cFileLog:=""
IF Param1="A"
   cFileLog:="AltaProv.Log"
ENDIF
IF Param1="B"
   cFileLog:="BajaProv.Log"
ENDIF
IF Param1="C"
   cFileLog:="ModiProv.Log"
ENDIF   
IF Param1="G"
   cFileLog:="proveedor.json"
ENDIF
MemoWrit(cFileLog,cLogRobot)

Return Nil

Function Aperturas(lEstatus)
Do Case
   Case lEstatus
        Use dbase\M_Prov NEW Alias Prov Shared 
        Index On Proveedor Tag Proveedor
        Sele Prov
   Case !lEstatus
        DbCloseAll()
EndCase

Return Nil

Function AltasProd(cparam1,cparam2,cparam3,cparam4,cparam5,cparam6)
LOCAL aprov
LOCAL json
LOCAL cFile

Public cLogJson:=""

cFile:="altaprov.json"
MemoWrit(cFile,cLogJson)

  IF !Prov->(Dbseek(cParam2))
	   Prov->(DbAppend())
	   Prov->(Rlock())
	   Prov->Proveedor:=cParam2
	   Prov->Nombre:=cParam3
	   Prov->Calle:=cParam4
	   Prov->Colonia:=cParam5
	   Prov->Ciudad:=cParam6
	   Prov->(DbUnlock())
       cObs:='[{"Resultado" : "Ok","Mensaje":"PROVEEDOR CREADO"}]'
	   cLogTxt:=cObs
	   cLogRobot+=cLogTxt
	   DbCloseAll()
  Else
      cObs:='[{"Resultado" : "Ok","Mensaje":"PROVEEDOR Ya Existe"}]'
      cLogTxt:=cObs
      cLogRobot+=cLogTxt
  ENDIF

Return Nil

Function BajasProd(cparam1,cparam2,cparam3,cparam4,cparam5,cparam6)
LOCAL aprov
LOCAL json
LOCAL cFile

Public cLogJson:=""

cFile:="bajaprov.json"
MemoWrit(cFile,cLogJson)

  IF Prov->(Dbseek(cParam2))
      cDelete:= "Borrado"
      Prov->(Rlock())
      Prov->Marcado:=cDelete  
      Prov->(DbDelete())
	  Prov->(DbUnlock())
      cObs:='[{"Resultado" : "Ok","Mensaje":"PROVEEDOR ELIMINADO"}]'
	  
      cLogTxt:=cObs
      cLogRobot+=cLogTxt
	  DbCloseAll()
  Else
      cObs:='[{"Resultado" : "Error","Mensaje":"PROVEEDOR No Existe"}]'
      cLogTxt:=cObs
      cLogRobot+=cLogTxt
  ENDIF

Return Nil

Function CambiosProd(cparam1,cparam2,cparam3,cparam4,cparam5,cparam6)
LOCAL aprov
LOCAL json
LOCAL cFile

Public cLogJson:=""

cFile:="modiprov.json"
MemoWrit(cFile,cLogJson)

  IF  Prov->(Dbseek(cParam2))
        Prov->(Rlock())
		Prov->Nombre:=cParam3
	    Prov->Calle:=cParam4
		Prov->Colonia:=cParam5
		Prov->Ciudad:=cParam6
  	    Prov->(DbUnlock())
      cObs:='[{"Resultado" : "Ok","Mensaje":"PROVEEDOR MODIFICADO"}]'
	  
		cLogTxt:= cObs  
		cLogRobot+=cLogTxt
		DbCloseAll()
  Else
      cObs:='[{"Resultado" : "Error","Mensaje":"PROVEEDOR No Existe"}]'
      cLogTxt:= cObs
      cLogRobot+=cLogTxt
  ENDIF

Return Nil



Function JsonProd()
LOCAL aprov
LOCAL json
LOCAL cFile

Public cLogJson:=""

cFile:="proveedor.json"
MemoWrit(cFile,cLogJson)

	Sele Prov
    GO TOP
     
      aprov := {}
      dbEval( {|| aAdd( aprov, { "Proveedor" => FIELD->Proveedor, "Nombre" => rTrim( FIELD->Nombre), "Marcado" => rTrim( FIELD->Marcado ) } ) } )
	  json := hb_jsonEncode( aprov )
	  cLogRobot:=""
      cLogRobot:=json
      DbCloseAll()
Return nil