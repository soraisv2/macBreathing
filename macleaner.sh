#!/bin/sh
echo "\n\x1B[34m -- github.com/soraisv2 - mac cleaner script -- \x1B[0m\n"
cd $HOME/Library/Caches
yesAnswer="yes"
noAnswer="no"
cachesPath="$HOME/Library/Caches"
preferencesPath="$HOME/Library/Preferences"
currentPath=`pwd`

programDelete()
{
    echo "\x1B[32m>\x1B[0m\x1B[1mRemove all file and directory present in $preferencesPath and $cachesPath directory ? (yes/no)\x1B[0m"
    while read line2
    do
	if [[ $line2 = $yesAnswer ]]
	then
	    #open $cachesPath
	    sudo rm -R $cachesPath
	    #close $cachesPath
	    echo "\x1B[32m>\x1B[0m\x1B[32mAll file and directory in $cachesPath have been successfully removed\x1B[0m"
	    #open $preferencesPath
	    sudo rm -Rf $preferencesPath
	    #close $preferencesPath
	    echo "\x1B[32m>\x1B[0m\x1B[32mAll file and directory in $preferencesPath have been successfully removed\x1B[0m"
	    break
	else
	    echo "\x1B[32m>\x1B[0mProgram exit without any file deleted"
	    break
	fi
    done
}

securityCheck()
{
    echo "\x1B[32m>\x1B[0m\x1B[1mDo you want to see whitch file are present in the directory \"Caches and Preferences\" ? (yes/no)\x1B[0m"
    while read line
    do
        if [[ $line = $yesAnswer ]]
        then
	    echo "\x1B[32mFile and directory present in $cachesPath\x1B[0m"
	    ls -la $cachesPath
	    echo "\x1B[32mFile and directory present in $preferencesPath\x1B[0m"
	    ls -la $preferencesPath
	    programDelete
	    break
	else
	    programDelete
	    break
	fi
    done
    echo "\n\x1B[32m>\x1B[0mEnd Of Program, envoy your healthy mac :)\n"
    exit 0
}
securityCheck
