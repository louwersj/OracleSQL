/* 
Name    :     EAN13CHECK_FUN.sql
Version :     V0.1
Desc.   :     funtion used to check if a given variable is a valid EAN-13
              product code. In case of a valid EAN-13 number the function
              will return TRUE
              
CHANGE LOG
Version   Date      Developer                     Desc
V0.1      16JUL14   johan.louwers@capgemini.com   Initial upload to github

 */

CREATE OR REPLACE
  FUNCTION ean_13(
      P_Str IN VARCHAR2)
    RETURN VARCHAR2
  IS
    l_Sum      NUMBER;
    l_Multiple NUMBER;
  BEGIN
    FOR I IN 1..12
    LOOP
      IF mod(i,2)   = 0 THEN
        l_Multiple := 3;
      ELSE
        l_Multiple := 1;
      END IF;
      l_Sum := NVL(l_Sum, 0) + SUBSTR(P_Str, i, 1) * l_Multiple;
    END LOOP;
    IF 10 - Mod(l_Sum, 10) = SUBSTR(P_Str, 13) THEN
      RETURN('TRUE');
    ELSE
      RETURN('FALSE');
    END IF;
  END;
