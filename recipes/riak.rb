#
# Cookbook Name:: repos
# Recipe:: riak
#

case node['platform']
  when "debian"
    apt_repository "riak" do
      uri "http://apt.basho.com"
      distribution node['lsb']['codename']
      components ["main"]
      key "http://apt.basho.com/gpg/basho.apt.key"
      deb_src false
    end
end