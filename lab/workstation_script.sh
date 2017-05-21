az group create -n 'chefconf2017wks' -l 'South Central US'
az group deployment create --template-file workstation.json --parameters @workstation.parameters.json --resource-group chefconf2017wks --name testMachines --output table

