# autogit
This is a project with scripts to automatically manage git repositories

To run the scripts:
1) Create a new folder under your local and save all the files in this folder there
2) Go to the newly created folder and open 'input.sh' for "edit"
3) Change the values inside 'input.sh' as follows:
    -branch --> This is the branch you are trying to use. Type HEAD if not branch is used
    -branchMessage --> Message used at the time you create a new branch
    -tag --> Tag to be used
    -tagMessage --> Message use at the time you create a new tag
    -locRepo --> is the location where the new local repository should be located
    -projects --> List of projects to be considered
4) Run 'autoGitPlus.sh' through Git Bash, by changing the directory to where 'autoGitPlus.sh' is saved
5) follow the instructions provided by the script
