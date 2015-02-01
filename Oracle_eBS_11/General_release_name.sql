/* 
Name    :     General_release_name.sql
Version :     V0.1
Desc.   :     Query to select the release name from an Oracle eBS implementation
              
CHANGE LOG
Version   Date      Developer                     Desc
V0.1      01FEB2015   johan.louwers@capgemini.com   Initial upload to github
 */

select 
     release_name 
from 
    apps.fnd_product_groups;
