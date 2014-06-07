#
#  Modify the default OpsWorks deploy for Ubuntu 12.04.
#  When OpsWorks updates to Ubuntu 14.x then this can probably go away.
#

node[:deploy].each do |application, deploy|
  if deploy[:application_type] != 'php'
    Chef::Log.debug("Skipping deploy::php application #{application} as it is not an PHP app")
    next
  end

  # Add a PPA for PHP 5.4
  execute "add-apt-repository ppa:ondrej/php5-oldstable" do
    user "root"
  end

  # Update the APT system
  execute "aptitude update" do
    user "root"
  end

  # Upgrade PHP (as well as other things)
  # %w{apache2 apache2-mpm-prefork apache2.2-bin libapache2-mod-php5 php-pear php5 php5-cli php5-common php5-curl php5-dev php5-fpm php5-gd php5-mcrypt php5-memcache php5-mysql php5-sqlite php5-xmlrpc php5-xsl}.each do |pkg|
  %w{libicu-dev php5 php5-intl}.each do |pkg|
    package pkg do
      action :upgrade
    end
  end

  # Remove the PHP SASL module
  file "/etc/php5/conf.d/sasl.ini" do
    action :delete
  end
end