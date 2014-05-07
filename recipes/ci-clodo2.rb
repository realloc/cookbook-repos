#
# Cookbook Name:: repos
# Recipe:: ci-clodo2
#

case node['platform']
  when "debian"
    apt_repository "ci-clodo2" do
      uri "http://ci.clodo.ru/release/clodo2"
      distribution "clodo2"
      components ["main"]
      deb_src true
    end
end