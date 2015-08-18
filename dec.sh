#!/bin/bash

if [ $# -ne 3 ]
then
	echo "Usage: ./dec.sh [pass] [iv] [dirwalk]"
else
	pass=$1
	iv=$2
	dirwalk=$3
	files=`find $dirwalk -iname "*.lol"`	
	for f in $files
	do
		outfile=`echo $f | sed 's/.lol//'`
		echo "Decrypting ${f}, outfile is ${outfile}"
		`openssl enc -d -aes-256-cbc -a -in $f -iv $iv -pass pass:$pass -out $outfile`
		if [ $? -eq 0 ] 
		then
			rm $f 
		fi
	done
fi
