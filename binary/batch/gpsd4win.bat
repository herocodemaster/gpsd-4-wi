@COLOR 0A
@ECHO off

%SystemDrive%
CHDIR %SystemDrive%\cygwin\bin

gpsd -b -N -D 2 /dev/com5 
