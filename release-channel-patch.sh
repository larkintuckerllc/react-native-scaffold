sed -i "s/react-native-scaffold/react-native-scaffold?release-channel=${TRAVIS_PULL_REQUEST}/" android/app/src/main/java/host/exp/exponent/generated/AppConstants.java
sed -i "s/default/${TRAVIS_PULL_REQUEST}/" android/app/src/main/java/host/exp/exponent/generated/AppConstants.java
