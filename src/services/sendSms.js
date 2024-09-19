import dotenv from "dotenv";
dotenv.config();

import aws from "aws-sdk";

aws.config.update({
  region: process.env.AWS_REGION,
  accessKeyId: process.env.AWS_ACCESS_KEY_ID,
  secretAccessKey: process.env.AWS_SECRET_ACCESS_KEY,
  sessionToken: process.env.AWS_TOKEN
})

export const sendSMS = (PhoneNumber, msg) => {
  const sms = new aws.SNS({ apiVersion: "2010-03-31" })
  const message = `Você está recebendo o códido ${msg} para usar na API - NIVALDO UNIFEOB`
  sms.publish({
    message,
    PhoneNumber
  }).promise()
}
