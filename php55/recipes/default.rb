# Clean up "old" packages
package 'php' do
  action :remove
end
package 'php-xml' do
  action :remove
end
package 'php-process' do
  action :remove
end
package 'php-common' do
  action :remove
end
package 'php-cli' do
  action :remove
end
package 'httpd-tools' do
  action :remove
end
package 'httpd' do
  action :remove
end

# Install PHP 5.5
package 'php55' do
  case node[:platform]
  when 'centos','redhat','fedora','amazon'
    package_name 'php55'
  when 'debian','ubuntu'
    package_name 'php'
  end
  action :install
end
