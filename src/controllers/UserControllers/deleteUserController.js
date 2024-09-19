import { remove } from "../../models/User/remove.js";

export const deleteUserController = async (request, response) => {
  let idUser = request.params.idUser;

  if (isNaN(idUser)) return response.status(404).json({ sucess: false, message: 'Incorrect parameter' });

  let result = await remove(idUser);

  return result.status
    ? response.status(200).json({ sucess: true, message: 'User deleted successfully' })
    : result.error
      ? response.status(500).json({ sucess: false, message: 'Failed to deleted user', error: result.error })
      : response.status(400).json({ sucess: false, message: result.message });
}
