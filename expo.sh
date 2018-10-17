set -e
set -x

if [ "$TRAVIS_EVENT_TYPE" = "pull_request" ]
then
  CHANNEL=$TRAVIS_PULL_REQUEST
else
  CHANNEL=$TRAVIS_BRANCH
fi
expo publish --release-channel $CHANNEL
