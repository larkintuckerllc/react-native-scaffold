set -e
set -x

FILE_NAME="app.json"
PACKAGE_VERSION=`./node_modules/.bin/json -f package.json version`
./node_modules/.bin/json -I -f $FILE_NAME -e "this.expo.version=\"${PACKAGE_VERSION}\""
git add $FILE_NAME

