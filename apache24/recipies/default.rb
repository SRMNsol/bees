# Install Apache 2.4
package 'apache2' do
  case node[:platform]
  when 'centos','redhat','fedora','amazon'
    package_name 'httpd24'
  when 'debian','ubuntu'
    package_name 'apache2'
  end
  action :install
end
