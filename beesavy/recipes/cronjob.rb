node[:deploy].each do |app_name, deploy|
  if deploy[:application_type] != 'php'
    Chef::Log.debug("Skipping beesavy::cronjob application #{app_name} as it is not an PHP app")
    next
  end

  cron "beesavy_transactions" do
    user deploy[:user]
    hour "6"
    minute "0"
    command "cd #{deploy[:deploy_to]}/current && php ./bin/console.php beesavy:transactions"
  end

  cron "beesavy_referral_calculate" do
    user deploy[:user]
    hour "7"
    minute "0"
    command "cd #{deploy[:deploy_to]}/current && php ./bin/console.php beesavy:referral:calculate"
  end
end
