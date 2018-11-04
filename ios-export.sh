cd ios && xcodebuild \
  -exportArchive \
  -archivePath $PWD/build/react-native-scaffold.xcarchive \
  -exportOptionsPlist $PWD/build/react-native-scaffold.xcarchive/Info.plist \
  -exportPath $PWD/build | xcpretty && cd .. && exit ${PIPESTATUS[0]}

