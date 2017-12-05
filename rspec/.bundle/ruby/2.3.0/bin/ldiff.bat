@ECHO OFF
IF NOT "%~f0" == "~f0" GOTO :WinNT
@"C:\Users\88630447753\Developer\RailsInstaller\Ruby2.3.0\bin\ruby.exe" "C:/Sites/rspec/.bundle/ruby/2.3.0/bin/ldiff" %1 %2 %3 %4 %5 %6 %7 %8 %9
GOTO :EOF
:WinNT
@"C:\Users\88630447753\Developer\RailsInstaller\Ruby2.3.0\bin\ruby.exe" "%~dpn0" %*
