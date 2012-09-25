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

case node['platform']
when "debian","ubuntu"
  apt_repository "opscode-chef" do
    uri "http://apt.opscode.com/"
    distribution "#{node['lsb']['codename']}-0.10"
    components ["main"]
    keyserver "keys.gnupg.net"
    key "83EF826A"
    deb_src false
  end
end
