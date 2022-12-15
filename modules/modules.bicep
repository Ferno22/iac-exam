param location string = resourceGroup().location
param storageAccountNames array = ['afernandez-finalexam1', 'afernandez-finalexam2']
var storageAccountSkuName = 'Standard_LRS'

resource storageAccount 'Microsoft.Storage/storageAccounts@2022-05-01' = [for storageAccountName in storageAccountNames: {
  name: storageAccountName
  location: location
    sku: {
      name: storageAccountSkuName
    }
    kind: 'StorageV2'
    properties: {
      accessTier: 'Hot'
    }
  }]


output storageAccountNames array = [for storageAccount in storageAccount: storageAccount.name]
