import bcrypt from "bcryptjs";

import { conn } from "../../data/connection.js";

import { editAuthCode } from "./editAuthCode.js";
import { findByEmail } from "./findByEmail.js";

export const resetPassword = async (code, emailEmployee, newPassword) => {
  let employee = await findByEmail(emailEmployee);

  if (code != employee.values.code) {
    return {
      status: false,
      message: 'Invalid verification code'
    };
  }

  if (employee.status) {
    let salt = bcrypt.genSaltSync(10);
    let hash = bcrypt.hashSync(newPassword, salt);

    try {
      await conn.update({
        passwordHash: hash,
      }).where({ idEmployee: employee.values.idEmployee }).table('employees');
      await editAuthCode(employee.values.idEmployee, null, null);
      return { status: true };
    } catch (error) {
      return {
        status: false,
        error: error
      };
    }
  }

  return {
    status: false,
    message: 'Bad request: Not found employee'
  }
}
