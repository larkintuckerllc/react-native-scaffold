set -e
set -x

$FILE_NAME="android/app/src/main/java/host/exp/exponent/generated/AppConstants.java"
sed -i ".bak" "s/react-native-scaffold/react-native-scaffold?release-channel=${CHANNEL}/" $FILE_NAME
sed -i ".bak" "s/default/${CHANNEL}/" $FILE_NAME
rm ${FILE_NAME}.bak
