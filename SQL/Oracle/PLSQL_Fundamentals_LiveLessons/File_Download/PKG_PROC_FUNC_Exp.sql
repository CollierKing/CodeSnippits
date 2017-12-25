

CREATE OR REPLACE PACKAGE temperature IS
   PROCEDURE Temperature_Conversion ( IN_Temp number,IN_Type varchar2);
   FUNCTION Celsius_to_Fahrenheit ( IN_Temp NUMBER) Return Number;
   FUNCTION Fahrenheit_to_Celsius ( IN_Temp NUMBER) Return Number;
   
/******************************************************************************
   NAME:       temperature
   PURPOSE:    To calculate the desired information.

   REVISIONS:
   Ver        Date        Author           Description
   ---------  ----------  ---------------  ------------------------------------
   1.0        9/12/02             1. Created this package.

   PARAMETERS:
   INPUT:
   OUTPUT:
   RETURNED VALUE:
   CALLED BY:
   CALLS:
   EXAMPLE USE:     NUMBER := temperature.MyFuncName(Number);
                    temperature.MyProcName(Number, Varchar2);
   ASSUMPTIONS:
   LIMITATIONS:
   ALGORITHM:
   NOTES:

   Here is the complete list of available Auto Replace Keywords:
      Object Name:     temperature or temperature
      Sysdate:         9/12/02
      Date/Time:       9/12/02 5:43:38 PM
      Date:            9/12/02
      Time:            5:43:38 PM
      Username:         (set in TOAD Options, Procedure Editor)
      Trigger Options: %TriggerOpts%
******************************************************************************/
END temperature;
/

CREATE OR REPLACE PACKAGE BODY temperature AS

PROCEDURE temperature_conversion 
(IN_Temp number,
IN_Type varchar2)
IS
Converted_Temp NUMBER := 0;


BEGIN

IF 	 IN_Type = 'C'
THEN
	Converted_Temp := TEMPERATURE.Celsius_to_Fahrenheit(IN_Temp);
	
	DBMS_OUTPUT.PUT_LINE ( ' this line pasted in  ' ); 
	
	DBMS_OUTPUT.PUT_LINE('Fahrenheit = ' || Converted_Temp);
	RETURN;
ELSIF In_Type = 'F'
THEN
	Converted_temp := TEMPERATURE.Fahrenheit_to_Celsius(IN_Temp);
	DBMS_OUTPUT.PUT_LINE('Celsius = ' || Converted_Temp);
	RETURN; 
END IF;
DBMS_OUTPUT.PUT_LINE('Bad Temperature Conversion Code: ' ||
    IN_Type);
RETURN;  

END temperature_conversion;


FUNCTION celsius_to_fahrenheit (IN_Temp NUMBER)
RETURN NUMBER IS
Conv_Temp NUMBER;

BEGIN
   Conv_Temp := (IN_Temp * 9/5) + 32;
   RETURN Conv_temp;
END celsius_to_fahrenheit;



FUNCTION fahrenheit_to_celsius (IN_Temp NUMBER)
RETURN NUMBER IS
Conv_Temp NUMBER;
BEGIN
   Conv_Temp := (5/9) * (IN_Temp - 32);
   RETURN Conv_temp;
END fahrenheit_to_celsius;

END temperature;
/ 


