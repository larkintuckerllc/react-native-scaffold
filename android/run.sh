#!/bin/bash

./gradlew ${1:-installDevMinSdkDevKernelDebug} --stacktrace && adb shell am start -n com.larkintuckerllc.reactnativescaffold/host.exp.exponent.MainActivity
