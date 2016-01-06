resource_name :deploy_key

property :key_name,     String, name_property: true
property :key_location, String
property :key_content,  String
property :user,         String

action :create do
  Chef::Log.info "Creating directory on #{key_location}"
  directory key_location do
    path key_location
    owner user
    group user
    mode '0700'
    recursive true
    action :create
  end

  Chef::Log.info "Creating key #{key_name}"
  file "#{key_location}" + "/#{key_name}" do
    owner user
    group user
    mode '0600'
    content key_content
    sensitive true
    action :create
  end
end

action :delete do
  Chef::Log.info "Deleting key #{key_name}"
  file "#{key_location}" + "/#{key_name}" do
    sensitive true
    action :delete
  end
end
