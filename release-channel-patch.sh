set -e
set -x

FILE_NAME="android/app/src/main/java/host/exp/exponent/generated/AppConstants.java"
sed "s/react-native-scaffold/react-native-scaffold?release-channel=${CHANNEL}/" $FILE_NAME
sed "s/default/${CHANNEL}/" $FILE_NAME

