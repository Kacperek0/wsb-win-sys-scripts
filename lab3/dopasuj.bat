@echo off

    REM check if file was starded with 2 params
    if "%1" == "" (
        echo Please run script with two parameters pointing download directory and target directory.
        goto :exit
    )
    if "%2" == "" (
        echo Please run script with two parameters pointing download directory and target directory.
        goto :exit
    )

    REM check if directory exist
    if not exist %1 (
        echo Directory does not exist. Please create it first.
        goto :exit
    )
    if not exist %2 (
        echo Directory does not exist. Please create it first.
        goto :exit
    )

    REM move files from first directory to matched names in second directory.
    for /f %%f in ('dir /S /B %1\*.*') do (
        for /f %%k in ('dir /A:D /S /B %2') do (
            if "%%~nf" == "%%~nk" (
                move %%f %%k
            )
        )
    )

    REM draw tree to show results
    tree /a /f .\zwierzeta

    :exit
