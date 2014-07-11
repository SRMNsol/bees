###
# This is the place to override the mod_php5_apache2 cookbook's default attributes.
###

normal[:mod_php5_apache2][:packages] = [
                                        'php5-xsl',
                                        'php5-curl',
                                        'php5-xmlrpc',
                                        'php5-gd',
                                        'php5-cli',
                                        'php5-mysql',
                                        'php5-mcrypt',
                                        'php5-memcache',
                                        'php-pear',
                                        'php-xml-parser',
                                        'php-mail-mime',
                                        'php-html-common',
                                        'php-apc',
                                        'php5-intl' ]
