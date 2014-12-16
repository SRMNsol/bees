node[:deploy].each do |app_name, deploy|
  if deploy[:application_type] != 'php'
    Chef::Log.debug("Skipping beesavy::logo application #{app_name} as it is not an PHP app")
    next
  end

  script "beesavy_merchant_logo" do
    interpreter "bash"
    user deploy[:user]
    cwd "#{deploy[:deploy_to]}/current"
    code "php bin/console.php beesavy:merchant:logo --no-interaction"
  end
end
