import dotenv from "dotenv";
dotenv.config();

import nodemailer from "nodemailer";
import { textEmail } from "./email/email.js";

const transporter = nodemailer.createTransport({
  host: process.env.SERVER_SMTP_HOST,
  port: process.env.SERVER_SMTP_PORT,
  secure: false,
  auth: {
    user: process.env.SERVER_SMTP_USER,
    pass: process.env.SERVER_SMTP_PASSWORD,
  }
});

export const sendEmail = async (name, email, authCode) => {
  if (!name || !email || !authCode) {
    return {
      success: false,
      message: 'Bad request: Missing required fields'
    };
  }

  try {
    await transporter.sendMail({
      from: process.env.SERVER_SMTP_USER,
      to: email,
      subject: "Password recovery",
      html: textEmail(name, authCode)
    });
    return { status: true };
  } catch (error) {
    return { status: false, error: error };
  }
};
