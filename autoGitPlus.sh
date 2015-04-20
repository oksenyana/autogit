######## Authors ###########################
# Odilon K. Senyana                        #
#                                          #
#                                          #
############################################

source passphraseHandler.sh
source input.sh

echo "-Enter 1 to clone all projects"
echo "-Enter 2 to pull [update] all"
echo "-Enter 3 to tag all projects" 
echo "-Enter 4 to create branches from base"
echo "-Enter 5 to create branches from tagged repo"
echo "-Enter 6 to delete a specific tag on all projects"
echo "-Enter 7 to delete branches"
echo "-Enter 8 to push branches to remote repositories"
echo "-Enter 9 to switch all projects from one branch to another one"
echo "-Enter 10 to switch all project to a specific tag"
echo "-Enter 11 to push tags to remote repositories"
echo "-Enter 12 to show the overall status for files on every project"
echo "-Enter 13 to campare branches or repositories"
echo "-Enter 14 to push deleted tags to REMOTE repository. Note: In this case, number 6 needs to be done first"
echo "-Enter 15 to push deleted branches to REMOTE repository. Note: In this case, number 7 needs to be done first"
echo "-Enter 16 to delete multiple branches."
echo "-Enter 17 to push deleted multiple branches to REMOTE repository. Note: In this case, number 16 needs to be done first"


read choice

case $choice in
    1)
        echo "You have chosen to clone all projects for $branch. Enter 'y' to confirm or 'n' to cancel."
		source util.sh;;
    2)
        echo "You have chosen to pull(update) all projects. Enter 'y' to confirm or 'n' to cancel."
		source util.sh
        break;;
    3)
        echo "You have chosen to tag all projects with tag name $newTag. Enter 'y' to confirm or 'n' to cancel."
		source util.sh
        break;;
    4)
        echo "You have chosen to create branches using current base. "
		echo "The name of the new branch will be $newBranch"
		echo "Enter 'y' to confirm or 'n' to cancel."
		source util.sh
        break;;
    5)
        echo "You have chosen to create branches using tag $tag."
		echo "The name of the new branch will be $newBranch."
		echo "Enter 'y' to confirm or 'n' to cancel."
		source util.sh
        break;;		
    6)
        echo "You have chosen to delete tag $delTag for all projects. Enter 'y' to confirm or 'n' to cancel."
		source util.sh
        break;;	
	7)
		echo "You have chosen to delete branch $delBranch for all projects. Enter 'y' to confirm or 'n' to cancel."
		echo "If you get an error that it can't be deleted, switch to that branch option 9 and then back to 'master' branch and try this option afterwards."
		source util.sh
		break;;	
    8)
        echo "You have chosen to push branches with name $newBranch to remote repositories."
		echo "Enter 'y' to confirm or 'n' to cancel."
		source util.sh
        break;;		
    9)
        echo "You have chosen to switch all projects from current branch to branch $branchToSwitchTo."
		echo "Enter 'y' to confirm or 'n' to cancel."
		source util.sh
        break;;		
    10)
        echo "You have chosen to switch all project to tag with name $tagToSwitchTo. Enter 'y' to confirm or 'n' to cancel."
		source util.sh
        break;;	
    11)
        echo "You have chosen to push tags with name $tag to remote repositories. Enter 'y' to confirm or 'n' to cancel."
		source util.sh
        break;;		
    12)
        echo "You have chosen to show status of files on all projects. Enter 'y' to confirm or 'n' to cancel."
		source util.sh
        break;;		
    13)
        echo "You have chosen to campare $toCompare1 against $toCompare2 for all projects."
		echo "Enter 'y' to confirm or 'n' to cancel."
		source util.sh
        break;;		
    14)
        echo "You have chosen to push deleted tag $delTag for all projects to REMOTE. Enter 'y' to confirm or 'n' to cancel."
		echo "If you get an error of the form [hook declined], please check that you have rw+ privileges on REMOTE server."
		source util.sh
        break;;
    15)
        echo "You have chosen to push deleted branch $delBranch for all projects to REMOTE. Enter 'y' to confirm or 'n' to cancel."
		echo "If you get an error of the form [hook declined], please check that you have rw+ privileges on REMOTE server."
		source util.sh
        break;;	
	16) 
		echo "You have chosen to delete multiple branches for all projects. Enter 'y' to confirm or 'n' to cancel."
		source util.sh
		break;;
	17)
        echo "You have chosen to push deleted multiple branches for all projects to REMOTE. Enter 'y' to confirm or 'n' to cancel."
		echo "If you get an error of the form [hook declined], please check that you have rw+ privileges on REMOTE server."
		source util.sh
        break;;	
	*) 
		echo "Wrong input. Please try again"
		break;;
		
