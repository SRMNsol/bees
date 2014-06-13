BeeSavy Chef Cookbooks
====

This repository contains various Chef cookbooks for the PopShops BeeSavy project.  Most of them
are used to update the ancient version of Ubuntu on OpsWorks.  These can be removed if/when OpsWorks
gets an updated version of Ubuntu.

The ```popshop::deploy recipe``` is used to install the PHP Composer and setup some YAML config files
so it probably needs to remain.