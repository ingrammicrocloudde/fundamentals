// Parameters for both resources
param location string = resourceGroup().location

// Storage Account parameters
param storageAccountName string = 'stgingramicro089'
param storageAccountSku string = 'Standard_LRS'

// VNet parameters
param vnetName string = 'vnetname'
param vnetAddressPrefix string = '10.0.0.0/16'
param defaultSubnetName string = 'default-subnet'
param defaultSubnetPrefix string = '10.0.0.0/24'

// VM parameters
param vmName string = 'winserver'
@secure()
param adminUsername string
@secure()
param adminPassword string

// Deploy Storage Account
module storageModule 'storage.bicep' = {
  name: 'storageDeployment'
  params: {
    storageAccountName: storageAccountName
    location: location
    storageAccountSku: storageAccountSku
  }
}

// Deploy VNet
module vnetModule 'vnet.bicep' = {
  name: 'vnetDeployment'
  params: {
    vnetName: vnetName
    location: location
    vnetAddressPrefix: vnetAddressPrefix
    defaultSubnetName: defaultSubnetName
    defaultSubnetPrefix: defaultSubnetPrefix
  }
}

// Deploy Windows Server VM
module vmModule 'vm.bicep' = {
  name: 'vmDeployment'
  params: {
    vmName: vmName
    location: location
    adminUsername: adminUsername
    adminPassword: adminPassword
    vnetName: vnetName
    subnetName: defaultSubnetName
    osDiskSizeGB: 128
  }
  dependsOn: [
    vnetModule
  ]
}

// Outputs
output storageAccountId string = storageModule.outputs.storageAccountId
output storageAccountName string = storageModule.outputs.storageAccountName
output vnetId string = vnetModule.outputs.vnetId
output vnetName string = vnetModule.outputs.vnetName
output vmId string = vmModule.outputs.vmId
output vmName string = vmModule.outputs.vmName
output vmPublicIP string = vmModule.outputs.publicIPAddress
