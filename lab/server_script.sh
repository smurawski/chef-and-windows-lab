az group create -n 'chefconf2017lab' -l 'South Central US'
az group deployment create --template-file server.json --parameters @server.parameters.json --resource-group chefconf2017lab --name testMachines --output table

