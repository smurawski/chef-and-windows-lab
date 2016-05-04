## ChefDK makes it easy to get started building a cookbook
cd c:\working_repo\cookbooks
chef generate cookbook ReactorWorkshop

## ChefDK generators are pretty useful, but there are some
## idosyncracies

## For example, 
## chef generate cookbook puts the cookbook at the current path
## chef generate recipe however looks for your cookbook at your cookbooks path

chef generate recipe ./ReactorWorkshop first_recipe

<#  

## Recipe content snippets

### OK
powershell_script 'web-server' do
  code  'add-windowsfeature web-server'
end


### Better
powershell_script 'web-server' do 
  code  'add-windowsfeature web-server'
  not_if '(Get-windowsfeature web-server) -ne $null'
end

### Best
dsc_resource 'web-server' do
  resource :windowsfeature
  propety :name, 'web-server'
end

#>
