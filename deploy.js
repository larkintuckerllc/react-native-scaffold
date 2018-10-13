const fs = require('fs');
const AWS = require('aws-sdk');

const SRC_FILE_NAME = 'test.txt';
const AWS_ACCESS_KEY = process.env.AWS_ACCESS_KEY;
const AWS_SECRET_ACCESS_KEY = process.env.AWS_SECRET_ACCESS_KEY;
const AWS_BUCKET = process.env.AWS_BUCKET;
const DST_FILE_NAME = 'test.txt';
const s3 = new AWS.S3({
    accessKeyId: AWS_ACCESS_KEY,
    secretAccessKey: AWS_SECRET_ACCESS_KEY,
});
const uploadFile = () => {
  fs.readFile(SRC_FILE_NAME, (err, data) => {
     if (err) throw err;
     const params = {
         Bucket: AWS_BUCKET, 
         Key: DST_FILE_NAME,
         Body: JSON.stringify(data, null, 2)
     };
     s3.upload(params, function(s3Err, data) {
         if (s3Err) throw s3Err
         console.log(`File uploaded successfully at ${data.Location}`)
     });
  });
};
uploadFile();
