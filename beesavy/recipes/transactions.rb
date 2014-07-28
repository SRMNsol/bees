node[:deploy].each do |app_name, deploy|
  if deploy[:application_type] != 'php'
    Chef::Log.debug("Skipping deploy::php application #{application} as it is not an PHP app")
    next
  end

  script "beesavy_transactions" do
    interpreter "bash"
    user "deploy"
    cwd "#{deploy[:deploy_to]}/current"
    code "php bin/console.php beesavy:transactions \"#{deploy[:app][:download][:from]}\" \"#{deploy[:app][:download][:to]}\""
  end
end
