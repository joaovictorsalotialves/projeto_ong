import { editPassword } from "../../models/Employee/editPassword.js";

export const updateEmployeePasswordController = async (request, response) => {
  let idEmployee = request.params.idEmployee;
  let { oldPassword, newPassword, passwordCheck } = request.body;

  if (isNaN(idEmployee)) return response.status(404).json({ sucess: false, message: 'Incorrect parameter' });

  let result = await editPassword(idEmployee, oldPassword, newPassword, passwordCheck);

  return result.status
    ? response.status(200).json({ sucess: true, message: 'Password changed successfully' })
    : result.error
      ? response.status(500).json({ sucess: false, message: 'Failed to changed password', error: result.error })
      : response.status(400).json({ sucess: false, message: result.message });
}
