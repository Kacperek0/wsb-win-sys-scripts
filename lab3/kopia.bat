@echo off

    REM check if directory exists, remove it and create again
    if exist "kopia" (
        rmdir /q /s "kopia"
    )

    REM delete existing downloads file
    if exist "download" (
        rmdir /q /s "download"
    )

    REM create and fill in new downloads folder
    mkdir "download"
    powershell Invoke-WebRequest https://wsb-architektura-komputerow.s3.eu-central-1.amazonaws.com/winlab.zip -O winlab.zip
    powershell Expand-Archive winlab.zip
    del /f "winlab.zip"
    for /f %%f in ('dir /s /b .\winlab\download') do (
        move %%f .\download
    )
    rmdir /q /s "winlab"

    REM move files from download folder to kopia
    mkdir "kopia"
    for /f %%f in ('dir /s /b .\download') do (
        copy %%f .\kopia
    )
