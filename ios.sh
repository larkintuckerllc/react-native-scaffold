set -e
set -x

# npm install -g expo-cli@2.2.0
# expo login -u $EXPO_USERNAME -p $EXPO_PASSWORD
# expo publish
security create-keychain -p $CUSTOM_KEYCHAIN_PASSWORD ios-build.keychain
security default-keychain -s ios-build.keychain
security unlock-keychain -p $CUSTOM_KEYCHAIN_PASSWORD ios-build.keychain
security set-keychain-settings -t 3600 -l ~/Library/Keychains/ios-build.keychain
