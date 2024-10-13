# Dog-Tinder-Codestuff
Project for Human Factors of Computing Systems class

## Getting Started
### Install Git
Install git if you do not have it already https://git-scm.com/downloads. 

To see if you have git installed, run the following command in command line:

    git --version
    

If the terminal says that git is not recognized, you do not have git installed.

Once you have git installed, you will now be able to open Git Bash in a specific directory by right-clicking in that directory and selecting the "Open Git Bash here" option.

### Development

NOTE: DO NOT PUSH THINGS TO MAIN

At the top of github, you should see an "Issues" tab. Issues with the "Scene" label will tell you about specific scenes that we need to create. You can click on an issue to see more about that specific scene. In the top right, you should see a section called "Assignees". If no one is listed there and you want to work on that scene, you can click "assign yourself" to claim the scene.

When you start working on a new scene, create a new branch for that scene and develop the scene in that branch. When you are done creating that scene, open a pull request for your branch.
To create a pull request, go to github, navigate to your branch, click on the contribute button, and then click "Open pull request". 

### Basic Commands
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

