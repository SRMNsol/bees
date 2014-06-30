node[:deploy].each do |app_name, deploy|
  if deploy[:application_type] != 'php'
    Chef::Log.debug("Skipping deploy::php application #{application} as it is not an PHP app")
    next
  end

  cron "networks" do
    hour "6"
    minute "0"
    command "cd #{deploy[:deploy_to]}/current && php .bin/console.php api:networks --catalog-key=74762wn6w9utgw6khg2ta92gz"
  end

  cron "linkshare" do
    hour "6"
    minute "20"
    command "cd #{deploy[:deploy_to]}/current && php .bin/console.php linkshare:transactions"
  end

  cron "cj_transactions" do
    hour "6"
    minute "25"
    command "cd #{deploy[:deploy_to]}/current && php .bin/console.php cj:transactions"
  end

  cron "pepperjam_transactions" do
    hour "6"
    minute "30"
    command "cd #{deploy[:deploy_to]}/current && php .bin/console.php pepperjam:transactions"
  end

  cron "pepperjam_transactions_update" do
    hour "6"
    minute "35"
    command "cd #{deploy[:deploy_to]}/current && php .bin/console.php pepperjam:transactions --update"
  end

  cron "shareasale_transactions" do
    hour "6"
    minute "40"
    command "cd #{deploy[:deploy_to]}/current && php .bin/console.php shareasale:transactions"
  end

  cron "shareasale_transactions_update" do
    hour "6"
    minute "45"
    command "cd #{deploy[:deploy_to]}/current && php .bin/console.php shareasale:transactions --update"
  end

  cron "referral_calculate" do
    hour "7"
    minute "0"
    command "cd #{deploy[:deploy_to]}/current && php .bin/console.php beesavy:referral:calculate --exclude=pbbmedia@gmail.com"
  end
end
