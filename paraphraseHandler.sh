######## Authors ###########################
# Odilon K. Senyana                        #
#                                          #
#                                          #
############################################

# used for confirmation of action from the user
echo "Did you setup a paraphrase when you generated your ssh keys? If yes enter 'y', and 'n' otherwise"
read paraphrase
if [ $paraphrase == 'y' ]; then
	ssh-keygen -p
fi 