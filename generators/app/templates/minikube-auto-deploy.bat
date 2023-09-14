@echo off
setlocal enabledelayedexpansion

REM Define the functions to call

REM applicationDeployment
:applicationDeployment
echo.
echo Prerequisites:
echo  1. Make sure that you have installed kubectl and is configured
echo  2. Make sure that you have installed minikube and make sure it's started.
echo  3. Make sure that domain mapping is done properly.
echo.

set /p "user_continue_action_appDeployment=Confirm if you meet all the above requirements (yes/no): "
if "%user_continue_action_appDeployment%"=="yes" (
    cd ..
    cd kubernetes

    REM Replace the placeholder with minikube_ip 
    for /f "delims=" %%i in ('kubectl get node -o jsonpath^='{.items[0].status.addresses[?(@.type=="InternalIP")].address}') do set "minikube_ip=%%i"

    REM Replace minikube_ip_placeholder with minikube_ip
    if "%PROCESSOR_ARCHITECTURE%"=="AMD64" (
        (for /f "delims=" %%j in ('type K8S-README.md ^| find /v /n "" ^| find "minikube_ip_placeholder"') do (
            set "line=%%j"
            set "line=!line:~0,-24!!minikube_ip!"
            echo(!line:*]=!
        )) > K8S-README.md.new
        move /y K8S-README.md.new K8S-README.md

        (for /f "delims=" %%j in ('type kubectl-apply.sh ^| find /v /n "" ^| find "minikube_ip_placeholder"') do (
            set "line=%%j"
            set "line=!line:~0,-24!!minikube_ip!"
            echo(!line:*]=!
        )) > kubectl-apply.sh.new
        move /y kubectl-apply.sh.new kubectl-apply.sh
    ) else (
        (for /f "delims=" %%j in ('type K8S-README.md ^| find /v /n "" ^| find "minikube_ip_placeholder"') do (
            set "line=%%j"
            set "line=!line:~0,-24!!minikube_ip!"
            echo(!line:*]=!
        )) > K8S-README.md.new
        move /y K8S-README.md.new K8S-README.md

        (for /f "delims=" %%j in ('type kubectl-apply.sh ^| find /v /n "" ^| find "minikube_ip_placeholder"') do (
            set "line=%%j"
            set "line=!line:~0,-24!!minikube_ip!"
            echo(!line:*]=!
        )) > kubectl-apply.sh.new
        move /y kubectl-apply.sh.new kubectl-apply.sh
    )

    cd ..
    call kubectl-apply.sh -f
    cd ..
    cd terraform
) else (
    echo Thank you, user!
)

REM MINIKUBE
:minikube
echo You have opted for Minikube cluster
REM Add code here to execute the action for minikube
echo Initiating the minikube action....
echo.
set /p "user_continue_action=Continue with the Infrastructure deployment (yes/no): "
if "%user_continue_action%"=="yes" (
    echo Deploying the Infrastructure in our Minikube cluster.....
    REM List of directories to process
    set "directories=./eck ./istio ./istio-monitoring ./docker-build^&publish"

    REM Loop through each directory and execute command
    for %%d in (%directories%) do (
        if exist "%%d" (
            echo Processing directory: %%d
            cd %%d

            REM Execute your command here
            echo Initiating terraform in %%d
            terraform init
            echo Auto applying terraform in %%d
            terraform apply -auto-approve

            cd ..
        ) else (
            echo Directory %%d does not exist
        )
    )

    echo.
    echo Minikube Infrastructure was deployed successfully!
    echo.
) else (
    echo.
    echo Looks like you have already deployed the WDI, Thank you!
    echo.
)

set /p "appDeployment=Do you want to continue with the application Deployment (yes/no): "

if "%appDeployment%"=="yes" (
  call :applicationDeployment
) else (
  echo Thank you, user!
)

REM End of script
