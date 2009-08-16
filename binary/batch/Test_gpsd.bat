:: ** This Batch file will launch gpspipe from the cygwin folder **
:: gpspipe is a simple client that captures GPS output and/or gpsd 
:: reports and sends it to standard output.
::

@COLOR 0A
@ECHO off

%SystemDrive%
CHDIR %SystemDrive%\cygwin\bin

gpspipe -w
