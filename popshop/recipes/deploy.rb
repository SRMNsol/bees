node[:deploy].each do |app_name, deploy|
  if deploy[:application_type] != 'php'
    Chef::Log.debug("Skipping deploy::php application #{application} as it is not an PHP app")
    next
  end

  script "install_composer" do
    interpreter "bash"
    user "deploy"
    cwd "#{deploy[:deploy_to]}/current"
    code <<-EOH
    curl -sS https://getcomposer.org/installer | php
    php composer.phar install --no-dev --prefer-source --no-interaction
    EOH
  end

  template "#{deploy[:deploy_to]}/current/config/local.yml" do
    source "local.yml.erb"
    mode 0644
    group deploy[:group]

    if platform?("ubuntu")
      owner "www-data"
    elsif platform?("amazon")
      owner "apache"
    end

    only_if do
      File.directory?("#{deploy[:deploy_to]}/current")
    end
  end
end
