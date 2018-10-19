set -e
set -x

sh release-channel-patch.sh
cd android && ./gradlew assembleRelease && cd ..
if [ "$TRAVIS_EVENT_TYPE" = "pull_request" ]
then
  node android-aws.js
else
  if [ "$TRAVIS_BRANCH" = "develop-native" ]
  then
    node android-aws.js
  else
    sh android-ha.sh
  fi
fi
