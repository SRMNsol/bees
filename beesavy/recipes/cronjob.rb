node[:deploy].each do |app_name, deploy|
  if deploy[:application_type] != 'php'
    Chef::Log.debug("Skipping beesavy::cronjob application #{app_name} as it is not an PHP app")
    next
  end

  cron "beesavy_transactions" do
    user deploy[:user]
    hour "6"
    minute "0"
    command "cd #{deploy[:deploy_to]}/current && php ./bin/console.php beesavy:transactions && php ./bin/console.php beesavy:transactions \"2 days ago\""
  end

  cron "beesavy_referral_calculate" do
    user deploy[:user]
    hour "7"
    minute "0"
    command "cd #{deploy[:deploy_to]}/current && php ./bin/console.php beesavy:referral:calculate"
  end

  cron "beesavy_referral_calculate_1m" do
    user deploy[:user]
    hour "8"
    minute "0"
    command "cd #{deploy[:deploy_to]}/current && php ./bin/console.php beesavy:referral:calculate --month=\"`date -d \"1 month ago\" \"+%Y%m\"`\""
  end

  cron "beesavy_referral_calculate_2m" do
    user deploy[:user]
    hour "9"
    minute "0"
    command "cd #{deploy[:deploy_to]}/current && php ./bin/console.php beesavy:referral:calculate --month=\"`date -d \"2 months ago\" \"+%Y%m\"`\""
  end

  cron "beesavy_referral_calculate_3m" do
    user deploy[:user]
    hour "10"
    minute "0"
    command "cd #{deploy[:deploy_to]}/current && php ./bin/console.php beesavy:referral:calculate --month=\"`date -d \"3 months ago\" \"+%Y%m\"`\""
  end

  cron "beesavy_merchant_logo" do
    user deploy[:user]
    action :delete
  end
end
