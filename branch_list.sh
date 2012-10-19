############### SCRIPT TO FIND THE LIST OF AVAILABLE BRANCHES FOR ANY MODULE ###############4

#!/bin/sh

if [ $# -eq 0 ]
then
echo "USAGE : <SCRIPT-NAME> <MODULE-NAME>"
exit 0;
fi
\rm /opt/kapilascripts/abhishek/log2.txt >/dev/null
mod_name=$1;
#echo "$mod_name"
if [ -d /opt/cvsroot/$mod_name ]
then
echo "Module - $mod_name exists"
cvs -q rlog -bSh $mod_name|sed -n '/symbolic names:/,/keyword substitution:/p'|grep "\.0\." | cut -d: -f1 | awk '{print $1}'|sort -u >>/opt/kapilascripts/abhishek/log2.txt
clear
if [ -s /opt/kapilascripts/abhishek/log2.txt ]
then
count=`wc -l /opt/kapilascripts/abhishek/log2.txt|cut -d " " -f1`
echo "$count branches are available for $mod_name"
echo "*********************************************"
cat /opt/kapilascripts/abhishek/log2.txt
else
echo "No branch available for $mod_name"
fi
else
echo " Module name doesnot exist , Please enter a valid module name"
exit 0;
fi
~
