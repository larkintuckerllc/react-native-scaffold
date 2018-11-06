sed -i.bak -E '/^\<dict\>/a\
<key>compileBitcode</key>\
<false/>\
<key>provisioningProfiles</key>\
<dict>\
  <key>com.larkintuckerllc.reactnativescaffold</key>\
  <string>00e1eafa-154c-413b-ad49-8aaa90befb5e</string>\
</dict>\
' ios/build/react-native-scaffold.xcarchive/Info.plist
