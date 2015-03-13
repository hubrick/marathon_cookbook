cookbook_file "#{Chef::Config[:file_cache_path]}/marathon_client-0.3.0.gem" do
  source 'marathon_client-0.3.0.gem'
  backup false
end.run_action(:create_if_missing)

chef_gem 'marathon_client' do
  #source "#{Chef::Config[:file_cache_path]}/marathon_client-0.3.0.gem"
  # XXX: http://stackoverflow.com/questions/27258938/install-gem-from-s3-in-opsworks-chef-recipe
  action :nothing
  version '0.3.0'
  options "--local #{Chef::Config[:file_cache_path]}/marathon_client-0.3.0.gem"
end.run_action(:upgrade)

require 'marathon'
