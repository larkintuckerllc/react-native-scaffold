set -e
set -x

if [ "$TRAVIS_EVENT_TYPE" = "pull_request" ]
then
  CHANNEL=$TRAVIS_PULL_REQUEST
else
  if [ "$TRAVIS_BRANCH" = "master" ]
  then
    CHANNEL=`cat package.json | ./node_modules/.bin/json version`
  else
    CHANNEL=$TRAVIS_BRANCH
  fi
fi
export CHANNEL=$CHANNEL
expo publish --release-channel $CHANNEL
sh release-channel-patch.sh
cd android && ./gradlew assembleRelease && cd ..
node deploy.js
