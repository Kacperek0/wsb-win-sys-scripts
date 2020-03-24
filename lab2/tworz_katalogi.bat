@echo off

    if "%1" == "" (
        echo Please run script using text file with files list as parameter.
        goto :exit
    )

    REM check if exist
        if exist "download" (
            rmdir /q /s "download"
        )
        if exist "zwierzeta" (
            rmdir /q /s "zwierzeta"
        )

    for /F %%f in (%1) do (
        mkdir "%%f"
    )

    if not exist "download" (
        mkdir "download"
    )
    REM fill in download file
    powershell Invoke-WebRequest https://wsb-architektura-komputerow.s3.eu-central-1.amazonaws.com/winlab.zip -O winlab.zip
    copy "winlab.zip" "download"
    cd "download"
    powershell Expand-Archive winlab.zip
    cd winlab/download
    for %%f in (*.jpg) do (
        move %%f ..\..
    )
    cd ..\..
    rmdir /q /s "winlab"
    del /f "winlab.zip"
    cd ..
    del /f "winlab.zip"

    REM show results
        cls
        tree /f

    :exit
