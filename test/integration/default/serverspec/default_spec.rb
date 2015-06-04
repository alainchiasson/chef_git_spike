require 'spec_helper'

describe 'chef_git_spike::default' do
  # Serverspec examples can be found at
  # http://serverspec.org/resource_types.html

  context 'using resource master' do

  	describe file('/var/git_test/master/description.txt') do
  		it { should be_a_file }
  		its(:content) { should match /master/ }
  	end

  end

  context 'using resource develop' do

  	describe file('/var/git_test/develop/description.txt') do
  		it { should be_a_file }
  		its(:content) { should match /develop/ }
  	end

  end

  context 'using resource develop and checkout_branch' do

  	describe file ('/var/git_test/develop_to_local/description.txt') do 
  		it { should be_a_file }
  		its(:content) { should match /develop/ }
  	end

  	# Need to figure out how to "query" the local git repo for the name of the branch

  	
end
