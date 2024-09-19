import dotenv from "dotenv";
dotenv.config();

import jwt from "jsonwebtoken";

import { editAuthCode } from "../../models/Employee/editAuthCode.js";
import { findByEmail } from "../../models/Employee/findByEmail.js";
import { authCode } from "../../services/authCode.js";
import { sendEmail } from "../../services/sendEmail.js";

export const forgotPasswordController = async (request, response) => {
  let { email } = request.body;

  if (!email) {
    return response.status(400).json({
      success: false,
      message: 'Bad request: Missing required fields'
    });
  }

  let employee = await findByEmail(email);

  if (employee.status) {
    let code = authCode();
    let token = jwt.sign(
      { email: employee.values.email, authCode: code },
      process.env.JWT_SECRET, { expiresIn: '10m' }
    );

    const result = await editAuthCode(employee.values.idEmployee, null, code);
    const resultSendEmail = await sendEmail(employee.values.nameEmployee, email, code);

    return resultSendEmail.status
      ? result.status
        ? response.status(200).json({ sucess: true, token: token, message: 'Password recovery email sent successfully' })
        : response.status(500).json({ sucess: false, message: 'Failed to fetch employee', error: employee.error })
      : response.status(500).json({ sucess: false, message: 'Failed to sent email', error: resultSendEmail.error })
  }

  return employee.status === undefined
    ? response.status(404).json({ sucess: false, message: 'Bad request: No account linked to this email' })
    : response.status(500).json({ sucess: false, message: 'Failed to fetch employee', error: employee.error })
}
