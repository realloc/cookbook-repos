#
# Cookbook Name:: repos
# Recipe:: backports
#

case node['platform']
when "debian"
  package "debian-keyring"
  
  apt_repository "debian-backports" do
    uri "http://backports.debian.org/debian-backports"
    distribution "#{node['lsb']['codename']}-backports"
    components ["main", "contrib", "non-free"]
    deb_src true
  end
end
