import { findAll } from "../../models/Adoption/findAll.js";

export const selectAdoptionsController = async (request, response) => {
  let { nameUser, nameAnimal, dateAdoption } = request.query;

  let adoptions = await findAll(nameUser, nameAnimal, dateAdoption);

  return adoptions.status
    ? response.status(200).json({ success: true, values: adoptions.values })
    : response.status(500).json({ success: false, message: 'Failed to fetch adoptions', error: adoptions.error });
}
