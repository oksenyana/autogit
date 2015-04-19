######## Authors ###########################
# Odilon K. Senyana                        #
#                                          #
#                                          #
############################################

# used for confirmation of action from the user
read confirm
if [ $confirm != 'y' ]; then
	echo "Good Bye!!!"
	exit 1
fi 