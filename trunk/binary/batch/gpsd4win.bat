:: ** This Batch file will launch gpsd from the cygwin folder **
:: gpsd is a daemon that monitors one or more GPSes attached to a 
:: host computer through serial or USB ports, making all data on the 
:: location/course/velocity of the sensors available to be queried 
:: on TCP port 2947 of the host computer.
::
:: You need to use the COM port that your GPS receiver is using.
:: This batch file search all port in use
::

@COLOR 0A
@ECHO off

:: Replace with your own COM port to skip search
SET PortNum=0

IF NOT %PortNum%==0 GOTO launchGPSD
SET regKey=HKLM\HARDWARE\DEVICEMAP\SERIALCOMM

:: Test a few of the most common ports
:preferiti
    FOR %%I IN (5 4 1 3) DO REG QUERY %regKey% /f COM%%I /d | IF %ErrorLevel%==0 SET PortNum=%%I
    IF NOT %PortNum%==0 GOTO launchGPSD

:: Search all ports from 1 to 255
:repeat
    CLS
    SET /A PortNum=%PortNum% + 1 
    IF %PortNum%==256 GOTO errorNoPortFound
    REG QUERY %regKey% /f COM%PortNum% /d || GOTO repeat

:: Launch GPSD with the given port number
:launchGPSD
    IF %PortNum%==0 GOTO errorNoPortFound
    %SystemDrive%
    CHDIR %SystemDrive%\cygwin\bin
    gpsd -b -N -D 2 /dev/com%PortNum% 

GOTO EOF

:: Display an error message
:errorNoPortFound
    COLOR 0C
    ECHO.
    ECHO.
    ECHO  No Serial Port detected! 
    ECHO  Make sure your GPS is properly connected and try again.
    ECHO.
    ECHO.
    pause

:EOF
