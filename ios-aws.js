const fs = require('fs');
const AWS = require('aws-sdk');

const SRC_FILE_NAME = 'ios/build/react-native-scaffold.ipa';
const AWS_ACCESS_KEY = process.env.AWS_ACCESS_KEY;
const AWS_SECRET_ACCESS_KEY = process.env.AWS_SECRET_ACCESS_KEY;
const AWS_BUCKET = process.env.AWS_BUCKET;
const DST_FILE_NAME = 'react-native-scaffold.ipa';
const s3 = new AWS.S3({
    accessKeyId: AWS_ACCESS_KEY,
    secretAccessKey: AWS_SECRET_ACCESS_KEY,
});
fs.readFile(SRC_FILE_NAME, (err, data) => {
  if (err) { throw err; }
  var base64data = new Buffer(data, 'binary');
  s3.putObject({
    Bucket: AWS_BUCKET,
    Key: DST_FILE_NAME,
    Body: base64data
  }, (resp) => {
    console.log(`Successfully uploaded ${DST_FILE_NAME}`);
  });
});
