node[:deploy].each do |app_name, deploy|
  if deploy[:application_type] != 'php'
    Chef::Log.debug("Skipping beesavy::configure application #{app_name} as it is not an PHP app")
    next
  end

  # write out local.yml
  template "#{deploy[:deploy_to]}/shared/config/local.yml" do
    source 'local.yml.erb'
    mode '0644'
    owner deploy[:user]
    group deploy[:group]
    variables(
      :database => deploy[:database],
      :memcached => deploy[:memcached],
      :smtp => deploy[:smtp],
      :stack_name => node[:opsworks][:stack][:name],
      :app => deploy[:app]
    )
    only_if do
      File.exists?("#{deploy[:deploy_to]}/shared/config")
    end
  end
end
