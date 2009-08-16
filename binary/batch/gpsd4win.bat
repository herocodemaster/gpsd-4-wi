@echo off

C:
chdir C:\cygwin\bin

gpsd -b -N -D 2 /dev/com5 
