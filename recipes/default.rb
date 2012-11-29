#
# Cookbook Name:: repos
# Recipe:: default
#

node['repos'].each do |repo|
  include_recipe "repos::#{repo}"
end
