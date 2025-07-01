@description('Name of the virtual network')
param vnetName string = 'vnet-${uniqueString(resourceGroup().id)}'

@description('Location for all resources')
param location string = resourceGroup().location

@description('Address space for the virtual network')
param vnetAddressPrefix string = '10.0.0.0/16'

@description('Name of the default subnet')
param defaultSubnetName string = 'default-subnet'

@description('Address prefix for the default subnet')
param defaultSubnetPrefix string = '10.0.0.0/24'

resource virtualNetwork 'Microsoft.Network/virtualNetworks@2023-04-01' = {
  name: vnetName
  location: location
  properties: {
    addressSpace: {
      addressPrefixes: [
        vnetAddressPrefix
      ]
    }
    subnets: [
      {
        name: defaultSubnetName
        properties: {
          addressPrefix: defaultSubnetPrefix
          privateEndpointNetworkPolicies: 'Disabled'
          privateLinkServiceNetworkPolicies: 'Enabled'
        }
      }
    ]
  }
}

output vnetId string = virtualNetwork.id
output vnetName string = virtualNetwork.name
output defaultSubnetId string = virtualNetwork.properties.subnets[0].id
