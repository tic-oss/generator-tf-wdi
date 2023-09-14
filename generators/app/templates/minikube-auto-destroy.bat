@echo off
setlocal enabledelayedexpansion

REM Define the functions to call

REM minikube
:minikube
echo You have opted for Minikube cluster
REM Add code here to execute the action for Minikube
echo Initiating the Minikube action...
echo.
set /p "user_continue_action=Continue with destroying Infrastructure (yes/no): "
if "%user_continue_action%"=="yes" (
    echo Destroying the Infrastructure in our Minikube cluster...

    REM List of directories to process
    set "directories=./istio-monitoring ./istio ./eck"

    REM Loop through each directory and execute command
    for %%d in (%directories%) do (
        if exist "%%d" (
            echo Processing directory: %%d
            cd %%d

            REM Execute your command here
            echo Auto destroying Terraform in %%d
            terraform destroy -auto-approve
            cd ..
        ) else (
            echo Directory %%d does not exist
        )
    )

    echo.
    echo Minikube Infrastructure was destroyed successfully! [insert appropriate emoji or message]
    echo.
    echo [Insert any additional messages or instructions here]
) else (
    echo.
    echo Looks like you have already destroyed the Infrastructure. Thank you! [insert appropriate emoji or message]
    echo.
)

REM End of script
