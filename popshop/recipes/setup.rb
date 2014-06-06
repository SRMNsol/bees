# Add a PPA for PHP 5.4
execute "add-apt-repository ppa:ondrej/php5" do
  user "root"
end

# Update the APT system
execute "apt-get update" do
  user "root"
end

# Upgrade PHP (as well as other things)
execute "apt-get upgrade -y" do
  user "root"
end
