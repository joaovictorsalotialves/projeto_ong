import { create } from "../../models/User/create.js";

export const insertUserController = async (request, response) => {
  let { nameUser, cellPhoneNumber, email, address } = request.body;

  if (!nameUser || !cellPhoneNumber) {
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

  let result = await create(nameUser, cellPhoneNumber, email, address);

  return result.status
    ? response.status(200).json({ sucess: true, id: result.id, message: 'User successfully registered' })
    : result.error
      ? response.status(500).json({ sucess: false, message: 'Failed to registered user', error: result.error })
      : response.status(400).json({ sucess: false, message: result.message });
}
