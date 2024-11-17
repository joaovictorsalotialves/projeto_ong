import { findById } from "../../models/User/findById.js";

export const selectUserController = async (request, response) => {
  let idUser = request.params.idUser;

  if (isNaN(idUser)) return response.status(404).json({ sucess: false, message: 'Incorrect parameter' });

  let user = await findById(idUser);

  return user.status
    ? response.status(200).json({ sucess: true, values: user.values })
    : user.status === undefined
      ? response.status(404).json({ sucess: false, message: 'User not found' })
      : response.status(500).json({ sucess: false, message: 'Failed to fetch user', error: user.error });
}
