#
# Cookbook Name:: repos
# Recipe:: default
#

node['repos'].each do |repo|
  if repo.is_a?(String) then
    include_recipe "repos::#{repo}"
  else
    case repo["type"]
    when "apt" then
      Array(repo['pre_packages']).each do |pre_pkg|
        package pre_pkg
      end
      apt_repository repo["name"] do
        %w{uri distribution components arch deb_src
           keyserver key cookbook cache_rebuild ignore_failure}.each do |attr|
          send(attr, repo[attr])  if repo[attr]
        end
      end
      if repo['pin_priority'] then
        apt_preference repo["name"] do
          glob '*'
          pin "release a=#{repo["name"]}"
          pin_priority repo['pin_priority']
        end
      end
      Array(repo['preferences']).each do |pref|
        Array(pref['packages']).each do |pkg|
          apt_preference "#{repo['name']}-#{pkg}" do
            package_name pkg
            pin "release a=#{repo["name"]}"
            pin_priority pref['pin_priority']
          end
        end
      end
    end
  end
end
