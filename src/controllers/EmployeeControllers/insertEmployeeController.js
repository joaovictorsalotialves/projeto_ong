import { create } from "../../models/Employee/create.js";

export const insertEmployeeController = async (request, response) => {
  let { nameEmployee, cellPhoneNumber, email, password, passwordCheck, position, address } = request.body;

  if (!nameEmployee || !cellPhoneNumber || !email || !password || !passwordCheck || !position) {
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

  if (password !== passwordCheck) {
    return response.status(400).json({
      sucess: false,
      message: 'Bad request: Incorrect password check'
    });
  }

  let result = await create(nameEmployee, cellPhoneNumber, email, password, position, address);

  console.log(result)

  return result.status
    ? response.status(200).json({ sucess: true, id: result.id, message: 'Employee successfully registered' })
    : result.error
      ? response.status(500).json({ sucess: false, message: 'Failed to registered employee', error: result.error })
      : response.status(400).json({ sucess: false, message: result.message });
}
