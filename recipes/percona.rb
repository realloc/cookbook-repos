#
# Author:: Stanislav Bogatyrev <sb@clodo.ru>
# Cookbook Name:: repos
# Recipe:: default
#
# Copyright 2012, Clodo.ru
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# If we run on unsupported distro try the latest supported
if ["lenny","squeeze","hardy","lucid","maverick","natty","oneric","precise"].include?( node['lsb']['codename'] )
  codename = node["lsb"]["codename"]
elsif node['platform'] == "debian"
  codename = "squeeze"
elsif node['platform'] == "ubuntu"
  codename = "precise"
end

case node['platform']
when "debian","ubuntu"
  apt_repository "percona-apt" do
    uri "http://repo.percona.com/apt/"
    distribution "#{codename}"
    components ["main"]
    keyserver "keys.gnupg.net"
    key "1C4CBDCDCD2EFD2A"
    deb_src false
  end
end
