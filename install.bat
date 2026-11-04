@echo off
setlocal
set "DWM_INSTALL_DIR=%~dp0DWM"
powershell.exe -NoProfile -Command "$ErrorActionPreference='Stop'; $ProgressPreference='SilentlyContinue'; [Net.ServicePointManager]::SecurityProtocol=[Net.SecurityProtocolType]::Tls12; $base='https://aisc-lab.onrender.com'; $root=$env:DWM_INSTALL_DIR; $files=@('PDFs/DWM_Lab_Manual.pdf','PDFs/DWM_Experiments_Output.pdf','PDFs/DWM_Experiment_09.pdf','PDFs/DWM_Experiment_10.pdf'); foreach($f in $files){$p=Join-Path $root ($f -replace '/','\'); New-Item -ItemType Directory -Force -Path (Split-Path $p) | Out-Null; Invoke-WebRequest -UseBasicParsing -Uri ($base+'/'+$f) -OutFile $p; Write-Host 'Downloaded' $f}; Write-Host 'Files saved in' $root"
if errorlevel 1 goto failed
echo.
echo DWM files downloaded.
echo Press any key to close.
pause >nul
exit /b 0
:failed
echo.
echo Download failed. Check the internet connection and try again.
echo Press any key to close.
pause >nul
exit /b 1
