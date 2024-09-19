import { findAll } from "../../models/Employee/findAll.js";

export const selectEmployeesController = async (request, response) => {
  let { nameEmployee, position } = request.query;

  let employees = await findAll(nameEmployee, position);

  return employees.status
    ? response.status(200).json({ sucess: true, values: employees.values })
    : response.status(500).json({ sucess: false, messagem: 'Failed to fetch employees', error: employees.error });
}
