import { conn } from "../../data/connection.js";
import { findById } from "./findById.js";

export const editAuthCode = async (idEmployee, token, code) => {
  let employee = await findById(idEmployee);

  if (employee.status) {
    try {
      await conn.update({
        validationToken: token,
        code: code
      }).where({ idEmployee: idEmployee }).table('employees');
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
