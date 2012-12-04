Description
===========

Manages repositories for your platform. Currently only Debian-based
distros are supported.

Requirements
============

Attributes
==========

* node['repos'] - List of repositories to be activated by default
  recipe.

Usage
=====

Each repository is defined in a separate recipe.
You may either add it directly to run_list, include from your wrapper-cookbook or use
data-driven approach and enumerate desired repos in 'repos' attribute
anywhere you want.

Example use of run_list:

    run_list("recipe[repos::percona]")

Example use of 'repos' attribute

    run_list("recipe[repos]")
    override_attributes( "repos" => ['jenkins-debian-glue', 'backports'] )
