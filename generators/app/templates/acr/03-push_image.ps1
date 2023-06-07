
# Log in to Azure interactively
az login

# Log in to the Azure Container Registry
$registryName = <%- "\""+"acr"+projectName+"\"" %>
az acr login --name $registryName

# Push local images to Azure Container Registry

$loginServer = "$registryName.azurecr.io"
$images = @(
    "client"
    
)

foreach ($image in $images) {
    docker tag $image "$loginServer/nand/$image"
    docker push "$loginServer/nand/$image"
}




