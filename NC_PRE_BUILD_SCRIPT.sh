#!/bin/sh

set -e
set -x

npm install -g expo-cli@2.2.0
expo login -u $EXPO_USERNAME -p $EXPO_PASSWORD
expo publish
