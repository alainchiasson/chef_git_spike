# chef_git_spike

This cookbook / test machine is to be used to validate various configurations of the git chef resource. While the documetation is addequate, I needed some concrete examples.

# Using 

While the cookbook is pretty simple, it works in conjuction with the git repository and the structure of the git repository. I'm still not 100% sure this will work the way I expect it to. I may start using a seperate git repsository to download.

# Tests done

As part of this - the structure of this giot repo is as important to the chef scripts that are being run. Currently what is being demostrated is :

- Synchronizing the master branch 
- Synchronizing a different branch
- Synchronizing the master branch, but changing the local branch name
- Synchronizing a tagged commit point

For most of these - the file description.txt is changed to reflect the expected results, and tehre is a coresponding serverspec test to show that all is ok.

_note: I have not figured out how to verify the current git branch in rspec._

# Modifying 

If there is a scenario you wish to demonstrate, fork this repo. All modifications should be made in master - the description file should match what you are trying to prove ( see tag 1.0.0 or branch develop ). 

Have fun and I hope this helps.

