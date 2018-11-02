set -e
set -x

# npm install -g expo-cli@2.2.0
# expo login -u $EXPO_USERNAME -p $EXPO_PASSWORD
# expo publish
# CREATE KEY CHAIN
security create-keychain -p $CUSTOM_KEYCHAIN_PASSWORD ios-build.keychain
security default-keychain -s ios-build.keychain
security unlock-keychain -p $CUSTOM_KEYCHAIN_PASSWORD ios-build.keychain
security set-keychain-settings -t 3600 -l ~/Library/Keychains/ios-build.keychain
# IMPORT ASSETS INTO KEY CHAIN
security import AppleWWDRCA.cer -k ios-build.keychain -A
security import development-cert.cer -k ios-build.keychain -A
security import development-key.p12 -k ios-build.keychain -P $SECURITY_PASSWORD -A
security set-key-partition-list -S apple-tool:,apple: -s -k $SECURITY_PASSWORD ios-build.keychain > /dev/null
