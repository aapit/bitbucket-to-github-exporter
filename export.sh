# author: David Spreekmeester <david@grrr.nl>
# github.com/aapit

BBNAME=$1
GHNAME=$2
REPO=$3
DESC=$4
BASE="$HOME/Sites/-bitbucket-to-github-tmp/"

function ensureMandatoryVars {
    if [ "$BBNAME" = "" ]; then
        echo "Provide Bitbucket username or organization that owns this repo."
        exit;
    fi
    if [ "$GHNAME" = "" ]; then
        echo "Provide Github username or organization that will own this repo."
        exit;
    fi
    if [ "$REPO" = "" ]; then
        echo "Provide repository name."
        exit;
    fi
}

function ensureBaseDir {
    mkdir -p $BASE
}

function cloneBitBucketRepo {
    git clone --mirror git@bitbucket.org:$BBNAME/$REPO $BASE$REPO
}

function createGithubRepo {
    hub create -p $GHNAME/$REPO -d "$DESC"
}

function exitIfRepoDirExists {
    if [ -d "$BASE$REPO" ]; then
        echo "Directory already exists."
        exit;
    fi
}

function exitIfRepoDirNotExist {
    if [ ! -d "$BASE$REPO" ]; then
        echo "Directory doesn't exist, the clone from Bitbucket apparently failed."
        exit;
    fi
}

function pushToGithub {
    git remote set-url --push origin git@github.com:$GHNAME/$REPO
    git push --mirror
}

ensureMandatoryVars
ensureBaseDir
exitIfRepoDirExists
cloneBitBucketRepo
exitIfRepoDirNotExist
cd $BASE$REPO
createGithubRepo
pushToGithub
cd -
