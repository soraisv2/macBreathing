#!/bin/sh
echo "\n\x1B[34m -- Niewtone's mac cleaner script launched -- \x1B[0m\n"
cd $HOME/Library/Caches
yesAnswer="yes"
noAnswer="no"
cachesPath="$HOME/Library/Caches"
preferencesPath="$HOME/Library/Preferences"
currentPath=`pwd`

programDelete()
{
    echo "\x1B[32m>\x1B[0m\x1B[1mRemove all file and directory present in $(preferencesPath) and $(cachesPath) directory ? (yes/no)\x1B[0m"
    while read line2
    do
	if [[ $line2 = $yesAnswer ]]
	then
	    sudo rm -R $cachesPath
	    sudo rm -R $preferencesPath
	    echo "\x1B[32m>\x1B[0m\x1B[32mAll file and directory in \"$(pwd)\" have been successfully removed\x1B[0m"
	    break
	else
	    echo "\x1B[32m>\x1B[0mProgram exit without any file deleted"
	    break
	fi
    done
}

securityCheck()
{
    if [[ $currentPath = $cachesPath ]]
    then
	echo "\x1B[32m>\x1B[0m\x1B[32mSecurity: OK\x1B[0m"
	echo "\x1B[32m>\x1B[0m\x1B[1mDo you want to see whitch file are present in the directory \"Caches and Preferences\" ? (yes/no)\x1B[0m"
	while read line
	do
	    if [[ $line = $yesAnswer ]]
	    then
		ls -l $(cachesPath)
		ls -l $(preferencesPath)
		programDelete
		break
	    else
		programDelete
		break
	    fi
	done
	echo "\x1B[32m>\x1B[0mEnd Of Program, thanks to use it :)"
	exit 0
    else
	echo "\x1B[32m>\x1B[0m\x1B[31mSecurity activated: Bad path ==> exit program without any deleted file or directory\x1B[0m"
	exit 84
    fi
}
securityCheck
