
/*------------------------------------------------------------------------
    File        : Proc_CustomerInformation.p
    Purpose     : 

    Syntax      :

    Description : 

    Author(s)   : 
    Created     : Wed May 08 12:36:18 IST 2013
    Notes       :
  ----------------------------------------------------------------------*/

/* ***************************  Definitions  ************************** */



/* ********************  Preprocessor Definitions  ******************** */


/* ***************************  Main Block  *************************** */

/* ***************************  Definitions  ***************************/ 
DEFINE TEMP-TABLE custRecord LIKE Customer.
DEFINE TEMP-TABLE createcustRecord LIKE Customer.
DEF VAR mye AS CHAR.    
/* ***************************  Main Block  *************************** */

PROCEDURE UpdateCustomer:

    /*Definition for Update customer */
    DEFINE INPUT PARAMETER custId AS INTEGER NO-UNDO.
    DEFINE INPUT PARAMETER TABLE FOR custRecord.
    
    FIND FIRST Customer WHERE Customer.CustNum = custId NO-ERROR.
    IF AVAILABLE Customer THEN 
    DO:
        OUTPUT TO "/dlc/wrk114/output/proc_oldcustomer.txt".
        MESSAGE Customer.CustNum Customer.Name  
            Customer.Address Customer.City Customer.Country.
        OUTPUT CLOSE. 
        FIND FIRST custRecord WHERE custRecord.CustNum = custId NO-ERROR.
        IF AVAILABLE custRecord THEN 
        DO:
            BUFFER-COPY custRecord TO Customer.
            RELEASE Customer.

            OUTPUT TO "/dlc/wrk114/output/proc_updatedcustomer.txt".
            MESSAGE custRecord.CustNum custRecord.Name 
                custRecord.Address custRecord.City custRecord.Country.
            OUTPUT CLOSE.        
        END.
        ELSE 
        DO:
            RETURN ERROR mye.
        END.
    END.
    ELSE 
    DO:
        mye = "Update CustNum does not exist in database".
        RETURN ERROR mye.
    END. 

END PROCEDURE. 

PROCEDURE CreateCustomers:

    /*Definition for Create customer */
    DEFINE INPUT PARAMETER TABLE FOR createcustRecord.

    FIND FIRST createcustRecord NO-ERROR.
    IF NOT AVAILABLE createcustRecord THEN 
    DO:
        mye = "Invalid customer record submitted".
        RETURN ERROR mye.
    END.
    
    /*Create new Customer records*/
    FOR EACH createcustRecord:
        CREATE Customer.
        BUFFER-COPY createcustRecord TO Customer.
        RELEASE Customer.
    END.

    FIND FIRST Customer WHERE Customer.CustNum = 9998.
    IF AVAILABLE Customer THEN 
    DO : 
        OUTPUT TO "/dlc/wrk114/output/proc_createcustomer.txt".
        MESSAGE Customer.CustNum Customer.Name  
            Customer.Address Customer.City Customer.Country.
        OUTPUT CLOSE.
    END.
END PROCEDURE. 

PROCEDURE DeleteCustomer:

    /*Definition for Delete customer */
    DEFINE INPUT PARAMETER del_custId AS INTEGER NO-UNDO.

    FIND FIRST Customer WHERE Customer.CustNum = del_custId NO-ERROR.
    IF AVAILABLE Customer THEN 
    DO:
        DELETE Customer.
    END.

    OUTPUT TO "/dlc/wrk114/output/proc_deletedcustomer.txt".
    MESSAGE "Customer" del_custId "Deleted".

END PROCEDURE.
 
PROCEDURE ReadCustomer:

    /*Definition for Read customer */
    DEFINE INPUT PARAMETER custId AS INTEGER NO-UNDO.
    DEFINE OUTPUT PARAMETER TABLE FOR custRecord.
    
    EMPTY TEMP-TABLE custRecord.
    FIND FIRST Customer WHERE Customer.CustNum = custId NO-ERROR.
    IF AVAILABLE Customer THEN 
    DO:
        CREATE custRecord.
        BUFFER-COPY Customer TO custRecord.
        OUTPUT TO "/dlc/wrk114/output/proc_readcustomer.txt".
        MESSAGE custRecord.CustNum custRecord.Name 
        custRecord.Address custRecord.City custRecord.Country.
        OUTPUT CLOSE.
    END.
    ELSE 
    DO:
        mye = "Customer " + STRING(custId) + " not found".
        RETURN ERROR mye.
    END. 

END PROCEDURE. 
