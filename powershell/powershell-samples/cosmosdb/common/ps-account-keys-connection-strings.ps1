# Account keys and connection string operations for Azure Cosmos account

#generate a random 10 character alphanumeric string to ensure unique resource names
$uniqueId=$(-join ((97..122) + (48..57) | Get-Random -Count 15 | % {[char]$_}))

$apiVersion = "2015-04-08"
$location = "West US 2"
$resourceGroupName = "myResourceGroup"
$accountName = "mycosmosaccount-$uniqueId" # must be lower case.
$resourceType = "Microsoft.DocumentDb/databaseAccounts"
$keyKind = @{ "keyKind"="Primary" }

# Provision a new Cosmos account with the regions below
$locations = @(
    @{ "locationName"="West US 2"; "failoverPriority"=0 },
    @{ "locationName"="East US 2"; "failoverPriority"=1 }
)

$CosmosDBProperties = @{
    "databaseAccountOfferType"="Standard";
    "locations"=$locations
}

New-AzResource -ResourceType $resourceType `
    -ApiVersion $apiVersion -ResourceGroupName $resourceGroupName -Location $location `
    -Name $accountName -PropertyObject $CosmosDBProperties


Read-Host -Prompt "List connection strings for an Azure Cosmos Account"

Invoke-AzResourceAction -Action listConnectionStrings `
    -ResourceType $resourceType -ApiVersion $apiVersion `
    -ResourceGroupName $resourceGroupName -Name $accountName | Select-Object *

Read-Host -Prompt "List keys for an Azure Cosmos Account"

Invoke-AzResourceAction -Action listKeys `
    -ResourceType $resourceType -ApiVersion $apiVersion `
    -ResourceGroupName $resourceGroupName -Name $accountName | Select-Object *

Read-Host -Prompt "Regenerate the primary key for an Azure Cosmos Account"

$keys = Invoke-AzResourceAction -Action regenerateKey `
    -ResourceType $resourceType -ApiVersion $apiVersion `
    -ResourceGroupName $resourceGroupName -Name $accountName -Parameters $keyKind

Write-Host $keys
