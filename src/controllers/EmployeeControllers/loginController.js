import bcrypt from "bcryptjs";
import jwt from "jsonwebtoken";

import { editAuthCode } from "../../models/Employee/editAuthCode.js";
import { findByEmail } from "../../models/Employee/findByEmail.js";
import { findById } from "../../models/Employee/findById.js";

export const loginController = async (request, response) => {
  let { email, password } = request.body;

  let employee = await findByEmail(email);

  if (employee.status) {
    if (bcrypt.compareSync(password, employee.values.passwordHash)) {
      let token = jwt.sign(
        { email: employee.values.email, position: employee.values.position },
        process.env.JWT_SECRET, { expiresIn: '8h' }
      );

      let result = await editAuthCode(employee.values.idEmployee, token, null);

      if (result.status) {
        let employeeFound = await findById(employee.values.idEmployee);
        return employeeFound.status
          ? response.status(200).json({ sucess: true, token: token, user: employeeFound.values, message: 'Login successful' })
          : response.status(500).json({ sucess: false, message: 'Failed to return user', error: employeeFound.error });
      }

      response.status(500).json({ sucess: false, message: 'Failed to save token', error: result.error });
    }
    return response.status(406).json({ sucess: false, message: 'Incorrect password' });
  }

  return employee.status === undefined
    ? response.status(404).json({ sucess: false, message: 'Employee not found' })
    : response.status(500).json({ sucess: false, message: 'Failed to fetch employee', error: employee.error });
}
