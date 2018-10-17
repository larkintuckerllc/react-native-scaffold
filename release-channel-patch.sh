set -e
set -x

sed -i "s/react-native-scaffold/react-native-scaffold?release-channel=${CHANNEL}/" android/app/src/main/java/host/exp/exponent/generated/AppConstants.java
sed -i "s/default/${CHANNEL}/" android/app/src/main/java/host/exp/exponent/generated/AppConstants.java
