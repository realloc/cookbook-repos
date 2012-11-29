Description
===========
Manages repositories for your platform. Currently only Debian-based
are supported.

Requirements
============

Attributes
==========
* node['repos'] - List of repositories to be activated by default
  recipe.

Usage
=====
Each repository is defined in a separate recipe.
You may either add it to run_list or to 'repos' attribute.

Example use of run_list:

    run_list("recipe[repos::percona]")


Example use of 'repos' attribute

    override_attributes( "repos" => ['jenkins-debian-glue'] )

