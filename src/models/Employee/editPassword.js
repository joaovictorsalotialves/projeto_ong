import bcrypt from "bcryptjs";

import { conn } from "../../data/connection.js";
import { findById } from "./findById.js";

export const editPassword = async (idEmployee, oldPassword, newPassword) => {
  let employee = await findById(idEmployee);

  if (employee.status) {
    if (bcrypt.compareSync(oldPassword, employee.values.passwordHash)) {
      let salt = bcrypt.genSaltSync(10);
      let hash = bcrypt.hashSync(newPassword, salt);

      try {
        await conn.update({
          passwordHash: hash
        }).where({ idEmployee: idEmployee }).table('employees');
        return { status: true };
      } catch (error) {
        return { status: false, error: error };
      }
    }
    return {
      status: false,
      message: 'Bad request: Incorrect password'
    };
  }
  return {
    status: false,
    message: 'Bad request: Not found employee'
  };
}
