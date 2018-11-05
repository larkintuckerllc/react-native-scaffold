cd ios && xcodebuild \
  -workspace react-native-scaffold.xcworkspace \
  -scheme react-native-scaffold \
  -sdk iphoneos12.1 \
  -configuration Release \
  -archivePath $PWD/build/react-native-scaffold.xcarchive \
  PROVISIONING_PROFILE="00e1eafa-154c-413b-ad49-8aaa90befb5e" \
  CODE_SIGN_IDENTITY="iPhone Developer: John Tucker (WS374528YS)" \
  archive | xcpretty && exit ${PIPESTATUS[0]}

