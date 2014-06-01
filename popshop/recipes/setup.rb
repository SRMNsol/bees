# Add a PPA for PHP 5.4
execute "add-apt-repository ppa:ondrej/php5-oldstable" do
  user "root"
end

# Update the APT system
execute "apt-get update" do
  user "root"
end

# Upgrade to PHP 5.4
execute "apt-get upgrade" do
  user "root"
end
