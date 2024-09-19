import { remove } from "../../models/Employee/remove.js";

export const deleteEmployeeController = async (request, response) => {
  let idEmployee = request.params.idEmployee;

  if (isNaN(idEmployee)) return response.status(404).json({ sucess: false, message: 'Incorrect parameter' });

  let result = await remove(idEmployee);

  return result.status
    ? response.status(200).json({ sucess: true, message: 'Employee deleted successfully' })
    : result.error
      ? response.status(500).json({ sucess: false, message: 'Failed to deleted employee', error: result.error })
      : response.status(400).json({ sucess: false, message: result.message });
}