esac

case $choice in
    1)
		echo "Cloning all projects for $branch..."
		for proj in "${projects[@]}"
		do
			if [ $branch == 'h' ]; then #using Head
				git clone https://github.com/oksenyana/$proj.git  $locRepo/$proj;
			else 
				git clone -b $branch https://github.com/oksenyana/$proj.git  $locRepo/$proj;
			fi
		done;;
    2)
		echo "Pulling (updating) all projects..."
		for proj in "${projects[@]}"
		do
			cd $locRepo/$proj
			git pull git@heroku.com:$proj.git;
			git pull https://github.com/oksenyana/$proj.git;
			cd $locRepo
		done;;
	3) 
		echo "Tagging all projects..."
		for proj in "${projects[@]}"
		do
			cd $locRepo/$proj
			git tag -a $newTag -m $newTagMessage;
			cd $locRepo
		done;;	
	
	4)cd 
		echo "Creating branches using base"
		for proj in "${projects[@]}"
		do
			cd $locRepo/$proj
			git checkout -b $newBranch
			cd $locRepo
		done;;
	
	5)
		echo "Creating branches using tag $tag"
		for proj in "${projects[@]}"
		do
			cd $locRepo/$proj
			git checkout $tag
			git checkout -b $newBranch
			cd $locRepo
		done;;
	6) 
		echo "Deleting tag $delTag on all projects"
		for proj in "${projects[@]}"
		do
			cd $locRepo/$proj
			git tag -d $delTag
			cd $locRepo
		done;;
	7) 
		echo "Deleting branch $delBranch on all projects"
		for proj in "${projects[@]}"
		do
			cd $locRepo/$proj
			git checkout $delBranch  # switch to the branch that needs deleted first
			git checkout master		 # switch to the head branch, which will be used to delete the branch above
			git branch -D $delBranch
			cd $locRepo
		done;;
		
	8) 
	 	echo "Pushing branches to remote repositories..."
		for proj in "${projects[@]}"
		do
			cd $locRepo/$proj
			git push origin $newBranch
			cd $locRepo
		done;;
		
	9) 
		echo " Switching all projects from current branch to branch $branchToSwitchTo"
		for proj in "${projects[@]}"
		do
			cd $locRepo/$proj
			git checkout $branchToSwitchTo
			cd $locRepo
		done;;
	10) 
		echo "Switching all projects to tag $tagToSwitchTo"
		for proj in "${projects[@]}"
		do
			cd $locRepo/$proj
			git checkout $tagToSwitchTo
			cd $locRepo
		done;;
	11) 
	 	echo "Pushing tags to remote repositories..."
		for proj in "${projects[@]}"
		do
			cd $locRepo/$proj
			git push origin $tag
			cd $locRepo
		done;;
	12) 
	 	echo "Showing status for all files on all projects..."
		for proj in "${projects[@]}"
		do
			cd $locRepo/$proj
			git status
			cd $locRepo
		done;;
	13) 
	 	echo "Comparing $toCompare1 against $toCompare2 for all projects..."
		for proj in "${projects[@]}"
		do
			cd $locRepo/$proj
			git diff $toCompare1 $toCompare2
			cd $locRepo
		done;;
	14) 
	 	echo "Pushing Deleted tags $delTag on REMOTE..."
		for proj in "${projects[@]}"
		do
			cd $locRepo/$proj
			git push origin :$delTag
			cd $locRepo
		done;;
		
	15) 
	 	echo "Pushing Deleted branches $delBranch on REMOTE..."
		
		for proj in "${projects[@]}"
		do
			cd $locRepo/$proj
			git push origin :$delBranch
			cd $locRepo
		done;;
		
	16)
		echo "Deleting multiple branches..."
		for proj in "${projects[@]}"
		do
			cd $locRepo/$proj
			for bch in "${multiBranches[@]}"
			do
				git checkout $bch
				git checkout master
				git branch -D $bch
			done;
			cd $locRepo
		done;;
		
	17) 
	 	echo "Pushing Deleted multiple branches on REMOTE..."		
		for proj in "${projects[@]}"
		do
			cd $locRepo/$proj
			for bch in "${multiBranches[@]}"
			do
				git push origin :$bch
			done;
			cd $locRepo
		done;;
	# merging from branch to branch:
		#only 2 commands needed 
		# make changes in the new branch 
		# commit them
		# pull and update loc repository
		#git merge branchX where branchX is the branch you want to merge from into the current branch
		#and then use a conditional check, if there are merge issues 
		#go to 
		#git mergetool 
		#and then merge using vimdiff or any other plugged in edittor 
		#switch back to main branch and push it to remote
esac




