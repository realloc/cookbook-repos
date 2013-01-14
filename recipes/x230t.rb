#
# Cookbook Name:: repos
# Recipe:: x230t
#

case node['platform']
when "debian"
  apt_repository "x230t" do
    uri "http://realloc.spb.ru/debian"
    distribution "x230t"
    components ["main"]
    key "http://realloc.spb.ru/debian/pkg-pubkey.txt"
    deb_src true
  end
end
