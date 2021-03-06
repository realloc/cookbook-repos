#
# Cookbook Name:: repos
# Recipe:: kitchen-pkg
#

case node['platform']
when "debian"
  apt_repository "kitchen-pkg" do
    uri node["repo"]["kitchen-pkg"]["url"]
    distribution "/"
    deb_src false
  end
end

apt_preference "kitchen-pkg" do
  glob "*"
  pin node["repo"]["kitchen-pkg"]["pin"]
  pin_priority "1001"
end


