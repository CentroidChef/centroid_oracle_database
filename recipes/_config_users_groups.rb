# Configure the group (i.e. dba)
group node['centroid_oracle_database']['os_group'] do
  action :create
end

# Configure the user (i.e. oracle)
user node['centroid_oracle_database']['os_user'] do
  comment 'Created by Chef for WebLogic installation'
  gid node['centroid_oracle_database']['os_group']
  shell node['centroid_oracle_database']['os_shell']
  home node['centroid_oracle_database']['os_user_home_dir'] + '/' + node['centroid_oracle_database']['os_user']
  manage_home true
  action :create
end
