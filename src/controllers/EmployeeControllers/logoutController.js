import { editAuthCode } from "../../models/Employee/editAuthCode.js";
import { findById } from "../../models/Employee/findById.js";

export const logoutController = async (request, response) => {
  const { authToken } = request.body;
  let idEmployee = request.params.idEmployee;

  if (isNaN(idEmployee)) return response.status(404).json({ sucess: false, message: 'Incorrect parameter' });

  let employee = await findById(idEmployee);

  if (!employee.status) {
    return response.status(404).json({ sucess: false, message: 'Bad request: Employee not found' });
  }

  if (!authToken) {
    return response.status(404).json({ sucess: false, message: 'Bad request: There is no open session' });
  }

  if (authToken != employee.values.validationToken) {
    return response.status(404).json({ sucess: false, message: 'Bad request: This session does not belong to this employee' });
  }

  let result = await editAuthCode(idEmployee, null, null);

  return result.status
    ? response.status(200).json({ sucess: true, message: 'Logout successful' })
    : response.status(500).json({ sucess: false, message: 'Failed to logout', error: error });
}
