:: Stops the commands from showing on the console as they are executed
@echo off
:: Variables can be modified during run time
setlocal enabledelayedexpansion
:: Asks for input and stores into sourcePath
set /p sourcePath=Enter the source folder path:
:: Same but stored into destinationPath
set /p destinationPath=Enter the destination folder path:
:: Check if the sourcePath exists
:: FALSE -> It prints the following text
::          Exit the whole script
if not exist "!sourcePath!\" (
    echo Error: Source folder does not exist.
    goto :eof
)
:: Same as above but for destinationPath
if not exist "!destinationPath!\" (
    echo Error: Destination folder does not exist.
    goto :eof
)
:: Copy files and directories from sourcePath to destinationPath
:: /E enables the copying of subdirectories aswell
robocopy "!sourcePath!" "!destinationPath!" /E
:: Check if an error returned by robocopy is 8 or above
:: TRUE -> Print the following text
:: FALSE -> Print the ELSE statement
if errorlevel 8 (
    echo Error: ROBOCOPY encountered errors during the copy operation.
) else (
    echo Copy operation completed successfully.
)
:: End of the script
:: Removes the setLocal found at the beginning of the text
:end
endlocal