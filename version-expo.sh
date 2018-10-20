set -e
set -x

FILE_NAME="app.json"
PACKAGE_VERSION=`cat package.json | ./node_modules/.bin/json version`
json -I -f $FILE_NAME -e "this.expo.version=\"${PACKAGE_VERSION}\""
git add $FILE_NAME
