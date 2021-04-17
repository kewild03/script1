#!bin/bash

# Author: Edi Wilson Tchouante

# Script to check a new server

echo "Please Enter Server's Name"
read SERVER

touch $SERVER

echo -e "\n********* Checking of $SERVER ************\n" > $SERVER

echo -e "\n********* Checking Number of CPU *********\n" >> $SERVER
echo -e "This Server has :$(nproc) CPU" >> $SERVER

echo -e "\n********* Checking Total Memory **********\n" >> $SERVER

echo -e "The Total Memory is: $(free -m |grep Mem |awk '{print $2}') Mb" >> $SERVER

echo -e "\n***** Checking if user puppet exist ******\n" >> $SERVER

cat /etc/passwd | grep puppet

if [ $? -eq 0 ]
then
echo "User puppet: PASS" >> $SERVER
else
echo "User puppet: FAILED" >> $SERVER
fi

echo -e "\n***** Checking if file /etc/group exists ******\n" >> $SERVER
if [ -f /etc/group ]
then
echo "file /etc/group: PASS" >> $SERVER
else 
echo "file /etc/group: FAILED" >> $SERVER
fi

echo -e "\n***** Checking if file /etc/passwd exists ******\n" >> $SERVER
if [ -f /etc/passwd ]
then
echo "file /etc/passwd: PASS" >> $SERVER
else 
echo "file /etc/passwd: FAILED" >> $SERVER
fi

echo -e "\n***** Checking if file /etc/httpd exists ******\n" >> $SERVER
if [ -f /etc/httpd ]
then
echo "file /etc/httpd: PASS" >> $SERVER
else 
echo "file /etc/httpd: FAILED" >> $SERVER
fi

echo -e "\n***** Checking if file /etc/httpd exists ******\n" >> $SERVER
if [ -f /etc/httpd ]
then
echo "file /etc/httpd: PASS" >> $SERVER
else 
echo "file /etc/httpd: FAILED" >> $SERVER
fi

echo -e "\n***** Checking kernel version ******\n" >> $SERVER

KERNEL=`uname -r | awk -F "." '{print $1}'`

if [ $KERNEL -lt 3 ]
then
echo "kernel: FAILED" >> $SERVER
else
echo "kernel: PASS" >> $SERVER
fi

echo "Please Wait for $SERVER Check Processing"
sleep 6

cat $SERVER

echo -e "\n \n"

