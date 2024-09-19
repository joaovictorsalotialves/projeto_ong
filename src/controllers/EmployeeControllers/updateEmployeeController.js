import { edit } from "../../models/Employee/edit.js";

export const updateEmployeeController = async (request, response) => {
  let idEmployee = request.params.idEmployee;
  let { nameEmployee, cellPhoneNumber, email, position, address } = request.body;

  if (isNaN(idEmployee)) return response.status(404).json({ sucess: false, message: 'Incorrect parameter' });

  if (!nameEmployee || !cellPhoneNumber || !email || !position) {
    return response.status(400).json({
      success: false,
      message: 'Bad request: Missing required fields'
    });
  }

  if (address !== undefined) {
    let { publicPlace, neighborhood, number, complement, idState, idCity } = address;
    if (!publicPlace || !neighborhood || !number || !idState || !idCity) {
      return response.status(400).json({
        success: false,
        message: 'Bad request: Missing required fields'
      });
    }
  }

  let result = await edit(idEmployee, nameEmployee, cellPhoneNumber, email, position, address);

  return result.status
    ? response.status(200).json({ sucess: true, message: 'Employee changed successfully' })
    : result.error
      ? response.status(500).json({ sucess: false, message: 'Failed to changed employee', error: result.error })
      : response.status(400).json({ sucess: false, message: result.message });
}
