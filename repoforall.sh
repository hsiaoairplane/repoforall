CYAN='\033[0;36m'
NC='\033[0m'

if [ "$#" -lt 1 ]; then
	echo "help: repoforall <pattern>"
	echo "      It will loop all repo. and execute <pattern>"
	exit
fi

# repo list
REPOLIST=`cat package.json | awk '{print $1}' | grep 'git@gitlab' | sed 's/"git@gitlab.dc.zyxel.com.tw:wlan-ap\///' | sed 's/.git"//'`

# loop repo list
echo ============================== START ========================================
for repo in $REPOLIST
do
	cd $repo
	echo -e ${CYAN}"Entering repo" $repo".git"${NC}
	$*
	cd ..
done
echo =============================== END ========================================

