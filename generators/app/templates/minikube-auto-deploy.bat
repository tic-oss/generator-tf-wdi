@echo off
REM Define the functions to call

REM applicationDeployment
:applicationDeployment
echo.
echo Prerequisites:
echo 1. Make sure that you have installed kubectl and is configured
echo 2. Make sure that you have installed minikube and make sure it's started.
echo 3. Make sure that domain mapping is done properly.
echo.

set /p user_continue_action_appDeployment=Confirm if you meet all the above requirements (yes/no):

if "%user_continue_action_appDeployment%" == "yes" (
    cd ..
    cd kubernetes

    REM replace the placeholder with minikube_ip
    for /f "tokens=*" %%i in ('kubectl get node -o jsonpath="{.items[0].status.addresses[?(@.type==\"InternalIP\")].address}"') do set "minikube_ip=%%i"
    
    REM replace pc with this minikube_ip
    if "%PROCESSOR_ARCHITECTURE%"=="AMD64" (
        for %%f in (K8S-README.md kubectl-apply.sh) do (
            (for /f "delims=" %%a in (%%f) do (
                echo %%a|findstr /i /c:"minikube_ip_placeholder">nul&&(
                    (echo %%a|findstr /i /c:"minikube_ip_placeholder") || (
                        (echo %%a|findstr /i /c:"minikube_ip_placeholder")>%%f.new
                    )
                )||(echo %%a)
            )) && (copy /y %%f.new %%f)
        )
    ) else (
        (for /f "delims=" %%a in (K8S-README.md) do (
            echo %%a|findstr /i /c:"minikube_ip_placeholder">nul&&(
                (echo %%a|findstr /i /c:"minikube_ip_placeholder") || (
                    (echo %%a|findstr /i /c:"minikube_ip_placeholder")>K8S-README.md.new
                )
            )||(echo %%a)
        )) && (copy /y K8S-README.md.new K8S-README.md)

        (for /f "delims=" %%a in (kubectl-apply.sh) do (
            echo %%a|findstr /i /c:"minikube_ip_placeholder">nul&&(
                (echo %%a|findstr /i /c:"minikube_ip_placeholder") || (
                    (echo %%a|findstr /i /c:"minikube_ip_placeholder")>kubectl-apply.sh.new
                )
            )||(echo %%a)
        )) && (copy /y kubectl-apply.sh.new kubectl-apply.sh)

        cd keycloak-k8s

        (for /f "delims=" %%a in (keycloak-configmap.yml) do (
            echo %%a|findstr /i /c:"minikube_ip_placeholder">nul&&(
                (echo %%a|findstr /i /c:"minikube_ip_placeholder") || (
                    (echo %%a|findstr /i /c:"minikube_ip_placeholder")>keycloak-configmap.yml.new
                )
            )||(echo %%a)
        )) && (copy /y keycloak-configmap.yml.new keycloak-configmap.yml)
    )

    cd ..
    call kubectl-apply.sh -f
    cd ..
    cd terraform
) else (
    echo Thank you, user!
)

REM MINIKUBE
:MINIKUBE
echo You have opted for Minikube cluster
echo Initiating the minikube action....
echo.
set /p user_continue_action=Continue with the Infrastructure deployment (yes/no):

if "%user_continue_action%" == "yes" (
    echo Deploying the Infrastructure in our Minikube cluster.....
    
    REM List of directories to process
    for %%d in (
        "./eck"
        "./istio"
        "./istio-monitoring"
        "./docker-build&publish"
    ) do (
        if exist "%%d" (
            echo Processing directory: %%d
            cd "%%d" || exit
            
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
    echo Looks like you have already deployed the WDI, Thank you! 🐱
    echo.
)

set /p appDepolyment=Do you want to continue with the application Deployment (yes/no):

if "%appDepolyment%" == "yes" (
    call :applicationDeployment
) else (
    echo Thank you, user!
)

REM End of script
