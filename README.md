


# rm -Rf .git                                       
// Remove previous git files if appears

# git init

# git add .                               
// from local repository adding all files

# git config --global user.email "vitoswow90@gmail.com"
# git config --global user.name "vitoswow90"
//
# git commit -m "1"                      
// Commits the tracked changes and prepares them to be pushed to a remote repository. 
To remove this commit and modify the file use 'git reset --soft HEAD~1' and commit and add the  file again.

# git remote remove origin

# git remote add origin "*remote repository URL*"     
// Sets the new remote

# git remote -v                                     
// Verifies the new remote URL

# git push --force origin master                    
// Pushes the changes in your local repository up to the remote repository you specified as the origin