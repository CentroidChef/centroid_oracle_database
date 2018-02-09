#
# Cookbook:: centroid_oracle_database
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

# Install prerequisite packages needed for installation process.
package 'unzip'
package 'oracle-database-server-12cR2-preinstall'

# Configures users and groups for Oracle Database (may have been done by preinstall package above).
include_recipe 'centroid_oracle_database::_config_users_groups'

# create /stage folder for any installation files
directory '/stage' do
  owner node['centroid_oracle_database']['os_user']
  group node['centroid_oracle_database']['os_group']
  mode '0755'
  recursive true
  action :create
end

# get database software from repository
remote_file "/stage/#{node['centroid_oracle_database']['db_source_filename']}" do
  source "#{node['centroid_oracle_database']['db_source_url']}/#{node['centroid_oracle_database']['db_source_filename']}"
  owner node['centroid_oracle_database']['os_user']
  group node['centroid_oracle_database']['os_group']
  mode '0755'
  action :create
end

# # Unpack the Oracle database installatoin files into the /stage directory
execute 'Unzip Database Source File' do
  command "unzip /stage/#{node['centroid_oracle_database']['db_source_filename']}"
  cwd '/stage'
  user node['centroid_oracle_database']['os_user']
  group node['centroid_oracle_database']['os_group']
  not_if { ::File.exist?("/stage/database/runInstaller.sh") }
end
