#
# Cookbook Name:: repos
# Recipe:: debian-backports
#

repo_uri='http://cdn.debian.net/debian/'

mirrors = {
  "nsu" => "http://debian.nsu.ru/debian/",
  "yandex" => "http://mirror.yandex.ru/debian/",
  "mephi" => "http://mirror.mephi.ru/debian/"
}

if node['repos_mirrors'] &&
    node['repos_mirrors']['debian'] &&
    mirrors[ node['repos_mirrors']['debian'] ]
  repo_uri = mirrors[ node['repos_mirrors']['debian']]
end

case node['platform']
when "debian"
  apt_repository "debian-backports" do
    uri repo_uri
    distribution "#{node['lsb']['codename']}-backports"
    components ["main", "contrib", "non-free"]
    deb_src true
  end

  package "debian-keyring" do
    options "--allow-unauthenticated"
  end
end
