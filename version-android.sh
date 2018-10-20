set -e
set -x

FILE_NAME="android/app/build.gradle"
PACKAGE_VERSION=`cat package.json | ./node_modules/.bin/json version`
VERSION_CODE=`grep versionCode ${FILE_NAME} | sed -E "s/[ ]+versionCode //"`
BUMPED_VERSION_CODE=$(($VERSION_CODE + 1))
sed -i ".bak" -E "s/versionCode ${VERSION_CODE}/versionCode ${BUMPED_VERSION_CODE}/" $FILE_NAME
sed -i ".bak" -E "s/versionName '[^']+'/versionName '${PACKAGE_VERSION}'/" $FILE_NAME
git add $FILE_NAME
rm ${FILE_NAME}.bak
