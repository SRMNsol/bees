###
# This is the place to override the mod_php5_apache2 cookbook's default attributes.
###

normal[:mod_php5_apache2][:packages] = [
  'php5-xsl',
  'php5-curl',
  'php5-xmlrpc',
  'php5-sqlite',
  'php5-dev',
  'php5-gd',
  'php5-cli',
  'php5-mysql',
  'php5-mcrypt',
  'php5-memcache',
  'php-apc',
  'php5-intl'
]
