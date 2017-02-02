RED='\e[7;31m' # Red color
GREEN='\e[0;32m' # Green color
NC='\e[0m' # No color

if [ "$#" -lt 1 ]; then
	echo "Help: repoforall <pattern>"
	echo "      It will loop all repo. and execute <pattern>"
	exit
fi

# repo list
REPOLIST=`cat package.json | awk '{print $1}' | grep 'git@gitlab' | sed 's/"git@gitlab.dc.zyxel.com.tw:wlan-ap\///' | sed 's/.git"//'`

# loop repo list
for repo in $REPOLIST
do
	cd $repo
	echo -e ${GREEN}"Entering repo" $repo".git"${NC}
	$*

	if [ `echo $?` != 0 ]; then
		break
	fi

	cd ..
done

