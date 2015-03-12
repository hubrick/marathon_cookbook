cookbook_file "#{Chef::Config[:file_cache_path]}/marathon_client-0.3.0.gem" do
  source 'marathon_client-0.3.0.gem'
  backup false
end.run_action(:create_if_missing)

chef_gem 'marathon_client' do
  source "#{Chef::Config[:file_cache_path]}/marathon_client-0.3.0.gem"
  action :upgrade
end

require 'marathon'
