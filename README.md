BeeSavy Chef Cookbooks
======================

This repository contains various Chef cookbooks for the PopShops BeeSavy project.  Most of them
are used to update the ancient version of Ubuntu on OpsWorks.  These can be removed if/when OpsWorks
gets an updated version of Ubuntu.

The ```popshop::deploy recipe``` is used to install the PHP Composer and setup some YAML config files
so it probably needs to remain.

## JSON Attributes

Full JSON attributes template for Opsworks

```json
{
  "deploy": {
    "beesavy": {
      "database": {
        "host": "DATABASE_HOST",
        "database": "DATABASE_NAME",
        "username": "DATABASE_USER",
        "password": "DATABASE_PASSWORD"
      },
      "memcached": {
        "host": "MEMCACHE_HOST",
        "port": 11211
      },
      "app": {
        "debug": "true",
        "download": {
          "from": "6 months ago",
          "to": "yesterday"
        },
        "smtp": {
          "password": "SMTP_PASSWORD"
        },
        "storage": {
          "bucket": "s3://static-dev.beesavy.com",
          "url": "http://s3.amazonaws.com/static-dev.beesavy.com"
        },
        "rakuten_oauth2": {
          "username": "RAKUTEN_USERNAME",
          "password": "RAKUTEN_PASSWORD",
          "client_id": "CLIENT_ID",
          "client_secret": "CLIENT_SECRET",
          "scope": "SID"
        },
        "cache_namespace": "prod_"
      },
      "symlink_before_migrate": {
        "config/local.yml": "config/local.yml"
      }
    }
  }
}
```