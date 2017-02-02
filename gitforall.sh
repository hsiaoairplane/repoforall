CYAN='\033[0;36m'
NC='\033[0m'

if [ "$#" -lt 1 ]; then
	echo "help: gitforall <pattern>"
	echo "      It will loop all repo. and execute <pattern>"
	exit
fi

# repo list
REPO_LIST=`cat package.json | awk '{print $1}' | grep 'git@gitlab' | sed 's/"git@gitlab.dc.zyxel.com.tw:wlan-ap\///' | sed 's/.git"//'`

# loop repo list
echo ============================== START ========================================
for repo in $REPO_LIST
do
	cd $repo
	echo -e ${CYAN}"#######" $repo "#######"${NC}
	$*
	cd ..
done
echo =============================== END ========================================

