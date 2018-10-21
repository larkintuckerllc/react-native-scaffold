set -e
set -x

if [ "$TRAVIS_BRANCH" = "master" ]
then
  RELEASE_TYPE=0
else
  RELEASE_TYPE=2
fi
SRC_FILE_NAME="android/app/build/outputs/apk/prodMinSdkProdKernel/release/app-prodMinSdk-prodKernel-release.apk"
curl \
   -H "X-HockeyAppToken: ${HOCKEY_APP_TOKEN}" \
   -F "ipa=@${SRC_FILE_NAME}" \
   -F "notify=2" \
   -F "status=2" \
   -F "release_type=${RELEASE_TYPE}" \
   https://rink.hockeyapp.net/api/2/apps/upload

