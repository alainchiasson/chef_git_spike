#
# Cookbook Name:: chef_git_spike
# Recipe:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

# update Ubuntu package index
include_recipe 'apt'

# Install git from packages
package 'git'

# Create the directory where all this will be installed
directory '/var/git_test' do
	owner 'root'
	group 'root'
	mode '0755'
	action :create
end


# First try 
git '/var/git_test/master' do
	repository 'git@github.com:alainchiasson/chef_git_spike.git'
	reference 'master'
	action :sync
end

