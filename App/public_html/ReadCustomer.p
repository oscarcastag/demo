
/*------------------------------------------------------------------------
    File        : ReadCustomer.p
    Purpose     : 

    Syntax      :

    Description : 

    Author(s)   : 
    Created     : Wed May 08 17:34:45 IST 2013
    Notes       :
  ----------------------------------------------------------------------*/
  


/* ***************************  Definitions  ************************** */
DEFINE TEMP-TABLE custRecord LIKE Customer.
DEFINE INPUT PARAMETER custId AS INTEGER NO-UNDO.
DEFINE OUTPUT PARAMETER TABLE FOR custRecord.

/* ********************  Preprocessor Definitions  ******************** */


/* ***************************  Main Block  *************************** */
    EMPTY TEMP-TABLE custRecord.
    FIND FIRST Customer WHERE Customer.CustNum = custId NO-ERROR.
    IF AVAILABLE Customer THEN 
    DO:
        CREATE custRecord.
        BUFFER-COPY Customer TO custRecord.
        OUTPUT TO "/dlc/wrk114/output/External_readcustomer.txt".
        MESSAGE custRecord.CustNum custRecord.Name 
            custRecord.Address custRecord.City custRecord.Country.
        OUTPUT CLOSE.
        RETURN.
    END.
    ELSE 
    DO:
        OUTPUT TO "/dlc/wrk114/output/External_readcustomer_not_Found.txt".
        MESSAGE "Cliente " + STRING(custId) + " No se encontro".
        OUTPUT CLOSE.
    END. 
