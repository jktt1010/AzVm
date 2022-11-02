$resourceGroupName = Read-Host -Prompt "Enter the Resource Group Name: grid"
$location = Read-Host -Prompt "Enter the Loacation: canadacentral"
$adminUsername = Read-Host -Prompt "Enter the admin Username: "
$adminPassword = Read-Host -Prompt "Enter the admin Password: " -AsSecureString

New-AzResourceGroup -Name $resourceGroupName -Location $location

New-AzResourceGroupDeployment   `
    -ResourceGroupName $resourceGroupName   `
    -TemplateUri "https://raw.githubusercontent.com/jktt1010/AzVm/main/AzVmDeploymentTemplate.json" `
    -adminUsername $adminUsername   `
    -adminPassword $adminPassword   `

(Get-AzVm -ResourceGroupName $resourceGroupName).name