#!/bin/sh
backupdate=`date "+%d%b%y"`;
#backupdate= `date "+%d%b%y%H:%M:%S"`
#lastweekdate=`date -d "-7 day" "+%d%b%y:%Hhrs"`;

lastweekdate=`date -d "-7 day" "+%d%b%y"`;
# For tomcat  backup
# echo "webdata.bz2_$lastweekdate"

tar -pjcf /backup/RGT3_$backupdate.bz2 /usr/local/apache2/htdocs/RGT3/
echo `date`;
if [ -s /backup/RGT3_$backupdate.bz2 ]
then
    echo " Backup file /backup/RGT3_$backupdate.bz2 have been created successfully. " | /usr/sbin/sendmail kapila.narang@makemytrip.com,amit.dixit@makemytrip.com

      else
         echo " Failed creating backupfile /backup/RGT3.bz2_$backupdate " | /usr/sbin/sendmail kapila.narang@makemytrip.com,amit.dixit@makemytrip.com
        fi

 #echo "webdata.bz2_$lastweekdate"

        if [ -s /backup/RGT3_$lastweekdate.bz2 ]
         then
          echo "RGT3_$lastweekdate.bz2"
          rm -f /backup/RGT3_$lastweekdate.bz2
          echo " last week file /backup/RGT3_$lastweekdate.bz2 has been deleted successfully."
