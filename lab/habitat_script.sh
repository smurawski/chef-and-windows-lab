az group create -n 'it-transform-habitat' -l 'South Central US'
az group deployment create --template-file habitat.json --parameters @habitat.parameters.json --resource-group it-transform-habitat --name testMachines --output table

