import { findAll } from "../../models/Species/findAll.js";

export const selectSpeciesController = async (request, response) => {
  let { nameSpecies } = request.query;

  let species = await findAll(nameSpecies);

  return species.status
    ? response.status(200).json({ sucess: true, values: species.values })
    : response.status(500).json({ sucess: false, messagem: 'Failed to fetch species', error: species.error });
}
