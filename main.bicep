@sys.description('The Web App name.')
@minLength(3)
@maxLength(24)
param appServiceAppName string = 'afernandez-app'
@sys.description('The App Service Plan name.')
@minLength(3)
@maxLength(24)
param appServicePlanName string = 'afernandez-asp'
param location string = resourceGroup().location

resource appServicePlan 'Microsoft.Web/serverFarms@2022-03-01' = {
  name: appServicePlanName
  location: location
  sku: {
    name: 'B1'
  }
}
resource appServiceApp 'Microsoft.Web/sites@2022-03-01' = {
name: appServiceAppName
location: location
properties: {
  serverFarmId: appServicePlan.id
  httpsOnly: true
  }
}

output appServiceAppHostName string = appServiceApp.properties.defaultHostName
