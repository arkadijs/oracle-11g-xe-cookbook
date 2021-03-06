#
# Cookbook Name:: oracle-11g-xe
# Recipe:: default
#
# Author:: Mike Ensor (<mike.ensor@acquitygroup.com>)
# Author:: Vince Montalbano (<vince.montalbano@acquitygroup.com>)
# 
# Copyright 2013, Acquity Group
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
#

ruby_block 'get-hostname' do
  block do
    node.automatic['oracle-11g-xe'][:hostname] = `hostname`.delete("\n") # remove line ending
  end
  action :run
end

ruby_block 'get-host-only-ip-address' do
  block do
    node.automatic['oracle-11g-xe'][:host_only_ip] = `ifconfig #{node['oracle-11g-xe'][:host_only_interface]} | grep "inet addr" | awk -F: '{print $2}' | awk '{print $1}'`
  end
  action :run
end


include_recipe "oracle-11g-xe::prettify"

include_recipe "oracle-11g-xe::install"
include_recipe "oracle-11g-xe::configure"
include_recipe "oracle-11g-xe::remote_access"