set -e
set -x

# EXPO PUBLISH
npm install -g expo-cli@2.2.0
expo login -u $EXPO_USERNAME -p $EXPO_PASSWORD
expo publish
# CREATE KEY CHAIN
security create-keychain -p $CUSTOM_KEYCHAIN_PASSWORD ios-build.keychain
security default-keychain -d user -s ios-build.keychain
security unlock-keychain -p $CUSTOM_KEYCHAIN_PASSWORD ios-build.keychain
security set-keychain-settings -t 3600 -l ~/Library/Keychains/ios-build.keychain
# IMPORT ASSETS INTO KEY CHAIN
security import AppleWWDRCA.cer -k ios-build.keychain -A
security import development-cert.p12 -k ios-build.keychain -P $SECURITY_PASSWORD -A
security set-key-partition-list -S apple-tool:,apple: -s -k $CUSTOM_KEYCHAIN_PASSWORD ios-build.keychain > /dev/null
# PROVISIONING PROFILE
mkdir -p ~/Library/MobileDevice/Provisioning\ Profiles
cp "00e1eafa-154c-413b-ad49-8aaa90befb5e.mobileprovision" ~/Library/MobileDevice/Provisioning\ Profiles
# BUILD ARCHIVE
sudo gem install xcpretty
sh ios-build.sh
# EXPORT ARCHIVE
sh ios-patch-plist.sh
sh ios-export.sh
node ios-aws.js
