:: ** This Batch file will launch gpsd from the cygwin folder **
:: gpsd is a daemon that monitors one or more GPSes attached to a 
:: host computer through serial or USB ports, making all data on the 
:: location/course/velocity of the sensors available to be queried 
:: on TCP port 2947 of the host computer.
::
:: You need to use the COM port that your GPS receiver is using.
:: This batch file uses com5 by default
::

@COLOR 0A
@ECHO off

%SystemDrive%
CHDIR %SystemDrive%\cygwin\bin

:: Replace com5 with your own COM port below
gpsd -b -N -D 2 /dev/com5 
