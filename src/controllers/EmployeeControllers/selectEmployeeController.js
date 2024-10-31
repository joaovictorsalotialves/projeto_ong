import { findById } from "../../models/Employee/findById.js";

export const selectEmployeeController = async (request, response) => {
  let idEmployee = request.params.idEmployee;

  if (isNaN(idEmployee)) return response.status(404).json({ sucess: false, message: 'Incorrect parameter' });

  let employee = await findById(idEmployee);

  return employee.status
    ? response.status(200).json({ sucess: true, values: [employee.values] })
    : employee.status === undefined
      ? response.status(404).json({ sucess: false, message: 'Employee not found' })
      : response.status(500).json({ sucess: false, message: 'Failed to fetch employee', error: employee.error });
}
