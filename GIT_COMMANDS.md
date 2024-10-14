# Basic Commands
    git clone https://github.com/Wyatt5150/Dog-Tinder-Codestuff.git
    
Run this command wherever you want the repository to be downloaded. The repository will be downloaded into a folder called "Dog-Tinder-Codestuff". You should only need to run this once throughout the project.

    git pull
    
Updates the repository on your computer to contain changes made to the repository on Github.

    git status
    
Displays which files have been modified since your last commit.

    git add directory
    
Stages changes for commit. If directory is a folder, all files in that folder will be staged for commit. To stage all changes, directory = .

Think of this like putting papers into an envelope.

    git reset directory
    
Unstages the specified directory for commit. If you do not specifiy a directory, all changes will be unstaged.

Think of this as removing papers into an envelope.

    git commit -m 'message'
    
Commits the staged changes to the branch. message should contain a brief description of the changes you made. You can also just leave message blank but that's bad practice.

Think of this as sealing an envelope.

    git push
    
Sends committed changes to Github.

Think of this as sending the envolope.

    git checkout -b branch_name
    
Creates a branch called branch_name and changes your working directory to that branch. You can also switch to an existing branch by removing -b from the command.
