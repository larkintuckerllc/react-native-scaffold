set -e
set -x

VERSION=`cat package.json | ./node_modules/.bin/json version`
if [ "$TRAVIS_BRANCH" = "release" ]
then
    CHANNEL=release
else
    CHANNEL=$VERSION
fi
export CHANNEL;