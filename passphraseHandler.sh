######## Authors ###########################
# Odilon K. Senyana                        #
#                                          #
#                                          #
############################################

# used for confirmation of action from the user
echo "Did you setup a passphrase when you generated your ssh keys? If yes enter 'y', and 'n' otherwise"
read passphrase
if [ $passphrase == 'y' ]; then
	ssh-keygen -p
fi 