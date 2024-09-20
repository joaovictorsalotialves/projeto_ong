import { findAdoptionForUser } from "../../models/User/findAdoptionForUser.js";

export const selectAdoptionForUserController = async (request, response) => {
  let idUser = request.params.idUser;
  let { dateAdoption } = request.query;

  if (isNaN(idUser)) return response.status(404).json({ sucess: false, message: 'Incorrect parameter' });

  let adoptions = await findAdoptionForUser(idUser, dateAdoption);

  return adoptions.status
    ? response.status(200).json({ sucess: true, values: adoptions.values })
    : response.status(500).json({ sucess: false, message: 'Failed to fetch adoptions', error: adoptions.error });
}
