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

# Get the master branch - description will have "master" - but branch will be deploy
git '/var/git_test/master' do
	repository 'https://github.com/alainchiasson/chef_git_spike'
	reference 'master'
	action :sync
end

# Get the develop branch - description will have "develop" - but branch will be deploy
git '/var/git_test/develop' do
	repository 'https://github.com/alainchiasson/chef_git_spike'
	reference 'develop'
	action :sync
end

# Get the develop branch - description will have "develop" - but branch will be local_name
git '/var/git_test/develop_to_local' do
	repository 'https://github.com/alainchiasson/chef_git_spike'
	reference 'develop'
	checkout_branch 'local_name'
	action :sync
end

# Get the master branch - description will have "master" - but branch will be deploy
git '/var/git_test/tag_1.0.0' do
	repository 'https://github.com/alainchiasson/chef_git_spike'
	reference '1.0.0'
	action :sync
end


# # Get a Branch that does not exist - thi s will fail !!
# git '/var/git_test/crap' do
# 	repository 'https://github.com/alainchiasson/chef_git_spike'
# 	reference 'crap'
# 	action :sync
# end


