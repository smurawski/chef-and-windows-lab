## Let's use chef generate again
chef generate attribute ./ReactorWorkshop first_attributes

<#

### in ./ReactorWorkshop/attributes/first_attributes.rb

default['ReactorWorkshop']['site_dir'] = ['first_site', 'second_site', 'third_site']


### in ./ReactorWorkshop/recipes/first_recipe.rb

directory 'c:/sites'

node['ReactorWorkshop']['site_dir'].each do |site_dir|
  directory File.join('c:/sites', site_dir)
end

#>