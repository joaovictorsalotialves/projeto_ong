import { edit } from "../../models/User/edit.js";

export const updateUserController = async (request, response) => {
  let idUser = request.params.idUser;
  let { nameUser, cellPhoneNumber, email, address } = request.body;

  if (isNaN(idUser)) return response.status(404).json({ sucess: false, message: 'Incorrect parameter' });

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

  let result = await edit(idUser, nameUser, cellPhoneNumber, email, address);

  return result.status
    ? response.status(200).json({ sucess: true, message: 'User changed successfully' })
    : result.error
      ? response.status(500).json({ sucess: false, message: 'Failed to changed user', error: result.error })
      : response.status(400).json({ sucess: false, message: result.message });
}
