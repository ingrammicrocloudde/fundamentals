using 'main.bicep'

// Common parameters
param location = 'eastus'

// Storage Account parameters
param storageAccountName = 'storagedemo230724'
param storageAccountSku = 'Standard_LRS'

// VNet parameters
param vnetName = 'vnet-demo'
param vnetAddressPrefix = '10.0.0.0/16'
param defaultSubnetName = 'default-subnet'
param defaultSubnetPrefix = '10.0.0.0/24'

// VM parameters
param vmName = 'winvm-demo'
param adminUsername = 'adminuser' // Replace with your secure admin username before deployment
param adminPassword = 'P@ssw0rd1234!' // Replace with your secure password before deployment
