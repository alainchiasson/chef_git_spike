require 'spec_helper'

describe 'chef_git_spike::default' do
  # Serverspec examples can be found at
  # http://serverspec.org/resource_types.html

  context 'using resource master' do

  	describe file('/var/git_test/master/description.txt') do
  		it { should be_a_file }
  		its(:content) { should match /master/ }
		  its(:content) { should_not match /develop/ } 
		  its(:content) { should_not match /1.0.0/ } 		
  	end

  end

  context 'using resource develop' do

  	describe file('/var/git_test/develop/description.txt') do
  		it { should be_a_file }
  		its(:content) { should match /develop/ }
  		its(:content) { should_not match /master/ }
  		its(:content) { should_not match /1.0.0/ } 
  	end

  end

  context 'using resource develop and checkout_branch' do

  	describe file ('/var/git_test/develop_to_local/description.txt') do 
  		it { should be_a_file }
  		its(:content) { should match /develop/ }
  		its(:content) { should_not match /master/ }
  		its(:content) { should_not match /1.0.0/ } 
  	end

  	# Need to figure out how to "query" the local git repo for the name of the branch
  end

  context 'using resource 1.0.0 (tag)' do

  	describe file('/var/git_test/tag_1.0.0/description.txt') do
  		it { should be_a_file }
  		its(:content) { should match /1.0.0/ }
  		its(:content) { should match /master/ }
  		its(:content) { should_not match /develop/ }
  	end

  end

  context 'modifying the user and group paramters' do

    describe file('/home/vagrant') do
      it { should be_writable.by_user('vagrant') }
      it { should be_owned_by('vagrant')}
    end

    describe file('/home/vagrant/user/description.txt') do
      it { should be_owned_by('vagrant')}
      it { should be_a_file }
      its(:content) { should match /master/ }
      its(:content) { should_not match /develop/ } 
      its(:content) { should_not match /1.0.0/ }    
    end

  end

end
