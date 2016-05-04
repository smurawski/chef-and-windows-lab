## We can use chef-apply to run one-off resources or recipes
## chef-apply only supports core resources, not cookbooks

$chef_file_resource = @'

file 'c:/chef_test.txt' do
  content 'Hey everyone!'
end

'@

chef-apply --execute $chef_file_resource

