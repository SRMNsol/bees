node[:deploy].each do |app_name, deploy|
  if deploy[:application_type] != 'php'
    Chef::Log.debug("Skipping deploy::php application #{application} as it is not an PHP app")
    next
  end

  cron "beesavy_transactions" do
    user "deploy"
    hour "6"
    minute "0"
    command "cd #{deploy[:deploy_to]}/current && php ./bin/console.php beesavy:transactions"
  end

  cron "beesavy_referral_calculate" do
    user "deploy"
    hour "7"
    minute "0"
    command "cd #{deploy[:deploy_to]}/current && php ./bin/console.php beesavy:referral:calculate"
  end

  # old jobs

  cron "popshops_networks" do
    user "deploy"
    hour "6"
    minute "0"
    command "cd #{deploy[:deploy_to]}/current && php ./bin/console.php api:networks --catalog-key=74762wn6w9utgw6khg2ta92gz"
    action :delete
  end

  cron "linkshare_transactions" do
    user "deploy"
    hour "6"
    minute "20"
    command "cd #{deploy[:deploy_to]}/current && php ./bin/console.php linkshare:transactions"
    action :delete
  end

  cron "cj_transactions" do
    user "deploy"
    hour "6"
    minute "25"
    command "cd #{deploy[:deploy_to]}/current && php ./bin/console.php cj:transactions"
    action :delete
  end

  cron "pepperjam_transactions" do
    user "deploy"
    hour "6"
    minute "30"
    command "cd #{deploy[:deploy_to]}/current && php ./bin/console.php pepperjam:transactions"
    action :delete
  end

  cron "pepperjam_transactions_update" do
    user "deploy"
    hour "6"
    minute "35"
    command "cd #{deploy[:deploy_to]}/current && php ./bin/console.php pepperjam:transactions --update"
    action :delete
  end

  cron "shareasale_transactions" do
    user "deploy"
    hour "6"
    minute "40"
    command "cd #{deploy[:deploy_to]}/current && php ./bin/console.php shareasale:transactions"
    action :delete
  end

  cron "shareasale_transactions_update" do
    user "deploy"
    hour "6"
    minute "45"
    command "cd #{deploy[:deploy_to]}/current && php ./bin/console.php shareasale:transactions --update"
    action :delete
  end

  cron "referral_calculate" do
    user "deploy"
    hour "7"
    minute "0"
    command "cd #{deploy[:deploy_to]}/current && php ./bin/console.php beesavy:referral:calculate --exclude=pbbmedia@gmail.com"
    action :delete
  end
end
