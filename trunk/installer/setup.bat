:: Make the installer using NSIS

@COLOR 0F
:: clean up before starting
@DEL *.exe
@COPY setup.* ..
@CD ..
@RD tempInst /s /q
@DEL *.exe

:: Make a temp folder 
@MD tempInst

:: Combine the binaries in temp 
@XCOPY /E binary\cygwin\* tempInst
@XCOPY /E binary\gpsd\* tempInst

:: Launch the NSIS setup
@COLOR 0B
"C:\Program Files (x86)\NSIS\makensis.exe" setup.nsi
@ECHO.

:: clean up at the end
@MOVE *.exe installer
@COLOR 0A
@ECHO.
@PAUSE
@DEL setup.* /q
@RD tempInst /s /q

