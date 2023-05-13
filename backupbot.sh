#!bin/bash

#this stores the path of directory passed as argument 
directory=$1
# directory= C:/Users/WELCOME/Desktop/bashtest
echo $directory
for i in $directory/*;
do
	#this extracts file name from path
	file=$(basename $i)
	
	#this extracts file name without extension
	filename="${file%%.*}"

	#this extracts extension of file
	extension="${file##*.}"

	#this stores timestamp
	timestamp="$(date +%s)"
	
	#this checks that if i is directory or  a file
	if [  -d $i ]
	then 
		#if i is directory then backupfilename store folder name
		backupfilename=$filename$timestamp
	else
		#if i is file the backupfilename stores file name with its extension
		backupfilename=$filename$timestamp.$extension
	fi
	
	#It makes copy of file if given directory
	cp  -r $i $directory/$backupfilename
	
	
done


