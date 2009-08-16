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
@XCOPY /E binary\images\* tempInst
@XCOPY /E binary\batch\* tempInst
@XCOPY /E binary\cygwin\* tempInst
@XCOPY /E binary\gpsd\* tempInst\bin

:: Launch the NSIS setup
@COLOR 0B
SET NSIS="%ProgramFiles%\NSIS\makensis.exe"
IF NOT EXIST %NSIS% SET NSIS="%ProgramFiles(x86)%\NSIS\makensis.exe"
CALL %NSIS% setup.nsi
@ECHO.

:: clean up at the end
@MOVE *.exe installer
@COLOR 0A
@ECHO.
@PAUSE
@DEL setup.* /q
@RD tempInst /s /q

