@echo off
setlocal EnableDelayedExpansion

REM Define the functions to call

REM minikube
:MINIKUBE
echo You have opted for minikube cluster
REM Add code here to execute the action for minikube
echo Initiating the minikube....
echo.
set /p "user_continue_action=Continue with the destroying Infrastructure (yes/no): "
if "%user_continue_action%"=="yes" (
    echo Destroying the Infrastructure in our Minikube cluster.....

    REM List of directories to process
    set "directories=./istio-monitoring ./istio ./eck"

    REM Loop through each directory and execute command
    for %%d in (%directories%) do (
        if exist "%%d" (
            echo Processing directory: %%d
            cd %%d || exit /b
            REM Execute your command here
            echo Auto destroying terraform in %%d
            terraform destroy -auto-approve
            cd ..
        ) else (
            echo Directory %%d does not exist
        )
    )

    echo.
    echo Minikube Infrastructure was destroyed successfully!^^
    echo.
    echo Make sure you delete the ECR manually.^^
    echo.
) else (
    echo.
    echo Looks like you have already destroyed the Infrastructure. Thank you!^^
    echo.
)

goto :EOF

REM SCRIPT STARTS
REM Check if figlet is installed
if "%PROCESSOR_ARCHITECTURE%"=="AMD64" (
    where figlet >nul 2>&1 || (
        REM Install figlet using apt-get
        echo Installing figlet...
        sudo apt-get -y install figlet
    )
) else if "%PROCESSOR_ARCHITECTURE%"=="ARM64" (
    where figlet >nul 2>&1 || (
        REM Install figlet using Homebrew
        echo Installing figlet...
        brew install figlet
    )
) else (
    echo Unsupported architecture: %PROCESSOR_ARCHITECTURE%
    exit /b 1
)

REM Use figlet to print "AutoDestroy"
figlet -f slant "AutoDestroy"
echo.
call :MINIKUBE
