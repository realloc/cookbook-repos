#
# Cookbook Name:: repos
# Recipe:: deb-multimedia
#

case node['platform']
when "debian"
  apt_repository "deb-multimedia" do
    uri "http://www.deb-multimedia.org"
    distribution "#{node['lsb']['codename']}"
    components ["main", "non-free"]
    deb_src false
  end

  package "deb-multimedia-keyring" do
    options "--allow-unauthenticated"
  end
end
