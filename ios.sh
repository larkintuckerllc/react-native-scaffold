set -e
set -x

openssl aes-256-cbc -K $encrypted_91d26112053f_key -iv $encrypted_91d26112053f_iv -in development-cert.cer.enc -out development-cert.cer -d
openssl aes-256-cbc -K $encrypted_91d26112053f_key -iv $encrypted_91d26112053f_iv -in development-key.p12.enc -out development-key.p12 -d
openssl aes-256-cbc -K $encrypted_91d26112053f_key -iv $encrypted_91d26112053f_iv -in reactnativescaffolddev.mobileprovision.enc -out reactnativescaffolddev.mobileprovision -d
npm install -g expo-cli@2.2.0
expo login -u $EXPO_USERNAME -p $EXPO_PASSWORD
expo publish

